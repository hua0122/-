<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/9 0009
 * Time: 15:54
 */

namespace app\common\model;


class Test extends Base
{

    public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'code' ,'title'=>'体检源码', 'type'=>'text', 'help'=>''),
        array('name'=>'random' ,'title'=>'随机码', 'type'=>'text','help'=>''),
        array('name'=>'verify' ,'title'=>'体检新码', 'type'=>'text','help'=>''),
        array('name'=>'create_time' ,'title'=>'录入时间', 'type'=>'text','help'=>''),
        array('name'=>'outfit_id' ,'title'=>'所属机构', 'type'=>'text','help'=>''),
        array('name'=>'username' ,'title'=>'申请人', 'type'=>'text','help'=>''),
        array('name'=>'phone' ,'title'=>'申请人电话', 'type'=>'text','help'=>''),
        array('name'=>'apply_time' ,'title'=>'申请时间', 'type'=>'text','help'=>''),
        array('name'=>'status' ,'title'=>'是否分配', 'type'=>'select','option'=>array('1'=>'已分配','0'=>'未分配'), 'help'=>''),

    );
    protected $type = array(
        'id'  => 'integer',
    );


}