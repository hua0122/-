<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 11:47
 */

namespace app\admin\controller;
use app\common\controller\Admin;
use think\Request;

class Activity extends Admin
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->schoolid = cookie("schoolid");
    }

    public function index() {
        $map = array();

        if(isset($this->schoolid)){
            $map['school_id'] = $this->schoolid;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $where['group_id'] = $role_id['group_id'];
            $where['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($where)->find();


            $map['school_id'] = $school_default['school_id'];
        }

        $status = input('status','','trim,intval');//状态
        if(!empty($status)){
            if($status==2){
                //上线状态  下线时间大于当前时间
                $map['downline_time'] = array('gt',time());


            }else{
                $map['downline_time'] = array('lt',time());
            }

        }else{
            $map['downline_time'] = array('gt',time());
        }

        $order = "id desc";
        $list  = db('Activity')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);

        $this->assign("list",$list);
        $this->assign("status",$status);
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

            if(empty($data['icon'])){
                return $this->error("活动图标不能为空！");
            }
            if(empty($data['description'])){
                return $this->error("活动介绍不能为空！");
            }

            $data['online_time'] = strtotime($data['online_time']);
            $data['downline_time'] = strtotime($data['downline_time']);

            if($this->schoolid){
                $data['school_id'] = $this->schoolid;
            }else{
                $data['school_id'] = 1;
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

    //修改活动
    public function edit(){
        $link = model('Activity');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }

            if(empty($data['icon'])){
                return $this->error("活动图标不能为空！");
            }
            if(empty($data['description'])){
                return $this->error("活动介绍不能为空！");
            }

            $data['online_time'] = strtotime($data['online_time']);
            $data['downline_time'] = strtotime($data['downline_time']);

            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Activity/index'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Activity')->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("编辑活动");
            return $this->fetch('edit');
        }
    }


    //立即下线
    public function status(){

        $id     = $this->getArrayParam('id');
        if (!$id) {
            return $this->error("非法操作！");
        }

        $map['id'] = array('IN', $id);
        $result    = db('Activity')->where($map)->setField('downline_time', time());
        if ($result) {
            return $this->success("设置成功！");
        } else {
            return $this->error("设置失败！");
        }
    }

    //立即下线活动
    public function code_status(){

        $id     = $this->getArrayParam('id');
        if (!$id) {
            return $this->error("非法操作！");
        }

        $map['id'] = array('IN', $id);
        $result    = db('Coupon')->where($map)->setField('downline_time', time());
        if ($result) {
            return $this->success("设置成功！");
        } else {
            return $this->error("设置失败！");
        }
    }




    //优惠券列表页
    public function coupon(){
        $map = array();

        if(isset($this->schoolid)){
            $map['school_id'] = $this->schoolid;
        }

        $status = input('status','','trim,intval');//状态
        if(!empty($status)){
            if($status==2){
                //上线状态  下线时间大于当前时间
                $map['downline_time'] = array('gt',time());


            }else{
                $map['downline_time'] = array('lt',time());
            }

        }else{
            $map['downline_time'] = array('gt',time());
        }


        $order = "id desc";
        $list  = db('Coupon')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign('status',$status);

        $this->setMeta("优惠券管理");
        return $this->fetch();
    }


    //添加优惠券
    public function coupon_add(){
        $Area = model('Coupon');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }

            $data['online_time'] = strtotime($data['online_time']);
            $data['downline_time'] = strtotime($data['downline_time']);

            if($this->schoolid){
                $data['school_id'] = $this->schoolid;
            }else{
                $data['school_id'] = 1;
            }

            if ($data) {

                $result = $Area->save($data);
                $coupon_id = $Area->getLastInsID();
                if ($result) {
                    //生成券码
                    for($i=1;$i<=$data['total'];$i++){
                        $data1 = [];
                        $data1['code'] = rand_string(10);
                        $data1['amount'] = $data['amount'];
                        $data1['coupon_id'] = $coupon_id;
                        $list[] = $data1;
                    }

                    model("Code")->saveAll($list);

                    return $this->success("添加成功！", url('Activity/coupon'));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {
            $time = time();
            $this->assign("time",$time);

            $this->setMeta("生成优惠券");
            return $this->fetch();
        }


    }


    //券码管理
    public function code(){
        $map = array();

        $id   = input('id', '', 'trim,intval');

        $status = input('status','','trim,intval');//状态
        if(!empty($status)){
            if($status==2){
                $map['status']='0';
            }else{
                $map['status'] = $status;
            }

        }else{
            $map['status']='0';
        }

        $map['coupon_id'] = $id;

        $order = "id desc";
        $list  = db('Code')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign('status',$status);


        $this->setMeta("券码列表");
        return $this->fetch();

    }
}