<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\common\controller;

class Front extends Base {

	public $wechat_oauth;
	public function _initialize() {
		parent::_initialize();

		//判读是否为关闭网站
		if (\think\Config::get('web_site_close')) {
			header("Content-type:text/html;charset=utf-8");
			echo $this->fetch('common@default/public/close');exit();
		}

		//设置SEO
		$this->setSeo();

		$this->setHoverNav();

		//主题设置
		$this->setThemes();
		
		//微信访问时
		// if ($this->isMobile() && $this->is_wechat()) {
		// 	if (!session('oauth')) {
		// 		$this->getOpentId();
		// 	}else{
		// 		$this->wechat_oauth = session('oauth');
		// 		$this->assign('oauth', session('oauth'));
		// 	}

		// 	//微信用户直接使用微信登录
		// 	$this->WechatUser();
		// }
	}

	/**
	 * 微信用户登录
	 */
	protected function WechatUser(){
		if (!is_login()) {
			$openid = $this->wechat_oauth['openid'];
			//若系统内存在则直接登录，不存在不登录
			$result = model('User')->login($openid, '', 5);
			if ($result == -1) {
				$user = & load_wechat('User');
				$wechat_user = $user->getUserInfo($this->wechat_oauth['openid']);
				
				$result = model('User')->register($openid, $openid, $openid, $openid.'@openid.com', true, array('openid'=>$openid,'nickname'=>$this->jsonName($wechat_user['nickname']),'headimgurl'=>$wechat_user['headimgurl']));
			}
			return $result;
		}else{
			return true;
		}
	}

	/**
	  +----------------------------------------------------------
	 * 过滤用户昵称里面的特殊字符
	  +----------------------------------------------------------
	 * @param string    $str   待输出的用户昵称
	  +----------------------------------------------------------
	 */
	protected function jsonName($str) {
       if($str){  
			$return = '';
			$length = mb_strlen($str,'utf-8');
			for ($i=0; $i < $length; $i++) {
				$_tmpStr = mb_substr($str,$i,1,'utf-8');
				if(strlen($_tmpStr) >= 4){
					$return .= '';
				}else{
					$return .= $_tmpStr;
				}
			}
        }else{  
            $return = 'wechat_'.time();  
        }      
        return $return;  
	}

	protected function getOpentId(){
		$oauth = &load_wechat('Oauth');
		$user_oauth = $oauth->getOauthAccessToken();
		if ($user_oauth) {
			session('oauth',$user_oauth);
		}else{
			$uri = $oauth->getOauthRedirect('http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
			header("Location:".$uri);
		}
	}

	//当前栏目导航
	protected function setHoverNav() {
		//dump($_SERVER['PHP_SELF']);
	}

	protected function setThemes() {
		//网站主题设置
		$themes['mobile'] = config('mobile_themes') ? config('mobile_themes') : 'mobile';
		$themes['pc']     = config('pc_themes') ? config('pc_themes') : 'default';
		$view_path        = ($this->isMobile() && config('open_mobile_site') == '1') ? 'template/' . $themes['mobile'] . '/' : 'template/' . $themes['pc'] . '/';
		$module = $this->request->module();
		if (!in_array($module, array('index', 'install'))) {
			$view_path_pre = $module . '/';
		} else {
			$view_path_pre = '';
		}
		$this->view->config('view_path', $view_path . $view_path_pre)
			->config('tpl_replace_string',array(
				'__IMG__' => BASE_PATH . '/' . $view_path . 'static/images',
				'__JS__'  => BASE_PATH . '/' . $view_path . 'static/js',
				'__CSS__' => BASE_PATH . '/' . $view_path . 'static/css',
			));
	}
}
