<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/27 0027
 * Time: 12:00
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Grade extends Admin {

    /**
     * 班别管理
     * @author
     */
    public function index() {
        $map = array();

        $area_id = input('area_id', '', 'trim,intval'); //场地ID
        if(!empty($area_id)){
            $map['area_id'] = $area_id;

        }

        $status = input('status','','trim,intval');//班别状态
        if(!empty($status)){
            if($status==2){
                $map['sent_grade.status']='0';
            }else{
                $map['sent_grade.status'] = $status;
            }

        }

        $order = "id desc";
        $list  = db('Grade')
            ->join('sent_area ','sent_area.id = sent_grade.area_id','left')
            ->field('sent_grade.*,sent_area.name as area_name')
            ->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);


        $area = db('Area')->select();
        $this->assign('area',$area);
        $this->assign('area_id',$area_id);
        $this->assign('status',$status);

        $this->setMeta("班别管理");
        return $this->fetch();
    }


    //添加
    public function add() {
        $Area = model('Grade');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("班别名称不能为空！");
            }
            if(empty($data['cid'])){
                return $this->error("编号不能为空！");
            }

            if(empty($data['version'])){
                return $this->error("版本号不能为空！");
            }

            if(empty($data['price'])){
                return $this->error("价格不能为空！");
            }

            if(empty($data['content'])){
                return $this->error("班别详情不能为空！");
            }

            if(empty($data['notice'])){
                return $this->error("学车须知不能为空！");
            }

            if ($data) {
                $list  = db('Grade')->where(array("cid"=>$data['cid']))->select();
                if($list){
                    return $this->error("编号已存在，请重新输入！", url('Grade/index'));
                }else{
                    $result = $Area->save($data);

                }


                if ($result) {
                    return $this->success("添加成功！", url('Grade/index'));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {

            $data = array(
                'keyList' => $Area->keyList,
            );
            $this->assign($data);

            $area = db('Area')->select();
            $this->assign('area',$area);

            //版本号
            $version = date("Ymd")."_V1.0";
            $this->assign('version',$version);

            $this->setMeta("添加班别");
            return $this->fetch('add');
        }
    }

    //修改
    public function edit() {
        $link = model('Grade');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("班别名称不能为空！");
            }
            /*if(empty($data['cid'])){
                return $this->error("编号不能为空！");
            }

            if(empty($data['version'])){
                return $this->error("版本号不能为空！");
            }*/

            if(empty($data['price'])){
                return $this->error("价格不能为空！");
            }

            if(empty($data['content'])){
                return $this->error("班别详情不能为空！");
            }

            if(empty($data['notice'])){
                return $this->error("学车须知不能为空！");
            }

            if ($data) {
                //$result = $link->save($data, array('id' => $data['id']));
                //既要保存历史内容，又要添加新内容(把该条信息下线，添加新的内容)
                $link->where(array('id' => $data['id']))->setField('status', '1');
                unset($data['id']);

                $v = substr($data['version'],strlen($data['version'])- 3,3);

                $data['version'] = date("Ymd").sprintf("%03d", $v+1);
                $result = $link->save($data);



                if ($result) {
                    return $this->success("修改成功！", url('Grade/index'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Grade')->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );
            $this->assign($data);
            $area = db('Area')->select();
            $this->assign('area',$area);

            $this->setMeta("编辑班别");
            return $this->fetch('edit');
        }
    }

    //删除
    public function delete() {
        $id = $this->getArrayParam('id');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $link = db('Grade');

        $map    = array('id' => array('IN', $id));
        $result = $link->where($map)->delete();
        if ($result) {
            return $this->success("删除成功！");
        } else {
            return $this->error("删除失败！");
        }
    }

    public function status() {
        $id     = $this->getArrayParam('id');
        $status = input('status', '0', 'trim,intval');

        if (!$id) {
            return $this->error("非法操作！");
        }

        $map['id'] = array('IN', $id);
        $result    = db('Grade')->where($map)->setField('status', $status);
        if ($result) {
            return $this->success("设置成功！");
        } else {
            return $this->error("设置失败！");
        }
    }
}