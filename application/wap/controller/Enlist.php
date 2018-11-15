<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/30 0030
 * Time: 15:04
 */

namespace app\wap\controller;
use app\common\controller\Fornt;
use think\Request;

class Enlist extends Fornt
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $web_path = $_SERVER['SERVER_NAME'];
        $this->assign('web_path',"http://".$web_path);
    }

    //报名班级列表页
    public function index(){
        if (empty(session('openid'))) {
            header("Location:../user/getwxinfo");
            exit();
        }

        $area = model('Area');
        $area = $area->select();

        $grade = model('Grade');
        $grade = $grade->where(array('area_id'=>'1'))->select();

        //banner图
        $where = array("category_id"=>8);
        $banner = db("Document")->where($where)->limit('0,5')->select();
        $this->assign("banner",$banner);

        $this->assign('area',$area);
        $this->assign('grade',$grade);
        return $this->fetch("template/wap/enlist/index.html");
    }

    //详情页
    public function detail(){

        $web_path = $_SERVER['SERVER_NAME'];
        $this->assign('web_path',"http://".$web_path);

        $id   = input('id', '', 'trim,intval');
        $grade = model('Grade');
        $info = $grade->join('sent_area ','sent_area.id = sent_grade.area_id','left')
            ->field('sent_grade.*,sent_area.name as area_name,sent_area.thumb,sent_area.address,sent_area.lng,sent_area.lat')
            ->where(array('sent_grade.id'=>$id))->find();

        $this->assign('info',$info);
        return $this->fetch("template/wap/enlist/detail.html");
    }


    //班级ajax列表
    public function ajax_list(){
        $area_id = input('city', '', 'trim,intval');
        $where = array("area_id"=>$area_id);
        $grade = model('Grade');
        $res = $grade->where($where)->select();

        echo json_encode($res);

    }


    //报名页面
    public function sign(){
        $id = input('id','','trim,intval');
        if(IS_POST){
            $data = input('post.');
            if(!$data['name']){
                return json_encode(array("code"=>"400","msg"=>"姓名不能为空"));
            }
            if(!$data['phone']){
                return json_encode(array("code"=>"400","msg"=>"电话不能为空"));
            }
            if(!$data['card']){
                return json_encode(array("code"=>"400","msg"=>"身份证号码不能为空"));
            }

            //缴费类型
            if($data['pay_type']==1){
                //线上全额支付
                $data['unpaid'] = 0;//未付款
                $data['tuition_state'] = 1;//学费状态 1全款
            }else if($data['pay_type']==2){
                //线上定金支付
                $data['unpaid'] = $data['payable']-$data['payment']-$data['activity_id']-$data['coupon'];//未付款
                $data['tuition_state'] = 2;
            }else if($data['pay_type']==3||$data['pay_type']==4){
                //线下全额支付 或者线下定金支付
                $data['unpaid'] = $data['payable']-$data['activity_id']-$data['coupon'];
                $data['tuition_state'] = 2;
            }else{
                //缴费类型不对
                return json_encode(array("code"=>"400","msg"=>"缴费类型不对"));
            }


            $data['sign_date'] = time();//报名时间
            $data['openId'] = session('openid');
            $data['sn'] = "dj_".rand_string(20);//订单编号


            $res = model("Student")->save($data);
            if($res){
                return json_encode(array("code"=>"200","msg"=>"报名成功"),JSON_UNESCAPED_SLASHES);
            }else{
                return json_encode(array("code"=>"400","msg"=>"报名失败"),JSON_UNESCAPED_SLASHES);
            }



        }else{
            //班级信息展示
            $grade = model('Grade')
                ->join('sent_area','sent_area.id=sent_grade.area_id','left')
                ->field('sent_grade.*,sent_area.name as area_name,sent_area.id as area_id')
                ->where(array("sent_grade.id"=>$id))
                ->find();
            $this->assign('grade',$grade);
            //活动信息展示
            $activity = model('Activity')->limit(0,3)->select();
            $this->assign('activity',$activity);


            return $this->fetch("template/wap/enlist/sign.html");
        }

    }

    //报名成功页面
    public function cg(){
        return $this->fetch("template/wap/enlist/success.html");
    }


    //学车协议
    public function agreement(){
        if (IS_POST) {
            $data = input('post.');
            session('agreement_name',$data);
            return json_encode($data);
        }else{
            $this->assign('agreement',session('agreement_name'));
            return $this->fetch("template/wap/enlist/agreement.html");
        }

    }
}