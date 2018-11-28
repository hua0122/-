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
        if (empty(session('openid'))) {
            header("Location:getwxinfo");
            exit();
        }

        $userwxinfo = model('WxUser')->where(array("openid" => session('openid')))->find();

        if($userwxinfo){
            return success($userwxinfo);
        }else{
            return failMsg();
        }

    }

    //学习中心
    public function study(){
        $openid = session("openid");
        if(empty($openid)){
            return failLogin();
        }

        $study = model('Student');
        $info = $study
            ->join('sent_grade', 'sent_grade.id=sent_student.grade_id', 'left')
            ->join('sent_area', 'sent_area.id=sent_student.area_id', 'left')
            ->field('sent_student.*,sent_grade.name as grade_name,sent_grade.price,sent_grade.content,sent_area.address,sent_area.thumb,sent_area.lat,sent_area.lng')
            ->where(array("openid" => session("openid")))->find();

        foreach ($info as $k=>$v){
            $info[$k]['picurl'] = get_cover($v['thumb'],'path');
            $info[$k]['sign_date'] = date("Y-m-d H:i:s",$v['sign_date']);
            $info[$k]['pay_date'] = date("Y-m-d H:i:s",$v['pay_date']);
        }



        //体检信息查询
        $code = model('Apply')
            ->join('sent_test', 'sent_test.id=sent_apply.code_id', 'left')
            ->join('sent_station', 'sent_station.id=sent_apply.station_id', 'left')
            ->field('sent_apply.*,sent_test.code,sent_test.verify,sent_station.name as station_name,sent_station.address,sent_station.lng,sent_station.lat')
            ->where(array("openid" => session("openid")))
            ->order("create_time desc")
            ->find();
        $data = array("study"=>$info,"code"=>$code);

        if($info){
            return success($data);
        }else{
            return emptyResult();
        }
    }

    //投诉建议
    public function feedback(){
        $data = input('post.');
        if (empty($data['content'])) {
            return failMsg('内容不能为空');
        }
        $openid = session("openid");
        if(empty($openid)){
            return failLogin();
        }
        $user = db("WxUser")->where(array("openid"=>$openid))->find();

        $data['name'] = $user['name'];
        $data['phone'] = $user['phone'];

        $data['create_time'] = time();
        $feedback = model('Feedback');
        if ($data) {
            $res = $feedback->save($data);
            if ($res) {
                return success();
            } else {
                return failMsg();

            }
        }
    }

    //我的协议
    public function agreement(){
        $openid = session("openid");
        if(empty($openid)){
            return failLogin();
        }
        $user = db("WxUser")->field("name,phone,card_id as card")->where(array("openid"=>$openid))->find();

        $where= [];
        if($user['school_id']==1){
            $content = db("Page")->where($where)->find(11);

        }else{
            $content = db("Page")->where($where)->find(11);
        }

        if($user&&$content){
            $data = array("user"=>$user,"content"=>$content);
            return success($data);
        }else{
            return emptyResult();
        }


    }


    //获取微信用户信息
    public function getwxinfo()
    {
        if (!empty($_REQUEST['data'])) {
            $data = $_REQUEST['data'];
            //echo $data;
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



            $url = "http://bmqdtest.yidianxueche.cn/index/index.html";
            header("Location:" . $url);
            session('openid',$data->openid);
            exit();
        }

        $url = "/l_wx/getwxinfo.php?method=getUserInfo&state=djjx_api";
        header("Location:" . $url);
        exit();
    }


}