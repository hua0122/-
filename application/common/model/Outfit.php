<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/10 0010
 * Time: 11:06
 */

namespace app\common\model;


class Outfit extends Base
{
    public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'名称', 'type'=>'text', 'help'=>''),
        array('name'=>'address' ,'title'=>'地址', 'type'=>'text','help'=>''),
        array('name'=>'status' ,'title'=>'状态', 'type'=>'select','option'=>array('1'=>'启用','0'=>'禁用'), 'help'=>''),

    );
    protected $type = array(
        'id'  => 'integer',
    );

}