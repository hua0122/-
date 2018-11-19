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
        /*if (empty(session('openid'))) {
            header("Location:../user/getwxinfo");
            exit();
        }*/

        $web_path = $_SERVER['SERVER_NAME'];
        $this->assign('web_path',"http://".$web_path);

		//设置SEO
		$this->setSeo(config('web_site_title'), config('web_site_keyword'), config('web_site_description'));
		//首页banner图
        $where = array("category_id"=>1);
        $banner1 = db("Document")->where($where)->limit('0,1')->select();
        $banner = db("Document")->where($where)->limit('1,5')->select();
        $this->assign("banner1",$banner1);
        $this->assign("banner",$banner);

        //首页最新活动
        $new_ad = db('Page')->find(13);
        $this->assign("new_ad",$new_ad);

        //走进鼎吉
        $w = array("category_id"=>3);
        $step = db("Document")->where($w)->find(21);
        $this->assign("step",$step);
        $step1 = db("Document")->where($w)->find(22);
        $this->assign("step1",$step1);
        $step2 = db("Document")->where($w)->find(23);
        $this->assign("step2",$step2);
        $step3 = db("Document")->where($w)->find(24);
        $this->assign("step3",$step3);
        $step4 = db("Document")->where($w)->find(25);
        $this->assign("step4",$step4);


        //发现最美鼎吉
        $where2 = array("category_id"=>9);
        $beautiful = db("Document")->where($where2)->order("create_time desc")->limit(0,10)->select();
        $this->assign("beautiful",$beautiful);


        //教练风采
        $w1 = array("category_id"=>10);
        $coach1 = db("Document")->where($w1)->find(26);
        $this->assign("coach1",$coach1);

        $coach2 = db("Document")->where($w1)->find(27);
        $this->assign("coach2",$coach2);

        $coach3 = db("Document")->where($w1)->find(28);
        $this->assign("coach3",$coach3);

        $coach4 = db("Document")->where($w1)->find(29);
        $this->assign("coach4",$coach4);

        $coach5 = db("Document")->where($w1)->find(30);
        $this->assign("coach5",$coach5);

        //团队风采
        $w2 = array("category_id"=>11);
        $team1 = db("Document")->where($w2)->find(31);
        $this->assign("team1",$team1);

        $team2 = db("Document")->where($w2)->find(32);
        $this->assign("team2",$team2);

        $team3 = db("Document")->where($w2)->find(33);
        $this->assign("team3",$team3);

        $team4 = db("Document")->where($w2)->find(34);
        $this->assign("team4",$team4);

        $team5 = db("Document")->where($w2)->find(35);
        $this->assign("team5",$team5);

        //学员风采
        $w3 = array("category_id"=>12);
        $student1 = db("Document")->where($w3)->find(36);
        $this->assign("student1",$student1);

        $student2 = db("Document")->where($w3)->find(37);
        $this->assign("student2",$student2);

        $student3 = db("Document")->where($w3)->find(38);
        $this->assign("student3",$student3);

        $student4 = db("Document")->where($w3)->find(39);
        $this->assign("student4",$student4);

        $student5 = db("Document")->where($w3)->find(40);
        $this->assign("student5",$student5);


		return $this->fetch("template/wap/index/index.html");
	}
}
