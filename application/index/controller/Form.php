<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\index\controller;
use app\common\controller\Front;

class Form extends Front {

	public function _initialize() {
		parent::_initialize();
		$model_name = $this->request->param('model');
		$this->model = M($model_name, 'form');
	}

	/**
	 * 表单首页
	 */
	public function index(){
		return $this->fetch();
	}

	/**
	 * 表单列表
	 */
	public function lists(){
		$list = $this->model->order('id desc')->paginate('20');

		$data = array(
			'list'   => $list,
			'page'   => $list->render()
		);
		$this->assign($data);
		return $this->fetch();
	}


	/**
	 * 表单数据提交
	 */
	public function add(\think\Request $request){
		if ($request->isPost()) {
			$data = $request->param();
			$result = $this->model->save($data);
			if (false !== $result) {
				return $this->success('提交成功！');
			}else{
				return $this->error('提交失败！');
			}
		}else{
			return $this->fetch();
		}
	}
}