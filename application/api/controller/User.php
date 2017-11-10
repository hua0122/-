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

class User extends Api {

	public function getuser(){
		$this->data['code'] = 1;
		$this->data['data'] = db('Member')->where('uid', $this->request->param('uid'))->find();
		return $this->data;
	}
}