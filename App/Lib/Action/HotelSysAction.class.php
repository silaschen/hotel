<?php 
/**
* 后台管理 酒店管理
*/
class HotelSysAction extends CommonAction
{
	#酒店列表#
	public function hotellist(){
		$this->IsAdm(true);
		if(IS_GET){
			$this->title = '酒店列表';
			$this->eq = '酒店管理';
			$p = I('p',1);
			$id = I("id");
			$word = I('word');
			$status = I("status");
			$a1 = I("a1");
			$a2 = I("a2");
			$a3 = I("a3");
			$map = array();
			if ($id) $map['id'] = $id;
			if($word) $map['title'] = array('like','%'.$word.'%');
			if ($a1 > 0) $map['a1'] = $a1;
			if ($a2 > 0) $map['a2'] = $a2;
			if ($a3 > 0) $map['a3'] = $a3;
			$map['status'] = array('egt',0);
			if ($status == 1){
				 $map['status'] = $status;
			}else if($status == 2){
				$map['status'] = 0;
			}else if($status == 3){
				$map['status'] = array("egt",0);
			}
			$model = M('hotel_list');
			import('@.ORG.Util.Page');// 导入分页类
			$list = $model
			->where($map)
			->order('px desc,id desc')
			->page($p.',10')
			->select();
			//获取该店对应房型数量
			foreach ($list as $key => $value) {
				$list[$key]['roomnum'] = M("hotel_room")->where(array('hid'=>$value['id']))->count();
			}
			$this->assign('list',$list);// 赋值数据集
			$count	= $model->where($map)->count();// 查询满足要求的总记录数
			$this->total = $count;
			$page 	= new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数
			$page->setConfig('theme','%upPage%  %linkPage%  %downPage%');
			$page->rollPage = 5 ;
			$show	= $page->show();// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			//分页跳转的时候保证查询条件
			foreach($map as $key=>$val) {
				$page->parameter   .=   "$key=".urlencode($val).'&';
			}
			$this->display();
		}else{
			$id = I('id');
			$t = I('t');
			$r = M('hotel_list')->where(array('id'=>$id))->setField('status',$t);
			if ($r) {
				json('操作成功!',1);
			}else{
				json("操作失败");
			}
			
		}
	}

	#添加修改酒店#
	public function addhotel(){
		$this->IsAdm(true);
		if(IS_GET){
			$this->title = '添加/修改酒店';
			$this->eq = '酒店管理';
			$id = I('id');
			if($id > 0){
				$info = M('hotel_list')
				->where(array('id'=>$id))
				->find();
				$this->assign('info',$info);
			}
			$this->display();
		}else{
			$data = I('post.');
			if ($data['pwd'] == "") {
				unset($data['pwd']);
			}else{
				$data['pwd'] = md5($data['pwd']);
			}
			if($data['id'] > 0){
				$r = M('hotel_list')->where(array('id'=>$data['id']))->save($data);
			}else{
				// 新增
				$data['addtime'] = NOW_TIME;
				$r = M('hotel_list')->add($data);
			}
			if($r){
				json("保存成功",1);
			}else{
				json("保存失败");
			}
		}
	}

	#房型列表管理#
	public function roomlist(){
		$this->IsAdm(true);
		if(IS_GET){
			$this->title = '房型列表';
			$this->eq = '酒店管理';
			$p = I('p',1);
			$hid = I("hid");//酒店id
			$id = I("id");
			$word = I('word');
			$status = I("status");
			if (!$hid) {
				alert("您的参数有误,稍后再试",U('HotelSys/hotellist'));
			}else{
				$hotelname = M("hotel_list")->where(array('id'=>$hid))->getField("title");
				$this->title = $hotelname."房型列表";
			}
			$map = array();
			if ($id) $map['id'] = $id;
			if($word) $map['title'] = array('like','%'.$word.'%');
			$map['status'] = array('egt',0);
			if ($status == 2) $map['status'] = array("egt",0);
			if ($status == 1) $map['status'] = $status;
			if ($status == 3) $map['status'] = 0;
			//自己店的商品
			$map['hid'] = $hid;
			$model = M('hotel_room');
			import('@.ORG.Util.Page');// 导入分页类
			$list = $model->where($map)->order('id desc')->page($p.',10')->select();
			$this->assign('list',$list);// 赋值数据集
			$count	= $model->where($map)->count();// 查询满足要求的总记录数
			$this->total = $count;
			$page 	= new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数
			$page->setConfig('theme','%upPage%  %linkPage%  %downPage%');
			$page->rollPage = 5 ;
			$show	= $page->show();// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			//分页跳转的时候保证查询条件
			foreach($map as $key=>$val) {
				$page->parameter   .=   "$key=".urlencode($val).'&';
			}
			$this->display();
		}else{
			$id = I('id');
			$t = I('t');
			$r = M("hotel_room")->where(array('id'=>$id))->setField("status",$t);
			if ($r) {
				json('操作成功!',1);
			}else{
				json("操作失败");
			}
		}
	}

	#会员列表#
	public function userlist(){
		$this->IsAdm(true);
		if(IS_GET){
			if(IS_AJAX){
				$id = I('id');
				$info = M('user_list')->where(array('id'=>$id))->find();
				exit(json_encode($info));
			}
			$this->title = '会员列表';
			$this->eq = "会员管理";
			$p = I('p');
			$word = I('word');
			$sex = I('sex');
			$id = I('id');
			if(!$p) $p = 1;
			$map = array();
			if($word) $map['nickname|id|name|tel'] = array('like','%'.$word.'%');
			$map['status'] = array('egt',0);
			if($id) $map['id'] = $id;
			if ($sex) {
				if ($sex == 3) {
					$map['sex'] = array('egt',0);
				}else{
					$map['sex'] = $sex;
				}
			}
			$model = M('user_list');
			import('@.ORG.Util.Page');// 导入分页类
			$list = $model->where($map)->order('addtime desc')->page($p.',10')->select();
			//计算绑定车辆
			foreach ($list as $key => $value) {
				$list[$key]['car'] = M("illegal_carlist")->where(array('openid'=>$value['openid']))->count();
			}
			$this->assign('list',$list);// 赋值数据集
			$count	= $model->where($map)->count();// 查询满足要求的总记录数
			$this->total = $count;
			$page 	= new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数
			$page->setConfig('theme','%upPage%  %linkPage%  %downPage%');
			$page->rollPage = 5 ;
			$show	= $page->show();// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			//分页跳转的时候保证查询条件
			foreach($map as $key=>$val) {
				$page->parameter   .=   "$key=".urlencode($val).'&';
			}
			$this->display();
		}else{
			$id = I('id');
			$t = I('t');
			$r = M('user_list')->where(array('id'=>$id))->setField('status',$t);
			json('操作成功!',1);
		}
	}
	#会员详情#
	public function UserDetail(){
		$this->IsAdm(true);
		$info = M("user_list")->where(array('id'=>$_GET['id']))->find();
		$info['car'] = M("illegal_carlist")->where(array('openid'=>$info['openid']))->count();
		$this->assign("info",$info);
		$this->display();
	}

	#地区账号管理#
	public function AreaUserList(){
		$this->IsAdm(true);
		if (IS_GET) {
			$this->title = "地区账号管理";
			$this->eq = "系统设置";
			$p = I("p",1);
			$word = I("word");
			$a1 = I("a1");
			$a2 = I("a2");
			$status = I("status");
			$map = array();
			if ($word) $map['user'] = array("like","%".$word."%");
			if ($a1 > 0) $map['a1'] = $a1;
			if ($a2 > 0) $map['a2'] = $a2;
			$map['status'] = array("egt",0);
			if ($status == 2) $map['status'] = array("egt",0);
			if ($status == 1) $map['status'] = $status;
			if ($status == 3) $map['status'] = 0;
			$map['type'] = 2;
			$model = M('sys_user');
			import('@.ORG.Util.Page');// 导入分页类
			$list = $model->where($map)->order('addtime desc')->page($p.',10')->select();
			foreach ($list as $key => $value) {
					$list[$key]['a1'] = M("sys_location")
					->where(array('id'=>$value['a1']))
					->getField
					('name');
					$list[$key]['a2'] = M("sys_location")
					->where(array('id'=>$value['a2']))
					->getField
					('name');
			}
			$this->assign('list',$list);// 赋值数据集
			$count	= $model->where($map)->count();// 查询满足要求的总记录数
			$this->total = $count;
			$page 	= new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数
			$page->setConfig('theme','%upPage%  %linkPage%  %downPage%');
			$page->rollPage = 5 ;
			$show	= $page->show();// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			//分页跳转的时候保证查询条件
			foreach($map as $key=>$val) {
				$page->parameter   .=   "$key=".urlencode($val).'&';
			}
			$this->display();
			
		}else{
			$id = I("id");
			$t = I("t");
			$r = M("sys_user")->where(array('id'=>$id))->setField("status",$t);
			if ($r) {
				json("操作成功",1);
			}else{
				json("操作失败");
			}
		}
	}
	#添加地区账号#
	public function AddAreaUser(){
		$this->IsAdm(true);
		if (IS_GET) {
			$this->title = "添加地区账号";
			$this->eq = "系统设置";
			$id = I("id");
			if ($id) {
				$info = M("sys_user")->where(array('id'=>$id))->find();
				$this->assign("info",$info);
			}
			$this->display();
		}else{
			$data = I("post.");
			if($data['pwd'] == ""){
				unset($data['pwd']);
			}else{
				$data['pwd'] = md5($data['pwd']);
			}
			if ($data['id'] > 0) {
				$r = M("sys_user")->where(array('id'=>$data['id']))->save($data);
			}else{
				$data['type'] = 2;//地区管理员
				$data['addtime'] = NOW_TIME;
				$r = M("sys_user")->add($data);
			}
			if ($r) {
				json("保存成功",1);
			}else{
				json("保存失败");
			}
		}
	}
	
	public function HotelDetail(){
		$this->IsAdm(true);
		$info = M("hotel_list")->where(array('id'=>I("id")))->field("adr,wifi,park,title,restaurant,meeting,js,status")->find();
		$info['js'] = $info['js']*100;
		$this->assign("info",$info);
		$this->display();
	}
	
}







