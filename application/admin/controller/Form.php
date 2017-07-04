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

	public function _initialize(){
		parent::_initialize();
		$this->model = model('Form');
	}

	//自定义表单
	public function index(){
		$map = array();
		$order = "id desc";
		$list = $this->model->where($map)->order($order)->paginate(25);

		$data = array(
			'list'   => $list,
			'page'   => $list->render()
		);
		$this->setMeta('自定义表单');
		$this->assign($data);
		return $this->fetch();
	}

	/**
	 * 添加表单
	 */
	public function add(\think\Request $request){
		if (IS_POST) {
			$result = $this->model->validate('Form')->save($request->post());
			if (false !== $result) {
				return $this->success('添加成功！', url('admin/form/index'));
			}else{
				return $this->error($this->model->getError());
			}
		}else{
			$data = array(
				'keyList'   => $this->model->addField
			);
			$this->assign($data);
			$this->setMeta('添加表单');
			return $this->fetch('public/edit');
		}
	}

	/**
	 * 编辑表单
	 */
	public function edit(\think\Request $request){
		if (IS_POST) {
			$result = $this->model->validate('Form')->save($request->post(), array('id'=> $request->post('id')));
			if (false !== $result) {
				return $this->success('修改成功！', url('admin/form/index'));
			}else{
				return $this->error($this->model->getError());
			}
		}else{
			$info = $this->model->where('id', $request->param('id'))->find();
			$data = array(
				'info'      => $info,
				'keyList'   => $this->model->editField
			);
			$this->assign($data);
			$this->setMeta('编辑表单');
			return $this->fetch('public/edit');
		}
	}

	/**
	 * 删除表单
	 */
	public function del(){
		$id = $this->getArrayParam('id');
		$result = false;
		if (false !== $result) {
			return $this->success('删除成功！');
		}else{
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
	public function lists(){
		return $this->fetch();
	}

	public function attr(){}
}