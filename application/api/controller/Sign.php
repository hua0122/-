<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/24 0024
 * Time: 17:26
 */

namespace app\api\controller;

use app\common\controller\Api;

class Sign extends Api
{
    //获取banner图
    public function get_banner()
    {
        $where = array("category_id" => 8);
        $where['school_id'] = input('school_id','','trim,intval');
        $res = db("Document")
            ->field("title,cover_id,school_id")
            ->where($where)->limit('0,5')->select();
        if ($res) {
            foreach ($res as $k=>$v){
                $res[$k]['picurl'] = get_cover($v['cover_id'],"path") ;
            }
            return success($res);
        } else {
            return emptyResult();
        }

    }

    //场地列表
    public function get_area()
    {
        $where = [];
        $where['school_id'] = input('school_id','','trim,intval');
        if(empty(input('school_id','','trim,intval'))){
            return failIncomplete();
        }
        $where['status'] = 0;
        $area = model('Area');
        $res = $area->where($where)->select();
        if ($res) {
            foreach ($res as $k=>$v){
                $res[$k]['picurl'] = get_cover($v['thumb'],"path") ;
            }
            return success($res);
        } else {
            return emptyResult();
        }

    }

    //班别列表
    public function get_grade()
    {
        $area_id = input('area_id', '', 'trim,intval');
        $grade = model('Grade');
        $res = $grade->where(array('area_id' => $area_id, "status" => 0))->select();
        if ($res) {
            return success($res);
        } else {
            return emptyResult();
        }
    }

    //班别详情
    public function grade_detail()
    {
        $id = input('id', '', 'trim,intval');
        $grade = model('Grade');
        $info = $grade->join('sent_area ', 'sent_area.id = sent_grade.area_id', 'left')
            ->field('sent_grade.*,sent_area.name as area_name,sent_area.thumb,sent_area.address,sent_area.lng,sent_area.lat')
            ->where(array('sent_grade.id' => $id))->find();
        if ($info) {

                $info['picurl'] = get_cover($info['thumb'],"path") ;

            return success($info);
        } else {
            return emptyResult();
        }
    }

    //活动列表
    public function get_activity()
    {
        $where = [];
        $where['downline_time'] = array('gt',time());
        $where['school_id'] = input('school_id','','trim,intval');
        $res = db('Activity')->where($where)->limit(0, 3)->select();
        if($res){
            foreach($res as $k=>$v){
                $res[$k]['picurl'] = get_cover($v['icon'],"path") ;
            }

            return success($res);
        }else{
            return emptyResult();
        }

    }

    //查询活动是否有效 活动详情
    public function activity_detail(){
        //查询活动优惠金额
        $activity_id = input('activity_id', '', 'trim,intval');
        if (!empty($activity_id)) {
            $res = db("Activity")->find($activity_id);
            if ($res) {
                return success($res);
            } else {
                return emptyResult('活动不存在或已下线');
            }
        }
    }

    //查询优惠券是否有效
    public function yhq_code()
    {
        $code = input('code', '', 'htmlspecialchars,trim');
        if (!empty($code)) {
            $res = model("Code")->where(array("code" => $code,"status"=>0))->find();
            if ($res) {
                return success($res);
            } else {
                return emptyResult('无效');
            }
        }


    }

    //查询推荐码是否有效
    public function referral()
    {
        $code = input('code', '', 'htmlspecialchars,trim');
        if (!empty($code)) {
            $res = db('Department')->where(array("code" => $code))->find();
            if ($res) {
                return success($res);
            } else {
                $res = db('Person')->where(array("code" => $code))->find();
                if ($res) {
                    return success($res);
                } else {
                    return emptyResult("推荐码无效,请重新输入");
                }
            }
        }
    }




    //我要报名
    public function submit_sign()
    {
        include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/config.php';
        $openid = input('openid')?input('openid'):session("openid");

        if(empty($openid)){
            return failMsg('请先登录');
        }

        $school_id = input('school_id','','trim,intval');
        if(!empty($school_id)){
            if($school_id==1){//鼎吉驾校
                $appid = APPID_DJ;
            }elseif($school_id==2){//金西亚驾校
                $appid = APPID_JXY;
            }elseif($school_id==3){//城南驾校
                $appid = APPID_CN;
            }elseif($school_id==4){//西南驾校
                $appid = APPID_XN;
            }
            elseif($school_id==5){ //秀学车
                $appid = APPID_XXC;
            }
            elseif($school_id==6){ //易点学车
                $appid = APPID;
            }

            else{
                $appid = APPID;
            }
        }


        $data = input('post.');
        if (!$data['name']) {
            return failMsg("姓名不能为空");
        }
        if (!$data['phone']) {
            return failMsg("电话不能为空");
        }
        if (!$data['card']) {
            return failMsg("身份证号码不能为空");
        }

        //缴费类型
        if ($data['pay_type'] == 1) {
            //线上全额支付
            $data['unpaid'] = 0;//未付款
            $data['tuition_state'] = 1;//学费状态 1全款
        } else if ($data['pay_type'] == 2 || $data['pay_type'] == 3 || $data['pay_type'] == 4) {
            //活动减免 优惠券减免
            if (isset($data['activity_id']) && isset($data['coupon'])) {
                //线上定金支付 //未付款
                $data['unpaid'] = intval($data['payable']) - intval($data['payment']) - intval($data['activity_id']) - intval($data['coupon']);
            } elseif (isset($data['activity_id'])) {
                //线上定金支付 //未付款
                $data['unpaid'] = intval($data['payable']) - intval($data['payment']) - intval($data['activity_id']);

            } elseif (isset($data['coupon'])) {
                //线上定金支付 //未付款
                $data['unpaid'] = intval($data['payable']) - intval($data['payment']) - intval($data['coupon']);

            } else {
                //线上定金支付 //未付款
                $data['unpaid'] = intval($data['payable']) - intval($data['payment']);
            }

            $data['tuition_state'] = 2; //学费状态 2欠费
        } else {
            //缴费类型不对
            return failMsg("缴费类型不对");
        }


        //查询是否报名  不能重复报名
        $is_have = model("Student")->where(array("openId" => $openid,"is_pay"=>"1"))->find();
        if ($is_have) {
            return failMsg("不能重复报名");
        }


        $data['sign_date'] = time();//报名时间
        $data['openId'] = $openid;
        $data['sn'] = "dj_" . rand_string(20);//订单编号

        $res = model("Student")->save($data);
        if ($res) {
            //保存姓名、电话、身份证号码到用户表
            $data_user['name'] = $data['name'];
            $data_user['phone'] = $data['phone'];
            $data_user['card_id'] = $data['card'];
            $where['openid'] = $openid;
            model("WxUser")->save($data_user, $where);
            //增加活动报名人数
            if(isset($data['activity_id'])){
                model("Activity")->where(array("id"=>$data['activity_id']))->setInc('number',1);
            }

            //增加团队招生数
            if(isset($data['inviter'])){
                $res = db("Department")->find($data['inviter']);
                if($res){
                    model("Department")->where(array("id"=>$data['inviter']))->setInc('number',1);
                    model("Department")->where(array("id"=>$data['inviter']))->setInc('total',1);
                }else{
                    $person = db("Person")->find($data['inviter']);
                    if($person){
                        model("Person")->where(array("id"=>$data['inviter']))->setInc('number',1);
                        model("Department")->where(array("id"=>$person['department_id']))->setInc('total',1);
                    }

                }
            }

            //修改优惠券使用状态
            if(isset($data['coupon'])){
                model("Code")->where(array("id"=>$data['coupon']))->setField('status','1');
            }

            //发送模板消息
            include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
            $wx = new \Weixin_class();

            //$content = $wx->send_template_msg($sign['school_id'],$sign['openid'],$sign['name'],$sign['payable']);
            $content = $wx->send_template_msg($school_id,$openid,$data['name'],$data['payable']);



            $total_fee = $data['payment'] * 100;


            if (!empty($total_fee) && $total_fee > 0 && !empty($openid)) {
                $total_fee = 0.01 * 100;
                include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
                $wx = new \Weixin_class();
                //$msg = "我们会在两个工作日内联系您，请保持手机畅通，耐心等待，谢谢！";
                $unifiedOrderResult = $wx->unifiedorder($total_fee, $openid, '驾校学车', $data['sn'],$school_id);
                //var_dump($unifiedOrderResult);
                $timeStamp = intval(time() / 10);
                $url = $_SERVER["HTTP_REFERER"];
                //echo $url;
                $nonceStr = $wx->getRandChar(15);
                //echo $url;
                $signature = $wx->get_js_signature($nonceStr, $timeStamp, $url,$school_id);
                //var_dump($unifiedOrderResult);exit();
                $package = "prepay_id=" . $unifiedOrderResult->prepay_id;
                $data = array("timeStamp" => $timeStamp, "nonceStr" => $nonceStr,
                    "package" => $package, "signType" => "MD5", "appId" => $appid);

                $paySign = $wx->get_signature($data,$school_id);
                $content = array('package' => $package, 'paySign' => $paySign, 'appId' => $appid, 'timestamp' => $timeStamp, 'nonceStr' => $nonceStr, 'signature' => $signature);
                return success($content);
            } else {
                return success();
            }


        } else {
            return failMsg("报名失败");
        }
    }

    //体检站列表
    public function get_station(){
        $where = [];
        //$where['sent_outfit.school_id'] = input('school_id','','trim,intval');
        $station = db("Station")
            ->join('sent_outfit','sent_outfit.id=sent_station.outfit_id','left')
            ->field('sent_station.*,sent_outfit.name as outfit_name')
            ->where($where)->select();

        if($station){
            return success($station);
        }else{
            return emptyResult();
        }

    }


    //申请体检
    public function apply(){
        include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
        $wx = new \Weixin_class();

        $data['name'] = input('name');
        $data['phone'] = input('phone');
        $data['station_id'] = input('station_id');
        $price = input('money');
        $data['openid'] = input('openid')?input('openid'):session("openid");
        $data['create_time'] = time();

        if(empty($data['openid'])){
            return failMsg('请先登录');
        }

        if(empty($data['name'])){
            return failMsg('姓名不能为空');
        }

        if(empty($data['phone'])){
            return failMsg('电话不能为空');
        }
        if(empty($data['station_id'])){
            return failMsg('体检站不能为空');
        }

        if(empty($price)){
            return failMsg('价格不能为空');
        }


        $school_id = input('school_id','','trim,intval');
        if(!empty($school_id)){
            if($school_id==1){//鼎吉驾校
                $appid = APPID_DJ;
            }elseif($school_id==2){//金西亚驾校
                $appid = APPID_JXY;
            }elseif($school_id==3){//城南驾校
                $appid = APPID_CN;
            }elseif($school_id==4){//西南驾校
                $appid = APPID_XN;
            }
            elseif($school_id==5){ //秀学车
                $appid = APPID_XXC;
            }
            elseif($school_id==6){ //易点学车
                $appid = APPID;
            }

            else{
                $appid = APPID;
            }
        }



        //查询是否报名
        $is_have = model("Student")->where(array("openId" => $data['openid']))->find();
        if (!$is_have) {
            return failMsg("还未报名,请先报名");
        }



        //先查询是否已经申请过 如果已经申请过 多次申请需缴费  首次申请免费
        $is_have = model("Apply")->where(array("openid"=>$data['openid']))->find();

        if($is_have){

            $res = model("Apply")->save($data);
            $insert_id = model("Apply")->getLastInsID();

            if ($res) {

                $sn = "tj_" . rand_string(20);//订单编号
                $total_fee = $price * 100;
                if (!empty($total_fee) && $total_fee > 0 && !empty($data['openid'])) {
                    $unifiedOrderResult = $wx->unifiedorder($total_fee, $data['openid'], '申请体检', $sn,$school_id);
                    //var_dump($unifiedOrderResult);
                    $timeStamp = intval(time() / 10);
                    $url = $_SERVER["HTTP_REFERER"];
                    //echo $url;
                    $nonceStr = $wx->getRandChar(15);
                    //echo $url;
                    $signature = $wx->get_js_signature($nonceStr, $timeStamp, $url,$school_id);
                    //var_dump($unifiedOrderResult);exit();
                    $package = "prepay_id=" . $unifiedOrderResult->prepay_id;
                    $data = array("timeStamp" => $timeStamp, "nonceStr" => $nonceStr,
                        "package" => $package, "signType" => "MD5", "appId" => $appid);

                    $paySign = $wx->get_signature($data);
                    $content = array('package' => $package, 'paySign' => $paySign, 'appId' => $appid, 'timestamp' => $timeStamp, 'nonceStr' => $nonceStr, 'signature' => $signature);

                    $sn = array("sn" => $sn);
                    $where = array("id" => $insert_id);

                    model("Apply")->save($sn,$where);
                    return success($content);

                }else{
                    return failIncomplete();
                }


            }

        }else{
            $data['is_pay'] = "1";
            $res = model("Apply")->save($data);
            $insert_id = model("Apply")->getLastInsID();
            if($res){
                //查询订单的体检站和电话号码
                $apply =model("Apply")->field('sent_apply.*,sent_station.outfit_id')
                    ->join('sent_station','sent_station.id=sent_apply.station_id','left')
                    ->where(array("sent_apply.id"=>$insert_id))->find();
                //查询未分配的体检码
                $code_info = model("Test")->where(array("status"=>0,"outfit_id"=>$apply['outfit_id']))->limit(0,1)->select();
                $code_id = $code_info[0]['id'];
                $is_use = array('status'=>1,"username"=>$apply['name'],"phone"=>$apply['phone'],"apply_time"=>time());
                $where = array('id'=>$code_id);
                //print_r($code_info); exit;
                //修改体检码表的使用状态 修改为已分配
                model('Test')->save($is_use,$where);
                //赋值体检申请表里面的体检码
                model("Apply")->where(array("id"=>$insert_id))->setField('code_id',$code_id);


                return json( ['status' => '2000', 'msg' => '申请成功'] );
            }else{
                return failMsg("申请失败");
            }

        }


    }

    //申请体检页面 获取学员报名信息
    public function get_sign(){
        $openid = input('openid')?input('openid'):session("openid");

        if(empty($openid)){
            return failMsg('请先登录');
        }

        $info = model("Student")->field('name,phone')->where(array("openid"=>$openid))->find();
        if($info){
            return success($info);
        }else{
            return emptyResult();
        }

    }

}