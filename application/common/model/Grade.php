<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/27 0027
 * Time: 14:02
 */


namespace app\common\model;

/**
 * 班别模型
 */
class Grade extends Base{
    public $keyList = array(
        array('name'=>'id' ,'title'=>'序号', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'名称', 'type'=>'text', 'help'=>''),
        array('name'=>'type' ,'title'=>'车型', 'type'=>'text','help'=>''),
        array('name'=>'cid' ,'title'=>'编号', 'type'=>'text','help'=>''),
        array('name'=>'version' ,'title'=>'版本号', 'type'=>'text','help'=>''),
        array('name'=>'area_id' ,'title'=>'所属场地', 'type'=>'text','help'=>''),
        array('name'=>'price' ,'title'=>'价格', 'type'=>'text','help'=>''),
        array('name'=>'content' ,'title'=>'班别详细', 'type'=>'text','help'=>''),
        array('name'=>'notice' ,'title'=>'学车须知', 'type'=>'text','help'=>''),
        array('name'=>'status' ,'title'=>'状态', 'type'=>'select','option'=>array('1'=>'禁用','0'=>'启用'), 'help'=>''),

    );
    protected $type = array(
        'id'  => 'integer',
    );

}