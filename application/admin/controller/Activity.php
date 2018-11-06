<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 11:47
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Activity extends Admin
{
    public function index() {

        $this->setMeta("活动管理");
        return $this->fetch();
    }
}