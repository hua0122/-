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

class Department extends Admin {

	/**
	 * 团队管理首页
	 * @author 
	 */
	public function index() {
		$map = array();
		$title = trim(input('get.title'));
		$order = "id desc";
		//$list  = db('Department')->where($map)->order($order)->paginate(10);
		$list  = db('Department')->where($map)->order($order)->select();
		if (!empty($list)) {
		    $tree = new \com\Tree();
		    $list = $tree->toFormatTree($list);
		     
		}
	
		$data = array(
			'list' => $list,
			//'page' => $list->render(),
		);
		
		$this->assign($data);
		$this->setMeta("合伙人信息");
		return $this->fetch();
	}
	

	//添加
	public function add() {
		$department = model('Department');
		if (IS_POST) {
			$data = input('post.');
			if ($data) {
				unset($data['id']);
				$result = $department->save($data);
				if ($result) {
					return $this->success("添加成功！", url('Department/index'));
				} else {
					return $this->error($department->getError());
				}
			} else {
				return $this->error($department->getError());
			}
		} else {
			/*$data = array(
				'keyList' => $department->keyList,
			);*/
		    //$this->assign($data);
		    
		    $this->assign('info', array('pid' => input('pid')));
		    $departments = db('Department')->select();
		    $tree  = new \com\Tree();
		    $departments = $tree->toFormatTree($departments);
		    
		    if (!empty($departments)) {
		        $departments = array_merge(array(0 => array('id' => 0, 'title_show' => '顶级菜单')), $departments);
		    } else {
		        $departments = array(0 => array('id' => 0, 'title_show' => '顶级菜单'));
		    }
		    
		    $this->assign('Departments', $departments);

			$this->setMeta("添加合伙人");
			return $this->fetch('edit');
		}
	}

	//修改
	public function edit() {
		$link = model('Department');
		$id   = input('id', '', 'trim,intval');
		if (IS_POST) {
			$data = input('post.');
			if ($data) {
				$result = $link->save($data, array('id' => $data['id']));
				if ($result) {
					return $this->success("修改成功！", url('Department/index'));
				} else {
					return $this->error("修改失败！");
				}
			} else {
				return $this->error($link->getError());
			}
		} else {
			/*$map  = array('id' => $id);
			$info = db('Department')->where($map)->find();
            
			$data = array(
				'keyList' => $link->keyList,
				'info'    => $info,
			);*/
			$info = array();
			/* 获取数据 */
			$info  = db('Department')->field(true)->find($id);
			$departments = db('Department')->field(true)->select();
			$tree  = new \com\Tree();
			$departments = $tree->toFormatTree($departments);
			
			$departments = array_merge(array(0 => array('id' => 0, 'title_show' => '顶级菜单')), $departments);
			$this->assign('Departments', $departments);
			if (false === $info) {
			    return $this->error('获取合伙人信息错误');
			}
			$this->assign('info', $info);
			
			
			
			//$this->assign($data);
			$this->setMeta("编辑合伙人");
			//return $this->fetch('public/edit');
			return $this->fetch('edit');
		}
	}

	//删除
	public function delete() {
		$id = $this->getArrayParam('id');
		if (empty($id)) {
			return $this->error('非法操作！');
		}
		$link = db('Department');

		$map    = array('id' => array('IN', $id));
		$result = $link->where($map)->delete();
		if ($result) {
			return $this->success("删除成功！");
		} else {
			return $this->error("删除失败！");
		}
	}

}