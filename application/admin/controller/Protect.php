<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 15:08
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Protect extends Admin
{
    public function index(){

        $this->setMeta("资源保护");
        return $this->fetch();
    }

}