<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 09:29
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Student extends Admin
{
    /**
     * 学员管理
     */
    public function index(){
        $this->setMeta("学员管理");
        $map = array();

        $keyword = input('keyword','', 'htmlspecialchars,trim');
        if(!empty($keyword)){
                $map['name|phone'] = array('like', '%' .$keyword . '%');

        }


        $status = input('status','','trim,intval');//学员状态
        if(!empty($status)){
            if($status==2){
                $map['status']='0';
            }else{
                $map['status'] = $status;
            }

        }

        $order = "id desc";

        $list  = db('Student')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign('status',$status);


        return $this->fetch();
    }
}