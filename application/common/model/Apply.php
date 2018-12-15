<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/10 0010
 * Time: 11:41
 */

namespace app\common\model;


class Apply extends Base
{
    public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'名称', 'type'=>'text', 'help'=>''),
        array('name'=>'phone' ,'title'=>'电话', 'type'=>'text','help'=>''),
        array('name'=>'station_id' ,'title'=>'体检站', 'type'=>'text','help'=>''),
        array('name'=>'verify' ,'title'=>'验证码', 'type'=>'text','help'=>''),
        array('name'=>'is_pay' ,'title'=>'是否付款', 'type'=>'select','option'=>array('1'=>'已付款','0'=>'未付款'),'help'=>''),
        array('name'=>'create_time' ,'title'=>'申请时间', 'type'=>'text','help'=>''),


    );
    protected $type = array(
        'id'  => 'integer',
    );

}