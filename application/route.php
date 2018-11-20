<?php

return array(
    '__pattern__'    => array(
        'name' => '\w+',
    ),

    '/'              => 'admin/index/index', // 首页访问路由
    'search'         => 'index/search/index', // 首页访问路由

    'cart/index'     => 'index/cart/index',
    'cart/add'       => 'index/cart/add',
    'cart/count'     => 'index/cart/count',

    'login'          => 'user/login/index',
    'register'       => 'user/login/register',
    'logout'         => 'user/login/logout',
    'uc'             => 'user/index/index',

    'order/index'    => 'user/order/index',
    'order/list'     => 'user/order/lists',

    'admin/login'    => 'admin/index/login',
    'admin/logout'   => 'admin/index/logout',
    'admin/public_set_schoolid'   => 'admin/index/public_set_schoolid',


    'wap'   => 'wap/index/index',
    'enlist/index'   => 'wap/enlist/index',//报名
    'enlist/detail'   => 'wap/enlist/detail',//报名
    'enlist/ajax_list'   => 'wap/enlist/ajax_list',//班别信息
    'enlist/sign'   => 'wap/enlist/sign',//报名信息
    'enlist/success'   => 'wap/enlist/cg',//支付成功
    'enlist/fail'   => 'wap/enlist/fail',//支付失败
    'enlist/sign_fail'   => 'wap/enlist/sign_fail',//报名失败
    'enlist/sign_success'   => 'wap/enlist/sign_success',//报名成功
    'enlist/agreement'   => 'wap/enlist/agreement',//学车协议
    'enlist/yhq_code'   => 'wap/enlist/yhq_code',//优惠券
    'enlist/referral'   => 'wap/enlist/referral',//推荐码
    'enlist/activity'   => 'wap/enlist/activity',//活动
    'enlist/test'   => 'wap/enlist/test',//申请体检
    'enlist/get_sign'   => 'wap/enlist/get_sign',//获取报名信息
    'enlist/pay_success'   => 'wap/enlist/pay_success',//支付成功
    'enlist/pay_fail'   => 'wap/enlist/pay_fail',//支付失败
    'enlist/update_order_status'   => 'wap/enlist/update_order_status',//报名信息支付成功回调函数
    'enlist/update_tjorder_status'   => 'wap/enlist/update_tjorder_status',//体检申请支付成功回调函数

    'page/index'   => 'wap/page/index',//单页详情
    'page/detail'   => 'wap/page/detail',//单页详情 返回首页发现最美鼎吉


    'user/index'   => 'wap/user/index',//个人中心
    'user/study'   => 'wap/user/study',//学习中心
    'user/feedback'   => 'wap/user/feedback',//投诉建议
    'user/getwxinfo'   => 'wap/user/getwxinfo',//获取微信用户信息






    // 变量传入index模块的控制器和操作方法
    'addons/:mc/:ac' => 'index/addons/execute', // 静态地址和动态地址结合
    'usera/:mc/:ac'  => 'user/addons/execute', // 静态地址和动态地址结合
    'admina/:mc/:ac' => 'admin/addons/execute', // 静态地址和动态地址结合
    'wapa/:mc/:ac' => 'wap/addons/execute', // 静态地址和动态地址结合
);