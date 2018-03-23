<?php
namespace app\api\controller;

class Index extends \app\common\controller\Api {

	public $mustToken = true;

	public function usercount(){
		$this->data['data'] = array('team_num'=>100,'coustomer_num'=>10000);
		return $this->data;
	}
}