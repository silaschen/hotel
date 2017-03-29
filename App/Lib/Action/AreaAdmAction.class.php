<?php
/**
* 地区管理后台
*/
class AreaAdmAction extends CommonAction{
	#退出登录#
	public function logout(){
		unset($_SESSION['area_id']);
		unset($_SESSION['area_user']);
		unset($_SESSION['a1']);
		unset($_SESSION['a2']);
		U('AreaAdm/login','','',true,true);
		exit();
	}
	#登录#
	public function login(){
		if(IS_GET){
			if($_SESSION['area_id']){
				U('AreaAdm/index','','',true,true);exit();
			}
			$this->title = '管理登录';
			$this->display();
		}else{
			$user = I('user');
			$pwd = I('pwd');
			$sign = I('sign'); //记住密码
			if($sign == 1){
				// 存入COOKIE
				cookie('area_user',$user,86400*365);
				cookie('area_pwd',$pwd,86400*365);
			}else{
				cookie('area_user',null);
				cookie('area_pwd',null);
			}
			$verify = I('verify');
			if(md5($verify) != $_SESSION['verify']) alert("验证码错误!");
			if(!$user || !$pwd) alert('请填写帐号密码!');
			$map = array('user'=>$user,'pwd'=>md5($pwd),'type'=>2);
			$info = M('sys_user')->where($map)->find();
			if(!$info) alert('帐号信息有误!');
			if($info['status']){
				//查询登录者所属权限组
				$_SESSION['area_id'] = $info['id'];  
		 		$_SESSION['area_user'] = $info['user'];
		 		$_SESSION['a1'] = $info['a1'];
		 		$_SESSION['a2'] = $info['a2'];
				// 读取上次登录时间
				$last = M('sys_logs')->where(array('uid'=>$info['id'],'type'=>3,'event'=>array('like','%登录%')))->max('addtime');
				cookie('lastlogin',date('Y-m-d H:i:s',$last));
				syslogs('系统管理员'.$info['user'].'登录后台。',$info['id'],3);
				U('AreaAdm/index','','',true,true);
			}else{
				alert('帐号已禁用!');
			}
		}
	}
	#登录检查  $need 是否需要检查权限 #
	public function IsLogin($need=false){
		// 登录状态检查
		if(IS_AJAX){
			if(!$_SESSION['area_id']) json('请重新登录！');
		}else{
			if(!$_SESSION['area_id']){
				$this->logout();//重新登录
			}
		}
		if(!$need || $_SESSION['area_id'] == 1) return true; //如果是admin或不需要验证
	}
	#修改管理员密码#
	public function profile(){
		$this->IsLogin();
		if(IS_GET){
			$this->title = '修改密码';
			$this->eq = -1;
			$this->display();
		}else{
			$old = I('old');
			$pwd = I('pwd');
			if(!$old || !$pwd) alert('参数错误!');
			$info = M('sys_user')->where(array('id'=>$_SESSION['area_id'],'type'=>2))->find();
			if($info['pwd'] != md5($old)) alert('当前密码错误!');
			$r = M('sys_user')->where(array('id'=>$_SESSION['area_id']))->setField('pwd',md5(trim($pwd)));
			if($r){
				syslogs('系统管理员'.$info['user'].'修改密码。',$info['id'],3);
				alert('恭喜您，密码修改成功!');
			}else{
				alert('密码无变化!');
			}
		}
	}
	#后台欢迎面板#
	public function index(){
		$this->IsLogin();
		$this->title = '管理概况';
		$this->eq = 0;
		// 曲线统计
		$dates = '';
		$data1 = '';
		//$data2 = '';
		for($i=9;$i>-1;$i--){ //最近几天？ i 
			$dates .= '"'.date("Y-m-d",strtotime("-".$i." day")).'",';
			$bt = strtotime(date("Y-m-d",strtotime("-".$i." day")));
			$et = $bt+86400;
			$users = M('user_list')->where(array('status'=>array('egt',1),'addtime'=>array('between',array($bt,$et))))->count();
			$data1 .= $users.',';
			//$data2 .= $checkin.',';
		}
		$this->dates = mb_substr($dates,0,-1,'utf-8');
		$this->data1 = mb_substr($data1,0,-1,'utf-8');
		//$this->data2 = mb_substr($data2,0,-1,'utf-8');
		// 操作日志
		$p = I('p');
        if($p == '') $p = 1;
        $model = M('sys_logs');
        $map = array();
        $map['uid'] = $_SESSION['area_id']; 
        $map['type'] = 3;
        import('@.ORG.Util.Page');// 导入分页类
        $list = $model->where($map)->order('addtime desc')->page($p.',10')->select();
        $this->assign('list',$list);// 赋值数据集
        $count  = $model->where($map)->count();// 查询满足要求的总记录数
        $page   = new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数
        $page->setConfig('theme','%upPage%  %linkPage%  %downPage%');
        $page->rollPage = 5 ;
        $show   = $page->show();// 分页显示输出
        $this->assign('page',$show);// 赋值分页输出
        //分页跳转的时候保证查询条件
        foreach($map as $key=>$val) {
            $page->parameter   .=   "$key=".urlencode($val).'&';
        }
        $this->display();
	}
	#酒店列表#
	public function hotellist(){
		$this->IsLogin(true);
		if(IS_GET){
			$this->title = '酒店列表';
			$this->eq = '酒店管理';
			$p = I('p',1);
			$id = I("id");
			$word = I('word');
			$status = I("status");
			$a3 = I("a3");
			$map = array();
			if ($id) $map['id'] = $id;
			if($word) $map['title'] = array('like','%'.$word.'%');
			if ($a3 > 0) $map['a3'] = $a3;
			$map['status'] = array('egt',0);
			if ($status == 1){
				 $map['status'] = $status;
			}else if($status == 2){
				$map['status'] = 0;
			}else if($status == 3){
				$map['status'] = array("egt",0);
			}
			$map['a1'] = $_SESSION['a1'];
			$map['a2'] = $_SESSION['a2']; 
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
		$this->IsLogin(true);
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
			$data['a1'] = $_SESSION['a1'];
			$data['a2'] = $_SESSION['a2'];
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
	#房型管理#
	public function roomlist(){
		$this->IsLogin(true);
		if(IS_GET){
			$this->title = '房型列表';
			$this->eq = '酒店管理';
			$p = I('p',1);
			$hid = I("hid");//酒店id
			$id = I("id");
			$word = I('word');
			$status = I("status");
			if (!$hid) {
				alert("您的参数有误,稍后再试",U('AreaAdm/hotellist'));
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
	
}