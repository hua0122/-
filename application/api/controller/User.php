<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/24 0024
 * Time: 17:40
 */

namespace app\api\controller;


use app\common\controller\Api;

class User extends Api
{

    //个人信息
    public function index(){
        $openid = input('openid')?input('openid'):session("openid");
        if (empty($openid)) {
            return failLogin();
        }

        $userwxinfo = model('WxUser')->where(array("openid" => $openid))->find();

        if($userwxinfo){
            return success($userwxinfo);
        }else{
            return failMsg();
        }

    }

    //学习中心
    public function study(){
        $openid = input('openid')?input('openid'):session("openid");
        if(empty($openid)){
            return failLogin();
        }

        $study = model('Student');
        $info = $study
            ->join('sent_grade', 'sent_grade.id=sent_student.grade_id', 'left')
            ->join('sent_area', 'sent_area.id=sent_student.area_id', 'left')
            ->join('sent_activity','sent_activity.id=sent_student.activity_id','left')
            ->field('sent_student.*,sent_grade.name as grade_name,sent_grade.price,sent_grade.content,sent_grade.notice,sent_area.address,sent_area.thumb,sent_area.lat,sent_area.lng,sent_activity.name as activity_name,sent_activity.amount as activity_amount,sent_activity.gift as activity_gift,sent_activity.type as activity_type,sent_activity.two_amount,sent_activity.three_amount,sent_activity.five_amount')
            ->where(array("openid" => $openid))->find();
        if($info){

                $info['picurl'] = get_cover($info['thumb'],'path');
                $info['sign_date'] = date("Y-m-d H:i:s",$info['sign_date']);
                $info['pay_date'] = date("Y-m-d H:i:s",$info['pay_date']);
                $info['wechat'] = "1423862202";//微信支付商户号

        }else{
            return emptyResult('还未报名');
        }

        //体检信息查询
        $code = model('Apply')
            ->join('sent_test', 'sent_test.id=sent_apply.code_id', 'left')
            ->join('sent_station', 'sent_station.id=sent_apply.station_id', 'left')
            ->field('sent_apply.*,sent_test.code,sent_test.verify,sent_station.name as station_name,sent_station.address,sent_station.lng,sent_station.lat')
            ->where(array("openid" => $openid))
            ->order("create_time desc")
            ->select();

        $data = array("study"=>$info,"code"=>$code);

        if($info){
            return success($data);
        }else{
            return emptyResult();
        }
    }

    //投诉建议
    public function feedback(){
        $data['content'] = input('content');
        $data['school_id'] = input('school_id');
        if (empty($data['content'])) {
            return failMsg('内容不能为空');
        }
        if (empty($data['school_id'])) {
            return failMsg('学校ID不能为空');
        }
        $openid = input('openid')?input('openid'):session("openid");
        if(empty($openid)){
            return failLogin();
        }


        $user = db("WxUser")->where(array("openid"=>$openid))->find();
        if($user){
            $data['name'] = $user['name'];
            $data['phone'] = $user['phone'];
        }



        $feedback = model('Feedback');
        if ($data) {
            $res = $feedback->save($data);
            if ($res) {
                return success($data);
            } else {
                return failMsg();

            }
        }
    }

    //我的协议
    public function agreement(){
        $openid = input('openid')?input('openid'):session("openid");
        if(empty($openid)){
            return failLogin();
        }
        $user = db("WxUser")->field("name,phone,card_id as card,school_id")->where(array("openid"=>$openid))->find();

        $where= [];
        if($user['school_id']==1){
            $content = db("Page")->where($where)->find(11);

        }else{
            $content = db("Page")->where($where)->find(11);
        }

        //查询该用户报名的班别
        $grade = db("Student")->field('sent_grade.name,sent_grade.type')
            ->join("sent_grade",'sent_grade.id=sent_student.grade_id','left')
            ->where(array("openid"=>$openid))->find();


        if($user&&$content&&$grade){
            $data = array("user"=>$user,"content"=>$content,'grade'=>$grade);
            return success($data);
        }else{
            return failMsg('还未报名,没有协议');
        }


    }


    //获取微信用户信息
    public function getwxinfo_ydxc()
    {
        

        if (!empty($_REQUEST['data'])) {
            $data = $_REQUEST['data'];

            $data = json_decode($data, JSON_UNESCAPED_UNICODE);
            $data = json_decode($data);

            if (session("openid")) {
                session("openid", session("openid"));
            } else {
                session("openid", $data->openid);//这一步保存openid到session
            }
            $info = model('WxUser')->where(array("openid" => $data->openid))->find();



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


            $url = "http://ydxc.yidianxueche.cn/index/index.html?openid=".$data->openid;

            header("Location:" . $url);
            exit;


        }
       
        $url = "/l_wx/getwxinfo.php?method=getUserInfo&state=ydxc_api";
        header("Location:" . $url);
        exit();
    }

    //获取微信用户信息
    public function getwxinfo_ydxchd()
    {


        if (!empty($_REQUEST['data'])) {
            $data = $_REQUEST['data'];

            $data = json_decode($data, JSON_UNESCAPED_UNICODE);
            $data = json_decode($data);

            if (session("openid")) {
                session("openid", session("openid"));
            } else {
                session("openid", $data->openid);//这一步保存openid到session
            }
            $info = model('WxUser')->where(array("openid" => $data->openid))->find();



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



            $url = "http://ydxc.yidianxueche.cn/dingji_active/index.html?openid=".$data->openid;



            header("Location:" . $url);
            exit;


        }

        $url = "/l_wx/getwxinfo.php?method=getUserInfo&state=ydxchd_api";
        header("Location:" . $url);
        exit();
    }


    //获取微信用户信息
    public function getwxinfo()
    {
        if (!empty($_REQUEST['data'])) {
            $data = $_REQUEST['data'];

            $data = json_decode($data, JSON_UNESCAPED_UNICODE);
            $data = json_decode($data);

            if (session("openid")) {
                session("openid", session("openid"));
            } else {
                session("openid", $data->openid);//这一步保存openid到session
            }
            $info = model('WxUser')->where(array("openid" => $data->openid))->find();



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


            $url = "http://djjx.yidianxueche.cn/index/index.html?openid=".$data->openid;


            header("Location:" . $url);
            exit;


        }

        $url = "/l_wx/getwxinfo.php?method=getUserInfo&state=djjx_api";
        header("Location:" . $url);
        exit();
    }

    //获取微信用户信息
    public function getwxinfo_xxc()
    {

        if (!empty($_REQUEST['data'])) {
            $data = $_REQUEST['data'];

            $data = json_decode($data, JSON_UNESCAPED_UNICODE);
            $data = json_decode($data);

            if (session("openid")) {
                session("openid", session("openid"));
            } else {
                session("openid", $data->openid);//这一步保存openid到session
            }
            $info = model('WxUser')->where(array("openid" => $data->openid))->find();



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


            $url = "http://xxc.yidianxueche.cn/index/index.html?openid=".$data->openid;


            header("Location:" . $url);
            exit;


        }

        $url = "/l_wx/getwxinfo.php?method=getUserInfo&state=xxc_api";
        header("Location:" . $url);
        exit();
    }




    //----------------------------------


    //获取code  并根据回调地址获取openid 及access_token
    public function get_code(){
        include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
        //$wx = new \Weixin_class();
        $openid = session('openid');
        $code = input('code');
        if($code){
            $openid = $this->get_openid($code);
        }

        if(empty($openid)){
            $redirect_uri="http://" . $_SERVER['HTTP_HOST']."/api/user/get_code";
            $scope ="snsapi_base";
            $state = "STATE";
            $codeurl = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' .
                APPID  . '&redirect_uri='.
                $redirect_uri .'&response_type=code&scope='.$scope.'&state=' .
                $state . '#wechat_redirect';
            header("Location:" . $codeurl);
        }else{
            session('openid',$openid);
        }

        return $openid;


    }

    //根据code取openid
    public function get_openid($code){
        $getaccessurl = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.
            APPID.'&secret='.APPSECRET.'&code='.$code.'&grant_type=authorization_code';

        $data = file_get_contents($getaccessurl);
        $data = json_decode($data, true);

        return $data;
    }


    //根据openid获取用户信息
    public function get_user_info(){

        $data = $this->get_code();

        $infourl = "https://api.weixin.qq.com/sns/userinfo?access_token=".$data['access_token'] .
            "&openid=" . $data['openid'] . "&lang=zh_CN";

        $user_info = file_get_contents($infourl);
        $data= json_encode($user_info, JSON_UNESCAPED_UNICODE);

        return $data;

    }




}