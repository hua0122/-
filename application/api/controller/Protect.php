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

        sent_code($tel,"测试");


        $data['tel'] = $tel;
        $data['code'] = $rand;
        $res = model("Msg")->save($data);
        if($res){
            return success($data);
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

}