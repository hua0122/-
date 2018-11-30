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
use think\Request;

class Department extends Admin {

    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->schoolid = cookie("schoolid");
    }

	/**
	 * 团队管理首页
	 * @author 
	 */
	public function index() {
		$map = array();

        if(isset($this->schoolid)){
            $map['school_id'] = $this->schoolid;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $where['group_id'] = $role_id['group_id'];
            $where['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($where)->find();


            $map['school_id'] = $school_default['school_id'];
        }


        $keyword = input('keyword','', 'htmlspecialchars,trim');
        if(!empty($keyword)){
            $map['title|phone|code'] = array('like', '%' .$keyword . '%');

        }


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

		$person = model("Person");
		if (IS_POST) {

            $data = input('post.');

            if(isset($this->schoolid)){
                $map['school_id'] = $this->schoolid;
            }else{

                //根据角色ID查询当前学校ID
                $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
                $where['group_id'] = $role_id['group_id'];
                $where['rules'] = array('<>','');
                $school_default = db("AuthGroupDetail")
                    ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                    ->field('sent_auth_group_detail.*,sent_school.name')
                    ->where($where)->find();


                $map['school_id'] = $school_default['school_id'];
            }

			if ($data) {
                //导入excel表格

                //接收前台文件
                $ex = $_FILES["file"];
                if(empty($ex['name'])){
                    return $this->error("请选择文件");
                }

                //重设置文件名
                $filename = time().substr($ex['name'],stripos($ex['name'],'.'));
                $path = S_ROOT.'/uploads/excel/'.$filename;//设置移动路径
                move_uploaded_file($ex['tmp_name'],$path);

                $driveFile=PHP_EXCEL.'PHPExcel.php';
                if(!file_exists($driveFile)){
                    $res=array('code'=>'55','msg'=>'驱动文件不存在');
                    return json_encode($res);
                }
                require_once($driveFile);
                require_once(PHP_EXCEL.'PHPExcel/IOFactory.php');

                //获取excel读取类
                $objReader = \PHPExcel_IOFactory::createReader('Excel5');
                //如果excel文件后缀名为.xls，导入这个类
                $exts = explode('.',$ex['name'])[1];
                if($exts=='xls'){
                    $objReader = \PHPExcel_IOFactory::createReader('Excel5');
                }elseif($exts=='xlsx'){
                    $objReader = \PHPExcel_IOFactory::createReader('Excel2007');
                }else{
                    $objReader = \PHPExcel_IOFactory::createReader('Excel5');
                }

                //设置只读
                $objReader->setReadDataOnly(true);
                //加载需要读取的文件
                $objPHPExcel = $objReader->load($path);
                //获取单元格
                $objWorksheet = $objPHPExcel->getActiveSheet();
                //获取总的行数
                $highestRow = $objWorksheet->getHighestRow();
                //获取总的列数
                $highestColumn = $objWorksheet->getHighestColumn();
                //将字母列名变成数字列名
                $highestColumnIndex = \PHPExcel_Cell::columnIndexFromString($highestColumn);
                //定义
                $excelData = array();
                //循环获取数据
                $lastid = '';
                for($row = 1; $row <= $highestRow; $row++ ){
                    $a = $objPHPExcel->getActiveSheet()->getCell("A".$row)->getValue();//获取A(姓名)列的值
                    $b = $objPHPExcel->getActiveSheet()->getCell("B".$row)->getValue();//获取B(手机号)列的值
                    $c = $objPHPExcel->getActiveSheet()->getCell("C".$row)->getValue();//获取C(合伙人)列的值

                    if($c=="合伙人"){
                        //先查询导入的合伙人是否存在
                        $is_have = db("Department")->where(array("phone"=>$b))->find();
                        if(!$is_have){
                            $sql ="insert into sent_department(title,phone,school_id) values('".$a."','".$b."','".$map['school_id']."')";
                            $result = $department->execute($sql);
                            $lastid = $department->getLastInsID();
                        }else{
                            $lastid = $is_have['id'];
                        }

                    }else{
                        //$last = $department->order("id desc")->find();
                        //$lastid = $last['id'];
                        //查询是否存在
                        $is_h = db("Person")->where(array("mobile"=>$b))->find();
                        if(!$is_h){
                            $sql1 = "insert into sent_person(username,mobile,department_id) values('".$a."','".$b."',".$lastid.")";
                            $result = $person->execute($sql1);
                        }

                    }

                }
                unlink($path);


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
			return $this->fetch();
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