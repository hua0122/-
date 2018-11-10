<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 15:19
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Code extends Admin
{
    public function index(){
        $map = array();

        $status = input('status','','trim,intval');//状态
        if(!empty($status)){
            if($status==2){
                $map['sent_test.status']='0';
            }else{
                $map['sent_test.status'] = $status;
            }

        }else{
            $map['sent_test.status']='0';
        }

        $order = "id desc";
        $list  = db('Test')
            ->join('sent_outfit','sent_outfit.id=sent_test.outfit_id','left')
            ->field('sent_test.*,sent_outfit.name as outfit_name')
            ->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign('status',$status);


        $this->setMeta("体检码管理");
        return $this->fetch();
    }


    //添加
    public function add(){
        $Area = model('Test');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("文件不能为空！");
            }
            if ($data) {

                $result = $Area->save($data);


                if ($result) {
                    return $this->success("添加成功！", url('Code/index'));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {
            $time = time();
            $this->assign("time",$time);

            //体检机构信息
            $outfit = db("Outfit")->select();
            $this->assign("outfit",$outfit);

            $this->setMeta("添加体检码");
            return $this->fetch();
        }

    }


    //体检机构列表
    public function outfit(){

        $map = array();

        $order = "id desc";
        $list  = db('Outfit')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);

        $this->setMeta("体检机构管理");
        return $this->fetch();
    }

    //新增体检机构
    public function outfit_add(){
        $Area = model('Outfit');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }
            if ($data) {

                $result = $Area->save($data);


                if ($result) {
                    return $this->success("添加成功！", url('Code/outfit'));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {
            $time = time();
            $this->assign("time",$time);

            $this->setMeta("添加体检机构");
            return $this->fetch();
        }

    }


    //编辑机构
    public function outfit_edit(){

        $link = model('Outfit');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Code/outfit'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Outfit')->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("编辑机构");
            return $this->fetch();
        }
    }


    //删除机构信息
    public function outfit_delete(){
        $id = $this->getArrayParam('id');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $link = db('Outfit');

        $map    = array('id' => array('IN', $id));
        $result = $link->where($map)->delete();
        if ($result) {
            return $this->success("删除成功！");
        } else {
            return $this->error("删除失败！");
        }

    }

    //体检站列表
    public function station_list(){
        $id   = input('id', '', 'trim,intval');
        $map = array();
        if($id){
            $map['outfit_id'] = $id;
        }

        $order = "id desc";
        $list  = db('Station')
            ->join('sent_outfit','sent_outfit.id=sent_station.outfit_id','left')
            ->field('sent_station.*,sent_outfit.name as outfit_name')
            ->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign("id",$id);

        $this->setMeta("体检站管理");
        return $this->fetch();

    }


    //添加
    public function station_add() {
        $id   = input('id', '', 'trim,intval');
        $Area = model('Station');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }
            if(empty($data['address'])){
                return $this->error("地址不能为空！");
            }



            if ($data) {
                $list  = db('Area')->where(array("name"=>$data['name']))->select();
                if($list){
                    return $this->error("名称已存在，请重新输入！", url('Code/station_list',array('id'=>$id)));
                }else{
                    $result = $Area->save($data);

                }


                if ($result) {
                    return $this->success("添加成功！", url('Code/station_list',array('id'=>$id)));
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


            $this->assign("id",$id);
            $this->setMeta("添加体检站");
            return $this->fetch();
        }
    }


    //修改
    public function station_edit() {
        $link = model('Station');
        $id   = input('id', '', 'trim,intval');
        $sid   = input('sid', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }
            if(empty($data['address'])){
                return $this->error("地址不能为空！");
            }

            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Code/station_list',array('id'=>$sid)));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Station')->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );
            $this->assign($data);
            $this->assign('id',$sid);
            $this->setMeta("编辑体检站");
            return $this->fetch();
        }
    }

    //删除
    public function station_delete() {
        $id = $this->getArrayParam('id');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $link = db('Station');

        $map    = array('id' => array('IN', $id));
        $result = $link->where($map)->delete();
        if ($result) {
            return $this->success("删除成功！");
        } else {
            return $this->error("删除失败！");
        }
    }



    //体检申请
    public function apply(){

        $map = array();

        $order = "id desc";
        $list  = db('Apply')
            ->join('sent_station','sent_station.id=sent_apply.station_id','left')
            ->join('sent_outfit','sent_outfit.id=sent_station.outfit_id','left')
            ->join('sent_test','sent_test.id=sent_apply.code_id','left')
            ->field('sent_apply.*,sent_station.name as station_name,sent_outfit.name as outfit_name,sent_test.code,sent_test.verify')
            ->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);

        $this->setMeta("体检申请管理");
        return $this->fetch();

    }

    //体检申请 编辑
    public function apply_edit(){
        $link = model('Apply');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Code/apply'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('sent_apply.id' => $id);
            $info = db('Apply')
                ->join('sent_test','sent_test.id=sent_apply.code_id','left')
                ->field("sent_apply.*,sent_test.code as code_name")
                ->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );


            //体检站列表
            $station = db('Station')->select();
            $this->assign("station",$station);


            $this->assign($data);
            $this->setMeta("编辑内容");
            return $this->fetch();
        }

    }

}