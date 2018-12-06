<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/12 0012
 * Time: 16:29
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Protect extends Admin
{

    public function index() {
        $map = array();


        $order = "id desc";
        $list  = db('Protect')
            ->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );

        $this->assign($data);
        $this->setMeta("保护系统");
        return $this->fetch();
    }

    //开发记录
    public function develop(){

        $map = array();


        $order = "id desc";
        $list  = db('Develop')->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );

        $this->assign($data);

        $this->setMeta("开发记录");
        return $this->fetch();
    }
}