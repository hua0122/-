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

class Auth extends Api {

	public function login(){
		if (!$this->request->post('username')) {
			$this->data['msg'] = "用户名不能为空！";
			return $this->data;
		}
		if (!$this->request->post('password')) {
			$this->data['msg'] = "密码不能为空！";
			return $this->data;
		}

		$user = model('User')->field('uid,username,password,salt')->where('username', $this->request->post('username'))->find();
		if ($user['password'] === md5($this->request->post('password').$user['salt'])) {
			$this->data['code'] = 1;
			$user['access_token'] = authcode($user['uid'].'|'.$user['username'].'|'.$user['password'], 'ENCODE');
			$this->data['data'] = $user;
		}else{
			$this->data['msg'] = "密码错误！";
		}
		return $this->data;
	}
}