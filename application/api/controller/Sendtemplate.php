<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/24 0024
 * Time: 14:11
 */

namespace app\api\controller;


use app\common\controller\Api;

class Sendtemplate extends Api
{

    //获得模板消息ID
    public function get_template_id(){
        include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
        $wx = new \Weixin_class();
        $school_id  = "1";
        return $wx->get_template_id($school_id);


    }

}