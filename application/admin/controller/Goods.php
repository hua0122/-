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

class Goods extends Admin {

	/**
	 * 物料管理首页
	 * @author 
	 */
	public function index() {
		$map = array();

		$order = "id desc";
		$list  = db('Goods')->where($map)->order($order)->paginate(10);

		$data = array(
			'list' => $list,
			'page' => $list->render(),
		);
		$this->assign($data);
		$this->setMeta("物料信息");
		return $this->fetch();
	}
	

	//添加
	public function add() {
		$goods = model('Goods');
		$input = model('Input');
		if (IS_POST) {
			$data = input('post.');
			if ($data) {
				unset($data['id']);
				//先查询输入的物料编号是否存在，若存在直接给出提示信息，否则继续添加
				$list  = db('Goods')->where(array("cid"=>$data['cid']))->select();
				if($list){
				    return $this->error("物料信息已存在，请直接修改库存！", url('Goods/index'));
				}else{
				    $data['inputnum'] = $data['stock'];
				    $result = $input->save($data);
				    
				    $result = $goods->save($data);
				    
				}
				
				
				if ($result) {
					return $this->success("添加成功！", url('Goods/index'));
				} else {
				    
					return $this->error($goods->getError());
				}
				
			} else {
				return $this->error($goods->getError());
			}
		} else {
		    
			$data = array(
				'keyList' => $goods->keyList,
			);
			$this->assign($data);
			
			
			
			$this->setMeta("添加物料");
			return $this->fetch('add');
		}
	}

	//修改
	public function edit() {
		$input = model('Input');
		$goods = model('goods');
		$id   = input('id', '', 'trim,intval');
		if (IS_POST) {
			$data = input('post.');
			if ($data) {
			    unset($data['id']);
			    unset($data['stock']);
			    //向入库表里面添加数据
				$result = $input->save($data);
				//修改(增加)物料表里面的库存
				$result = $goods ->where(array('id' => $id))->setInc('stock',$data['inputnum']);
				
				if ($result) {
					return $this->success("修改成功！", url('Goods/index'));
				} else {
					return $this->error("修改失败！");
				}
			} else {
				return $this->error($input->getError());
			}
		} else {
			$map  = array('id' => $id);
			$info = db('Goods')->where($map)->find();

			$data = array(
				'keyList' => $input->keyList,
				'info'    => $info,
			);
			$this->assign($data);
			$this->setMeta("编辑物料信息");
			return $this->fetch('edit');
		}
	}

	//删除
	public function delete() {
		$id = $this->getArrayParam('id');
		if (empty($id)) {
			return $this->error('非法操作！');
		}
		$link = db('Goods');

		$map    = array('id' => array('IN', $id));
		$result = $link->where($map)->delete();
		if ($result) {
			return $this->success("删除成功！");
		} else {
			return $this->error("删除失败！");
		}
	}
}