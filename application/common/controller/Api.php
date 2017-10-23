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
		header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
		header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");
		$header = getallheaders();
		$this->data = array('code' => 0, 'msg' => '', 'time' => time(), 'data' => '');
		$isCheck = $this->checkToken($header);
		$url = request()->module() . '/' . request()->controller() . '/' . request()->action();
		if (!$isCheck && 'api/index/gettoken' !== strtolower($url)) {
			$this->data['code'] = '301';
			$this->data['data'] = '非法请求！';
			echo json_encode($this->data);
			exit();
		}
	}

	protected function checkToken($header){
		if (isset($header['Authorization']) && $header['Authorization']) {
			$token = authcode($header['Authorization']);
			list($appid, $appsecret, $currentTime) = explode('|', $token);
			$client = db('Client')->where('appid', $appid)->where('appsecret', $appsecret)->value('id');
			if ($client && ($currentTime+86400) < time()) {
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
}