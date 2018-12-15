<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31 0031
 * Time: 09:44
 */

namespace app\admin\controller;
use app\common\controller\Admin;
use think\Request;

class Operate extends Admin
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->schoolid = cookie("schoolid");
        $time = time();

        $this->assign('time',$time);
    }
    //首页banner图列表
    public function index(){
        $order = "id desc";
        $where = [];

        if(isset($this->schoolid)){
            $where['school_id'] = $this->schoolid;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $map['group_id'] = $role_id['group_id'];
            $map['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($map)->find();


            $where['school_id'] = $school_default['school_id'];
        }


        $where['category_id '] = 1;
        $list = db('Document')->where($where)->order($order)->select();

        $this->assign('list',$list);
        $this->setMeta("图片列表");
        return $this->fetch();
    }
    //报名页 banner图列表
    public function banner(){
        $order = "id desc";
        $where = [];
        if(isset($this->schoolid)){
            $where['school_id'] = $this->schoolid;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $map['group_id'] = $role_id['group_id'];
            $map['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($map)->find();


            $where['school_id'] = $school_default['school_id'];
        }


        $where['category_id '] = 8;
        $list = db('Document')->where($where)->order($order)->select();

        $this->assign('list',$list);
        $this->setMeta("图片列表");
        return $this->fetch();
    }

    //首页banner图 添加
    public function add() {
        $document = model('Document');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['cover_id'])){
                return $this->error("缩略图不能为空！");
            }

            if($this->schoolid){
                $data['school_id'] = $this->schoolid;
            }else{

                //根据角色ID查询当前学校ID
                $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
                $map['group_id'] = $role_id['group_id'];
                $map['rules'] = array('<>','');
                $school_default = db("AuthGroupDetail")
                    ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                    ->field('sent_auth_group_detail.*,sent_school.name')
                    ->where($map)->find();


                $data['school_id'] = $school_default['school_id'];

            }


            if ($data) {

                $result = $document->save($data);


                if ($result) {
                    return $this->success("添加成功！", url('Operate/index'));
                } else {

                    return $this->error($document->getError());
                }

            } else {
                return $this->error($document->getError());
            }
        } else {

            $this->setMeta("添加");
            return $this->fetch('add');
        }
    }

    //报名页banner图 添加
    public function banner_add() {
        $document = model('Document');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['cover_id'])){
                return $this->error("缩略图不能为空！");
            }

            if($this->schoolid){
                $data['school_id'] = $this->schoolid;
            }else{

                //根据角色ID查询当前学校ID
                $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
                $map['group_id'] = $role_id['group_id'];
                $map['rules'] = array('<>','');
                $school_default = db("AuthGroupDetail")
                    ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                    ->field('sent_auth_group_detail.*,sent_school.name')
                    ->where($map)->find();


                $data['school_id'] = $school_default['school_id'];

            }



            if ($data) {

                $result = $document->save($data);


                if ($result) {
                    return $this->success("添加成功！", url('Operate/banner'));
                } else {

                    return $this->error($document->getError());
                }

            } else {
                return $this->error($document->getError());
            }
        } else {

            $this->setMeta("添加");
            return $this->fetch('banner_add');
        }
    }


    //最美鼎吉 滚动图片添加
    public function beautiful_add() {
        $document = model('Document');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['cover_id'])){
                return $this->error("缩略图不能为空！");
            }

            if($this->schoolid){
                $data['school_id'] = $this->schoolid;
            }else{

                //根据角色ID查询当前学校ID
                $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
                $map['group_id'] = $role_id['group_id'];
                $map['rules'] = array('<>','');
                $school_default = db("AuthGroupDetail")
                    ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                    ->field('sent_auth_group_detail.*,sent_school.name')
                    ->where($map)->find();


                $data['school_id'] = $school_default['school_id'];

            }



            if ($data) {

                $result = $document->save($data);


                if ($result) {
                    return $this->success("添加成功！", url('Operate/beautiful'));
                } else {

                    return $this->error($document->getError());
                }

            } else {
                return $this->error($document->getError());
            }
        } else {

            $this->setMeta("添加");
            return $this->fetch('beautiful_add');
        }
    }




    //首页banner图 修改
    public function edit() {
        $link = model('Document');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/index'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Document')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("图片修改");
            return $this->fetch();
        }
    }

    //报名页banner图 修改
    public function banner_edit() {
        $link = model('Document');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/banner'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Document')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("图片修改");
            return $this->fetch();
        }
    }


    public function beautiful_edit() {
        $link = model('Document');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/beautiful'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Document')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("图片修改");
            return $this->fetch();
        }
    }


    //删除
    public function del(){
        $id = $this->getArrayParam('id');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $link = db('Document');

        $map    = array('id' => array('IN', $id));
        $result = $link->where($map)->delete();
        if ($result) {
            return $this->success("删除成功！");
        } else {
            return $this->error("删除失败！");
        }

    }


    //走进鼎吉
    public function about(){
        $link = model('Page');
        if (IS_POST) {
            $data = [];
            $data['id'] = input('id', '', 'trim,intval');
            $data['title'] = input('title','', 'htmlspecialchars,trim');
            $data['content'] = input('content');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    //修改首页展示图
                    $this->update_pic();

                    return $this->success("修改成功！", url('Operate/about'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {

            //首页展示图
            $this->show_pic(3);
            $this->setMeta("走进鼎吉");
            return $this->fetch();
        }

    }


    //发现最美鼎吉
    public function beautiful(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/beautiful'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {

            //首页滚动图
            $order = "id desc";
            $where = [];

            if(isset($this->schoolid)){
                $where['school_id'] = $this->schoolid;
            }else{

                //根据角色ID查询当前学校ID
                $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
                $map['group_id'] = $role_id['group_id'];
                $map['rules'] = array('<>','');
                $school_default = db("AuthGroupDetail")
                    ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                    ->field('sent_auth_group_detail.*,sent_school.name')
                    ->where($map)->find();


                $where['school_id'] = $school_default['school_id'];
            }

            $where['category_id '] = 9;


            $info = db('Page')->where($where)->find();
            $data = array(
                'info'    => $info,
            );
            $this->assign($data);


            $list = db('Document')->where($where)->order($order)->select();

            $this->assign('list',$list);


            $this->setMeta("发现最美鼎吉");
            return $this->fetch();
        }

    }

    //教练风采
    public function coach(){
        $link = model('Page');
        if (IS_POST) {
            $data = [];
            $data['id'] = input('id', '', 'trim,intval');
            $data['title'] = input('title','', 'htmlspecialchars,trim');
            $data['content'] = input('content');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {

                    //修改首页展示图
                    $this->update_pic();


                    return $this->success("修改成功！", url('Operate/coach'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {

            //首页展示图
            $this->show_pic(10);


            $this->setMeta("教练风采");
            return $this->fetch('about');
        }

    }

    //团队风采
    public function team(){
        $link = model('Page');
        if (IS_POST) {
            $data = [];
            $data['id'] = input('id', '', 'trim,intval');
            $data['title'] = input('title','', 'htmlspecialchars,trim');
            $data['content'] = input('content');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {

                    //修改首页展示图
                    $this->update_pic();


                    return $this->success("修改成功！", url('Operate/team'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {


            //首页展示图
            $this->show_pic(11);


            $this->setMeta("团队风采");
            return $this->fetch("about");
        }

    }


    //学员风采
    public function student(){
        $link = model('Page');
        if (IS_POST) {
            $data = [];
            $data['id'] = input('id', '', 'trim,intval');
            $data['title'] = input('title','', 'htmlspecialchars,trim');
            $data['content'] = input('content');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {

                    //修改首页展示图
                    $this->update_pic();

                    return $this->success("修改成功！", url('Operate/student'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {

            //首页展示图
            $this->show_pic(12);


            $this->setMeta("学员风采");
            return $this->fetch('about');
        }

    }


    //最新活动
    public function activity(){
        $link = model('Page');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/activity'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {

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
            $map['category_id'] = 2;

            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("最新活动");
            return $this->fetch();
        }

    }

    //学车流程
    public function process(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/process'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {

            $this->show_page(13);

            $this->setMeta("学车流程");
            return $this->fetch();
        }

    }


    //优势服务
    public function service(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/service'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $this->show_page(14);
            $this->setMeta("优势服务");
            return $this->fetch();
        }

    }

    //学车保障
    public function ensure(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/ensure'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $this->show_page(15);
            $this->setMeta("学车保障");
            return $this->fetch();
        }

    }


    //常见问题
    public function question(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/question'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $this->show_page(16);
            $this->setMeta("常见问题");
            return $this->fetch();
        }

    }


    //学生协议
    public function agreement(){

        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }

            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/agreement'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 11);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("学车协议");
            return $this->fetch();
        }

    }

    //科目一学习预约流程
    public function flow(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/flow'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 10);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("科目一学习预约流程");
            return $this->fetch();
        }

    }

    //约考缴费流程
    public function pay(){
        $link = model('Page');
        //$id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/pay'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 12);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("约考缴费流程");
            return $this->fetch();
        }

    }

    //修改首页五个展示图

    public function update_pic(){
        $pic = input('cover_id','','trim,intval');
        $pic1= input('cover_id1','','trim,intval');
        $pic2= input('cover_id2','','trim,intval');
        $pic3= input('cover_id3','','trim,intval');
        $pic4= input('cover_id4','','trim,intval');

        model("Document")->where(array('id'=>input('one_left_id')))->setField('cover_id',$pic);
        model("Document")->where(array('id'=>input('one_right_id')))->setField('cover_id',$pic1);
        model("Document")->where(array('id'=>input('two_left_id')))->setField('cover_id',$pic2);
        model("Document")->where(array('id'=>input('two_center_id')))->setField('cover_id',$pic3);
        model("Document")->where(array('id'=>input('two_right_id')))->setField('cover_id',$pic4);

    }

    //显示首页五个展示图
    public function show_pic($category_id){
        $w = array("category_id"=>$category_id);
        if(isset($this->schoolid)){
            $w['school_id'] = $this->schoolid;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $where['group_id'] = $role_id['group_id'];
            $where['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($where)->find();
            $w['school_id'] = $school_default['school_id'];
        }

        $info = db('Page')->where($w)->find();

        $step = db("Document")->where($w)->limit(0,1)->select();
        $this->assign("step",$step);
        $step1 = db("Document")->where($w)->limit(1,1)->select();
        $this->assign("step1",$step1);
        $step2 = db("Document")->where($w)->limit(2,1)->select();
        $this->assign("step2",$step2);
        $step3 = db("Document")->where($w)->limit(3,1)->select();
        $this->assign("step3",$step3);
        $step4 = db("Document")->where($w)->limit(4,1)->select();
        $this->assign("step4",$step4);

        $this->assign("info",$info);
    }


    //单页面切换展示
    public function show_page($category_id){
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
        $map['category_id'] = $category_id;

        $info = db('Page')->where($map)->find();

        $this->assign("info",$info);


    }


}