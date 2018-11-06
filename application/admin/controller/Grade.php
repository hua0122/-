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

        }else{
            $map['sent_grade.status']='0';
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
        $count = db('Grade')->count();
        if($count==0){
            session('cid', null);
        }

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

            if(is_numeric($data['name'])){
                return $this->error("班别名称不能全为数字！");
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
            $data['create_time'] = $data['update_time'] = time();

            if ($data) {
                if(session('cid')){
                    $cid = session('cid');
                }else{
                    $cid = 0;
                }
                //版本号
                $y=substr(date("Y"),2,2);

                $data['version'] = $y.date("md").sprintf("%03d", $cid+1)."_v0.1";
                $data['cid'] = sprintf("%03d", $cid+1);
                $result = $Area->save($data);
                session("cid",$cid+1);

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

                $data['update_time'] = time();
                //如果内容改变 则改变版本号
                $old_content = $link->where(array("id"=>$id))->find();


                //查询编号相同的最新版本号
                $zx_version = $link->where(array("cid"=>$old_content['cid']))->order("update_time desc")->find();

                if($old_content['type']!=$data['type']||$old_content['price']!=$data['price']||$old_content['content']!=$data['content']||$old_content['notice']!=$data['notice']){
                    //既要保存历史内容，又要添加新内容(把该条信息下线，添加新的内容)
                    $link->where(array('id' => $data['id']))->setField('status', '1');
                    unset($data['id']);
                    $len = strlen(stristr($zx_version['version'],'.'))-1;
                    $v = substr($zx_version['version'],strlen($data['version'])- $len,$len);
                    $data['version'] =substr($zx_version['version'],0,9)."_v0.".($v+1);
                    $result = $link->save($data);
                }else{
                    $result = $link->save($data,array("id"=>$id));
                }


                if ($result) {
                    return $this->success("修改成功！", url('Grade/index'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('sent_grade.id' => $id);
            $info = db('Grade')
                ->join('sent_area ','sent_area.id = sent_grade.area_id','left')
                ->field('sent_grade.*,sent_area.name as area_name')
                ->where($map)->find();

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