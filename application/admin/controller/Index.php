<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use app\common\controller\Admin;

class Index extends Admin {

	public function index() {
		$this->setMeta('后台首页');
		return $this->fetch();
	}

    /**
     * 设置学校ID COOKIE
     */
    public function public_set_schoolid() {
        $schoolid = input('schoolid','','trim,intval');
        $schoolid = isset($schoolid) && intval($schoolid) ? intval($schoolid) : exit('0');
        cookie("schoolid",$schoolid);
        exit('1');
    }

    //根据学校id获取顶部菜单
   public function get_top_menu(){
       header("Content-type: text/html; charset=utf-8");
       $schoolid = input('schoolid','','trim,intval');
       $hover_url  = $this->request->module() . '/' . $this->request->controller();
       $controller = $this->url;

       $menu       = array(
           'main'  => array(),
           'child' => array(),
       );

       $where['pid']  = 0;
       $where['hide'] = 0;
       $where['type'] = 'admin';
       if (!config('develop_mode')) {
           // 是否开发者模式
           $where['is_dev'] = 0;
       }
       $row = db('menu')->field('id,title,url,icon,"" as style')->where($where)->select();

       $role = db('AuthGroupAccess')->where(array("uid"=>session('user_auth.uid')))->find();
       $rule = db('AuthGroupDetail')->where(array("school_id"=>$schoolid,"group_id"=>$role['group_id']))->find();
       //var_dump($rule['rules']);
       //var_dump($row);
       $rule = explode(',',$rule['rules']);
       foreach ($row as $key => $value) {
          /*if(in_array($value['id'],$rule)){
              $menu['main'][] = $value;
          }*/

           $where2['module'] = "admin";
           $where2['type'] = '2';

           $row2 = db('auth_rule')->field('id,title,name')->where($where2)->select();
           foreach ($row2 as $k2=>$v2){
               if(in_array($v2['id'],$rule)){
                   if($v2['name']==$value['url']){
                       $menu['main'][] = $value;
                   }
               }
           }



           if ($controller == $value['url']) {
               $value['style'] = "active";
           }
       }


       // 查找当前子菜单
       $pid = db('menu')->where("pid !=0 AND url like '%{$hover_url}%'")->value('pid');
       $id  = db('menu')->where("pid = 0 AND url like '%{$hover_url}%'")->value('id');
       $pid = $pid ? $pid : $id;
       if (strtolower($hover_url) == 'admin/content' || strtolower($hover_url) == 'admin/attribute') {
           //内容管理菜单
           $pid = db('menu')->where("pid =0 AND url like '%admin/category%'")->value('id');
       }
       if ($pid) {
           $map['pid']  = $pid;
           $map['hide'] = 0;
           $map['type'] = 'admin';
           $row         = db('menu')->field('id,title,url,icon,group,pid,"" as style')->where($map)->select();
           foreach ($row as $key => $value) {
               if (is_administrator() || $this->checkRule($value['url'], 2, null)) {
                   if ($controller == $value['url']) {
                       $menu['main'][$value['pid']]['style'] = "active";
                       $value['style']                       = "active";
                   }
                   $menu['child'][$value['group']][] = $value;
               }
           }
       }

       return success($menu);
   }

    public function login($username = '', $password = '', $verify = '') {
		if (IS_POST) {
			if (!$username || !$password) {
				return $this->error('用户名或者密码不能为空！', '');
			}

			//验证码验证
			$this->checkVerify($verify);

			$user = model('User');
			$uid  = $user->login($username, $password);
			if ($uid > 0) {
				return $this->success('登录成功！', url('admin/index/index'));
			} else {
				switch ($uid) {
				case -1:$error = '用户不存在或被禁用！';
					break; //系统级别禁用
				case -2:$error = '密码错误！';
					break;
				default:$error = '未知错误！';
					break; // 0-接口参数错误（调试阶段使用）
				}
				return $this->error($error, '');
			}
		} else {
			return $this->fetch();
		}
	}

	public function logout() {
		$user = model('User');
		$user->logout();
		$this->redirect('admin/index/login');
	}

	public function clear() {
		if (IS_POST) {
			$clear = input('post.clear/a', array());
			foreach ($clear as $key => $value) {
				if ($value == 'cache') {
					\think\Cache::clear(); // 清空缓存数据
				} elseif ($value == 'log') {
					\think\Log::clear();
				}
			}
			return $this->success("更新成功！", url('admin/index/index'));
		} else {
			$keylist = array(
				array('name' => 'clear', 'title' => '更新缓存', 'type' => 'checkbox', 'help' => '', 'option' => array(
					'cache' => '缓存数据',
					'log'   => '日志数据',
				),
				),
			);
			$data = array(
				'keyList' => $keylist,
			);
			$this->assign($data);
			$this->setMeta("更新缓存");
			return $this->fetch('public/edit');
		}
	}

}