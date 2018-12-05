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
        $tel = input('tel','','trim.intval');
        $code = input('code','','trim.intval');
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

        }else{
            $data = model("Department")->field('')->where(array("phone"=>$tel))->find();
        }

        $code = model("Msg")->where(array("code"=>$code,"tel"=>$tel))->find();
        if(!$code){
            return failMsg("验证码不正确");
        }



        return success($data);




    }

    //发送验证码
    public function sent_msg(){

    }

}