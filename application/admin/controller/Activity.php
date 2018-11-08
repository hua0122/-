<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 11:47
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Activity extends Admin
{
    public function index() {
        $map = array();

        $status = input('status','','trim,intval');//场地状态
        if(!empty($status)){
            if($status==2){
                $map['status']='0';
            }else{
                $map['status'] = $status;
            }

        }else{
            $map['status']='0';
        }

        $order = "id desc";
        $list  = db('Activity')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);

        $this->assign("list",$list);
        $this->setMeta("活动管理");
        return $this->fetch();
    }

    //新增活动
    public function add(){
        $Area = model('Activity');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("活动名称不能为空！");
            }



            if ($data) {

                $result = $Area->save($data);


                if ($result) {
                    return $this->success("添加成功！", url('Activity/index'));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {
            $time = time();
            $this->assign("time",$time);

            $this->setMeta("添加活动");
            return $this->fetch('add');
        }

    }


    //优惠券列表页
    public function coupon(){
        $map = array();

        $status = input('status','','trim,intval');//场地状态
        if(!empty($status)){
            if($status==2){
                $map['status']='0';
            }else{
                $map['status'] = $status;
            }

        }else{
            $map['status']='0';
        }

        $order = "id desc";
        $list  = db('Coupon')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);

        $this->setMeta("优惠券管理");
        return $this->fetch();
    }
}