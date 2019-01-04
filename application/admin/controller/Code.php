<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/6 0006
 * Time: 15:19
 */

namespace app\admin\controller;
use app\common\controller\Admin;

class Code extends Admin
{
    public function index(){
        $map = array();

        $keyword = input('keyword','', 'htmlspecialchars,trim');
        if(!empty($keyword)){
            $map['username|phone|code|verify'] = array('like', '%' .$keyword . '%');

        }


        $status = input('status','','trim,intval');//状态
        if(!empty($status)){
            if($status==2){
                $map['sent_test.status']='0';
            }else{
                $map['sent_test.status'] = $status;
            }

        }else{
            $map['sent_test.status']='0';
        }

        $order = "id desc";
        $list  = db('Test')
            ->join('sent_outfit','sent_outfit.id=sent_test.outfit_id','left')
            ->field('sent_test.*,sent_outfit.name as outfit_name')
            ->where($map)->order($order)->paginate(10,false,['query'=>request()->param()]);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign('status',$status);


        $this->setMeta("体检码管理");
        return $this->fetch();
    }


    //添加  导入体检源码
    public function add(){
        $Area = model('Test');

        if (IS_POST) {
            $data = input('post.');
            //导入excel表格


            //接收前台文件
            $ex = $_FILES["file"];
            if(empty($ex['name'])){
                return $this->error("请选择文件");
            }

            //重设置文件名
            $filename = time().substr($ex['name'],stripos($ex['name'],'.'));
            $path = S_ROOT.'/uploads/excel/'.$filename;//设置移动路径
            move_uploaded_file($ex['tmp_name'],$path);

            $driveFile=PHP_EXCEL.'PHPExcel.php';
            if(!file_exists($driveFile)){
                $res=array('code'=>'55','msg'=>'驱动文件不存在');
                return json_encode($res);
            }
            require_once($driveFile);
            require_once(PHP_EXCEL.'PHPExcel/IOFactory.php');

            //获取excel读取类
            $objReader = \PHPExcel_IOFactory::createReader('Excel5');
            //如果excel文件后缀名为.xls，导入这个类
            $exts = explode('.',$ex['name'])[1];
            if($exts=='xls'){
                $objReader = \PHPExcel_IOFactory::createReader('Excel5');
            }elseif($exts=='xlsx'){
                $objReader = \PHPExcel_IOFactory::createReader('Excel2007');
            }else{
                $objReader = \PHPExcel_IOFactory::createReader('Excel5');
            }

            //设置只读
            $objReader->setReadDataOnly(true);
            //加载需要读取的文件
            $objPHPExcel = $objReader->load($path);
            //获取单元格
            $objWorksheet = $objPHPExcel->getActiveSheet();
            //获取总的行数
            $highestRow = $objWorksheet->getHighestRow();
            //获取总的列数
            $highestColumn = $objWorksheet->getHighestColumn();
            //将字母列名变成数字列名
            $highestColumnIndex = \PHPExcel_Cell::columnIndexFromString($highestColumn);
            //定义
            $excelData = array();
            //循环获取数据
            for($row = 1; $row <= $highestRow; $row++ ){
                for($cols = 0; $cols < $highestColumnIndex; $cols++){
                    $excelData[$row]['b'[$cols]]=(string)$objWorksheet->getCellByColumnAndRow($cols, $row)->getValue();
                }
            }
            unlink($path);
            for($i=1;$i<=count($excelData);$i++){
                $arr = array(
                    'code'            => 	$excelData[$i]['b'],
                    'create_time'     => 	time(),
                    'status'          => 	'0',
                    'outfit_id'       => 	$data['outfit_id'],
                );
                $rand1 = rand(0,9);
                $rand2 = rand(0,9);
                $rand3 = rand(0,9);

                $rand_group = $rand1.$rand2.$rand3;
                $arr['random'] = $rand_group;
                $substring = substr($excelData[$i]['b'],0,7);
                // 10位体检码  7位源码 ＋ 3位随机码
                $arr['verify'] = $substring.$rand_group;
                $arr1[] = $arr;
            }

                $result = $Area->saveAll($arr1);
                if ($result) {
                    return $this->success("添加成功！", url('Code/index'));
                } else {

                    return $this->error($Area->getError());
                }

        } else {
            $time = time();
            $this->assign("time",$time);

            //体检机构信息
            $outfit = db("Outfit")->select();
            $this->assign("outfit",$outfit);

            $this->setMeta("添加体检码");
            return $this->fetch();
        }

    }


    //导出 体检码信息
    public function export(){
        date_default_timezone_set('Asia/Shanghai');
        header("content-type:text/html;charset='utf-8'");
        require_once(PHP_EXCEL.'PHPExcel.php');
        require_once(PHP_EXCEL.'PHPExcel/IOFactory.php');
        $objPHPExcel=new \PHPExcel();
        $iofactory=new \PHPExcel_IOFactory();

        $data  = db('Test')
            ->join('sent_outfit','sent_outfit.id=sent_test.outfit_id','left')
            ->field('sent_test.*,sent_outfit.name as outfit_name')
            ->select();


        //设置excel列名
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1','ID');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('B1','体检源码');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('C1','随机码');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('D1','体检新码');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('E1','录入时间');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('F1','是否分配');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('G1','所属机构');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('H1','申请人');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('I1','申请人电话');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('J1','申请时间');

        //把数据循环写入excel中
        foreach($data as $key => $value){
            $key+=2;
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A'.$key,$value['id']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('B'.$key,$value['code']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('C'.$key,$value['random']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('D'.$key,$value['verify']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('E'.$key,date("Y-m-d H:i:s",$value['create_time']));
            if($value['status']){
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('F'.$key,'已分配');
            }else{
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('F'.$key,'未分配');
            }

            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('G'.$key,$value['outfit_name']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('H'.$key,$value['username']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('I'.$key,$value['phone']);
            if($value['apply_time']=="NULL"){
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('J'.$key,' ');
            }else{
                $objPHPExcel->setActiveSheetIndex(0)->setCellValue('J'.$key,date("Y-m-d H:i:s",$value['apply_time']));
            }


        }

        //导出代码
        $objPHPExcel->getActiveSheet() -> setTitle('体检码列表');
        $objPHPExcel-> setActiveSheetIndex(0);
        $objWriter = $iofactory -> createWriter($objPHPExcel, 'Excel5');

        $filename = date("Y-m-d H:i:s").'体检码列表.xls';
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        header('Cache-Control: max-age=0');
        $objWriter -> save('php://output');

    }


    //体检机构列表
    public function outfit(){

        $map = array();

        $order = "id desc";
        $list  = db('Outfit')->where($map)->order($order)->paginate(10,false,['query'=>request()->param()]);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);

        $this->setMeta("体检机构管理");
        return $this->fetch();
    }

    //新增体检机构
    public function outfit_add(){
        $Area = model('Outfit');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }
            if ($data) {

                $result = $Area->save($data);


                if ($result) {
                    return $this->success("添加成功！", url('Code/outfit'));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {
            $time = time();
            $this->assign("time",$time);

            $this->setMeta("添加体检机构");
            return $this->fetch();
        }

    }


    //编辑机构
    public function outfit_edit(){

        $link = model('Outfit');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Code/outfit'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Outfit')->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("编辑机构");
            return $this->fetch();
        }
    }


    //删除机构信息
    public function outfit_delete(){
        $id = $this->getArrayParam('id');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $link = db('Outfit');

        $map    = array('id' => array('IN', $id));
        $result = $link->where($map)->delete();
        if ($result) {
            return $this->success("删除成功！");
        } else {
            return $this->error("删除失败！");
        }

    }

    //体检站列表
    public function station_list(){
        $id   = input('id', '', 'trim,intval');
        $map = array();
        if($id){
            $map['outfit_id'] = $id;
        }

        $order = "id desc";
        $list  = db('Station')
            ->join('sent_outfit','sent_outfit.id=sent_station.outfit_id','left')
            ->field('sent_station.*,sent_outfit.name as outfit_name')
            ->where($map)->order($order)->paginate(10,false,['query'=>request()->param()]);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign("id",$id);

        $this->setMeta("体检站管理");
        return $this->fetch();

    }


    //添加
    public function station_add() {
        $id   = input('id', '', 'trim,intval');
        $Area = model('Station');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }
            if(empty($data['address'])){
                return $this->error("地址不能为空！");
            }



            if ($data) {
                $list  = db('Area')->where(array("name"=>$data['name']))->select();
                if($list){
                    return $this->error("名称已存在，请重新输入！", url('Code/station_list',array('id'=>$id)));
                }else{
                    $result = $Area->save($data);

                }


                if ($result) {
                    return $this->success("添加成功！", url('Code/station_list',array('id'=>$id)));
                } else {

                    return $this->error($Area->getError());
                }

            } else {
                return $this->error($Area->getError());
            }
        } else {

            $data = array(
                'keyList' => $Area->keyList,
            );
            $this->assign($data);


            $this->assign("id",$id);
            $this->setMeta("添加体检站");
            return $this->fetch();
        }
    }


    //修改
    public function station_edit() {
        $link = model('Station');
        $id   = input('id', '', 'trim,intval');
        $sid   = input('sid', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }
            if(empty($data['address'])){
                return $this->error("地址不能为空！");
            }

            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Code/station_list',array('id'=>$sid)));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Station')->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );
            $this->assign($data);
            $this->assign('id',$sid);
            $this->setMeta("编辑体检站");
            return $this->fetch();
        }
    }

    //删除
    public function station_delete() {
        $id = $this->getArrayParam('id');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $link = db('Station');

        $map    = array('id' => array('IN', $id));
        $result = $link->where($map)->delete();
        if ($result) {
            return $this->success("删除成功！");
        } else {
            return $this->error("删除失败！");
        }
    }



    //体检申请
    public function apply(){

        $map = array();

        $order = "id desc";
        $list  = db('Apply')
            ->join('sent_station','sent_station.id=sent_apply.station_id','left')
            ->join('sent_outfit','sent_outfit.id=sent_station.outfit_id','left')
            ->join('sent_test','sent_test.id=sent_apply.code_id','left')
            ->field('sent_apply.*,sent_station.name as station_name,sent_outfit.name as outfit_name,sent_test.code,sent_test.verify')
            ->where($map)->order($order)->paginate(10);

        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);

        $this->setMeta("体检申请管理");
        return $this->fetch();

    }

    //体检申请 编辑
    public function apply_edit(){
        $link = model('Apply');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['name'])){
                return $this->error("名称不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Code/apply'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('sent_apply.id' => $id);
            $info = db('Apply')
                ->join('sent_test','sent_test.id=sent_apply.code_id','left')
                ->field("sent_apply.*,sent_test.code as code_name")
                ->where($map)->find();

            $data = array(
                'keyList' => $link->keyList,
                'info'    => $info,
            );


            //体检站列表
            $station = db('Station')->select();
            $this->assign("station",$station);


            $this->assign($data);
            $this->setMeta("编辑内容");
            return $this->fetch();
        }

    }

}