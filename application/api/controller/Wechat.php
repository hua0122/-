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
			'app_id' => 'wx463e346969cf5366',
			'secret' => 'f4d830487dffc0c37f281420caea6db4',
		));
		$param = $this->request->param();

		$info = $app->auth->session($param['jsCode']);

		//查询用户是否已添加
		$user = db('Member')->where('openid', $info['openid'])->find();
		if (!$user) {
			$other = array(
				'avatar_url' => $param['avatar'],
			);
			$user = model('Member')->register($param['nickname'], $param['openid'], $param['openid'], $param['openid'].'@wx.com', false, $other);
		}

		$info['access_token'] = authcode($user['uid'].'|'.$user['username'].'|'.$user['password'], 'ENCODE');
		$info['uid'] = $user['uid'];

		$this->data['data'] = $info;
		
		return json($this->data);
	}
}