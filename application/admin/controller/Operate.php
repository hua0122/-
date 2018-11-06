<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31 0031
 * Time: 09:44
 */

namespace app\admin\controller;
use app\common\controller\Admin;
use think\Request;

class Operate extends Admin
{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $time = date("Y-m-d H:i:s");

        $this->assign('time',$time);
    }

    public function index(){
        /*$order = "id desc";
        $list = db('Page')->order($order)->paginate(10);
        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->assign('model_id','4');//单页
        */

        $order = "id desc";
        $where = [];
        $where['category_id '] = 1;
        $list = db('Document')->where($where)->order($order)->select();

        $this->assign('list',$list);
        $this->setMeta("图片列表");
        return $this->fetch();
    }

    //添加
    public function add() {
        $document = model('Document');

        if (IS_POST) {
            $data = input('post.');
            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['cover_id'])){
                return $this->error("缩略图不能为空！");
            }


            if ($data) {

                $result = $document->save($data);


                if ($result) {
                    return $this->success("添加成功！", url('Operate/index'));
                } else {

                    return $this->error($document->getError());
                }

            } else {
                return $this->error($document->getError());
            }
        } else {

            $time = date("Y-m-d H:i:s");

            $this->assign('time',$time);
            $this->setMeta("添加");
            return $this->fetch('add');
        }
    }
    //修改
    public function edit() {
        $link = model('Document');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/index'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('Document')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $time = date("Y-m-d H:i:s");

            $this->assign('time',$time);
            $this->setMeta("图片修改");
            return $this->fetch();
        }
    }


    //走进鼎吉
    public function about(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/about'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 1);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("走进鼎吉");
            return $this->fetch();
        }

    }


    //发现最美鼎吉
    public function beautiful(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/beautiful'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 2);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("发现最美鼎吉");
            return $this->fetch();
        }

    }

    //教练风采
    public function coach(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/coach'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 3);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("教练风采");
            return $this->fetch();
        }

    }

    //团队风采
    public function team(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/team'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 4);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("团队风采");
            return $this->fetch();
        }

    }


    //学员风采
    public function student(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/student'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 5);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("学员风采");
            return $this->fetch();
        }

    }


    //最新活动
    public function activity(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/activity'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 6);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("最新活动");
            return $this->fetch();
        }

    }

    //学车流程
    public function process(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/process'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 6);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("学车流程");
            return $this->fetch();
        }

    }


    //优势服务
    public function service(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/service'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 7);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("优势服务");
            return $this->fetch();
        }

    }

    //学车保障
    public function ensure(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/ensure'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 8);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("学车保障");
            return $this->fetch();
        }

    }


    //常见问题
    public function question(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/question'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 9);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("常见问题");
            return $this->fetch();
        }

    }


    //学生协议
    public function agreement(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/agreement'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 11);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("学车协议");
            return $this->fetch();
        }

    }

    //科目一学习预约流程
    public function flow(){
        $link = model('Page');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/flow'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 10);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("科目一学习预约流程");
            return $this->fetch();
        }

    }

    //约考缴费流程
    public function pay(){
        $link = model('Page');
        //$id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');

            if(empty($data['title'])){
                return $this->error("标题不能为空！");
            }
            if(empty($data['content'])){
                return $this->error("内容不能为空！");
            }


            if ($data) {
                $result = $link->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Operate/pay'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($link->getError());
            }
        } else {
            $map  = array('id' => 12);
            $info = db('Page')->where($map)->find();

            $data = array(
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("约考缴费流程");
            return $this->fetch();
        }

    }


}