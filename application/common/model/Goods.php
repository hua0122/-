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
* 物料录入模型
*/
class Goods extends Base{
	public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
		array('name'=>'cid' ,'title'=>'物料编号', 'type'=>'text','help'=>''),
        array('name'=>'name' ,'title'=>'物料名称', 'type'=>'text', 'help'=>''),
        array('name'=>'model' ,'title'=>'物料型号', 'type'=>'text','help'=>''),
		array('name'=>'library' ,'title'=>'物料库位', 'type'=>'text','help'=>''),
		array('name'=>'stock' ,'title'=>'入库数量', 'type'=>'text','help'=>''),
		array('name'=>'createtime' ,'title'=>'入库时间', 'type'=>'date','help'=>''),
		array('name'=>'uid' ,'title'=>'入库管理员', 'type'=>'text','help'=>''),
		/*
        array('name'=>'status' ,'title'=>'状态', 'type'=>'select','option'=>array('1'=>'禁用','0'=>'启用'), 'help'=>''),
        */
    );
    protected $type = array(
        'id'  => 'integer',
    );

}