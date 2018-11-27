<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\common\controller;

class Api
{

	protected $data;

	public function __construct() {
        header("Access-Control-Allow-Origin: *");
        if (empty(session('openid'))) {
            header("Location:user/getwxinfo");
            exit();
        }
		$this->data = array('code' => 0, 'msg' => '', 'time' => time(), 'data' => '');
	}
}