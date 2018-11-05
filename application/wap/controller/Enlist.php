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
        $area = model('Area');
        $area = $area->select();

        $grade = model('Grade');
        $grade = $grade->where(array('area_id'=>'1'))->select();

        //banner图
        $where = array("category_id"=>8);
        $banner = db("Document")->where($where)->limit('0,5')->select();
        $this->assign("banner",$banner);

        $this->assign('area',$area);
        $this->assign('grade',$grade);
        return $this->fetch("template/wap/enlist/index.html");
    }

    //详情页
    public function detail(){

        $id   = input('id', '', 'trim,intval');
        $grade = model('Grade');
        $info = $grade->join('sent_area ','sent_area.id = sent_grade.area_id','left')
            ->field('sent_grade.*,sent_area.name as area_name,sent_area.thumb,sent_area.address,sent_area.lng,sent_area.lat')
            ->where(array('sent_grade.id'=>$id))->find();

        $this->assign('info',$info);
        return $this->fetch("template/wap/enlist/detail.html");
    }


    //班级ajax列表
    public function ajax_list(){
        $area_id = input('city', '', 'trim,intval');
        $where = array("area_id"=>$area_id);
        $grade = model('Grade');
        $res = $grade->where($where)->select();

        echo json_encode($res);

    }


    //报名页面
    public function sign(){
        return $this->fetch("template/wap/enlist/sign.html");
    }

    //报名成功页面
    public function cg(){
        return $this->fetch("template/wap/enlist/success.html");
    }

}