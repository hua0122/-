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
        $area = model('Area');
        $res = $area->where(array("status" => 0))->select();
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
            $res = model("Code")->where(array("code" => $code))->find();
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
        $openid = input('openid')?input('openid'):session("openid");

        //查询是否报名  不能重复报名
        $is_have = model("Student")->where(array("openId" => $openid))->find();
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

            $total_fee = $data['payment'] * 100;


            if (!empty($total_fee) && $total_fee > 0 && !empty($openid)) {
                $total_fee = 0.01 * 100;
                include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
                $wx = new \Weixin_class();
                $msg = "我们会在两个工作日内联系您，请保持手机畅通，耐心等待，谢谢！";
                $unifiedOrderResult = $wx->unifiedorder($total_fee, $openid, '驾校学车', $data['sn']);
                //var_dump($unifiedOrderResult);
                $timeStamp = intval(time() / 10);
                $url = $_SERVER["HTTP_REFERER"];
                //echo $url;
                $nonceStr = $wx->getRandChar(15);
                //echo $url;
                $signature = $wx->get_js_signature($nonceStr, $timeStamp, $url);
                //var_dump($unifiedOrderResult);exit();
                $package = "prepay_id=" . $unifiedOrderResult->prepay_id;
                $data = array("timeStamp" => $timeStamp, "nonceStr" => $nonceStr,
                    "package" => $package, "signType" => "MD5", "appId" => 'wx09e39aed7d3c3912');

                $paySign = $wx->get_signature($data);
                $content = array('package' => $package, 'paySign' => $paySign, 'appId' => 'wx09e39aed7d3c3912', 'timestamp' => $timeStamp, 'nonceStr' => $nonceStr, 'signature' => $signature);
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
        $where['sent_outfit.school_id'] = input('school_id','','trim,intval');
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

        $data = input('post.');

        $price = input('money');
        $data['openid'] = input('openid')?input('openid'):session("openid");
        $data['create_time'] = time();



        //先查询是否已经申请过 如果已经申请过 多次申请需缴费  首次申请免费
        $is_have = model("Apply")->where(array("openid"=>session("openid")))->find();
        if($is_have){
            $res = model("Apply")->save($data);
            $insert_id = model("Apply")->getLastInsID();
            if ($res) {
                $openid = session("openid");
                $sn = "tj_" . rand_string(20);//订单编号
                $total_fee = $price * 100;
                if (!empty($total_fee) && $total_fee > 0 && !empty($openid)) {
                    $code = 1;
                    $msg = "我们会在两个工作日内联系您，请保持手机畅通，耐心等待，谢谢！";
                    $unifiedOrderResult = $wx->unifiedorder($total_fee, $openid, '驾校学车', $sn);
                    //var_dump($unifiedOrderResult);
                    $timeStamp = intval(time() / 10);
                    $url = $_SERVER["HTTP_REFERER"];
                    //echo $url;
                    $nonceStr = $wx->getRandChar(15);
                    //echo $url;
                    $signature = $wx->get_js_signature($nonceStr, $timeStamp, $url);
                    //var_dump($unifiedOrderResult);exit();
                    $package = "prepay_id=" . $unifiedOrderResult->prepay_id;
                    $data = array("timeStamp" => $timeStamp, "nonceStr" => $nonceStr,
                        "package" => $package, "signType" => "MD5", "appId" => 'wx09e39aed7d3c3912');

                    $paySign = $wx->get_signature($data);
                    $content = array('package' => $package, 'paySign' => $paySign, 'appId' => 'wx09e39aed7d3c3912', 'timestamp' => $timeStamp, 'nonceStr' => $nonceStr, 'signature' => $signature);

                    $sn = array("sn" => $sn);
                    $where = array("id" => $insert_id);

                    model("Apply")->save($sn,$where);

                }
                if (empty(session("openid"))) {
                    $code = -1;
                    $msg = "错误";
                    $content ="";
                }
               return success($content);

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
}