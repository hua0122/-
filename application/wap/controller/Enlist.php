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

class Enlist extends Fornt
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $web_path = $_SERVER['SERVER_NAME'];
        $this->assign('web_path', "http://" . $web_path);
    }

    //报名班级列表页
    public function index()
    {
        /*if (empty(session('openid'))) {
            header("Location:../user/getwxinfo");
            exit();
        }*/

        $area = model('Area');
        $area = $area->where(array("status" => 0))->select();

        $area_name = model('Area')->find(1);
        $this->assign('area_name', $area_name);

        $grade = model('Grade');
        $grade = $grade->where(array('area_id' => '1', "status" => 0))->select();

        //banner图
        $where = array("category_id" => 8);
        $banner = db("Document")->where($where)->limit('0,5')->select();
        $this->assign("banner", $banner);

        $this->assign('area', $area);
        $this->assign('grade', $grade);
        return $this->fetch("template/wap/enlist/index.html");
    }

    //详情页
    public function detail()
    {

        $id = input('id', '', 'trim,intval');
        $grade = model('Grade');
        $info = $grade->join('sent_area ', 'sent_area.id = sent_grade.area_id', 'left')
            ->field('sent_grade.*,sent_area.name as area_name,sent_area.thumb,sent_area.address,sent_area.lng,sent_area.lat')
            ->where(array('sent_grade.id' => $id))->find();

        $this->assign('info', $info);
        return $this->fetch("template/wap/enlist/detail.html");
    }


    //班级ajax列表
    public function ajax_list()
    {
        $area_id = input('city', '', 'trim,intval');
        $where = array("area_id" => $area_id, "status" => 0);
        $grade = model('Grade');
        $res = $grade->where($where)->select();
        echo json_encode($res);
    }

    //优惠券ajax
    public function yhq_code()
    {
        //查询优惠券是否有效
        $code = input('code', '', 'htmlspecialchars,trim');
        if (!empty($code)) {
            $res = model("Code")->where(array("code" => $code))->find();
            if ($res) {
                echo json_encode(array("code" => "200", "msg" => "有效", "res" => $res));
            } else {
                echo json_encode(array("code" => "400", "msg" => "无效"));
            }
        }


    }

    //推荐码ajax
    public function referral()
    {
        //查询推荐码是否有效
        $code = input('code', '', 'htmlspecialchars,trim');
        if (!empty($code)) {
            $res = db('Department')->where(array("code" => $code))->find();
            if ($res) {
                echo json_encode(array("code" => "200", "msg" => "有效", "res" => $res));
            } else {
                $res = db('Person')->where(array("code" => $code))->find();
                if ($res) {
                    echo json_encode(array("code" => "200", "msg" => "有效", "res" => $res));
                } else {
                    echo json_encode(array("code" => "400", "msg" => "推荐码无效,请重新输入"));
                }
            }
        }
    }

    //活动 ajax
    public function activity()
    {
        //查询活动优惠金额
        $activity_id = input('activity_id', '', 'trim,intval');
        if (!empty($activity_id)) {
            $res = db("Activity")->find($activity_id);
            if ($res) {
                echo json_encode(array("code" => "200", "msg" => "有效", "res" => $res));
            } else {
                echo json_encode(array("code" => "400", "msg" => "活动不存在或已下线"));
            }
        }
    }


    //报名页面
    public function sign()
    {
        $id = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');
            if (!$data['name']) {
                return json_encode(array("code" => "400", "msg" => "姓名不能为空"));
            }
            if (!$data['phone']) {
                return json_encode(array("code" => "400", "msg" => "电话不能为空"));
            }
            if (!$data['card']) {
                return json_encode(array("code" => "400", "msg" => "身份证号码不能为空"));
            }

            //缴费类型
            if ($data['pay_type'] == 1) {
                //线上全额支付
                $data['unpaid'] = 0;//未付款
                $data['tuition_state'] = 1;//学费状态 1全款
            } else if ($data['pay_type'] == 2) {
                //线上定金支付
                $data['unpaid'] = intval($data['payable']) - intval($data['payment']) - intval($data['activity_id']) - intval($data['coupon']);//未付款
                $data['tuition_state'] = 2;
            } else if ($data['pay_type'] == 3 || $data['pay_type'] == 4) {
                //线下全额支付 或者线下定金支付
                $data['unpaid'] = $data['payable'] - $data['activity_id'] - $data['coupon'];
                $data['tuition_state'] = 2;
            } else {
                //缴费类型不对
                return json_encode(array("code" => "400", "msg" => "缴费类型不对"));
            }


            $data['sign_date'] = time();//报名时间
            $data['openId'] = session('openid');
            $data['sn'] = "dj_" . rand_string(20);//订单编号


            $res = model("Student")->save($data);
            if ($res) {
                return json_encode(array("code" => "200", "msg" => "报名成功"), JSON_UNESCAPED_SLASHES);
            } else {
                return json_encode(array("code" => "400", "msg" => "报名失败"), JSON_UNESCAPED_SLASHES);
            }


        } else {
            //班级信息展示
            $grade = model('Grade')
                ->join('sent_area', 'sent_area.id=sent_grade.area_id', 'left')
                ->field('sent_grade.*,sent_area.name as area_name,sent_area.id as area_id')
                ->where(array("sent_grade.id" => $id))
                ->find();
            $this->assign('grade', $grade);
            //活动信息展示
            $activity = model('Activity')->limit(0, 3)->select();
            $this->assign('activity', $activity);


            return $this->fetch("template/wap/enlist/sign.html");
        }

    }

    //报名成功页面
    public function cg()
    {

        //体检站展示
        $station = model("Station")->select();
        $this->assign("station", $station);


        return $this->fetch("template/wap/enlist/success.html");
    }


    //学车协议
    public function agreement()
    {
        if (IS_POST) {
            $data = input('post.');
            session('agreement_name', $data);
            return json_encode($data);
        } else {
            $this->assign('agreement', session('agreement_name'));
            return $this->fetch("template/wap/enlist/agreement.html");
        }

    }


    //申请体检页面
    public function test()
    {
        if (IS_POST) {
            include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';

            $wx = new \Weixin_class();

            $data = input('post.');

            $price = input('money');
            $data['openid'] = session("openid");
            $data['create_time'] = time();

            $res = model("Apply")->save($data);

            $insert_id = model("Apply")->getLastInsID();


            if ($res) {
                $code = 0;
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
                echo json_encode(array('code' => $code, 'msg' => $msg, 'content' => $content), JSON_UNESCAPED_UNICODE);

            }
        } else {
            //体检站展示
            $station = model("Station")->select();
            $this->assign("station", $station);

            return $this->fetch("template/wap/enlist/test.html");
        }


    }

    //查询报名信息是否存在 ajax
    public function get_sign()
    {
        //查询报名信息
        $res = db("Student")->where(array("openid" => session('openid')))->find();
        if ($res) {
            echo json_encode(array("code" => "200", "msg" => "已报名", "res" => $res));
        } else {
            echo json_encode(array("code" => "400", "msg" => "还未报名"));
        }
    }

    //支付成功回调函数
    public function pay_success(){
        return $this->fetch("template/wap/enlist/pay_success.html");
    }

    //支付失败回调函数
    public function pay_fail(){
        return $this->fetch("template/wap/enlist/pay_fail.html");
    }


}