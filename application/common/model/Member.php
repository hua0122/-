<?php
namespace app\common\model;

class Member extends Base {

	protected $createTime = 'reg_time';
	protected $updateTime = 'last_login_time';

	protected $insert = array('status'=>1, 'reg_time');

	protected $type = array(
		'uid'  => 'integer',
		'reg_time' => 'integer'
	);
	
	protected function getGroupListAttr($value, $data){
		$sql = db('AuthGroupAccess')->where('uid', $data['uid'])->fetchSql(true)->column('group_id');
		return db('AuthGroup')->where('id in ('.$sql.')')->column('title', 'id');
	}

	/**
	 * 用户登录模型
	 * @param  string  $username [description]
	 * @param  string  $password [description]
	 * @param  integer $type     登录类型，1为用户名登录2为邮箱登录3为手机登录4为用户ID登录5为微信登录
	 * @return [type]            [description]
	 */
	public function login($username = '', $password = '', $type = 1) {
		$map = array();
		if (\think\Validate::is($username, 'email')) {
			$type = 2;
		} elseif (preg_match("/^1[34578]{1}\d{9}$/", $username)) {
			$type = 3;
		}
		switch ($type) {
			case 1:
				$map['username'] = $username;
				break;
			case 2:
				$map['email'] = $username;
				break;
			case 3:
				$map['mobile'] = $username;
				break;
			case 4:
				$map['uid'] = $username;
				break;
			case 5:
				$map['openid'] = $username;
				break;
			default:
				return 0; 	//参数错误
		}
		if (!$username) {
			return false;
		}

		$user = $this->where($map)->find();
		if (isset($user['uid']) && $user['uid'] && $user['status']) {
			if ($type == 3) {
				//手机验证手机动态密码
				if ($password == session('mobile_login_code')) {
					$this->autoLogin($user); //更新用户登录信息
					return $user['uid'];
				}else{
					return -5;
				}
			} elseif ($type == 5) {
				$this->autoLogin($user); //更新用户登录信息
				return $user['uid'];
			} else {
				/* 验证用户密码 */
				if (md5($password . $user['salt']) === $user['password']) {
					$this->autoLogin($user); //更新用户登录信息
					return $user['uid']; //登录成功，返回用户ID
				} else {
					return -2; //密码错误
				}
			}
		} else {
			if ($type == 3 && preg_match("/^1[34578]{1}\d{9}$/", $username) && $password == session('mobile_login_code')) {
				$data = array(
					'username' => $username,
					'mobile'   => $username,
					'salt'     => rand_string(6),
					'password' => $password,
				);
				$result = $this->save($data);
				if ($result) {
					$this->autoLogin($this->data); //更新用户登录信息
				}
				return $this->data['uid'];
			} else {
				return -1; //用户不存在或被禁用
			}
		}
	}


	/**
	 * 用户注册
	 * @param  integer $user 用户信息数组
	 */
	function register($username, $password, $repassword, $email, $isautologin = true, $other = array()){
		$data['username'] = $username;
		$data['salt'] = rand_string(6);
		$data['password'] = $password;
		$data['repassword'] = $repassword;
		$data['email'] = $email;
		if (!empty($other)) {
			$data = array_merge($data, $other);
		}
		$result = $this->validate(true)->save($data);
		if ($result) {
			$data['uid'] = $this->data['uid'];
			if ($isautologin) {
				$this->autoLogin($this->data);
			}
			return $result;
		}else{
			if (!$this->getError()) {
				$this->error = "注册失败！";
			}
			return false;
		}
	}

	/**
	 * 自动登录用户
	 * @param  integer $user 用户信息数组
	 */
	private function autoLogin($user){
		/* 更新登录信息 */
		$data = array(
			'uid'             => $user['uid'],
			'login'           => array('exp', '`login`+1'),
			'last_login_time' => time(),
			'last_login_ip'   => get_client_ip(1),
		);
		$this->where(array('uid'=>$user['uid']))->update($data);
		$user = $this->where(array('uid'=>$user['uid']))->find();

		/* 记录登录SESSION和COOKIES */
		$auth = array(
			'uid'             => $user['uid'],
			'username'        => $user['username'],
			'last_login_time' => $user['last_login_time'],
		);

		session('user_auth', $auth);
		session('user_auth_sign', data_auth_sign($auth));
	}

	public function logout(){
		session('user_auth', null);
		session('user_auth_sign', null);
	}
}