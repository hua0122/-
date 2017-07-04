<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\api\controller;
use app\common\controller\Api;

class Wechat extends Api {

	public function config(){
		$js = new \Wechat\WechatScript(config('wxapp'));
		$this->data['data'] = $js->getJsSign('http://test.tensent.cn:81/home');
// dump($this->data);
// 		$this->data['data'] = array(
// 			'appid'  => 'dddd',
// 			'timestamp' => time()
// 		);
		return $this->data;
	}
}