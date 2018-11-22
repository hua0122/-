<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/27 0027
 * Time: 12:00
 */

namespace app\admin\controller;
use app\common\controller\Admin;
use think\Request;

class Grade extends Admin {

    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->schoolid = cookie("schoolid");
    }

    /**
     * 班别管理
     * @author
     */
    public function index() {
        $map = array();

        if(isset($this->schoolid)){
            $map['school_id'] = $this->schoolid;
        }


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

                //版本号
                $y=substr(date("Y"),2,2);

                //先查询最新版本
                $new = model('Grade')->order("create_time desc")->limit(0,1)->find();
                if($new){
                    $data['cid'] =  round($new['cid']+0.1,1);
                    if(is_int($data['cid'])){
                        $data['version'] = $y.date("mdHis")."_v".$data['cid'].".0";
                    }else{
                        $data['version'] = $y.date("mdHis")."_v".$data['cid'];
                    }

                }else{
                    $data['cid'] = "0.1";
                    $data['version'] = $y.date("mdHis")."_v0.1";
                }



                $result = $Area->save($data);
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

                if($old_content['type']!=$data['type']||$old_content['price']!=$data['price']||$old_content['content']!=$data['content']||$old_content['notice']!=$data['notice']){
                    //既要保存历史内容，又要添加新内容(把该条信息下线，添加新的内容)
                    $link->where(array('id' => $data['id']))->setField('status', '1');
                    unset($data['id']);
                    //版本号
                    $y=substr(date("Y"),2,2);
                    //先查询最新版本
                    $new = model('Grade')->order("create_time desc")->limit(0,1)->find();
                    if($new){
                        $data['cid'] =  round($new['cid']+0.1,1);
                        if(is_int($data['cid'])){
                            $data['version'] = $y.date("mdHis")."_v".$data['cid'].".0";
                        }else{
                            $data['version'] = $y.date("mdHis")."_v".$data['cid'];
                        }

                    }else{
                        $data['cid'] = "0.1";
                        $data['version'] = $y.date("mdHis")."_v0.1";
                    }
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


    //上线
    public function online(){
        $link = model('Grade');
        $id     = $this->getArrayParam('id');

        //既要保存历史内容，又要添加新内容(把该条信息下线，添加新的内容)
        $data = $link->find($id);

        $data_new['name'] = $data['name'];
        $data_new['type'] = $data['type'];
        $data_new['price'] = $data['price'];
        $data_new['content'] = $data['content'];
        $data_new['notice'] = $data['notice'];
        $data_new['status'] = 0;
        $data_new['area_id'] = $data['area_id'];
        $data_new['create_time'] = time();
        $data_new['update_time'] = time();
        //版本号
        $y=substr(date("Y"),2,2);
        //先查询最新版本
        $new = model('Grade')->order("create_time desc")->limit(0,1)->find();

        if($new){
            $data_new['cid'] =  round($new['cid']+0.1,1);
            if(is_int($data_new['cid'])){
                $data_new['version'] = $y.date("mdHis")."_v".$data_new['cid'].".0";
            }else{
                $data_new['version'] = $y.date("mdHis")."_v".$data_new['cid'];
            }

        }else{
            $data_new['cid'] = "0.1";
            $data_new['version'] = $y.date("mdHis")."_v0.1";
        }

        $result = $link->save($data_new);
        if ($result) {
            return $this->success("设置成功！",url('Grade/index'));
        } else {
            return $this->error("设置失败！");
        }

    }
}