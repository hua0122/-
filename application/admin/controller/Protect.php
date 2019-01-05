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
        $map = array();
        $keyword = input('keyword','', 'htmlspecialchars,trim');
        if(!empty($keyword)){

            $d_where['title'] = array('like', '%' .$keyword . '%');
            $department = db("Department")->where($d_where)->select();

            $p_where['username'] = array('like', '%' .$keyword . '%');
            $person = db("Person")->where($p_where)->select();

            if($department){
                $str = implode(',',array_column($department,'phone'));
                $map['person'] = array("in",$str);
            }elseif($person){
                $str1 = implode(',',array_column($person,'mobile'));

                $map['person'] = array("in",$str1);
            }else{
                $map['person|tel|name'] = array('like', '%' .$keyword . '%');

            }
        }


        $order = "id desc";

        $list  = db('Protect')
            ->where($map)->order($order)->paginate(10,false,['query'=>request()->param()]);
        $data = $list->all();

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

        $map = array();

        $keyword = input('keyword','', 'htmlspecialchars,trim');
        if(!empty($keyword)){

            $d_where['title'] = array('like', '%' .$keyword . '%');
            $department = db("Department")->where($d_where)->select();

            $p_where['username'] = array('like', '%' .$keyword . '%');
            $person = db("Person")->where($p_where)->select();

            if($department){
                $str = implode(',',array_column($department,'phone'));
                $map['person'] = array("in",$str);
            }elseif($person){
                $str1 = implode(',',array_column($person,'mobile'));

                $map['person'] = array("in",$str1);
            }else{
                $map['person|tel|name'] = array('like', '%' .$keyword . '%');

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