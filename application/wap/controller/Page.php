<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31 0031
 * Time: 15:08
 */

namespace app\wap\controller;


use app\common\controller\Fornt;

class Page extends Fornt
{
    public function index(){
        $id   = $this->request->param('id');
        $model = model("Page");
        $res = $model->where(array('id'=>$id))->find();
        $this->assign('res',$res);
        return $this->fetch("template/wap/page/detail.html");

    }
}