<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/10 0010
 * Time: 11:35
 */

namespace app\common\model;


class Station extends Base
{
    public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'名称', 'type'=>'text', 'help'=>''),
        array('name'=>'address' ,'title'=>'地址', 'type'=>'text','help'=>''),
        array('name'=>'lat' ,'title'=>'纬度', 'type'=>'text','help'=>''),
        array('name'=>'lng' ,'title'=>'经度', 'type'=>'text','help'=>''),


    );
    protected $type = array(
        'id'  => 'integer',
    );

}