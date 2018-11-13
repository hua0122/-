<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/30 0030
 * Time: 15:04
 */

namespace app\wap\controller;
use app\common\controller\Fornt;
use think\Request;

class Enlist extends Fornt
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $web_path = $_SERVER['SERVER_NAME'];
        $this->assign('web_path',"http://".$web_path);
    }

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

        $web_path = $_SERVER['SERVER_NAME'];
        $this->assign('web_path',"http://".$web_path);

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


    //学车协议
    public function agreement(){
        if (IS_POST) {
            $data = input('post.');
            session('agreement_name',$data);
            return json_encode($data);
        }else{
            $this->assign('agreement',session('agreement_name'));
            return $this->fetch("template/wap/enlist/agreement.html");
        }

    }
}