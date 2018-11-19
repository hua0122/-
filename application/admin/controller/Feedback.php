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

class Feedback extends Admin
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->schoolid = cookie("schoolid");
    }

    public function index() {
        $map = array();
        if(isset($this->schoolid)){
            $map['school_id'] = $this->schoolid;
        }

        $order = "id desc";
        $list  = db('Feedback')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );

        $this->assign($data);
        $this->setMeta("意见建议");
        return $this->fetch();
    }

    //处理
    public function dispose(){

        $id   = input('id', '', 'trim,intval');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $link = db('Feedback');

        $map    = array('id' => $id);
        $result = $link->where($map)->setField('status','1');
        if ($result) {
            return $this->success("处理成功！");
        } else {
            return $this->error("处理失败！");
        }
    }
}