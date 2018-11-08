<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/8 0008
 * Time: 17:42
 */

namespace app\common\model;


class Activity extends Base
{
    public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'名称', 'type'=>'text', 'help'=>''),
        array('name'=>'amount' ,'title'=>'金额', 'type'=>'text','help'=>''),
        array('name'=>'gift' ,'title'=>'物品', 'type'=>'text','help'=>''),
        array('name'=>'description' ,'title'=>'活动介绍', 'type'=>'text','help'=>''),
        array('name'=>'online_time' ,'title'=>'上线时间', 'type'=>'text','help'=>''),
        array('name'=>'downline_time' ,'title'=>'下线时间', 'type'=>'text','help'=>''),
        array('name'=>'number' ,'title'=>'报名人数', 'type'=>'text','help'=>''),
        array('name'=>'status' ,'title'=>'状态', 'type'=>'select','option'=>array('1'=>'禁用','0'=>'启用'), 'help'=>''),

    );
    protected $type = array(
        'id'  => 'integer',
    );

}