<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/12 0012
 * Time: 16:29
 */

namespace app\admin\controller;
use app\common\controller\Admin;
use think\Request;

class Protect extends Admin
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->schoolid = cookie("schoolid");
    }

    public function index() {
        if(isset($this->schoolid)){
            $school_id = $this->schoolid;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $where['group_id'] = $role_id['group_id'];
            $where['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($where)->find();


            $school_id = $school_default['school_id'];
        }


        $map = array();
        $keyword = input('keyword','', 'htmlspecialchars,trim');
        if(!empty($keyword)){

            $d_where['title'] = array('like', '%' .$keyword . '%');
            $d_where['school_id'] = $school_id;
            $department = db("Department")->where($d_where)->select();

            $p_where['username'] = array('like', '%' .$keyword . '%');
            $person = db("Person")->where($p_where)->select();

            if($department){
                $str = implode(',',array_column($department,'phone'));
                $map['person'] = array("in",$str);
            }elseif($person){
                $str_ids = implode(',',array_column($person,'department_id'));//队员所属的所有合伙人id
                $w['id'] = array("in",$str_ids);
                $w['school_id'] = $school_id;
                $department = db("Department")->where($w)->select(); //根据学校id查询到的合伙人id
                $d_ids = implode(',',array_column($department,'id'));

                $p_where['department_id'] = array("in",$d_ids);
                $person = db("Person")->where($p_where)->select();

                $str1 = implode(',',array_column($person,'mobile'));

                $map['person'] = array("in",$str1);
            }else{
                $map['person|tel|name'] = array('like', '%' .$keyword . '%');

            }
        }



        if($school_id){
            $d_where['school_id'] = $school_id;
            $department = db("Department")->where($d_where)->select();

            if($department){
                $str = implode(',',array_column($department,'phone'));//合伙人的电话

                $d_ids = implode(',',array_column($department,'id'));

                $p_where['department_id'] = array("in",$d_ids);
                $person = db("Person")->where($p_where)->select();

                $str1 = implode(',',array_column($person,'mobile'));//队员的电话



                $map['person'] = array("in",$str.','.$str1);

            }
        }




        $order = "id desc";

        $list  = db('Protect')
            ->where($map)->order($order)->paginate(10,false,['query'=>request()->param()]);
        $data = $list->all();



        if($data){
            foreach ($data as $k=>$v){
                //先查询电话号码是合伙人还是队员
                $d = model("Department")->where(array("phone"=>$v['person']))->find();

                if($d){
                        $data[$k]['department'] = $d['title'];
                        $data[$k]['person'] = '';

                }else{
                    $p = model("Person")
                        ->field('sent_person.*,sent_department.title')
                        ->join("sent_department",'sent_department.id=sent_person.department_id','left')
                        ->where(array("mobile"=>$v['person']))->find();
                    if($p){
                        $data[$k]['department'] = $p['title'];
                        $data[$k]['person'] = $p['username'];
                    }
                }
            }

        }



        $data = array(
            'list' => $data,
            'page' => $list->render(),
        );

        $this->assign($data);
        $this->setMeta("保护系统");
        return $this->fetch();
    }

    //开发记录
    public function develop(){
        if(isset($this->schoolid)){
            $school_id = $this->schoolid;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $where['group_id'] = $role_id['group_id'];
            $where['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($where)->find();


            $school_id = $school_default['school_id'];
        }


        $map = array();

        $keyword = input('keyword','', 'htmlspecialchars,trim');
        if(!empty($keyword)){

            $d_where['title'] = array('like', '%' .$keyword . '%');
            $d_where['school_id'] = $school_id;
            $department = db("Department")->where($d_where)->select();

            $p_where['username'] = array('like', '%' .$keyword . '%');
            $person = db("Person")->where($p_where)->select();

            if($department){
                $str = implode(',',array_column($department,'phone'));
                $map['person'] = array("in",$str);
            }elseif($person){
                $str_ids = implode(',',array_column($person,'department_id'));//队员所属的所有合伙人id
                $w['id'] = array("in",$str_ids);
                $w['school_id'] = $school_id;
                $department = db("Department")->where($w)->select(); //根据学校id查询到的合伙人id
                $d_ids = implode(',',array_column($department,'id'));

                $p_where['department_id'] = array("in",$d_ids);
                $person = db("Person")->where($p_where)->select();

                $str1 = implode(',',array_column($person,'mobile'));

                $map['person'] = array("in",$str1);
            }else{
                $map['person|tel|name'] = array('like', '%' .$keyword . '%');

            }
        }



        if($school_id){
            $d_where['school_id'] = $school_id;
            $department = db("Department")->where($d_where)->select();

            if($department){
                $str = implode(',',array_column($department,'phone'));//合伙人的电话

                $d_ids = implode(',',array_column($department,'id'));

                $p_where['department_id'] = array("in",$d_ids);
                $person = db("Person")->where($p_where)->select();

                $str1 = implode(',',array_column($person,'mobile'));//队员的电话



                $map['person'] = array("in",$str.','.$str1);

            }
        }


        $order = "id desc";
        $list  = db('Develop')->where($map)->order($order)->paginate(10,false,['query'=>request()->param()]);
        $data = $list->all();

        if($data){
            foreach ($data as $k=>$v){
                //先查询电话号码是合伙人还是队员
                $w['phone'] = $v['person'];

                $d = model("Department")->where($w)->find();

                if($d){
                    $data[$k]['department'] = $d['title'];
                    $data[$k]['person'] = '';

                }else{
                    $p = model("Person")
                        ->field('sent_person.*,sent_department.title')
                        ->join("sent_department",'sent_department.id=sent_person.department_id','left')
                        ->where(array("mobile"=>$v['person']))->find();
                    if($p){
                        $data[$k]['department'] = $p['title'];
                        $data[$k]['person'] = $p['username'];
                    }
                }
            }
        }



        $data = array(
            'list' => $data,
            'page' => $list->render(),
        );

        $this->assign($data);

        $this->setMeta("开发记录");
        return $this->fetch();
    }

    public function detail(){
        $id = input('id','','trim,intval');
        $info = db('Develop')->find($id);
        if($info){
            //先查询电话号码是合伙人还是队员
            $d = model("Department")->where(array("phone"=>$info['person']))->find();

            if($d){
                $info['department'] = $d['title'];
                $info['person'] = '';

            }else{
                $p = model("Person")
                    ->field('sent_person.*,sent_department.title')
                    ->join("sent_department",'sent_department.id=sent_person.department_id','left')
                    ->where(array("mobile"=>$info['person']))->find();
                if($p){
                    $info['department'] = $p['title'];
                    $info['person'] = $p['username'];
                }
            }
        }


        $this->assign("info",$info);
        $this->setMeta("开发记录详情");
        return $this->fetch();
    }
}