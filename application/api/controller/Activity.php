<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/17 0017
 * Time: 09:28
 */

namespace app\api\controller;


use app\common\controller\Api;

class Activity extends Api
{

    //登录
    public function login(){
        $tel = input('tel');
        $code = input('code');

        $name = input('name');

        if(empty($tel)){
            return failMsg('电话号码不能为空');
        }
        if(empty($code)){
            return failMsg('验证码不能为空');
        }
        $school_id = input('school_id');
        if(empty($school_id)){
            return failMsg('学校ID不能为空');
        }

        $code = model("Msg")->where(array("code"=>$code,"tel"=>$tel))->find();
        if(!$code){
            return failMsg("验证码不正确");
        }


        $id = input('id');


        //不是合伙人 驾校也不匹配  链接也没带参数，就无法登陆 提示：请联系邀请你的人通过页面下方的邀请按钮邀请你
        $is_hhr = model("Department")->where(array("phone"=>$tel,"school_id"=>$school_id))->find();
        if(!$is_hhr&&empty($id)){
            return failMsg("请联系邀请你的人通过页面下方的邀请按钮邀请你");
        }



        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if($is_have){

            if($is_have['is_pay']==1&&$is_have['school_id']!=$school_id){
                $school = model("School")->find($is_have['school_id']);
                return failMsg("您已经在".$school['name']."参加过活动了,无法登录本驾校");
            }

            $re = model("ActivityUser")->where(array("tel"=>$tel))->setField('update_time',time());
            if(!$re) return failMsg();

            return success($is_have);
        }else{
            $data['tel'] = $tel;
            $data['add_time'] = time();
            $data['school_id'] = $school_id;
            if(!empty($name)){
                $data['name'] = $name;
            }
            if(!empty($id)){
                $data['pid'] = $id;
            }

            $res = model("ActivityUser")->save($data);
            if($res){
                $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
                return success($is_have);
            }else{
                return failMsg();
            }
        }




    }

    //发送验证码
    public function send_msg(){
        $tel = input('tel');
        if(empty($tel)){
            return failMsg('手机号码不能为空');
        }
        $rand = rand_string(4,1);//生成随机数

        $data['tel'] = $tel;
        $data['code'] = $rand;

        $is_have = model("Msg")->where(array("tel"=>$tel))->find();
        if($is_have){
            $res = model("Msg")->save($data,array("id"=>$is_have['id']));
        }else{
            $res = model("Msg")->save($data);
        }


        if($res){
            return send_code($tel,"您正在登录，您的验证码是:".$rand);
        }else{
            return failMsg('发送失败');
        }



    }

    //预存
    public function prestore(){
        $amount = input("amount");
        if(empty($amount)){
            return failMsg('预存金额不能为空');
        }

        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        $pid = input("id");
        if(!empty($pid)){

            $data['pid'] = $pid;
        }

        //查询是否已经预存
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['is_pay']==1){
            return failMsg("您已经预存过了,无需再预存");
        }

        $data['amount'] = $amount;
        $data['is_prestore'] = 1;
        $data['prestore_time'] = time();
        $data['sn'] = "yc_" . rand_string(10,'5').time();//订单编号
        //var_dump($data['sn']);
        //exit;
        $where['tel'] = $tel;

        $res = model("ActivityUser")->save($data,$where);
        if($res){
            include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
            $wx = new \Weixin_class();

            $school_id = $is_have['school_id'];

            if($school_id!=input('school_id')){
                return failMsg("学校ID不匹配");
            }

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

            //预存100 支付

            if(empty(input('openid'))){
                return failMsg("openid不能为空");
            }

            $total_fee = $amount * 100;
            if (!empty($total_fee) && $total_fee > 0 ) {
                //$total_fee=0.01*100;
                $unifiedOrderResult = $wx->unifiedorder($total_fee, input('openid'), '活动预存', $data['sn'],$school_id);
                //var_dump($unifiedOrderResult);
                $timeStamp = intval(time() / 10);
                $url = $_SERVER["HTTP_REFERER"];
                //echo $url;
                $nonceStr = $wx->getRandChar(15);
                //echo $url;
                $signature = $wx->get_js_signature($nonceStr, $timeStamp, $url,$school_id);
                //var_dump($unifiedOrderResult);exit();
                $package = "prepay_id=" . $unifiedOrderResult->prepay_id;
                if(isset($unifiedOrderResult->prepay_id)){
                    $package = "prepay_id=" . $unifiedOrderResult->prepay_id;
                }else{
                    //var_dump($unifiedOrderResult);
                    //exit;
                    return failMsg("网络出错，请再试一次");
                }
                $data = array("timeStamp" => $timeStamp, "nonceStr" => $nonceStr,
                    "package" => $package, "signType" => "MD5", "appId" => $appid);

                $paySign = $wx->get_signature($data,$school_id);
                $content = array('package' => $package, 'paySign' => $paySign, 'appId' => $appid, 'timestamp' => $timeStamp, 'nonceStr' => $nonceStr, 'signature' => $signature);


                return success($content);

            }


        }else{
            return failMsg('预存失败');
        }

    }

    //预存
    public function prestore_h5(){
        $amount = input("amount");
        if(empty($amount)){
            return failMsg('预存金额不能为空');
        }

        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        $pid = input("id");
        if(!empty($pid)){

            $data['pid'] = $pid;
        }

        //查询是否已经预存
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['is_pay']==1){
            return failMsg("您已经预存过了,无需再预存");
        }

        $data['amount'] = $amount;
        $data['is_prestore'] = 1;
        $data['prestore_time'] = time();
        $data['sn'] = "yc_" . rand_string(20);//订单编号
        $where['tel'] = $tel;

        $res = model("ActivityUser")->save($data,$where);
        if($res){
            include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
            $wx = new \Weixin_class();

            $school_id = $is_have['school_id'];

            if($school_id!=input('school_id')){
                return failMsg("学校ID不匹配");
            }

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

            //预存100 支付

            $total_fee = $amount * 100;
            if (!empty($total_fee) && $total_fee > 0 ) {
                //$total_fee=0.01*100;
                $unifiedOrderResult = $wx->unifiedorder_h5($total_fee, '活动预存', $data['sn'],$school_id);
                //var_dump($unifiedOrderResult);
                $timeStamp = intval(time() / 10);
                $url = $_SERVER["HTTP_REFERER"];
                //echo $url;
                $nonceStr = $wx->getRandChar(15);
                //echo $url;
                $signature = $wx->get_js_signature($nonceStr, $timeStamp, $url,$school_id);
                //var_dump($unifiedOrderResult);exit();
                if(isset($unifiedOrderResult->prepay_id)){
                    $package = "prepay_id=" . $unifiedOrderResult->prepay_id;
                }else{
                    return failMsg("请在微信浏览器中打开");
                }

                $data = array("timeStamp" => $timeStamp, "nonceStr" => $nonceStr,
                    "package" => $package, "signType" => "MD5", "appId" => $appid);

                $paySign = $wx->get_signature($data,$school_id);
                $content = array('package' => $package, 'paySign' => $paySign, 'appId' => $appid, 'timestamp' => $timeStamp, 'nonceStr' => $nonceStr, 'signature' => $signature);


                return success($content);

            }


        }else{
            return failMsg('预存失败');
        }

    }


    //预存
    public function prestore_alipay(){
        $amount = input("amount");
        if(empty($amount)){
            return failMsg('预存金额不能为空');
        }

        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        $pid = input("id");
        if(!empty($pid)){

            $data['pid'] = $pid;
        }

        //查询是否已经预存
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['is_pay']==1){
            return failMsg("您已经预存过了,无需再预存");
        }

        $data['amount'] = $amount;
        $data['is_prestore'] = 1;
        $data['prestore_time'] = time();
        $data['sn'] = "yc_" . rand_string(20);//订单编号
        $where['tel'] = $tel;

        $res = model("ActivityUser")->save($data,$where);
        if($res){


            $school_id = $is_have['school_id'];

            if($school_id!=input('school_id')){
                return failMsg("学校ID不匹配");
            }

            //预存100 支付

            $total_fee = $amount;
            if (!empty($total_fee) && $total_fee > 0 ) {
                $total_fee=0.01;
                include_once $_SERVER['DOCUMENT_ROOT'] .'/alipay/wappay/service/AlipayTradeService.php';
                include_once $_SERVER['DOCUMENT_ROOT'] .'/alipay/wappay/buildermodel/AlipayTradeWapPayContentBuilder.php';
                include_once $_SERVER['DOCUMENT_ROOT'] . '/alipay/config.php';

                if (!empty($data['sn'])&& trim($data['sn'])!=""){
                    //商户订单号，商户网站订单系统中唯一订单号，必填
                    $out_trade_no = $data['sn'];

                    //订单名称，必填
                    $subject = "活动预存";

                    //付款金额，必填
                    $total_amount = $total_fee;

                    //商品描述，可空
                    $body = "活动预存";

                    //超时时间
                    $timeout_express="1m";

                    $payRequestBuilder = new \AlipayTradeWapPayContentBuilder();
                    $payRequestBuilder->setBody($body);
                    $payRequestBuilder->setSubject($subject);
                    $payRequestBuilder->setOutTradeNo($out_trade_no);
                    $payRequestBuilder->setTotalAmount($total_amount);
                    $payRequestBuilder->setTimeExpress($timeout_express);
                    $payResponse = new \AlipayTradeService($config);
                    $result=$payResponse->wapPay($payRequestBuilder,$config['return_url'],$config['notify_url']);

                    return $result;
                }

            }


        }else{
            return failMsg('预存失败');
        }

    }


    //分享
    public function share(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }
        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }

        //
        $info = model("ActivityUser")->field('id,name,tel,is_share')->where(array("tel"=>$tel))->find();
        if($info['is_share']==1){
            return failMsg("已经分享过，无需重复分享！");
        }else{
            return success($info);
        }


    }
    //分享后调用
    public function share_after(){
        $fenxiang_id = input("fenxiang_id");
        if(empty($fenxiang_id)){
            return failMsg("分享id不能为空");
        }

        $res = model("ActivityUser")->where(array("id"=>$fenxiang_id))->setField('is_share',1);

        if($res){
            //修改总的优惠金额
            model("ActivityUser")->where(array("id"=>$fenxiang_id))->setInc('total_amount',100);
            return success();
        }else{
            return failMsg();
        }
    }

    //邀请
    public function invite(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }
        //查询是否已经登录
        $is_have = model("ActivityUser")->field('id,name,tel')->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }

        return success($is_have);

    }

    //邀请列表
    public function invite_list(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }

        //邀请的下级人员 预存的列表
        $list = model("ActivityUser")->field('name,tel')->where(array("pid"=>$is_have['id'],"is_pay"=>1))->select();

        if($list){
            foreach ($list as $k=>$v){
                $list[$k]['tel'] = hide_phone($v['tel']);
                $list[$k]['name'] = substr_cut($v['name']);

            }

            return success($list);
        }else{
            return emptyResult();
        }


    }


    //抽奖
    public function luck(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['luck_name']!=NULL){
            return failMsg("您已经抽过奖了");
        }

        $prize_arr = array(
            '0' => array('id'=>1,'min'=>316,'max'=>360,'prize'=>'价值1288的小米平板4','v'=>0.48),//弧度：55°-80°范围是：“欢乐秀火锅聚会套餐500元”奖， v=10是中奖率是10%
            '1' => array('id'=>2,'min'=>226,'max'=>270,'prize'=>'智能天猫精灵1台','v'=>2.38),
            '2' => array('id'=>3,'min'=>46,'max'=>90,'prize'=>'品牌充电宝1个','v'=>7.14),
            '3' => array('id'=>4,'min'=>136,'max'=>180,'prize'=>'100元秀火锅现金券','v'=>23.80),
            '4' => array('id'=>5,'min'=>array(1,91,181,271,),'max'=>array(45,135,225,315),'prize'=>'很遗憾,未中奖','v'=>66.2),
        );


        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        $rid = getRand($arr); //根据概率获取奖项id
        $res = $prize_arr[$rid-1]; //中奖项
        $min = $res['min'];
        $max = $res['max'];

        if($res['id']==5){ //未中奖
            $i = mt_rand(0,3);
            $result['angle'] = mt_rand($min[$i],$max[$i]);
        }else{
            $result['angle'] = mt_rand($min,$max); //随机生成一个角度
        }

        //查询奖品是否已经发放完
        $count = model("ActivityUser")->where("luck_name != '很遗憾,未中奖' and school_id=1")->count();
        if($count<=142){
            $result['prize'] = $res['prize'];
        }else{
            $result['prize'] = "很遗憾,未中奖";
        }



        //存入数据库
        $res = model("ActivityUser")->where(array("tel"=>$tel))->setField('luck_name',$result['prize']);
        if(!$res) return failMsg();

        return success($result);

    }


    //抽奖
    public function luck_jxy(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['luck_name']!=NULL){
            return failMsg("您已经抽过奖了");
        }

        $prize_arr = array(
            '0' => array('id'=>1,'min'=>316,'max'=>360,'prize'=>'价值1288的小米平板4','v'=>0.48),//弧度：55°-80°范围是：“欢乐秀火锅聚会套餐500元”奖， v=10是中奖率是10%
            '1' => array('id'=>2,'min'=>226,'max'=>270,'prize'=>'智能天猫精灵1台','v'=>2.38),
            '2' => array('id'=>3,'min'=>46,'max'=>90,'prize'=>'品牌充电宝1个','v'=>7.14),
            '3' => array('id'=>4,'min'=>136,'max'=>180,'prize'=>'100元秀火锅现金券','v'=>23.80),
            '4' => array('id'=>5,'min'=>array(1,91,181,271,),'max'=>array(45,135,225,315),'prize'=>'很遗憾,未中奖','v'=>66.2),
        );


        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        $rid = getRand($arr); //根据概率获取奖项id
        $res = $prize_arr[$rid-1]; //中奖项
        $min = $res['min'];
        $max = $res['max'];

        if($res['id']==5){ //未中奖
            $i = mt_rand(0,3);
            $result['angle'] = mt_rand($min[$i],$max[$i]);
        }else{
            $result['angle'] = mt_rand($min,$max); //随机生成一个角度
        }

        //查询奖品是否已经发放完
        $count = model("ActivityUser")->where("luck_name != '很遗憾,未中奖' and school_id=2")->count();
        if($count<=142){
            $result['prize'] = $res['prize'];
        }else{
            $result['prize'] = "很遗憾,未中奖";
        }



        //存入数据库
        $res = model("ActivityUser")->where(array("tel"=>$tel))->setField('luck_name',$result['prize']);
        if(!$res) return failMsg();

        return success($result);

    }


    //抽奖
    public function luck_cn(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['luck_name']!=NULL){
            return failMsg("您已经抽过奖了");
        }

        $prize_arr = array(
            '0' => array('id'=>1,'min'=>316,'max'=>360,'prize'=>'价值1288的小米平板4','v'=>0.48),//弧度：55°-80°范围是：“欢乐秀火锅聚会套餐500元”奖， v=10是中奖率是10%
            '1' => array('id'=>2,'min'=>226,'max'=>270,'prize'=>'智能天猫精灵1台','v'=>2.38),
            '2' => array('id'=>3,'min'=>46,'max'=>90,'prize'=>'品牌充电宝1个','v'=>7.14),
            '3' => array('id'=>4,'min'=>136,'max'=>180,'prize'=>'100元秀火锅现金券','v'=>23.80),
            '4' => array('id'=>5,'min'=>array(1,91,181,271,),'max'=>array(45,135,225,315),'prize'=>'很遗憾,未中奖','v'=>66.2),
        );


        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        $rid = getRand($arr); //根据概率获取奖项id
        $res = $prize_arr[$rid-1]; //中奖项
        $min = $res['min'];
        $max = $res['max'];

        if($res['id']==5){ //未中奖
            $i = mt_rand(0,3);
            $result['angle'] = mt_rand($min[$i],$max[$i]);
        }else{
            $result['angle'] = mt_rand($min,$max); //随机生成一个角度
        }

        //查询奖品是否已经发放完
        $count = model("ActivityUser")->where("luck_name != '很遗憾,未中奖' and school_id=3")->count();
        if($count<=142){
            $result['prize'] = $res['prize'];
        }else{
            $result['prize'] = "很遗憾,未中奖";
        }



        //存入数据库
        $res = model("ActivityUser")->where(array("tel"=>$tel))->setField('luck_name',$result['prize']);
        if(!$res) return failMsg();

        return success($result);

    }

    //抽奖
    public function luck_xn(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['luck_name']!=NULL){
            return failMsg("您已经抽过奖了");
        }

        $prize_arr = array(
            '0' => array('id'=>1,'min'=>316,'max'=>360,'prize'=>'价值1288的小米平板4','v'=>0.48),//弧度：55°-80°范围是：“欢乐秀火锅聚会套餐500元”奖， v=10是中奖率是10%
            '1' => array('id'=>2,'min'=>226,'max'=>270,'prize'=>'智能天猫精灵1台','v'=>2.38),
            '2' => array('id'=>3,'min'=>46,'max'=>90,'prize'=>'品牌充电宝1个','v'=>7.14),
            '3' => array('id'=>4,'min'=>136,'max'=>180,'prize'=>'100元秀火锅现金券','v'=>23.80),
            '4' => array('id'=>5,'min'=>array(1,91,181,271,),'max'=>array(45,135,225,315),'prize'=>'很遗憾,未中奖','v'=>66.2),
        );


        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        $rid = getRand($arr); //根据概率获取奖项id
        $res = $prize_arr[$rid-1]; //中奖项
        $min = $res['min'];
        $max = $res['max'];

        if($res['id']==5){ //未中奖
            $i = mt_rand(0,3);
            $result['angle'] = mt_rand($min[$i],$max[$i]);
        }else{
            $result['angle'] = mt_rand($min,$max); //随机生成一个角度
        }

        //查询奖品是否已经发放完
        $count = model("ActivityUser")->where("luck_name != '很遗憾,未中奖' and school_id=4")->count();
        if($count<=142){
            $result['prize'] = $res['prize'];
        }else{
            $result['prize'] = "很遗憾,未中奖";
        }



        //存入数据库
        $res = model("ActivityUser")->where(array("tel"=>$tel))->setField('luck_name',$result['prize']);
        if(!$res) return failMsg();

        return success($result);

    }

    //抽奖
    public function luck_xxc(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['luck_name']!=NULL){
            return failMsg("您已经抽过奖了");
        }

        $prize_arr = array(
            '0' => array('id'=>1,'min'=>316,'max'=>360,'prize'=>'价值1288的小米平板4','v'=>0.48),//弧度：55°-80°范围是：“欢乐秀火锅聚会套餐500元”奖， v=10是中奖率是10%
            '1' => array('id'=>2,'min'=>226,'max'=>270,'prize'=>'智能天猫精灵1台','v'=>2.38),
            '2' => array('id'=>3,'min'=>46,'max'=>90,'prize'=>'品牌充电宝1个','v'=>7.14),
            '3' => array('id'=>4,'min'=>136,'max'=>180,'prize'=>'100元秀火锅现金券','v'=>23.80),
            '4' => array('id'=>5,'min'=>array(1,91,181,271,),'max'=>array(45,135,225,315),'prize'=>'很遗憾,未中奖','v'=>66.2),
        );


        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        $rid = getRand($arr); //根据概率获取奖项id
        $res = $prize_arr[$rid-1]; //中奖项
        $min = $res['min'];
        $max = $res['max'];

        if($res['id']==5){ //未中奖
            $i = mt_rand(0,3);
            $result['angle'] = mt_rand($min[$i],$max[$i]);
        }else{
            $result['angle'] = mt_rand($min,$max); //随机生成一个角度
        }

        //查询奖品是否已经发放完
        $count = model("ActivityUser")->where("luck_name != '很遗憾,未中奖' and school_id=5")->count();
        if($count<=142){
            $result['prize'] = $res['prize'];
        }else{
            $result['prize'] = "很遗憾,未中奖";
        }



        //存入数据库
        $res = model("ActivityUser")->where(array("tel"=>$tel))->setField('luck_name',$result['prize']);
        if(!$res) return failMsg();

        return success($result);

    }


    //抽奖
    public function luck_ydxc(){
        $tel = input("tel");
        if(empty($tel)){
            return failMsg("电话号码不能为空");
        }

        //查询是否已经登录
        $is_have = model("ActivityUser")->where(array("tel"=>$tel))->find();
        if(!$is_have){
            return failLogin();
        }
        if($is_have['luck_name']!=NULL){
            return failMsg("您已经抽过奖了");
        }

        $prize_arr = array(
            '0' => array('id'=>1,'min'=>316,'max'=>360,'prize'=>'价值1288的小米平板4','v'=>0.48),//弧度：55°-80°范围是：“欢乐秀火锅聚会套餐500元”奖， v=10是中奖率是10%
            '1' => array('id'=>2,'min'=>226,'max'=>270,'prize'=>'智能天猫精灵1台','v'=>2.38),
            '2' => array('id'=>3,'min'=>46,'max'=>90,'prize'=>'品牌充电宝1个','v'=>7.14),
            '3' => array('id'=>4,'min'=>136,'max'=>180,'prize'=>'100元秀火锅现金券','v'=>23.80),
            '4' => array('id'=>5,'min'=>array(1,91,181,271,),'max'=>array(45,135,225,315),'prize'=>'很遗憾,未中奖','v'=>66.2),
        );


        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        $rid = getRand($arr); //根据概率获取奖项id
        $res = $prize_arr[$rid-1]; //中奖项
        $min = $res['min'];
        $max = $res['max'];

        if($res['id']==5){ //未中奖
            $i = mt_rand(0,3);
            $result['angle'] = mt_rand($min[$i],$max[$i]);
        }else{
            $result['angle'] = mt_rand($min,$max); //随机生成一个角度
        }

        //查询奖品是否已经发放完
        $count = model("ActivityUser")->where("luck_name != '很遗憾,未中奖' and school_id=6")->count();
        if($count<=142){
            $result['prize'] = $res['prize'];
        }else{
            $result['prize'] = "很遗憾,未中奖";
        }



        //存入数据库
        $res = model("ActivityUser")->where(array("tel"=>$tel))->setField('luck_name',$result['prize']);
        if(!$res) return failMsg();

        return success($result);

    }



    public function ceshi_luck(){
        header("content-type:text/html;charset='utf-8'");
        $prize_arr = array(
            '0' => array('id'=>1,'min'=>316,'max'=>360,'prize'=>'价值1288的小米平板4','v'=>0.48),//弧度：55°-80°范围是：“欢乐秀火锅聚会套餐500元”奖， v=10是中奖率是10%
            '1' => array('id'=>2,'min'=>226,'max'=>270,'prize'=>'智能天猫精灵1台','v'=>2.38),
            '2' => array('id'=>3,'min'=>46,'max'=>90,'prize'=>'品牌充电宝1个','v'=>7.14),
            '3' => array('id'=>4,'min'=>136,'max'=>180,'prize'=>'100元秀火锅现金券','v'=>23.80),
            '4' => array('id'=>5,'min'=>array(1,91,181,271,),'max'=>array(45,135,225,315),'prize'=>'很遗憾,未中奖','v'=>66.2),
        );


        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }



            $rid = getRand($arr); //根据概率获取奖项id
            $res = $prize_arr[$rid-1]; //中奖项
            $min = $res['min'];
            $max = $res['max'];
            //var_dump($rid);

            if($res['id']==5){ //未中奖
                $i = mt_rand(0,3);
                $result['angle'] = mt_rand($min[$i],$max[$i]);
            }else{
                $result['angle'] = mt_rand($min,$max); //随机生成一个角度
            }


           return  $res['prize'];


    }

    public function ceshi_100(){
        $count = input('num');
        if(empty(input('num'))){
            $count = 100;
        }
        for ($i=0;$i<$count;$i++){
            $arr[]=$this->ceshi_luck();
            echo $this->ceshi_luck()."<br/>";
        }
        var_dump(array_count_values($arr));

    }


    //个人信息
    public function info(){
        $tel = input('tel');
        if(empty($tel)){
            return failMsg('电话号码不能为空');
        }

        $info = model("ActivityUser")->where(array("tel"=>$tel))->find();

        if($info){
            return success($info);
        }else{
            return emptyResult();
        }

    }


    //根据邀请人id查询电话号码
    public function get_tel(){
        $id = input('id');
        if(empty($id)){
            return failMsg("邀请人ID不能为空");
        }
        model("ActivityUser")->where(array("id"=>$id))->setField('is_share','1');

        $info = model("ActivityUser")->field('tel')->find($id);
        if($info){
            $info['tel'] = hide_phone($info['tel']);
        }
        return success($info);
    }

    //判断该用户是否有抽奖机会
    public function chance(){
        $id = input('id');
        if(empty($id)){
            return failMsg("用户ID不能为空");
        }
        $info = model("ActivityUser")->field('id,tel,is_share,luck_name')->find($id);

        return success($info);

    }


    //中奖名单
    public  function luck_list(){

        $list = model("ActivityUser")->field('tel,luck_name')->where("luck_name !='' and luck_name != '很遗憾,未中奖'")->order('id desc')->limit(5)->select();

        if($list){
            foreach ($list as $k=>$v){
                $list[$k]['tel'] = hide_phone($v['tel']);

            }
            return success($list);
        }else{
            return emptyResult();
        }


    }

    //活动预存 支付成功回调函数
    public function update_ycorder_status(){
        $sn =$_GET['sn'];
        if (empty($sn)) {
            exit();
        }

        $activity = model("ActivityUser")->where(array("sn"=>$sn))->find();
        if ($activity['is_pay'] == 1) {
            exit();
        }


        $updt = array("is_pay"=>1,"pay_date"=>time());

        $where = array("sn"=>$sn);

        //修改总的优惠金额
        $r = model("ActivityUser")->where($where)->setInc('total_amount',300);
        //if(!$r) return failMsg();

        //修改活动表的支付状态
        model("ActivityUser")->save($updt,$where);

        //修改邀请人数
        if($activity['pid']>0){
            model("ActivityUser")->where(array("id"=>$activity['pid']))->setInc('num',1);
            //修改总的优惠金额
            model("ActivityUser")->where(array("id"=>$activity['pid']))->setInc('total_amount',100);

        }

        include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
        $wx = new \Weixin_class();


        //组装发送消息内容
        $openid = $wx->get_code("api/sendtemplate/send_msg");
        $wx->send_template_msg($activity['school_id'],$openid,'花花');





    }




}