<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\wap\controller;
use app\common\controller\Fornt;

class Index extends Fornt {

	//网站首页
	public function index() {
		//设置SEO
		$this->setSeo(config('web_site_title'), config('web_site_keyword'), config('web_site_description'));
		//首页banner图
        $where = array("category_id"=>1);
        $banner1 = db("Document")->where($where)->limit('0,1')->select();
        $banner = db("Document")->where($where)->limit('1,5')->select();
        $this->assign("banner1",$banner1);
        $this->assign("banner",$banner);

        //首页最新活动
        $where1 = array("category_id"=>2);
        $new_ad = db("Document")->where($where1)->order("create_time desc")->limit(0,1)->find();
        $this->assign("new_ad",$new_ad);

        //走进鼎吉
        $w = array("category_id"=>3);
        $step1 = db("Document")->where($w)->order("create_time desc")->limit(0,1)->select();
        $this->assign("step1",$step1);

        $step2 = db("Document")->where($w)->order("create_time desc")->limit(1,1)->select();
        $this->assign("step2",$step2);

        $step3 = db("Document")->where($w)->order("create_time desc")->limit(2,1)->select();
        $this->assign("step3",$step3);

        $step4 = db("Document")->where($w)->order("create_time desc")->limit(3,1)->select();
        $this->assign("step4",$step4);

        $step5 = db("Document")->where($w)->order("create_time desc")->limit(4,1)->select();
        $this->assign("step5",$step5);


        //发现最美鼎吉
        $where2 = array("category_id"=>9);
        $beautiful = db("Document")->where($where2)->order("create_time desc")->limit(0,10)->select();
        $this->assign("beautiful",$beautiful);


        //教练风采
        $w1 = array("category_id"=>10);
        $coach1 = db("Document")->where($w1)->order("create_time desc")->limit(0,1)->select();
        $this->assign("coach1",$coach1);

        $coach2 = db("Document")->where($w1)->order("create_time desc")->limit(1,1)->select();
        $this->assign("coach2",$coach2);

        $coach3 = db("Document")->where($w1)->order("create_time desc")->limit(2,1)->select();
        $this->assign("coach3",$coach3);

        $coach4 = db("Document")->where($w1)->order("create_time desc")->limit(3,1)->select();
        $this->assign("coach4",$coach4);

        $coach5 = db("Document")->where($w1)->order("create_time desc")->limit(4,1)->select();
        $this->assign("coach5",$coach5);

        //团队风采
        $w2 = array("category_id"=>11);
        $team1 = db("Document")->where($w2)->order("create_time desc")->limit(0,1)->select();
        $this->assign("team1",$team1);

        $team2 = db("Document")->where($w2)->order("create_time desc")->limit(1,1)->select();
        $this->assign("team2",$team2);

        $team3 = db("Document")->where($w2)->order("create_time desc")->limit(2,1)->select();
        $this->assign("team3",$team3);

        $team4 = db("Document")->where($w2)->order("create_time desc")->limit(3,1)->select();
        $this->assign("team4",$team4);

        $team5 = db("Document")->where($w2)->order("create_time desc")->limit(4,1)->select();
        $this->assign("team5",$team5);

        //学员风采
        $w3 = array("category_id"=>12);
        $student1 = db("Document")->where($w3)->order("create_time desc")->limit(0,1)->select();
        $this->assign("student1",$student1);

        $student2 = db("Document")->where($w3)->order("create_time desc")->limit(1,1)->select();
        $this->assign("student2",$student2);

        $student3 = db("Document")->where($w3)->order("create_time desc")->limit(2,1)->select();
        $this->assign("student3",$student3);

        $student4 = db("Document")->where($w3)->order("create_time desc")->limit(3,1)->select();
        $this->assign("student4",$student4);

        $student5 = db("Document")->where($w3)->order("create_time desc")->limit(4,1)->select();
        $this->assign("student5",$student5);


		return $this->fetch("template/wap/index/index.html");
	}
}
