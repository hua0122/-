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

        $activity_id = input('activity_id','','trim,intval');//活动id
        if(!empty($activity_id)){
            $map['sent_student.activity_id'] = $activity_id;
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
            ->join('sent_activity','sent_activity.id=sent_student.activity_id','left')
            ->field('sent_student.*,sent_grade.name as grade_name,sent_grade.price,sent_area.name as area_name,sent_activity.name as activity_name')
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
        $this->assign('activity_id',$activity_id);


        //班级信息展示
        $grade_s = db('Grade')->where(array("status"=>0))->select();
        $grade_x = db('Grade')->where(array("status"=>1))->select();
        $this->assign("grade_s",$grade_s);
        $this->assign("grade_x",$grade_x);

        //场地信息展示
        $area = db("Area")->select();
        $this->assign("area",$area);

        //活动信息展示
        $activity = db("Activity")->select();
        $this->assign("activity",$activity);

        return $this->fetch();
    }


    public function status() {
        $id     = $this->getArrayParam('id');
        $status = input('status', '0', 'trim,intval');

        if (!$id) {
            return $this->error("非法操作！");
        }

        $map['id'] = array('IN', $id);
        $result    = db('Student')->where($map)->setField('status', $status);
        if ($result) {
            return $this->success("设置成功！");
        } else {
            return $this->error("设置失败！");
        }
    }

    //导出
    public function export(){

        date_default_timezone_set('Asia/Shanghai');

        ob_end_clean();
        header("content-type:text/html;charset='utf-8'");
        require_once(PHP_EXCEL.'PHPExcel.php');
        require_once(PHP_EXCEL.'PHPExcel/IOFactory.php');
        $objPHPExcel=new \PHPExcel();
        $iofactory=new \PHPExcel_IOFactory();

        $data  = db('Student')
            ->join('sent_grade','sent_grade.id=sent_student.grade_id','left')
            ->join('sent_area','sent_area.id=sent_student.area_id','left')
            ->field('sent_student.*,sent_grade.name as grade_name,sent_grade.price,sent_area.name as area_name')
            ->select();


        //设置excel列名
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1','ID');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('B1','学员姓名');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('C1','电话');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('D1','身份证号');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('E1','班别');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('F1','价格');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('G1','场地');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('H1','活动');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('I1','优惠券');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('J1','合伙人');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('K1','队员');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('L1','报名时间');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('M1','应缴');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('N1','已缴');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('O1','欠费');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('P1','缴费时间');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Q1','缴费类型');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('R1','收款人');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('S1','收款备注');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('T1','状态');

        //把数据循环写入excel中
        foreach($data as $key => $value){
            $key+=2;
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A'.$key,$value['id']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('B'.$key,$value['name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('C'.$key,$value['phone']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('D'.$key,$value['card']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('E'.$key,$value['grade_name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('F'.$key,$value['price']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('G'.$key,$value['area_name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('H'.$key,$value['activity_id']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('I'.$key,$value['coupon']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('J'.$key,$value['inviter']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('K'.$key,$value['inviter']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('L'.$key,$value['sign_date']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('M'.$key,$value['payable']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('N'.$key,$value['payment']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('O'.$key,$value['unpaid']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('P'.$key,$value['pay_date']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Q'.$key,$value['pay_type']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('R'.$key,$value['payee']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('S'.$key,$value['remark']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('T'.$key,$value['status']);

        }

        $this->xiazaiExcel($data,$objPHPExcel,$iofactory);

    }


    //导出excel并下载
    function xiazaiExcel($data,$objPHPExcel,$iofactory){
        //导出代码
        $objPHPExcel->getActiveSheet() -> setTitle('学员管理');
        $objPHPExcel-> setActiveSheetIndex(0);
        $objWriter = $iofactory -> createWriter($objPHPExcel, 'Excel2007');

        $filename = date("YmdHis").'student.xlsx';
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        header('Cache-Control: max-age=0');
        $objWriter -> save('php://output');

    }

}