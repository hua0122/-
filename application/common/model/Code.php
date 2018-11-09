<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/9 0009
 * Time: 15:54
 */

namespace app\common\model;


class Code extends Base
{

    public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'code' ,'title'=>'兑换码', 'type'=>'text', 'help'=>''),
        array('name'=>'amount' ,'title'=>'金额', 'type'=>'text','help'=>''),
        array('name'=>'coupon_id' ,'title'=>'优惠券id', 'type'=>'text','help'=>''),
        array('name'=>'status' ,'title'=>'状态', 'type'=>'select','option'=>array('1'=>'已使用','0'=>'未使用'), 'help'=>''),

    );
    protected $type = array(
        'id'  => 'integer',
    );


}