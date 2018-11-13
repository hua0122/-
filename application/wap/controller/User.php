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

class User extends Fornt
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $web_path = $_SERVER['SERVER_NAME'];
        $this->assign('web_path',"http://".$web_path);
    }

    //个人中心
    public function index(){

        return $this->fetch("template/wap/user/index.html");
    }

    //学习中心
    public function study(){
        return $this->fetch("template/wap/user/study.html");
    }

    //投诉建议
    public function feedback(){

        if(IS_POST){
            $data = input('post.');
            if(empty($data['content'])){
                $this->error('内容不能为空');
            }
            $feedback = model('Feedback');
            if($data){
               $res=$feedback->save($data);
               if($res){
                   return stripslashes(json_encode(array("code"=>"200")));
               }else{
                   return json_encode(array("code"=>"500"));

               }
            }

        }else{
            return $this->fetch("template/wap/user/feedback.html");
        }

    }

}