<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31 0031
 * Time: 09:44
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Operate extends Admin
{
    public function index(){
        $order = "id desc";
        $list = db('Page')->order($order)->paginate(10);
        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->setMeta("运营列表");
        $this->assign('model_id','4');//单页
        return $this->fetch();
    }

    //添加
    public function add() {
        $Area = model('Page');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $list  = db('Page')->where(array("title"=>$data['title']))->select();
                if($list){
                    return $this->error("标题已存在，请重新输入！", url('Operate/index'));
                }else{
                    $result = $Area->save($data);

                }


                if ($result) {
                    return $this->success("添加成功！", url('Operate/index'));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {

            $time = date("Y-m-d H:i:s");

            $this->assign('time',$time);
            $this->setMeta("添加");
            return $this->fetch('add');
        }
    }
    //修改
    public function edit() {
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/index'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("内容修改");
            return $this->fetch();
        }
    }

}