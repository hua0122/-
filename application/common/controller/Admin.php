<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\common\controller;
use app\common\model\AuthGroup;
use app\common\model\AuthRule;

class Admin extends Base {

	public function _initialize() {
		parent::_initialize();

		if (!is_login() and !in_array($this->url, array('admin/index/login', 'admin/index/logout', 'admin/index/verify','admin/index/public_set_schoolid','admin/index/get_top_menu'))) {
			$this->redirect('admin/index/login');
		}

		if (!in_array($this->url, array('admin/index/login', 'admin/index/logout', 'admin/index/verify','admin/index/public_set_schoolid','admin/index/get_top_menu'))) {

			// 是否是超级管理员
			define('IS_ROOT', is_administrator());
			if (!IS_ROOT && \think\Config::get('admin_allow_ip')) {
				// 检查IP地址访问
				if (!in_array(get_client_ip(), explode(',', \think\Config::get('admin_allow_ip')))) {
					$this->error('403:禁止访问');
				}
			}

			// 检测系统权限
			if (!IS_ROOT) {
				$access = $this->accessControl();
				if (false === $access) {
					$this->error('403:禁止访问');
				} elseif (null === $access) {
					$dynamic = $this->checkDynamic(); //检测分类栏目有关的各项动态权限
					if ($dynamic === null) {

						//检测访问权限
                        //如果驾校是默认为1的情况 就是原来的检测方式  如果是其他驾校  查询新表

                        $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();

                        $where['sent_auth_group_detail.group_id'] = $role_id['group_id'];
                        $where['rules'] = array('<>','');
                        $school= db("AuthGroupDetail")
                            ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                            ->field('sent_auth_group_detail.*,sent_school.name')
                            ->where($where)->select();

                        if($school){
                            foreach ($school as $k=>$v){
                                if($v['school_id']==1){
                                    if (!$this->checkRule($this->url, array('in', '1,2'))) {
                                        $this->error('未授权访问!');
                                    } else {
                                        // 检测分类及内容有关的各项动态权限
                                        $dynamic = $this->checkDynamic();
                                        if (false === $dynamic) {
                                            $this->error('未授权访问!');
                                        }
                                    }
                                }else{
                                    $where1['module'] = "admin";
                                    $where1['type'] = '2';

                                    $row = db('auth_rule')->field('id,title,name')->where($where1)->select();
                                    $rule = explode(',',$v['rules']);

                                    foreach ($row as $key => $value) {
                                        if($this->url == $value['name']){
                                            if(!in_array($value['id'],$rule)){
                                                $this->error('未授权访问!');
                                            }
                                        }
                                    }

                                }
                            }
                        }

					} elseif ($dynamic === false) {
						$this->error('未授权访问!');
					}
				}
			}
            //菜单设置
            //$this->setMenu();

			if(IS_ROOT){
                //菜单设置
                $this->setMenu();
                //学校设置
                $school = db("School")->select();
                $this->assign("school",$school);
                //默认学校
                $school_id = cookie("schoolid");
                if (isset($school_id)) {
                    $school_default = db("School")->find($school_id);
                    $this->assign('school_default', $school_default);
                } else {
                    $school_default = db("School")->find(1);
                    $this->assign('school_default', $school_default);
                }

                //

                $list = db("School")->select();
                foreach ($list as $k=>$v){
                    $list[$k]['school_id'] = $v['id'];
                }
                $this->assign("school_list",$list);

            }else{
			    //其他人员菜单设置
                $this->setOtherMenu();

                $school_id = cookie("schoolid");
                if (isset($school_id)) {
                    $school_default = db("School")->find($school_id);
                    $this->assign('school_default', $school_default);
                } else {
                    $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
                    $where['group_id'] = $role_id['group_id'];
                    $where['rules'] = array('<>','');
                    $school_default = db("AuthGroupDetail")
                        ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                        ->field('sent_auth_group_detail.*,sent_school.name')
                        ->where($where)->find();

                }

                $this->assign('school_default', $school_default);

                $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
                $this->get_school($role_id['group_id']);
            }





            $this->setMeta();

		}
	}

	/*
	 * 根据角色ID获取学校列表
	 */
    protected function get_school($role_id){
        $where = [];
        $where['group_id'] = $role_id;
        $where['rules'] = array('<>','');

        $list = db("AuthGroupDetail")
            ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
            ->field('sent_auth_group_detail.*,sent_school.name')
            ->where($where)->select();

        $this->assign("school_list",$list);


    }


	/**
	 * 权限检测
	 * @param string  $rule    检测的规则
	 * @param string  $mode    check模式
	 * @return boolean
	 * @author 朱亚杰  <xcoolcc@gmail.com>
	 */
	final protected function checkRule($rule, $type = AuthRule::rule_url, $mode = 'url') {
		static $Auth = null;
		if (!$Auth) {
			$Auth = new \com\Auth();
		}
		if (!$Auth->check($rule, session('user_auth.uid'), $type, $mode)) {
			return false;
		}
		return true;
	}

	/**
	 * 检测是否是需要动态判断的权限
	 * @return boolean|null
	 *      返回true则表示当前访问有权限
	 *      返回false则表示当前访问无权限
	 *      返回null，则表示权限不明
	 *
	 * @author 朱亚杰  <xcoolcc@gmail.com>
	 */
	protected function checkDynamic() {
		if (IS_ROOT) {
			return true; //管理员允许访问任何页面
		}
		return null; //不明,需checkRule
	}

	/**
	 * action访问控制,在 **登陆成功** 后执行的第一项权限检测任务
	 *
	 * @return boolean|null  返回值必须使用 `===` 进行判断
	 *
	 *   返回 **false**, 不允许任何人访问(超管除外)
	 *   返回 **true**, 允许任何管理员访问,无需执行节点权限检测
	 *   返回 **null**, 需要继续执行节点权限检测决定是否允许访问
	 * @author 朱亚杰  <xcoolcc@gmail.com>
	 */
	final protected function accessControl() {
		$allow = \think\Config::get('allow_visit');
		$deny  = \think\Config::get('deny_visit');
		$check = strtolower($this->request->controller() . '/' . $this->request->action());
		if (!empty($deny) && in_array_case($check, $deny)) {
			return false; //非超管禁止访问deny中的方法
		}
		if (!empty($allow) && in_array_case($check, $allow)) {
			return true;
		}
		return null; //需要检测节点权限
	}

	protected function setMenu() {
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
		foreach ($row as $key => $value) {
			//此处用来做权限判断
			if (!IS_ROOT && !$this->checkRule($value['url'], 2, null)) {
				unset($menu['main'][$value['id']]);
				continue; //继续循环
			}
			if ($controller == $value['url']) {
				$value['style'] = "active";
			}
			$menu['main'][$value['id']] = $value;
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
				if (IS_ROOT || $this->checkRule($value['url'], 2, null)) {
					if ($controller == $value['url']) {
						$menu['main'][$value['pid']]['style'] = "active";
						$value['style']                       = "active";
					}
					$menu['child'][$value['group']][] = $value;
				}
			}
		}


		$this->assign('__menu__', $menu);
	}

    protected function setOtherMenu() {
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
        foreach ($row as $key => $value) {
            //此处用来做权限判断
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();

            $where1['sent_auth_group_detail.group_id'] = $role_id['group_id'];
            $where1['rules'] = array('<>','');
            $school= db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($where1)->select();

            if($school){
                foreach ($school as $k=>$v){

                    $rule = explode(',',$v['rules']);

                    $where2['module'] = "admin";
                    $where2['type'] = '2';

                    $row2 = db('auth_rule')->field('id,title,name')->where($where2)->select();
                    foreach ($row2 as $k2=>$v2){
                        if(in_array($v2['id'],$rule)){
                            if($v2['name']==$value['url']){
                                $menu['main'][$value['id']] = $value;
                            }
                        }
                    }


                        if ($controller == $value['url']) {
                            $value['style'] = "active";
                        }

                }
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
                if (IS_ROOT || $this->checkRule($value['url'], 2, null)) {
                    if ($controller == $value['url']) {
                        $menu['main'][$value['pid']]['style'] = "active";
                        $value['style']                       = "active";
                    }
                    $menu['child'][$value['group']][] = $value;
                }else{
                    if ($controller == $value['url']) {
                        $menu['main'][$value['pid']]['style'] = "active";
                        $value['style']                       = "active";
                    }
                    $menu['child'][$value['group']][] = $value;
                }


            }
        }

        $this->assign('__menu__', $menu);
    }




	protected function getContentMenu() {
		$model = \think\Loader::model('Model');
		$list  = array();
		$map   = array(
			'status' => array('gt', 0),
			'extend' => array('gt', 0),
		);
		$list = $model::where($map)->field("name,id,title,icon,'' as 'style'")->select();

		//判断是否有模型权限
		$models = AuthGroup::getAuthModels(session('user_auth.uid'));
		foreach ($list as $key => $value) {
			if (IS_ROOT || in_array($value['id'], $models)) {
				if ('admin/content/index' == $this->url && input('model_id') == $value['id']) {
					$value['style'] = "active";
				}
				$value['url']   = "admin/content/index?model_id=" . $value['id'];
				$value['title'] = $value['title'] . "管理";
				$value['icon']  = $value['icon'] ? $value['icon'] : 'file';
				$menu[]         = $value;
			}
		}
		if (!empty($menu)) {
			$this->assign('extend_menu', array('内容管理' => $menu));
		}
	}

	protected function getAddonsMenu() {
		$model = db('Addons');
		$list  = array();
		$map   = array(
			'isinstall' => array('gt', 0),
			'status' => array('gt', 0),
		);
		$list = $model->field("name,id,title,'' as 'style'")->where($map)->select();

		$menu = array();
		foreach ($list as $key => $value) {
			$class = "\\addons\\" . strtolower($value['name']) . "\\controller\\Admin";
			if (is_file(ROOT_PATH . $class . ".php")) {
				$action       = get_class_methods($class);
				$value['url'] = "admin/addons/execute?mc=" . strtolower($value['name']) . "&ac=" . $action[0];
				$menu[$key]   = $value;
			}
		}
		if (!empty($menu)) {
			$this->assign('extend_menu', array('管理插件' => $menu));
		}
	}

	protected function setMeta($title = '') {
		$this->assign('meta_title', $title);
	}


}
