<?php
namespace app\admin\controller;
use app\common\controller\Admin;
use think\Request;

class Area extends Admin {

    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->schoolid = cookie("schoolid");
    }


    /**
     * 场地管理
     * @author
     */
    public function index() {
        $map = array();

        if(isset($this->schoolid)){
            $map['school_id'] = $this->schoolid;
        }


        $status = input('status','','trim,intval');//场地状态
        if(!empty($status)){
            if($status==2){
                $map['status']='0';
            }else{
                $map['status'] = $status;
            }

        }else{
            $map['status']='0';
        }

        $order = "id desc";
        $list  = db('Area')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->setMeta("场地管理");
        return $this->fetch();
    }


    //添加
    public function add() {
        $Area = model('Area');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("场地名称不能为空！");
            }
            if(empty($data['address'])){
                return $this->error("场地地址不能为空！");
            }

            if(empty($data['thumb'])){
                return $this->error("场地封面图不能为空！");
            }

            if(strlen($data['address'])>45){
                return $this->error("地址超出了十五字数范围，请修改!");
            }


            if(isset($this->schoolid)){
                $data['school_id'] = $this->schoolid;
            }else{

                //根据角色ID查询当前学校ID
                $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
                $where['group_id'] = $role_id['group_id'];
                $where['rules'] = array('<>','');
                $school_default = db("AuthGroupDetail")
                    ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                    ->field('sent_auth_group_detail.*,sent_school.name')
                    ->where($where)->find();


                $data['school_id'] = $school_default['school_id'];
            }



            if ($data) {
                $list  = db('Area')->where(array("name"=>$data['name']))->select();
                if($list){
                    return $this->error("场地名称已存在，请重新输入！", url('Area/index'));
                }else{
                    $result = $Area->save($data);

                }


                if ($result) {
                    return $this->success("添加成功！", url('Area/index'));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {

            $data = array(
                'keyList' => $Area->keyList,
            );
            $this->assign($data);



            $this->setMeta("添加场地");
            return $this->fetch('add');
        }
    }

    //修改
    public function edit() {
        $link = model('Area');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['name'])){
                return $this->error("场地名称不能为空！");
            }
            if(empty($data['address'])){
                return $this->error("场地地址不能为空！");
            }

            if(empty($data['thumb'])){
                return $this->error("场地封面图不能为空！");
            }

            if(strlen($data['address'])>45){
                return $this->error("地址超出了十五字数范围，请修改!");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Area/index'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Area')->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("编辑场地");
            return $this->fetch('edit');
        }
    }

    //删除
    public function delete() {
        $id = $this->getArrayParam('id');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $link = db('Area');

        $map    = array('id' => array('IN', $id));
        $result = $link->where($map)->delete();
        if ($result) {
            return $this->success("删除成功！");
        } else {
            return $this->error("删除失败！");
        }
    }

    public function status() {
        $id     = $this->getArrayParam('id');
        $status = input('status', '0', 'trim,intval');

        if (!$id) {
            return $this->error("非法操作！");
        }

        $map['id'] = array('IN', $id);
        $result    = db('Area')->where($map)->setField('status', $status);
        if ($result) {
            return $this->success("设置成功！");
        } else {
            return $this->error("设置失败！");
        }
    }
}