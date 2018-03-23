<?php
namespace app\api\controller;

use EasyWeChat\Factory;

/**
 * 微信类接口
 */
class Wechat extends \app\common\controller\Api{

	public function onLogin() {
		$app = Factory::miniProgram(array(
			'app_id' => 'wxbcf7b64b8dc6ca72',
			'secret' => '01f8b10956ea44e6a726f1391af6e3d8',
		));

		$info = $app->auth->session($this->request->param('code'));

		$this->data['data'] = $info;
		
		return json($this->data);
	}

	public function jscode2session(){
		$app = Factory::miniProgram(array(
			'app_id' => 'wxbcf7b64b8dc6ca72',
			'secret' => '01f8b10956ea44e6a726f1391af6e3d8',
		));

		$info = $app->auth->session($this->request->param('jsCode'));

		$this->data['data'] = $info;
		
		return json($this->data);
	}
}