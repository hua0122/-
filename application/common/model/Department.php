<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\common\model;

/**
* 部门模型
*/
class Department extends Base{
    /*public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'部门名称', 'type'=>'text', 'help'=>''),
        array('name'=>'pid' ,'title'=>'上级菜单', 'type'=>'select','option'=>array('1'=>'禁用','0'=>'启用'), 'help'=>''),
        array('name'=>'status' ,'title'=>'状态', 'type'=>'select','option'=>array('1'=>'禁用','0'=>'启用'), 'help'=>''),
        array('name'=>'remark' ,'title'=>'备注', 'type'=>'textarea', 'help'=>'')
    );*/

    protected $type = array(
        'id'  => 'integer',
    );

}