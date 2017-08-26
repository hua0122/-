<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\common\model;

/**
* 设置模型
*/
class AuthRule extends Base{

	const rule_url = 1;
	const rule_mian = 2;

	protected $type = array(
		'id'    => 'integer',
	);

	public $keyList = array(
		array('name'=>'module','title'=>'所属模块','type'=>'hidden'),
		array('name'=>'title','title'=>'节点名称','type'=>'text','help'=>''),
		array('name'=>'name','title'=>'节点标识','type'=>'text','help'=>''),
		array('name'=>'group','title'=>'功能组','type'=>'text','help'=>'功能分组'),
		array('name'=>'status','title'=>'状态','type'=>'select','option'=>array('1'=>'启用','0'=>'禁用'),'help'=>''),
		array('name'=>'condition','title'=>'条件','type'=>'text','help'=>'')
	);

	public function uprule($data, $type){
		foreach ($data as $value) {
			$id = $this->where(array('name' => $value['url']))->value('id');
			$save = array(
				'module' => $type,
				'type'   => 2,
				'name'   => $value['url'],
				'title'  => $value['title'],
				'group'  => $value['group'],
				'status' => 1,
			);
			if ($id) {
				$save['id'] = $id;
			}
			$list[] = $save;
		}
		return $this->saveAll($list);
	}
}