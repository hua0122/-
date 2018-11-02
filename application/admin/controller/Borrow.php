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

class Borrow extends Admin {

	/**
	 * 借用管理首页
	 * @author 
	 */
	public function index() {
	    $map="";
	    $keyword = input('keyword', '', 'htmlspecialchars,trim'); //关键字
	    
        if(!empty($keyword)){
            $map = "sent_borrow.cid like '%$keyword%' or name like '%$keyword%' or username like '%$keyword%' or title like '%$keyword%' or sent_goods.library like '%$keyword%'";
            
        }
        
        
		

		$order = "id desc";
		$list  = db('Borrow')
		         ->join('sent_goods ','sent_borrow.cid = sent_goods.cid')
		         ->join('sent_person','sent_borrow.person_id = sent_person.uid')
		         ->join('sent_department','sent_department.id = sent_person.department_id')
		         ->field('sent_borrow.id,sent_borrow.cid,sent_borrow.num,sent_borrow.snum,sent_borrow.time,sent_borrow.returntime,sent_borrow.status,sent_goods.name,sent_goods.model,sent_goods.library,sent_person.username,sent_department.title')
		         ->where($map)->order($order)->paginate(10);
    
		
		$data = array(
			'list' => $list,
			'page' => $list->render(),
		);
		$this->assign($data);
		$this->setMeta("借用信息");
		return $this->fetch();
	}
	

	//添加
	public function add() {
	    $id   = input('id', '', 'trim,intval');
	    
		$borrow = model('Borrow');
		
		if (IS_POST) {
		   
			$data = input('post.');
			
			if ($data) {
				    
				    //库存剩余数量=原库存数量-借用数量
				    $goods = model('Goods');
				    $goods ->where(array('id' => $id))->setDec('stock',$data['num']);
				    
				    unset($data['id']);
				    $data['snum'] = $data['num'];
				    $result = $borrow->save($data);
			
				
				if ($result) {
					return $this->success("添加成功！", url('Borrow/index'));
				} else {
				    
					return $this->error($borrow->getError());
				}
				
			} else {
				return $this->error($borrow->getError());
			}
		} else {
		    $map  = array('id' => $id);
		    $info = db('Goods')->where($map)->find();

			$data = array(
				'keyList' => $borrow->keyList,
			    'info'    => $info,
			);
			$this->assign($data);
			
			
			$this->setMeta("添加借用信息");
			return $this->fetch('add');
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
	//显示所有部门及人员信息
	public function person(){
	    //查询部门
	    $departments = db('Department')->field(true)->select();
	    $tree  = new \com\Tree();
	    $departments = $tree->toFormatTree($departments);
	    
	    //查询人员
	    $person = db('Person')->field(true)->select();
	    $this->assign("Person",$person);
	    
	    $this->assign("Department",$departments);
	    $this->setMeta("人员选择");
	    return $this->fetch('person');
	    
	    
	}
	//选择人员-部门
	public function select_department(){
	    //获取传过来的部门ID
	    $id=$_REQUEST['id'];
	    
	    //查询是否存在子集ID,若存在取出来，若不存在就是其本身
	    $departments = db('Department')->field('id')->where(array("pid"=>$id))->select();
	    $ids="";
	    if($departments){
	        foreach ($departments as $k=>$v){
	            $v=join(',', $v);
	            $temp[] = $v;
	        }
	         
	        foreach($temp as $v){
	            $ids.=$v.",";
	        }
	        $ids=substr($ids,0,-1);  //利用字符串截取函数消除最后一个逗号
	    }
	    if($id){
	        $id=$id.",".$ids;
	    }
	     
	    
	     
	    
	    if(!empty($id)){
	        $map['sent_person.department_id'] = array('in',$id);
	    }
	    
	    
	    
	    //然后根据部门ID查询人员
	    //查询人员
	    $person = db('Person')->field(true)->where($map)->select();
	    
	    return $person;
	    
	}
	
	//选择人员
	public function select_person(){
	    //获取传过来的人员id
	    $id=$_REQUEST['uid'];
	    $person1 = db('Person')->field(true)->where(array("uid"=>$id))->select();
	   
	    //$_SESSION['personname']=$person[0]['username'];
	    return $person1;
	    
	}
	
	
	//选择全部归还
	public  function select_back(){
	    //获取传过来的借用id 物料编号
	    $id=$_REQUEST['id'];
	    $cid=$_REQUEST['cid'];
	    //更改借用状态为 已还清  status=2  并且向归还记录表里面添加一条归还数据   修改物料表里面的库存 库存增加
	    $borrow = model('Borrow');
	    $borrow ->where(array("id"=>$id))->setField('status','2');
	    
	    
	    $list = $borrow ->where(array("id"=>$id))->select();

	    
	    $goods = model('Goods');
	    $goods ->where(array('cid'=>$cid))->setInc('stock',$list[0]['snum']);
	    
	    
	    $return = model('Back');
	    $data['cid'] = $list[0]['cid'];
	    $data['person_id'] = $list[0]['person_id'];
	    $data['num'] = $list[0]['snum'];
	    
	    
	    //剩余归还数量改为0
	    $borrow ->where(array("id"=>$id))->setField('snum','0');
	    
	    $res = $return->save($data);
	    
	    return $res;
	    
	
	}
	
	//选择部分归还
	public function edit(){
	    
	    $back =model('Back');
	    $borrow = model('Borrow');
	    
	    $id   = input('id', '', 'trim,intval');
	    if (IS_POST) {
	        $data = input('post.');
	        if ($data) {
	            unset($data['id']);
	           
	            //修改(增加)物料表里面的库存
	            $goods = model('Goods');
	            $goods ->where(array('id' => $id))->setInc('stock',$data['returnnum']);
	            
	            //更改借用记录表里面的状态   status=1 部分归还
	            
	            $borrow ->where(array("id"=>$id))->setField('status','1');
	            $borrow ->where(array("id"=>$id))->setDec('snum',$data['returnnum']);
	 
	            //向归还记录表里面添加数据
	            unset($data['num']);
	            $data['num'] = $data['returnnum'];
	            $result = $back->save($data);
	            
	            if ($result) {
	                return $this->success("部分归还成功！", url('Borrow/index'));
	            } else {
	                return $this->error("部分归还失败！");
	            }
	        } else {
	            return $this->error($borrow->getError());
	        }
	    } else {
	        $map  = array('sent_borrow.id' => $id);
	        $info = db('Borrow')
	        ->join('sent_goods ','sent_borrow.cid = sent_goods.cid')
	        ->join('sent_person','sent_borrow.person_id = sent_person.uid')
	        ->join('sent_department','sent_department.id = sent_person.department_id')
	        ->field('sent_borrow.id,sent_borrow.cid,sent_borrow.num,sent_borrow.snum,sent_borrow.time,sent_borrow.returntime,sent_borrow.status,sent_goods.name,sent_goods.model,sent_goods.library,sent_person.uid,sent_person.username,sent_department.title')
	        ->where($map)->find();
	       
	        $data = array(
	            'keyList' => $borrow->keyList,
	            'info'    => $info,
	        );
	        $this->assign($data);
	        $this->setMeta("选择部分归还");
	        return $this->fetch('edit');
	    }
	    
	    
	}
	
	//归还记录
	public function back(){
	    $map="";
	    $keyword = input('keyword', '', 'htmlspecialchars,trim'); //关键字
	    
        if(!empty($keyword)){
            $map = "sent_borrow.cid like '%$keyword%' or name like '%$keyword%' or username like '%$keyword%' or title like '%$keyword%' or sent_goods.library like '%$keyword%'";
            
        }
        
	    
	    $order = "id desc";
	    $list  = db('Back')
	    ->join('sent_goods ','sent_back.cid = sent_goods.cid')
	    ->join('sent_person','sent_back.person_id = sent_person.uid')
	    ->join('sent_department','sent_department.id = sent_person.department_id')
	    ->field('sent_back.id,sent_back.cid,sent_back.num,sent_back.returntime,sent_goods.name,sent_goods.model,sent_goods.library,sent_person.username,sent_department.title')
	    ->where($map)->order($order)->paginate(10);
	    
	    
	    $data = array(
	        'list' => $list,
	        'page' => $list->render(),
	    );
	    $this->assign($data);
	    $this->setMeta("归还信息");
	    return $this->fetch();
	}
	
}