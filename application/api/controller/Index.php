<?php
namespace app\api\controller;
use app\common\controller\Api;

class Index extends Api{

	public function index(){

	}

	//获取首页banner
	public function get_banner(){
        $where = array("category_id"=>1);
        $banner = db("Document")->where($where)->limit('0,5')->select();
        if($banner){
            return success($banner);
        }else{
            return emptyResult();
        }

    }

    //走进鼎吉
    public function get_about(){
        $w = array("category_id"=>3);
        $res = db("Document")->where($w)->select();
        if($res){
            return success($res);
        }else{
            return emptyResult();
        }

    }

    //发现最美鼎吉
    public function get_beautiful(){
        $where2 = array("category_id"=>9);
        $res = db("Document")->where($where2)->order("create_time desc")->limit(0,10)->select();
        if($res){
            return success($res);
        }else{
            return emptyResult();
        }
    }

    //教练风采
    public function get_coach(){

    }
    //团队风采
    public function get_team(){

    }
    //学员风采
    public function get_student(){

    }
    //最新活动
    public function get_activity(){

    }

}
