<?php
namespace app\api\controller;
use app\common\controller\Api;

class Index extends Api{
    public function __construct()
    {
        parent::__construct();
        header("Access-Control-Allow-Origin: *");
    }

    public function index(){

	}

	//获取首页banner
	public function get_banner(){
        $where = array("category_id"=>1);
        $where['school_id'] = input('school_id','','trim,intval');
        $banner = db("Document")
            ->field("title,cover_id,school_id")
            ->where($where)->limit('0,5')->select();
        if($banner){
            foreach ($banner as $k=>$v){
                $banner[$k]['picurl'] = get_cover($v['cover_id'],"path") ;
                //$banner[$k]['picurl'] = str_replace("\/", "/", $banner[$k]['picurl']);
            }

            return success($banner);
        }else{
            return emptyResult();
        }

    }

    //走进鼎吉
    public function get_about(){
        $w = array("category_id"=>3);
        $w['school_id'] = input('school_id','','trim,intval');
        $res = db("Document")
            ->field("title,cover_id,school_id")
            ->where($w)->select();
        if($res){
            foreach ($res as $k=>$v){
                $res[$k]['picurl'] = get_cover($v['cover_id'],"path") ;
            }
            return success($res);
        }else{
            return emptyResult();
        }

    }

    //发现最美鼎吉
    public function get_beautiful(){
        $where = array("category_id"=>9);
        $where['school_id'] = input('school_id','','trim,intval');
        $res = db("Document")
            ->field("title,cover_id,school_id")
            ->where($where)->order("create_time desc")->limit(0,10)->select();
        if($res){
            foreach ($res as $k=>$v){
                $res[$k]['picurl'] = get_cover($v['cover_id'],"path") ;
            }
            return success($res);
        }else{
            return emptyResult();
        }
    }

    //教练风采
    public function get_coach(){
        $where = array("category_id"=>10);
        $where['school_id'] = input('school_id','','trim,intval');
        $res = db("Document")
            ->field("title,cover_id,school_id")
            ->where($where)->select();
        if($res){
            foreach ($res as $k=>$v){
                $res[$k]['picurl'] = get_cover($v['cover_id'],"path") ;
            }
            return success($res);
        }else{
            return emptyResult();
        }
    }
    //团队风采
    public function get_team(){
        $where = array("category_id"=>11);
        $where['school_id'] = input('school_id','','trim,intval');
        $res = db("Document")
            ->field("title,cover_id,school_id")
            ->where($where)->select();
        if($res){
            foreach ($res as $k=>$v){
                $res[$k]['picurl'] = get_cover($v['cover_id'],"path") ;
            }
            return success($res);
        }else{
            return emptyResult();
        }

    }
    //学员风采
    public function get_student(){
        $where = array("category_id"=>12);
        $where['school_id'] = input('school_id','','trim,intval');
        $res = db("Document")
            ->field("title,cover_id,school_id")
            ->where($where)->select();
        if($res){
            foreach ($res as $k=>$v){
                $res[$k]['picurl'] = get_cover($v['cover_id'],"path") ;
            }
            return success($res);
        }else{
            return emptyResult();
        }
    }
    //最新活动
    public function get_activity(){
        $where['school_id'] = input('school_id','','trim,intval');
        $res = db('Page')
            ->field('id,title,cover_id,content,create_time,update_time,school_id')
            ->where($where)
            ->find(13);
        if($res){
                $res['picurl'] = get_cover($res['cover_id'],"path") ;
            return success($res);
        }else{
            return emptyResult();
        }
    }

    //详情
    public function detail(){
	    $id = input('id','','trim,intval');
	    $res = db("Page")
            ->field('id,title,content,school_id')
            ->find($id);
        if($res){
            return success($res);
        }else{
            return emptyResult();
        }
    }

}
