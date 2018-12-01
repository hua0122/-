<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 09:29
 */

namespace app\admin\controller;
use app\common\controller\Admin;
use think\Request;

class Student extends Admin
{
    public $schoolid;
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->schoolid = cookie("schoolid");
    }

    /**
     * 学员管理
     */
    public function index(){
        $this->setMeta("学员管理");
        $map = array();

        if(isset($this->schoolid)){
            $map['sent_student.school_id'] = $this->schoolid;
        }else{

            //根据角色ID查询当前学校ID
            $role_id = db('AuthGroupAccess')->where(array("uid"=>session("user_auth.uid")))->find();
            $where['group_id'] = $role_id['group_id'];
            $where['rules'] = array('<>','');
            $school_default = db("AuthGroupDetail")
                ->join('sent_school','sent_school.id=sent_auth_group_detail.school_id','left')
                ->field('sent_auth_group_detail.*,sent_school.name')
                ->where($where)->find();


            $map['sent_student.school_id'] = $school_default['school_id'];
        }


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

        $list  = db("Student")
            ->join('sent_grade','sent_grade.id=sent_student.grade_id','left')
            ->join('sent_area','sent_area.id=sent_student.area_id','left')
            ->join('sent_activity','sent_activity.id=sent_student.activity_id','left')

            ->join('sent_person','sent_person.id=sent_student.inviter','left')
            ->join('sent_department','sent_department.id=sent_person.department_id','left')

            ->join('sent_code','sent_code.id=sent_student.coupon','left')
            ->join('sent_coupon','sent_coupon.id=sent_code.coupon_id','left')
            ->join('sent_member','sent_member.uid=sent_student.payee','left')
            ->field('sent_student.*,sent_grade.name as grade_name,sent_grade.price,sent_area.name as area_name,sent_activity.name as activity_name,sent_activity.gift,sent_activity.amount as activity_amount,sent_person.username,sent_department.title as partner_name,sent_code.code,sent_coupon.name as coupon_name,sent_coupon.amount as coupon_amount,sent_member.nickname as payee_name')
            ->where($map)->order($order)->paginate(5);

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
        header("content-type:text/html;charset='utf-8'");
        require_once(PHP_EXCEL.'PHPExcel.php');
        require_once(PHP_EXCEL.'PHPExcel/IOFactory.php');
        $objPHPExcel=new \PHPExcel();
        $iofactory=new \PHPExcel_IOFactory();
        $data  = db('Student')
            ->join('sent_grade','sent_grade.id=sent_student.grade_id','left')
            ->join('sent_area','sent_area.id=sent_student.area_id','left')
            ->join('sent_activity','sent_activity.id=sent_student.activity_id','left')

            ->join('sent_person','sent_person.id=sent_student.inviter','left')
            ->join('sent_department','sent_department.id=sent_person.department_id','left')

            ->join('sent_code','sent_code.id=sent_student.coupon','left')
            ->join('sent_coupon','sent_coupon.id=sent_code.coupon_id','left')
            ->join('sent_member','sent_member.uid=sent_student.payee','left')
            ->field('sent_student.*,sent_grade.name as grade_name,sent_grade.price,sent_area.name as area_name,sent_activity.name as activity_name,sent_activity.gift,sent_activity.amount as activity_amount,sent_person.username,sent_department.title as partner_name,sent_code.code,sent_coupon.name as coupon_name,sent_coupon.amount as coupon_amount,sent_member.nickname as payee_name')


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
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('C'.$key,$value['phone'].=  ' ');
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('D'.$key,$value['card'].=  ' ');
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('E'.$key,$value['grade_name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('F'.$key,$value['price']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('G'.$key,$value['area_name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('H'.$key,$value['activity_name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('I'.$key,$value['coupon_name'].$value['coupon_amount'].'('.$value['code'].')');
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('J'.$key,$value['partner_name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('K'.$key,$value['username']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('L'.$key,date("Y-m-d H:i:s",$value['sign_date']));
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('M'.$key,$value['payable']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('N'.$key,$value['payment']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('O'.$key,$value['unpaid']);
            if($value['pay_date']==null){
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('P'.$key,'/');

            }else{
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('P'.$key,date("Y-m-d H:i:s",$value['pay_date']));

            }
            if($value['pay_type']==1){
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Q'.$key,'线上全款支付');
            }elseif ($value['pay_type']==2){
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Q'.$key,'线上定金支付');
            }elseif ($value['pay_type']==3){
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Q'.$key,'线下全款支付');
            }else{
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Q'.$key,'线下定金支付');
            }
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('R'.$key,$value['payee_name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('S'.$key,$value['remark']);
            if($value['status']==0){
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('T'.$key,'退学');
            }else{
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('T'.$key,'正常');
            }


        }

        //导出代码
        $objPHPExcel->getActiveSheet() -> setTitle('学员管理');
        $objPHPExcel-> setActiveSheetIndex(0);
        $objWriter = $iofactory -> createWriter($objPHPExcel, 'Excel5');

        $filename = date("Y-m-d H:i:s").'学员管理.xls';
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        header('Cache-Control: max-age=0');
        $objWriter -> save('php://output');

    }



    //收款编辑字段
    public function editable() {
        $pk     = input('pk', '', 'trim,intval');
        //$name   = input('name', '', 'trim');
        $value  = input('value', '', 'trim');
        db("Student")->where(array('id' => $pk))->setInc("payment", $value);
        db("Student")->where(array('id' => $pk))->setDec("unpaid", $value);
        $user_id = session("user_auth.uid");
        $result = db("Student")->where(array('id' => $pk))->setField('payee',$user_id);

        if ($result) {
            return $this->success("收款成功！",url('admin/student/index'));
        } else {
            return $this->error("收款失败！");
        }
    }
}