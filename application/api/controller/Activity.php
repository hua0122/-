<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/17 0017
 * Time: 09:28
 */

namespace app\api\controller;


use app\common\controller\Api;

class Activity extends Api
{

    //登录
    public function login(){
        $tel = input('tel');
        $code = input('code');

        if(empty($tel)){
            return failMsg('电话号码不能为空');
        }
        if(empty($code)){
            return failMsg('验证码不能为空');
        }
        $school_id = input('school_id');
        if(empty($school_id)){
            return failMsg('学校ID不能为空');
        }

        $code = model("Msg")->where(array("code"=>$code,"tel"=>$tel))->find();
        if(!$code){
            return failMsg("验证码不正确");
        }

        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if($is_have){
            return success($is_have);
        }else{
            $data['tel'] = $tel;
            $res = model("ActivityUser")->save($data);
            if($res){
                $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
                return success($is_have);
            }else{
                return failMsg();
            }
        }




    }

    //发送验证码
    public function send_msg(){
        $tel = input('tel');
        if(empty($tel)){
            return failMsg('手机号码不能为空');
        }
        $rand = rand_string(4,1);//生成随机数

        $data['tel'] = $tel;
        $data['code'] = $rand;

        $is_have = model("Msg")->where(array("tel"=>$tel))->find();
        if($is_have){
            $res = model("Msg")->save($data,array("id"=>$is_have['id']));
        }else{
            $res = model("Msg")->save($data);
        }


        if($res){
            return send_code($tel,"正在参加活动，您的验证码是:".$rand);
        }else{
            return failMsg('发送失败');
        }



    }

    //预存
    public function prestore(){
        $amount = input("amount");
        if(empty($amount)){
            return failMsg('预存金额不能为空');
        }

        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        $pid = input("pid");
        if(!empty($pid)){

            $data['pid'] = $pid;
        }

        //查询是否已经预存
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['amount']!=0&&$is_have['amount']==100){
            return failMsg("您已经预存过了,无需再预存");
        }

        $data['amount'] = $amount;
        $where['tel'] = $tel;

        $res = model("ActivityUser")->save($data,$where);
        if($res){
            return failMsg("预存成功","200");
        }else{
            return failMsg('预存失败');
        }

    }

    //分享
    public function share(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }
        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }




    }
    //邀请
    public function invite(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }
        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }

    }

    //邀请列表
    public function invite_list(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }


        $list = model("ActivityUser")->field('name,tel')->where(array("pid"=>$is_have['id']))->select();

        if($list){
            return success($list);
        }else{
            return emptyResult();
        }


    }


    //抽奖
    public function luck(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }

        $prize_arr = array(
            '0' => array('id'=>1,'min'=>55,'max'=>80,'prize'=>'欢乐秀火锅聚会套餐500元 ','v'=>1),//弧度：55°-80°范围是：“欢乐秀火锅聚会套餐500元”奖， v=10是中奖率是10%
            '1' => array('id'=>2,'min'=>10,'max'=>35,'prize'=>'智能天猫精灵1台','v'=>7),
            '2' => array('id'=>3,'min'=>320,'max'=>355,'prize'=>'品牌充电宝1个','v'=>21),
            '3' => array('id'=>4,'min'=>230,'max'=>265,'prize'=>'100元报名优惠券','v'=>100),
            '4' => array('id'=>5,'min'=>185,'max'=>215,'prize'=>'100元秀火锅现金券','v'=>70),
        );


        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        $rid = getRand($arr); //根据概率获取奖项id
        $res = $prize_arr[$rid-1]; //中奖项
        $min = $res['min'];
        $max = $res['max'];
        $result['angle'] = mt_rand($min,$max); //随机生成一个角度
        $result['prize'] = $res['prize'];

        //存入数据库
        model("ActivityUser")->where(array("tel"=>$tel))->setField('luck_name',$result['prize']);

        return success($result);

    }



}