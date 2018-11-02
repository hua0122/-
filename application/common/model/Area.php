<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/27 0027
 * Time: 12:19
 */

namespace app\common\model;

/**
 * 场地模型
 */
class Area extends Base{
    public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'名称', 'type'=>'text', 'help'=>''),
        array('name'=>'address' ,'title'=>'地址', 'type'=>'text','help'=>''),
        array('name'=>'lat' ,'title'=>'位置纬度', 'type'=>'text','help'=>''),
        array('name'=>'lng' ,'title'=>'位置经度', 'type'=>'text','help'=>''),
        array('name'=>'thumb' ,'title'=>'缩略图', 'type'=>'text','help'=>''),
        array('name'=>'status' ,'title'=>'状态', 'type'=>'select','option'=>array('1'=>'禁用','0'=>'启用'), 'help'=>''),

    );
    protected $type = array(
        'id'  => 'integer',
    );

}