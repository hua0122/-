<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\Api\controller;
use app\common\controller\Api;

class Index extends Api {

	public function index(){
		return $this->fetch();
	}

	public function getToken(\think\Request $request){
		$appid = $request->post('appid', '');
		$appsecret = $request->post('appsecret', '');

		$appid = "32432452345324";
		$appsecret = "a2b1Yubmej8qFLZbijcEenj9CoKWgratNdIpWha8LZ64xVfSt1YM5";
		//$client = db('Client')->where('appid', $appid)->where('appsecret', $appsecret)->value('id');
		$client = 1;
		if ($client) {
			$this->data['time'] = time();
			$tokens = $appid . '|' . $appsecret . '|' . $this->data['time'];
			$this->data['token'] = authcode($tokens, 'ENCODE');
			$this->data['code'] = 1;
			return $this->data;
		}else{
			$data['msg'] = '未知信息，请联系管理员！';
			return $this->data;
		}
	}

	public function getOauthUrl(\think\Request $request){
		$oauth = &load_wechat('Oauth');
		$url = $request->param('url');
		$uri = $oauth->getOauthRedirect('http://wx.tensent.cn'  . $url);
		$this->data['code'] = 1;
		$this->data['data'] = $uri;
		return $this->data;
	}
}