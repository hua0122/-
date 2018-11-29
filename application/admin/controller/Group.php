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

class Group extends Admin {

	protected $model;
	protected $rule;

	public function _initialize() {
		parent::_initialize();
		$this->group = model('AuthGroup');
		$this->rule  = model('AuthRule');
        $this->schoolid = cookie("schoolid");
	}

	//会员分组首页控制器
	public function index($type = 'admin') {
		$map['module'] = $type;

        //当前页面的学校ID
        $school_id = cookie("schoolid");
        if(isset($school_id)){
            $w['school_id'] = $school_id;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $where1['group_id'] = $role_id['group_id'];
            $where1['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($where1)->find();
            $w['school_id'] = $school_default['school_id'];
        }

		$list = db('AuthGroup')->where($map)->order('id desc')->paginate(10);

        //判断用户是否属于当前学校
        if($list){
            foreach ($list as $k=>$v){
                //根据角色ID查询当前学校ID
                $where['group_id'] = $v['id'];
                $where['rules'] = array('<>','');
                $school_default = db("AuthGroupDetail")
                    ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                    ->field('sent_auth_group_detail.*,sent_school.name')
                    ->where($where)->select();

                $str = [];
                foreach ($school_default as $k1=>$v1){
                    $str[$k1] = $v1['school_id'];


                }
                if(!in_array($w['school_id'],$str)){
                    unset($list[$k]);
                }
            }
        }



		$data = array(
			'list' => $list,
			'page' => $list->render(),
			'type' => $type,
		);
		$this->assign($data);
		$this->setMeta('用户组管理');
		return $this->fetch();
	}

	//会员分组添加控制器
	public function add($type = 'admin') {
		if (IS_POST) {
			$result = $this->group->change();
			if ($result) {
				return $this->success("添加成功！", url('admin/group/index'));
			} else {
				return $this->error("添加失败！");
			}
		} else {
			$data = array(
				'info'    => array('module' => $type, 'status' => 1),
				'keyList' => $this->group->keyList,
			);
			$this->assign($data);
			$this->setMeta('添加用户组');
			return $this->fetch('public/edit');
		}
	}

	//会员分组编辑控制器
	public function edit($id) {
		if (!$id) {
			return $this->error("非法操作！");
		}
		if (IS_POST) {
			$result = $this->group->change();
			if ($result) {
				return $this->success("编辑成功！", url('admin/group/index'));
			} else {
				return $this->error("编辑失败！");
			}
		} else {
			$info = $this->group->where(array('id' => $id))->find();
			$data = array(
				'info'    => $info,
				'keyList' => $this->group->keyList,
			);
			$this->assign($data);
			$this->setMeta('编辑用户组');
			return $this->fetch('public/edit');
		}
	}

	//会员分组编辑字段控制器
	public function editable() {
		$pk     = input('pk', '', 'trim,intval');
		$name   = input('name', '', 'trim');
		$value  = input('value', '', 'trim');
		$result = $this->group->where(array('id' => $pk))->setField($name, $value);
		if ($result) {
			return $this->success("删除成功！");
		} else {
			return $this->error("删除失败！");
		}
	}

	//会员分组删除控制器
	public function del() {
		$id = $this->getArrayParam('id');
		if (empty($id)) {
			return $this->error("非法操作！");
		}
		$result = $this->group->where(array('id' => array('IN', $id)))->delete();
		if ($result) {
			return $this->success("删除成功！");
		} else {
			return $this->error("删除失败！");
		}
	}

	//权限节点控制器
	public function access($type = 'admin') {
		$map['module'] = $type;

		$list = db('AuthRule')->where($map)->order('id desc')->paginate(15);

		$data = array(
			'list' => $list,
			'page' => $list->render(),
			'type' => $type,
		);
		$this->assign($data);
		$this->setMeta('权限节点');
		return $this->fetch();
	}

	//根据菜单更新节点
	public function upnode($type) {
		$rule = model('Menu')->getAuthNodes($type);
		$reuslt = $this->rule->uprule($rule, $type);
		return $this->success("更新成功！");
	}

	/**
	 * 授权
	 */
	public function auth($id) {
		if (!$id) {
			return $this->error("非法操作！");
		}
		if (IS_POST) {
			$rule          = $this->request->post('rule/a', array());
			$extend_rule   = $this->request->post('extend_rule/a', array());
			$extend_result = $rule_result = false;
			//扩展权限
			$extend_data = array();
			foreach ($extend_rule as $key => $value) {
				foreach ($value as $item) {
					$extend_data[] = array('group_id' => $id, 'extend_id' => $item, 'type' => $key);
				}
			}
			if (!empty($extend_data)) {
				db('AuthExtend')->where(array('group_id' => $id))->delete();
				$extend_result = db('AuthExtend')->insertAll($extend_data);
			}

			//查询所有学校id
            $school = db("School")->field('id')->select();
			foreach ($school as $v1){
                if(!isset($rule[$v1['id']])){
                    $rule[$v1['id']] = [];
                }

            }


			if ($rule) {
                foreach($rule as $k=>$v){
                    $rules       = implode(',', $v);

                    $rule_result = $this->group->where(array('id' => $id,'school_id'=>$k))->setField('rules', $rules);
                    $select = db("AuthGroupDetail")->where(array("group_id"=>$id,'school_id'=>$k))->find();
                    if($select){
                        db("AuthGroupDetail")->where(array("group_id"=>$id,'school_id'=>$k))->setField('rules',$rules);
                    }else{
                        db("AuthGroupDetail")->insert(array("group_id"=>$id,"school_id"=>$k,"rules"=>$rules));
                    }

                }

			}

			if ($rule_result !== false || $extend_result !== false) {
				return $this->success("授权成功！", url('admin/group/index'));
			} else {
				return $this->error("授权失败！");
			}
		} else {
            $school_id = cookie("school_id");
		    if(isset($school_id)){
                $school_id = cookie("school_id");
            }else{
                $school_id=1;
            }


			$group = $this->group->where(array('id' => $id,"school_id"=>$school_id))->find();
			$group_list = db("AuthGroupDetail")->where(array("group_id"=>$id))->select();

			foreach ($group_list as $k=>$v){
			    $group_list[$v['school_id']] = explode(',', $v['rules']);
            }

			$map['module'] = $group['module'];
			$map['status'] = 1;
			$row           = db('AuthRule')->where($map)->order('id desc')->select();

			$list = array();
			foreach ($row as $key => $value) {
				$list[$value['group']][] = $value;
			}

			//模块
			$model = db('model')->field('id,title,name')
				->where(array('status' => array('gt', 0), 'extend' => array('gt', 0)))
				->select();
			//扩展权限
			$extend_auth = db('AuthExtend')->where(array('group_id' => $id, 'type' => 2))->column('extend_id');
			$data        = array(
				'list'        => $list,
				'model'       => $model,
				'extend_auth' => $extend_auth,
				'auth_list'   => explode(',', $group['rules']),
				'group_list'   => $group_list,
				'school_id'    =>$group['school_id'],
				'id'          => $id,
			);
			$this->assign($data);
			$this->setMeta('授权');
			return $this->fetch();
		}
	}

	public function addnode($type = 'admin') {
		if (IS_POST) {
			$result = $this->rule->change();
			if ($result) {
				return $this->success("创建成功！", url('admin/group/access'));
			} else {
				return $this->error($this->rule->getError());
			}
		} else {
			$data = array(
				'info'    => array('module' => $type, 'status' => 1),
				'keyList' => $this->rule->keyList,
			);
			$this->assign($data);
			$this->setMeta('添加节点');
			return $this->fetch('public/edit');
		}
	}

	public function editnode($id) {
		if (IS_POST) {
			$result = $this->rule->change();
			if (false !== $result) {
				return $this->success("更新成功！", url('admin/group/access'));
			} else {
				return $this->error("更新失败！");
			}
		} else {
			if (!$id) {
				return $this->error("非法操作！");
			}
			$info = $this->rule->find($id);
			$data = array(
				'info'    => $info,
				'keyList' => $this->rule->keyList,
			);
			$this->assign($data);
			$this->setMeta('编辑节点');
			return $this->fetch('public/edit');
		}
	}

	public function delnode($id) {
		if (!$id) {
			return $this->error("非法操作！");
		}
		$result = $this->rule->where(array('id' => $id))->delete();
		if ($result) {
			return $this->success("删除成功！");
		} else {
			return $this->error("删除失败！");
		}
	}
}