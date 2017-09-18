<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\common\validate;

/**
* 设置模型
*/
class Client extends Base{

	protected $rule = array(
		'appid'  =>  'require|number|unique:client',
		'appsecret' => 'require|alphaNum',
		'title' =>  'require'
	);

	protected $message = array(
		'appid.require'  =>  'appid必须',
		'appid.unique'   =>  'appid已经存在',
		'appid.number'   =>  'appid只能为数字',
		'appsecret.require'      =>  'appsecret必须',
		'appsecret.alphaNum'      =>  'appsecret只能为数字和字母',
		'title'         =>  '客户端名称必须',
	);

	protected $scene = array(
		'add'   => array('appid', 'appsecret', 'title'),
		'edit'  => array('appid', 'appsecret', 'title')
	);
}