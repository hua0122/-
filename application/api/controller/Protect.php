<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/5 0005
 * Time: 14:29
 */

namespace app\api\controller;


use app\common\controller\Api;

class Protect extends Api
{

    public function index(){


    }
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

        $department = model("Department")->where(array("phone"=>$tel))->find();
        if(!$department){
            $person = model("Person")->where(array("mobile"=>$tel))->find();
            if(!$person){
                return failMsg("电话号码不存在");
            }
            $data = model("Person")->field('username,code,mobile as phone')->where(array("mobile"=>$tel))->find();

        }else{
            $data = model("Department")->field('title as username,code,phone')->where(array("phone"=>$tel))->find();
        }

        $code = model("Msg")->where(array("code"=>$code,"tel"=>$tel))->find();
        if(!$code){
            return failMsg("验证码不正确");
        }



        return success($data);




    }

    //发送验证码
    public function sent_msg(){
        $tel = input('tel');
        if(empty($tel)){
            return failMsg('手机号码不能为空');
        }
        $rand = rand_string(4,1);//生成随机数

        $data['tel'] = $tel;
        $data['code'] = $rand;
        $res = model("Msg")->save($data);
        if($res){
            return sent_code($tel,"欢迎登录保护系统，您的验证码是:".$rand);
        }else{
            return failMsg('发送失败');
        }



    }

    //设置推荐码
    public function set_code(){
        $tel = input('tel');
        $username = input('username');
        $code = input('code');
        if(empty($tel)){
            return failMsg('手机号码不能为空');
        }
        if(empty($username)){
            return failMsg('姓名不能为空');
        }
        if(empty($code)){
            return failMsg('推荐码不能为空');
        }

        $data['title'] = $username;
        $data['code'] = $code;

        $d = model("Department")->where(array("code"=>$code))->find();
        $p = model("Person")->where(array("code"=>$code))->find();
        if($d||$p){
            return failMsg("您下手慢了,试一试其他的吧",'301');
        }


        $data1['username'] = $username;
        $data1['code'] = $code;
        $res = model("Department")->save($data,array("phone"=>$tel));
        if(!$res){
            $re = model("Person")->save($data1,array("mobile"=>$tel));
            if(!$re){
                return failMsg('设置失败');
            }
        }

        return success();


    }

    //查询推荐码
    public function get_code(){
        $tel = input('tel');
        if(empty($tel)){
            return failMsg('手机号码不能为空');
        }

        $department = model("Department")->where(array("phone"=>$tel))->find();
        if(!$department){
            $person = model("Person")->where(array("mobile"=>$tel))->find();
            if(!$person){
                return failMsg("电话号码不存在");
            }
            $data = model("Person")->field('username,code,mobile as phone')->where(array("mobile"=>$tel))->find();

        }else{
            $data = model("Department")->field('title as username,code,phone')->where(array("phone"=>$tel))->find();
        }

        return success($data);


    }
    //查询学员是否已经被保护
    public function select_student(){
        $tel = input('tel');
        if(empty($tel)){
            return failMsg('学员手机号码不能为空');
        }
        //查询学员是否已经被保护
        $is_have = model("Protect")->where(array("tel"=>$tel))->find();
        if($is_have){
            return fail($is_have,"学员已经被保护");
        }else{
            return success();
        }
    }

    //意向资源保护
    public function resource_add(){
        $name = input('name');
        $tel = input('tel');
        $person = input('person');
        if(empty($person)){
            return failMsg('推荐人号码不能为空');
        }
        if(empty($tel)){
            return failMsg('学员手机号码不能为空');
        }
        //查询学员是否已经被保护
        $is_have = model("Protect")->where(array("tel"=>$tel))->find();
        if($is_have){
            return fail($is_have,"学员已经被保护");
        }


        $data['name'] = $name;
        $data['person'] = $person;
        $data['tel'] = $tel;
        $data['protect_time'] = time();
        $data['deactivation_time'] = '';//脱保时间规定
        $res = model("Protect")->save($data);
        if($res){
            return success($data);
        }else{
            return  failMsg('失败');
        }
    }


    //开发记录添加
    public function record_add(){
        $name = input('name');//学员姓名
        $tel = input('tel');//学员电话
        $channel = input('channel');//资源获取途径
        $progress = input('progress');//跟进进度
        $deal_time = input('deal_time');//预计成交时间
        $remark = input('remark');
        $person = input('person');
        if(empty($person)){
            return failMsg('推荐人号码不能为空');
        }

        if(empty($tel)){
            return failMsg('学员手机号码不能为空');
        }
        if(empty($channel)){
            return failMsg('资源获取途径不能为空');
        }

        $data['person'] = $person;
        $data['name'] = $name;
        $data['tel'] = $tel;
        $data['channel'] = $channel;
        $data['deal_time'] = $deal_time;
        $data['remark'] = $remark;
        $res = model('Develop')->save($data);
        $last_id = model('Develop')->getLastInsID();
        if($res){
            $data1['progress'] = $progress;
            $data1['develop'] = $last_id;
            model("Progress")->save($data1);

            return success($data);
        }else{
            return  failMsg('失败');
        }


    }

}