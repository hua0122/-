<?php
namespace app\common\controller;

class Front extends Base{

	public function _initialize(){
		parent::_initialize();

		//设置主题信息
		$this->setThemes();
	}


	public function setThemes(){
		$theme = 'default';
		$module = $this->request->module();
		if ($module == 'index') {
			$view_path   = '/template/' . $theme . '/' ;
		}else{
			$view_path   = '/template/' . $theme . '/' . $module . '/';
		}

		$tpl_replace = array(
			'__TPL__' => $view_path,
			'__CSS__' => $view_path . 'static/css',
			'__JS__' => $view_path . 'static/js',
			'__IMG__' => $view_path . 'static/images',
		);
		$tpl_conf = array(
			'view_path'   => '.' . $view_path,
			'tpl_replace_string' => $tpl_replace
		);
		$this->view->config($tpl_conf);
	}
}