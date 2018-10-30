<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/30 0030
 * Time: 15:04
 */

namespace app\wap\controller;
use app\common\controller\Fornt;

class Enlist extends Fornt
{
    //报名班级列表页
    public function index(){
        return $this->fetch('../enlist/index');
    }

    //详情页
    public function detail(){
        return $this->fetch('../enlist/detail');
    }

}