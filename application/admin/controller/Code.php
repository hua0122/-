<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 15:19
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Code extends Admin
{
    public function index(){

        $this->setMeta("体检码管理");
        return $this->fetch();
    }

}