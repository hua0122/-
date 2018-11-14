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
        if (empty(session('openid'))) {
            header("Location:getwxinfo");
            exit();
        }

        $userwxinfo = model('WxUser')->where(array("openid"=>session('openid')))->find();
        $this->assign("userwxinfo",$userwxinfo);

        return $this->fetch("template/wap/user/index.html");
    }

    //学习中心
    public function study(){
        $study = model('Student');
        $info = $study->where(array("openid"=>session("openid")))->find();
        if($info){
            $this->assign("info",$info);

        }
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


    //获取微信用户信息
    public function getwxinfo(){
        if (!empty($_REQUEST['data']) || !empty(session("openid"))) {
            $data = $_REQUEST['data'];

            if($data!='false'){
                $data = json_decode($data, JSON_UNESCAPED_UNICODE);
                $data = json_decode($data);
                var_dump($data);

                if(session("openid")){
                    session("openid",session("openid"));
                }else{
                    session("openid",$data->openid);
                }

                $info = model('WxUser')->where(array("openid"=>$data->openid))->find();

                if (count($info) <= 0) {
                    $sign = array(
                        "openid"  => $data->openid,
                        "nickname"  => $data->nickname,
                        'sex' => $data->sex,
                        "city"  => $data->city,
                        "country"  => $data->country,
                        "province"  => $data->province,
                        "headimgurl"  => $data->headimgurl,
                        "subscribe_time" => time()
                    );

                    model('WxUser')->save($sign);
                }

                $url = "index";
                header("Location:" . $url);
                exit();
            }else{
                echo "请在微信客户端打开";
            }

        }

        $url = "/l_wx/getwxinfo.php?method=getUserInfo&state=djjx";
        header("Location:" . $url);
        exit();
    }


}