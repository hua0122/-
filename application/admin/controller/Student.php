<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 09:29
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Student extends Admin
{
    /**
     * 学员管理
     */
    public function index(){
        $this->setMeta("学员管理");
        $map = array();

        $keyword = input('keyword','', 'htmlspecialchars,trim');
        if(!empty($keyword)){
                $map['name|phone'] = array('like', '%' .$keyword . '%');

        }


        $status = input('status','','trim,intval');//学员状态
        if(!empty($status)){
            if($status==2){
                $map['sent_student.status']='0';
            }else{
                $map['sent_student.status'] = $status;
            }

        }

        $area_id = input('area_id','','trim,intval');//所属场地
        if(!empty($area_id)){
            $map['sent_student.area_id'] = $area_id;
        }

        $tuition_state = input('tuition_state','','trim,intval');//学费状态
        if(!empty($tuition_state)){
            $map['tuition_state'] = $tuition_state;
        }

        //欠费区间
        $min_tuition = input('min_tuition','','htmlspecialchars,trim');//最小值
        $max_tuition = input('max_tuition','','htmlspecialchars,trim');//最大值
        if(!empty($min_tuition)&&!empty($max_tuition)){
            $map['unpaid'] = array(array('gt',$min_tuition),array('lt',$max_tuition));
        }

        //价格区间
        $min_price = input('min_price','','htmlspecialchars,trim');
        $max_price = input('max_price','','htmlspecialchars,trim');
        if(!empty($min_price)&&!empty($max_price)){
            $map['sent_grade.price'] =  array(array('gt',$min_price),array('lt',$max_price)) ;

        }

        //班别信息
        $grade_id = input('grade_id','','trim,intval');
        if(!empty($grade_id)){
            $map['grade_id'] = $grade_id;
        }

        //身份证
        $card = input('card','','htmlspecialchars,trim');
        if(!empty($card)){
            $arr = explode("\r\n",$card);//获取多行文本值以换行为分割转换为数组
            if(count($arr)>1){
                foreach ($arr as $k=>$v){
                    $arr[$k]= array("eq",$v);
                }
                array_push($arr,"or");
                $map['card'] = $arr;

            }else{
                $map['card'] = $arr[0];
            }

        }


        $order = "id desc";

        $list  = db('Student')
            ->join('sent_grade','sent_grade.id=sent_student.grade_id','left')
            ->join('sent_area','sent_area.id=sent_student.area_id','left')
            ->field('sent_student.*,sent_grade.name as grade_name,sent_grade.price,sent_area.name as area_name')
            ->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign('status',$status);
        $this->assign('grade_id',$grade_id);
        $this->assign('tuition_state',$tuition_state);
        $this->assign('area_id',$area_id);
        $this->assign('min_price',$min_price);
        $this->assign('max_price',$max_price);
        $this->assign('max_tuition',$max_tuition);
        $this->assign('min_tuition',$min_tuition);


        //班级信息展示
        $grade_s = db('Grade')->where(array("status"=>0))->select();
        $grade_x = db('Grade')->where(array("status"=>1))->select();
        $this->assign("grade_s",$grade_s);
        $this->assign("grade_x",$grade_x);

        //场地信息展示
        $area = db("Area")->select();
        $this->assign("area",$area);

        return $this->fetch();
    }
}