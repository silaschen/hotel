<?php
class SysAction extends CommonAction{
	#退出登录#
	public function logout(){
		unset($_SESSION['sys_uid']);
		unset($_SESSION['sys_user']);
		unset($_SESSION['sys_role']);
		U('Sys/login','','',true,true);
		exit();
	}
	#登录#
	public function login(){
		if(IS_GET){
			if($_SESSION['sys_uid']){
				U('Sys/index','','',true,true);exit();
			}
			$this->title = '管理登录';
			$this->display();
		}else{
			$user = I('user');
			$pwd = I('pwd');
			if(!$user || !$pwd) alert('请填写帐号密码!');
			$map = array('user'=>$user,'pwd'=>md5($pwd));
			$info = M('sys_user')->where($map)->find();
			if(!$info) alert('帐号信息有误!');
			if($info['status']){
				$_SESSION['sys_uid'] = $info['id'];
				//查询登录者所属权限组
		        $groupid = M('sys_group_access')->where(array('uid'=>$_SESSION['sys_uid']))->find();
		        $_SESSION['group_id'] = $groupid['group_id'];    
		 		$_SESSION['sys_user'] = $info['user'];
				// 读取上次登录时间
				$last = M('sys_logs')->where(array('uid'=>$info['id'],'event'=>array('like','%登录%')))->max('addtime');
				cookie('lastlogin',date('Y-m-d H:i:s',$last));
				syslogs('系统管理员'.$info['user'].'登录后台。',$info['id']);
				U('Sys/index','','',true,true);
			}else{
				alert('帐号已禁用!');
			}
		}
	}

    //组首页
    public function group(){
    	$this->IsAdm(true);
    	if(IS_GET){
	    	$this->eq = -1;
	        $this->title = '管理组列表';
	    	$p = I('p');
		    if(!$p) $p = 1;
	        $map =array();
	        $model = M('sys_group');
	        import('@.ORG.Util.Page');// 导入分页类   
	    	$list = $model->where($map)->page($p.',15')->select();
	    	foreach($list as $key=>$value){
	    	  $count = M('sys_group_access')->where(array('group_id'=>$value['id']))->count();
	    	  $list[$key]['count'] = $count;	
	    	}
	        $this->assign('list',$list);// 赋值数据集
			$count	= $model->where($map)->count();// 查询满足要求的总记录数
			$this->total = $count;
			$page 	= new Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数
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
			$r = M('sys_group')->where(array('id'=>$id))->setField('status',$t);
			if($t == -1) M('sys_group')->where(array('id'=>$id))->delete();
			json('操作成功!',1);
		}
    }



    #已添加权限列表#
    public function accesslist(){
    	$this->IsAdm(true);
    	if(IS_GET){
		   $this->eq = -1;
           $this->title = '权限列表';
    	   $p = I('p');
		   if(!$p) $p = 1; 
          $map = array();
           $model = M('sys_rule');
           import('@.ORG.Util.Page');// 导入分页类
		   $list = $model->where($map)->order('id desc')->page($p.',15')->select();
		   $this->assign('list',$list);// 赋值数据集
		   $count	= $model->where($map)->count();// 查询满足要求的总记录数
		   $this->total = $count;
		   $page 	= new Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数
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
			$r = M('sys_rule')->where(array('id'=>$id))->setField('status',$t);
			if($t == -1) M('sys_rule')->where(array('id'=>$id))->delete();
			json('操作成功!',1);
    	}
    }

    //权限添加或修改   
    public function RuleAdd(){
    	$this->IsAdm(true);
    	$id = I('id');
    	$name = I('name');
    	$title = I('title');
    	// 检查格式是否正确
    	if(strpos($name, '/') === false) json('操作格式错误!');
    	if($id > 0){
    		// 修改
    		$r = M('sys_rule')->where(array('id'=>$id))->save(array('name'=>$name,'title'=>$title));
    	}else{
    		// 添加
    		$r = M('sys_rule')->add(array('name'=>$name,'title'=>$title,'status'=>1));
    	}
    	if($r){
    		json('保存成功!',1);
    	}else{
    		json('保存失败!');
    	}
    }

    //查看组成员
    public function LookPre(){
    	$this->IsAdm(true);
    	if(IS_GET){
		   $this->eq = -1;
           $this->title = '组成员查看';
    	   $p = I('p');
		   if(!$p) $p = 1; 
           $rules	= M('sys_group_access')->where(array('group_id'=>I('get.id')))->select();
           foreach($rules as $key=>$value){
           	 $arr[] =$value['uid'];
           }
           $map['id'] = array('in',$arr);
           $model = M('sys_user');
           import('@.ORG.Util.Page');// 导入分页类
		   $list = $model->where($map)->page($p.',10')->select();
		   foreach($list as $key=>$value){
		   	 $arr = M('sys_group_access')->where(array('uid'=>$value['id']))->find();
		   	 $list[$key]['group_id'] = $arr['group_id'];
		   }
		   // dump($list);die;
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
    		 $map = array();
    		 $map['uid'] = I('id');
	    	 $map['group_id'] = I('gid');
	    	 $r = M('sys_group_access')->where($map)->delete();	
	    	 if($r){
	    	    json('移除管理员操作成功!',1);
	    	 }else{
	    	    json('移除失败!，请重新尝试');
	    	 }
    	}
    }

    //查看组权限
    public function LookRule(){
        $this->IsAdm(true);
        if(IS_GET){
		   $this->eq = -1;
           $p = I('p');
		   if(!$p) $p = 1;
           // $id = I('get.id');
           $rules = M('sys_group')->where(array('id'=>I('get.id')))->find();
           $this->title = $rules['title'].'组权限列表';
		    //查询所拥有的权限内容
		   $arr = explode(',',$rules['rules']);
		   $map['id'] = array('in',$arr);
		   $model = M('sys_rule');
           import('@.ORG.Util.Page');// 导入分页类
		   $list = $model->where($map)->page($p.',10')->select();
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
	     }
      }
    //增加修改管理组
    public function GroupAdd(){
    	  $this->IsAdm(true);
    	  if(IS_GET){
    	 	  $id = I('id');
    	 	  $this->eq = -1;
	    	  if($id){	
		    	  $this->title = '修改组权限';
		    	  $info = M('sys_group')->where(array('id'=>$id))->find();
		    	  $arr = explode(',',$info['rules']);
		    	  $this->json = json_encode($arr);
		    	  $this->assign('info',$info);
	    	  }else{    	  	
	    	  	  $this->title = '添加管理组';
    		  }
    		  $list = M('sys_rule')->select();
	    	  $this->assign('list',$list);
	    	  $this->display();
    	  }else{
	    	  $id = I('post.id');
	    	  $url = U('Sys/group');
	    	  if($id){	
	    	    $info['title'] = I('post.title');
	    	  if($info['title']){
	    	  	$post = I('post.');
	    	  	unset($post['title']);
	    	  	$arr = array_slice($post,1);
	    	    $info['rules'] = implode(',',$arr);
	    	    $user = M('sys_group')->where(array('id'=>$id))->save($info);

	    	    if($user){
	    	      alert('修改管理组成功!',$url);
	    	    }else{
	    	      alert('修改失败!');
	    	    }
	    	  }else{
	    	       alert('管理组名称不能为空！');
	    	    }
	    	  }else{
	    	  $info['addtime'] = NOW_TIME;
	    	  $info['title'] = I('post.title');
	    	  if($info['title']){
	    	  $titles = M('sys_group')->where(array('title'=>$info['title']))->find();
	    	  if($titles) alert('管理组名称已存在！');	
	    	  $post = I('post.');
	    	  	unset($post['title']);
	    	  	$arr = array_slice($post,1);
	    	  $info['rules'] = implode(',',$arr);
	    	  $res = M('sys_group')->add($info);
	    	  if($res){
	    	    alert('添加管理组成功!',$url);
	    	  }else{
	    	    alert('添加失败，请重新尝试!');
	    	  }  	 
	    	  }else{
	    	    alert('管理组名称不能为空！');
	    	     }
	    	  }
      }
    } 

    //添加管理员
    public function RulAdd(){
    	 $this->IsAdm(true);
    	 if(IS_POST){
    	 $name = I('post.name');
    	 $groupid =I('post.group_id');
    	 $res = M('sys_user')->where(array('user'=>$name))->find();
    	 if($res){
    	 	 $uid = $res['id'];
    	 	 $info = M('sys_group_access')->where(array('uid'=>$uid,'group_id'=>$groupid))->find();	
    	 	 if(!$info){
    	 	 	$date = M('sys_group_access')->add(array('uid'=>$uid,'group_id'=>$groupid));
    	 	 	 $url = $_SERVER['HTTP_REFERER'];	
    				 if($date){
    	    				alert('添加成功!',$url);
    					 }else{
    	    				alert('添加失败!，请重新尝试',$url);
    	 				 }
    	 	 			 }else{
    	 	 				alert('该管理员已经在组内！');
    	 	 			}
		    	  }else{
		    	 	   alert('不存在该管理员！');
		    	  }
		    	}

    }
    

    

	#修改管理员密码#
	public function profile(){
		$this->IsAdm();
		if(IS_GET){
			$this->title = '修改密码';
			$this->eq = -1;
			$this->display();
		}else{
			$old = I('old');
			$pwd = I('pwd');
			if(!$old || !$pwd) alert('参数错误!');
			$info = M('sys_user')->where(array('id'=>$_SESSION['sys_uid']))->find();
			if($info['pwd'] != md5($old)) alert('当前密码错误!');
			$r = M('sys_user')->where(array('id'=>$_SESSION['sys_uid']))->setField('pwd',md5(trim($pwd)));
			if($r){
				syslogs('系统管理员'.$info['user'].'修改密码。',$info['id']);
				alert('恭喜您，密码修改成功!');
			}else{
				alert('密码无变化!');
			}
		}
	}

	#后台欢迎面板#
	public function index(){
		$this->IsAdm();
		$this->title = '管理后台';
		$this->eq = 0;
		// 曲线统计
		$dates = '';
		$data1 = ''; //第一统计项
		//$data2 = '';  //第二统计项
		for($i=9;$i>-1;$i--){ //最近几天？ i 
			$dates .= '"'.date("Y-m-d",strtotime("-".$i." day")).'",';
			$bt = strtotime(date("Y-m-d",strtotime("-".$i." day")));
			$et = $bt+86400;
			$orders = rand(1,10); //此处获取具体统计数量
			$data1 .= $orders.',';
			//$data2 .= $checkin.',';
		}
		$this->dates = mb_substr($dates,0,-1,'utf-8'); //日期
		$this->data1 = mb_substr($data1,0,-1,'utf-8'); //数据
		//$this->data2 = mb_substr($data2,0,-1,'utf-8');
		// 操作日志
		$p = I('p',1);
        $model = M('sys_logs');
        $map = array();
        $map['uid'] = $_SESSION['sys_uid']; 
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

	#系统管理员#
	public function admin(){
		$this->IsAdm(true);
		if(IS_GET){
			if(IS_AJAX){
				$id = I('id');
				$info = M('sys_user')->where(array('id'=>$id))->find();
				exit(json_encode($info));
			}
			$this->title = '系统管理员';
			$this->eq = -1;
			$role = M('sys_group')->where(array('status'=>1))->select();
			$this->assign('role',$role);
			$p = I('p');
			if(!$p) $p = 1;
			$map = array();
			$model = M('sys_user');
			$map['id'] = array('neq',$_SESSION['sys_uid']); //排除当前的帐号
			$map['status'] = array('egt',0);
			import('@.ORG.Util.Page');// 导入分页类
			$list = $model->where($map)->order('addtime desc')->page($p.',10')->select();
			foreach($list as $key=>$value){
				$list[$key]['group_id'] = M('sys_group_access')->where(array('uid'=>$value['id']))->getField('group_id');
			}
			foreach($list as $key=>$value){
				$list[$key]['title'] = M('sys_group')->where(array('id'=>$value['group_id']))->getField('title');
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
			$r = M('sys_user')->where(array('id'=>$id))->setField('status',$t);
			if($t == -1){
				syslogs('删除管理员:'.$id.'。',$_SESSION['sys_uid']);
			}else if($t == 1){
				syslogs('启用管理员:'.$id.'。',$_SESSION['sys_uid']);
			}else{
				syslogs('禁用管理员:'.$id.'。',$_SESSION['sys_uid']);
			}
			json('操作成功!',1);
		}
	}
	public function account(){
		$this->IsAdm(true);
		if(IS_GET){


		}else{
				// dump(I('post.'));die;
			$data = postdata();
			$uid = I('uid');
			if($uid > 0){
				// 编辑
				$info = M('sys_user')->where(array('id'=>$uid))->find();
				if(!$info) json('不存在的帐号!');
				if($data['user'] != $info['user'] && $data['user'] != ''){
					// 修改帐号
					$ck = M('sys_user')->where(array('user'=>$data['user']))->count();
					if($ck > 0) json('该帐号已存在!');
				}else{
					unset($data['user']);
				}
				if($data['pwd'] != '' && md5($data['pwd']) != $info['pwd']){
					$data['pwd'] = md5($data['pwd']); //修改密码
				}else{
					unset($data['pwd']);
				}
				$r = M('sys_user')->where(array('id'=>$uid))->save($data);
				if($r){
					json('修改成功!',1);
				}else{
					json('信息无变化!');
				}
			}else{
				// dump(I('post.'));die;
				// alert(I('post.'));die;
				$data['type'] = 1;
				// 检查重复
				$ck = M('sys_user')->where(array('user'=>$data['user']))->count();
				if($ck > 0) json('该帐号已存在!');
				$data['pwd'] = md5($data['pwd']);
				$data['addtime'] = NOW_TIME;
				$r = M('sys_user')->add($data);
				$user['uid'] = $r;
				$user['group_id'] = I('post.role');
				$user = M('sys_group_access')->add($user);
			}
			if($r||$user){
				json('帐号信息保存成功!',1);
			}else{
				json('操作失败!');
			}
		}
	}

	#站点设置#
	public function site(){
		$this->IsAdm(true);
		if(IS_GET){
			$this->title = '站点设置';
			$this->eq = -1;
			$this->display();
		}else{
			$file='./App/Conf/site.php';
			//检测文件是否可写
			if (!is_writeable($file)) alert('配置文件无法写入！');
			$config	=	postdata();
			unset($config['files']);
			arr2file('./App/Conf/site.php',$config);
			@unlink('./App/Runtime/~runtime.php'); //更新缓存
			alert('修改成功!');
		}
	}
	#轮播广告#
	public function advs(){
		$this->IsAdm(true);
		if(IS_GET){
			$this->title = '轮播广告';
			$this->eq = -1;
			$js = M('sys_advs')->where(array('type'=>1))->order('id asc')->select();
			$this->res = json_encode($js);
			$this->display();
		}else{
			// 删除旧的
			M('sys_advs')->where(array('type'=>1))->delete();
			for ($i=1; $i <5 ; $i++) { 
				$adv = I('adv'.$i);
				if($adv){
					$arr = explode('$$', $adv);
					M('sys_advs')->add(array('type'=>1,'pic'=>$arr[0],'url'=>$arr[1],'addtime'=>NOW_TIME));
				}
			}
			alert('恭喜您修改成功!',U('Sys/advs'));
		}
	}

	#第三方平台设置#
	public function vendor(){
		$this->IsAdm(true);
		if(IS_GET){
			$this->title = '第三方平台设置';
			$this->eq = -1;
			if(is_file("App/Lib/ORG/apiclient_cert.pem")) $this->assign('cert',"apiclient_cert.pem");
			if(is_file("App/Lib/ORG/apiclient_key.pem"))  $this->assign('key',"apiclient_key.pem");
			$this->display();
		}else{
			$file='./App/Conf/mp.php';
			//检测文件是否可写
			if (!is_writeable($file)) alert('配置文件无法写入！');
			$config = postdata();
			unset($config['files']);
			$config['ACCESSTOKEN'] = C('ACCESSTOKEN');
			$config['EXPIREIN'] = C('EXPIREIN');
			$config['ASTFROM'] = C('ASTFROM');
			$config['JSAPI_TICKET'] = C('JSAPI_TICKET');
			$config['JSAPI_EXPIRE'] = C('JSAPI_EXPIRE');
			arr2file($file,$config);
			@unlink('./App/Runtime/~runtime.php'); //更新缓存
			alert('配置修改成功!');
		}
	}
	#上传微信支付证书#
	public function upwxpem(){
		$name = $_FILES['files']['name'];
		if($name!= 'apiclient_cert.pem' && $name!= 'apiclient_key.pem'){
			json("证书名称错误！");
		}
		$path = "App/Lib/ORG/";
		if(!is_dir($path)) mkdir($path,0777,true); //不存在 则创建目录
		import("@.ORG.Util.UploadFile");
		$upload = new UploadFile();
		if(isset($op['size'])){
			$upload->maxSize = $op['size']; //传入的允许上传文件大小
		}else{
			$upload->maxSize = C('FILE_SIZE'); //获取全局允许上传文件大小
		}
		$upload->allowExts = array('pem');//传入的允许文件格式
		$upload->savePath = $path;
		$upload->saveRule='';
		$upload->uploadReplace =true;
		if (!$upload->upload()){
		  $r = $upload->getErrorMsg();
		}else{
		   $info    = $upload->getUploadFileInfo();
		   $file    =   $info[0]['savepath'].$info[0]['savename']; //上传的文件路径
		   $info['file'] = $file; //上传的文件路径
		   $r =  $info;
		}
		if(is_array($r)){
			json($r,1);
		}else{
			json($r);
		}
	}

	#文章列表#
	public function artlist(){
		$this->IsAdm();
		if(IS_GET){
			$this->title = '文章列表';
			$this->eq = '文章管理';
			$p = I('p',1);
			$word = I('word');
			$map = array();
			if($word) $map['title'] = array('like','%'.$word.'%');
			$map['status'] = array('egt',0);
			$model = M('art_list');
			import('@.ORG.Util.Page');// 导入分页类
			$list = $model->where($map)->order('addtime desc')->page($p.',10')->select();
			foreach ($list as $key => $value) {
				$list[$key]['cate']=M('art_category')->where(array('id'=>$value['cateid']))->getField('title');
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
			$r = M('art_list')->where(array('id'=>$id))->setField('status',$t);
			if($t == -1){
				$cover = M('art_list')->where(array('id'=>$id))->getField('cover');
				if($cover) @unlink($cover);
				M('art_list')->where(array('id'=>$id))->delete();
				syslogs('删除文章:'.$id.'。',$_SESSION['sys_uid']);
			}
			json('操作成功!',1);
		}
	}
	public function artcategory(){
		$this->IsAdm(true);
		//处理页面访问请求
		if(IS_GET){
			$this->title = '分类管理';
			$this->eq = '文章管理';
			$word = I('word');
			$p = I('p',1);
			$word = I('word');
			$map = array();
			if($word){
				$map['title'] = array('like','%'.$word.'%');
			}else{
				$map['parid'] = 0;
			}
			$map['status'] = array('egt',0);
			$model = M('art_category');
			import('@.ORG.Util.Page');// 导入分页类
			$list = $model->where($map)->order('addtime desc')->page($p.',10')->select();
			foreach ($list as $key => $value) {
				$list[$key]['son'] = $model->where(array('parid'=>$value['id']))->order('addtime desc')->select();
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
			$id = I('post.id');
			$status = I('post.t');
			$model = M('art_category');
			if($id>0){
				if($status == -1){
					$artrow = M('art_list')->where(array('cateid'=>$id))->count();
					$caterow = $model->where(array('parid'=>$id))->count();
					if($artrow>0 || $caterow>0) json("该分类下存在子分类或者文章，请先现在分类下面的子分类和文章！");
					$r = $model->where(array('id'=>$id))->delete();
				}else{
					$r = $model->where(array('id|parid'=>$id))->setField('status',$status);
				}
				if($r) json('操作成功！',1);
				json('操作失败！');
			}	
		}	
	}
	#添加修改文章分类#
    public function addartcate(){
		$this->IsAdm(true);
		if(IS_GET){
			$this->title = '添加/编辑文章分类';
			$this->eq = '文章管理';
			$id = I('get.id');
			$model = M('art_category');
			$data['cates']=M('art_category')->where(array('parid'=>0))->select();
			if($id>0){
				$data['info'] = M('art_category')->where(array('id'=>$id))->find();
				$data['info']['parname']=M('art_category')->where(array('id'=>$data['info']['parid']))->getField('title');
			}
		    $this->assign($data);
			$this->display();
		}else{
			$data = I('post.');
			if($data['id'] > 0){
				$r = M('art_category')->where(array('id'=>$data['id']))->save($data);
			}else{
				// 新增
				$data['addtime'] = NOW_TIME;
				$r = M('art_category')->add($data);
			}
			if($r){
				alert("分类保存成功!",U('Sys/artcategory'));
			}else{
				alert('保存失败!');
			}
		}
	}
	#添加文章#
	public function addart(){
		$this->IsAdm(true);
		if(IS_GET){
			$this->title = '添加文章';
			$this->eq = '文章管理';
			$id = I('id');
			if($id > 0){
				$info = M('art_list')->where(array('id'=>$id))->find();
				$info['catename']=M('art_category')->where(array('id'=>$info['cateid']))->getField('title');
				$this->assign('info',$info);
			}
			$cates = M('art_category')->select();
			$this->assign('cates',$cates);
			$this->display();
		}else{
			$data = I('post.');
			if($data['id'] > 0){
				$r = M('art_list')->where(array('id'=>$data['id']))->save($data);
			}else{
				// 新增
				$data['addtime'] = NOW_TIME;
				$r = M('art_list')->add($data);
			}
			if($r){
				syslogs('编辑文章:'.$data['id'].$data['title'].'。',$_SESSION['sys_uid']);
				alert("文章保存成功!",U('Sys/artlist'));
			}else{
				alert('保存失败!');
			}
		}
	}

}