<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/12 0012
 * Time: 16:29
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Partner extends Admin
{

    public function index() {
        $map = array();


        $order = "id desc";
        $list  = db('Partner')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );

        $this->assign($data);
        $this->setMeta("合伙人申请信息");
        return $this->fetch();
    }
}