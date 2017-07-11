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

class Form extends Admin {

	public function _initialize() {
		parent::_initialize();
		$this->model = model('Form');
		$this->Fattr  = model('FormAttr');
		//遍历属性列表
		foreach (get_attribute_type() as $key => $value) {
			$this->attr[$key] = $value[0];
		}
		$this->field     = $this->getField();
	}

	//自定义表单
	public function index() {
		$map   = array();
		$order = "id desc";
		$list  = $this->model->where($map)->order($order)->paginate(25);

		$data = array(
			'list' => $list,
			'page' => $list->render(),
		);
		$this->setMeta('自定义表单');
		$this->assign($data);
		return $this->fetch();
	}

	/**
	 * 添加表单
	 */
	public function add(\think\Request $request) {
		if (IS_POST) {
			$result = $this->model->validate('Form')->save($request->post());
			if (false !== $result) {
				return $this->success('添加成功！', url('admin/form/index'));
			} else {
				return $this->error($this->model->getError());
			}
		} else {
			$data = array(
				'keyList' => $this->model->addField,
			);
			$this->assign($data);
			$this->setMeta('添加表单');
			return $this->fetch('public/edit');
		}
	}

	/**
	 * 编辑表单
	 */
	public function edit(\think\Request $request) {
		if (IS_POST) {
			$result = $this->model->validate('Form')->save($request->post(), array('id' => $request->post('id')));
			if (false !== $result) {
				return $this->success('修改成功！', url('admin/form/index'));
			} else {
				return $this->error($this->model->getError());
			}
		} else {
			$info = $this->model->where('id', $request->param('id'))->find();
			$data = array(
				'info'    => $info,
				'keyList' => $this->model->editField,
			);
			$this->assign($data);
			$this->setMeta('编辑表单');
			return $this->fetch('public/edit');
		}
	}

	/**
	 * 删除表单
	 */
	public function del() {
		$id     = $this->getArrayParam('id');
		$result = false;
		if (false !== $result) {
			return $this->success('删除成功！');
		} else {
			return $this->error('删除失败！');
		}
	}

	/**
	 * @title       表单数据
	 * @description 表单数据
	 * @Author      molong
	 * @DateTime    2017-06-30
	 * @return      html        页面
	 */
	public function lists() {
		return $this->fetch();
	}

	public function attr($form_id = '') {
		$map   = array();
		$order = "id desc";
		$list  = $this->Fattr->where($map)->order($order)->paginate(25);

		$data = array(
			'list'    => $list,
			'form_id' => $form_id,
			'page'    => $list->render(),
		);
		$this->setMeta('表单字段');
		$this->assign($data);
		return $this->fetch();
	}

	public function addattr(\think\Request $request){
		$form_id = isset($this->param['form_id']) ? $this->param['form_id'] : '';
		if (!$form_id) {
			return $this->error('非法操作！');
		}
		if (IS_POST) {
			$data = $request->post();
			$result = $this->Fattr->save($data);
			if (false !== $result) {
				return $this->success('添加成功！', url('admin/form/attr?form_id='.$form_id));
			}else{
				return $this->error($this->Fattr->getError());
			}
		}else{
			$data = array(
				'keyList'   => $this->field
			);
			$this->assign($data);
			$this->setMeta('添加字段');
			return $this->fetch('public/edit');
		}
	}

	public function editattr(\think\Request $request){
		$form_id = isset($this->param['form_id']) ? $this->param['form_id'] : '';
		$id = isset($this->param['id']) ? $this->param['id'] : '';
		if (!$form_id || !$id) {
			return $this->error('非法操作！');
		}
		if (IS_POST) {
			$data = $request->post();
			$result = $this->Fattr->save($data, array('id'=>$data['id']));
			if (false !== $result) {
				return $this->success('修改成功！', url('admin/form/attr?form_id='.$form_id));
			}else{
				return $this->error($this->Fattr->getError());
			}
		}else{
			$info = $this->Fattr->where('id', $id)->find();
			$data = array(
				'info'      => $info,
				'keyList'   => $this->field
			);
			$this->assign($data);
			$this->setMeta('添加字段');
			return $this->fetch('public/edit');
		}
	}

	public function delattr(\think\Request $request){
		$id = isset($this->param['id']) ? $this->param['id'] : 0;
		if (!$id) {
			return $this->error('非法操作！');
		}
		$result = $this->Fattr->where('id', $id)->delete();
		if (false !== $result) {
			return $this->success('添加成功！');
		}else{
			return $this->error($this->Fattr->getError());
		}
	}


	protected function getField(){
		return  array(
			array('name' => 'id', 'title' => 'id', 'help' => '', 'type' => 'hidden'),
			array('name' => 'form_id', 'title' => 'model_id', 'help' => '', 'type' => 'hidden'),
			array('name' => 'name', 'title' => '字段名', 'help' => '英文字母开头，长度不超过30', 'type' => 'text'),
			array('name' => 'title', 'title' => '字段标题', 'help' => '请输入字段标题，用于表单显示', 'type' => 'text'),
			array('name' => 'type', 'title' => '字段类型', 'help' => '用于表单中的展示方式', 'type' => 'select', 'option' => $this->attr, 'help' => ''),
			array('name' => 'length', 'title' => '字段长度', 'help' => '字段的长度值', 'type' => 'text'),
			array('name' => 'extra', 'title' => '参数', 'help' => '布尔、枚举、多选字段类型的定义数据', 'type' => 'textarea'),
			array('name' => 'value', 'title' => '默认值', 'help' => '字段的默认值', 'type' => 'text'),
			array('name' => 'remark', 'title' => '字段备注', 'help' => '用于表单中的提示', 'type' => 'text'),
			array('name' => 'is_show', 'title' => '是否显示', 'help' => '是否显示在表单中', 'type' => 'select', 'option' => array('1' => '始终显示', '2' => '新增显示', '3' => '编辑显示', '0' => '不显示'), 'value' => 1),
			array('name' => 'is_must', 'title' => '是否必填', 'help' => '用于自动验证', 'type' => 'select', 'option' => array('0' => '否', '1' => '是')),
		);
	}
}