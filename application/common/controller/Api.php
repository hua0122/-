<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\common\controller;

class Api {

	protected $data;

	public function __construct() {
		header("Access-Control-Allow-Origin: *");
		header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
		header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept , token");
		$this->data = array('code' => 0, 'msg' => '', 'time' => time(), 'data' => '');
		if (!$this->checkToken()) {
			$this->data['code'] = '301';
			$this->data['data'] = '非法请求！';
		}
	}

	protected function checkToken(){
		return true;
	}
}