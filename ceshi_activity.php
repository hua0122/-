<?php
//链接数据库
$q=mysql_connect("localhost","root","");
if(!$q){
    die('亲，链接不到数据库哦！'.mysql_error());
}
mysql_query("set name utf8");       //以utf8读取数据库
mysql_select_db("test",$q);   //数据库

$prize_arr = array(
    '0' => array('id'=>1,'min'=>55,'max'=>80,'prize'=>'3折抢购红酒木瓜丰胸靓汤 ','v'=>10),//弧度：55°-80°范围是：“3折抢购红酒木瓜丰胸靓汤”奖， v=10是中奖率是10%
    '1' => array('id'=>2,'min'=>10,'max'=>35,'prize'=>'3折抢购自由呼吸魔泥金装精品套装','v'=>10),
    '2' => array('id'=>3,'min'=>320,'max'=>355,'prize'=>'100元现金券','v'=>20),
    '3' => array('id'=>4,'min'=>230,'max'=>265,'prize'=>'3折抢购218齿白健套装','v'=>10),
    '4' => array('id'=>5,'min'=>185,'max'=>215,'prize'=>'3折抢购498元祛疤精华','v'=>10),
    '5' => array('id'=>6,'min'=>140,'max'=>170,'prize'=>'300元现金券大礼包','v'=>40)
);

function getRand($proArr) {
    $result = '';
    //概率数组的总概率精度
    $proSum = array_sum($proArr);
    //概率数组循环
    foreach ($proArr as $key => $proCur) {
        $randNum = mt_rand(1, $proSum);
        if ($randNum <= $proCur) {
            $result = $key;
            break;
        } else {
            $proSum -= $proCur;
        }
    }
    unset ($proArr);

    return $result;
}


foreach ($prize_arr as $key => $val) {
    $arr[$val['id']] = $val['v'];
}
$rid = getRand($arr); //根据概率获取奖项id
$res = $prize_arr[$rid-1]; //中奖项
$min = $res['min'];
$max = $res['max'];
$result['angle'] = mt_rand($min,$max); //随机生成一个角度
$result['prize'] = $res['prize'];
echo json_encode($result);
?>