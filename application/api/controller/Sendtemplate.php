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


    public function get_template(){
        include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/weixin.php';
        $wx = new \Weixin_class();
        $school_id  = "1";
        $wx->set_industry($school_id);

        return $wx->template_list($school_id);


    }

    //发送模板消息


}