<?php
/**
	## 公共控制器
	## V1.0 2017-02-24
**/
class CommonAction extends Action{
	#后台权限检查  $need 是否需要检查权限 #
	protected function IsAdm($need=false){
		// 登录状态检查
		if(IS_AJAX){
			if(!$_SESSION['sys_uid']) json('请重新登录！');
		}else{
			if(!$_SESSION['sys_uid']){
				R('Sys/logout');exit();
			}
		}
		if(!$need || $_SESSION['sys_uid'] == 1) return true; //如果是admin或不需要验证
	     //查询所属权限组 拥有的权限
		$rules = M('sys_group')->where(array('id'=> $_SESSION['group_id'],'status'=>1))->find();
		//查询所拥有的权限内容
		$arr = explode(',',$rules['rules']);
		foreach($arr as $key=>$value){
		   $brr[] = M('sys_rule')->where(array('id'=>$value))->find();
		   $arr[$key] =$brr[$key]['name'];
		}
		$do = MODULE_NAME.'/'.ACTION_NAME; //当前操作
		//判断组 内是否有操作权限
		// dump($arr);die;
		if(in_array($do, $arr)){
			return true;
		}else{
			if(IS_AJAX){
				json('您无权进行此操作!');
			}else{
				alert('对不起，您无权操作该项!');
		    }
	    }
    }
    
	
/**
	####微信相关操作
**/
	#静默方式获取OPENID#
	protected function IsWx($js=false){
		if($_SESSION['openid'] == '') unset($_SESSION['openid']);
		header("Content-type: text/html; charset=utf-8");
		$direct = get_page_url(); //当前访问URL
		import("@.ORG.WeiXin");
		$WeiXin = new WeiXin();
		$WeiXin->cktoken();
		$code = I('code');
		if(!$code && !$_SESSION['openid']){
			header("Location:"."https://open.weixin.qq.com/connect/oauth2/authorize?appid=".C('AppId')."&redirect_uri=".urlencode($direct)."&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
		}
		if(!$_SESSION['openid'] && $code){
			$url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".C('AppId')."&secret=".C('AppSecret')."&code=$code&grant_type=authorization_code";
			$r = json_decode(file_get_contents($url),true);
			$_SESSION['openid'] = $r['openid']; //openid
		}
		if($js && IS_GET && !IS_AJAX){
			//SDK 
			import("@.ORG.WeiXin");
			$WeiXin = new WeiXin();
			$res = $WeiXin->GetSignPackage();
			$this->assign('SDK',$res);
		}
		// openid 请求必要性检查
		if(!$_SESSION['openid']){
			if(IS_AJAX){
				json('OPENID已过期，请刷新重试!');
			}else{
				alert('请刷新重试!');
			}
		}
	}

	#授权模式获取微信用户信息#
	protected function WxAuth($js=false){
		if($_SESSION['openid'] == '') unset($_SESSION['openid']);
		header("Content-type: text/html; charset=utf-8");
		$direct = get_page_url(); //当前访问URL
		$code = I('code');
		$appid = C('AppId');
		// 授权模式
		if(C('WX_MODEL')){
			$cinfo = json_decode(file_get_contents(C('WXOPEN_URL')."/Auth-CaccessToken?appid={$appid}"),true);
		    if(!$code && !$_SESSION['openid']){
				header("Location:"."https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$appid."&redirect_uri=".urlencode($direct)."&response_type=code&scope=snsapi_userinfo&state=STATE&component_appid=".$cinfo['cappid']."#wechat_redirect");
			}
			if(!$_SESSION['openid'] && $code){
				$url = "https://api.weixin.qq.com/sns/oauth2/component/access_token?appid=".$appid."&code=".$code."&grant_type=authorization_code&component_appid=".$cinfo['cappid']."&component_access_token=".$cinfo['caccesstoken'];
				$r = json_decode(file_get_contents($url),true);
				$openid = $r['openid'];
				$access=$r['access_token'];
				$url = "https://api.weixin.qq.com/sns/userinfo?access_token={$access}&openid={$openid}&lang=zh_CN";
				$user = json_decode(file_get_contents($url),true);
				$_SESSION['openid'] = $r['openid'];
				if($user['headimgurl'] || $user['nickname']){
					cookie('WX_PROFILE',$user);
				}
			}
		}else{
			if(!$code && !$_SESSION['openid']){
				header("Location:"."https://open.weixin.qq.com/connect/oauth2/authorize?appid=".C('AppId')."&redirect_uri=".urlencode($direct)."&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect");
			}
			if(!$_SESSION['openid'] && $code){
				$url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".C('AppId')."&secret=".C('AppSecret')."&code=$code&grant_type=authorization_code";
				$r = json_decode(file_get_contents($url),true);
				if($r['openid'] && $r['access_token']){
					$_SESSION['openid'] = $r['openid']; //openid
					$url = "https://api.weixin.qq.com/sns/userinfo?access_token=".$r['access_token']."&openid=".$r['openid']."&lang=zh_CN";
					$user = json_decode(file_get_contents($url),true);
					if($user['headimgurl'] || $user['nickname']){
						cookie('WX_PROFILE',$user);
					}
				}
			}
		}
		// openid 请求必要性检查
		if(!$_SESSION['openid']){
			if(IS_AJAX){
				json('OPENID已过期，请刷新重试!');
			}else{
				alert('请刷新重试!');
			}
		}
		if($js && IS_GET && !IS_AJAX){
			//SDK 
			import("@.ORG.WeiXin");
			$WeiXin = new WeiXin();
			$res = $WeiXin->GetSignPackage();
			$this->assign('SDK',$res);
		}
	}
 	#appid 为授权方公众号appid，scope为授权方式snsapi_userinfo和snsapi_base，backurl为获取用户资料后的回调地址#
    public function OpenAuth($scope='snsapi_userinfo',$apppid='',$backurl=''){
		if($_SESSION['openid'] == '') unset($_SESSION['openid']);
		$appid = empty($appid)?C('AppId'):$apppid;
		$backurl = empty($backurl)?get_page_url():$backurl;
		$code = I('code');
		$state = I('state');
		if(C('WX_MODEL')){
			$cinfo = json_decode(file_get_contents(C('WXOPEN_URL')."/Auth-CaccessToken?appid={$appid}"),true);
		    if(!$code && !$_SESSION['openid']){
				header("Location:"."https://open.weixin.qq.com/connect/oauth2/authorize?appid={$appid}&redirect_uri={$backurl}&response_type=code&scope={$scope}&state={$scope}&component_appid={$cinfo['cappid']}#wechat_redirect");
			}
			if(!$_SESSION['openid'] && $code){
				$url = "https://api.weixin.qq.com/sns/oauth2/component/access_token?appid={$appid}&code={$code}&grant_type=authorization_code&component_appid={$cinfo['cappid']}&component_access_token={$cinfo['caccesstoken']}";
				$r = json_decode(file_get_contents($url),true);	
			}
		}else{
			if(!$code && !$_SESSION['openid']){
				header("Location:"."https://open.weixin.qq.com/connect/oauth2/authorize?appid=".C('AppId')."&redirect_uri=".urlencode($backurl)."&response_type=code&scope={$scope}&state={$scope}#wechat_redirect");
			}
			if(!$_SESSION['openid'] && $code){
				$url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".C('AppId')."&secret=".C('AppSecret')."&code=$code&grant_type=authorization_code";
				$r = json_decode(file_get_contents($url),true);
			}
		}
		if($r){
			if($state=='snsapi_base'){
				session('openid',$r['openid']);
				return true;
			}
			if($state=='snsapi_userinfo'){
				$openid = $r['openid'];
				$access=$r['access_token'];
				$url = "https://api.weixin.qq.com/sns/userinfo?access_token={$access}&openid={$openid}&lang=zh_CN";
				$user = json_decode(file_get_contents($url),true);
				if($user['headimgurl'] || $user['nickname']){
					cookie('user',$user);
					return true;
				}		
			}
		}
	}

	#保存微信JS上传的图片#
	public function SaveWxImg(){
		if(!$_SESSION['uid'] && !$_SESSION['openid']) exit();
		$res = I('res'); //资源ID
		if(!$res) json('未能获取资源ID!');
		import("@.ORG.WeiXin");
        $weixin = new WeiXin();
        $url = 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token='.$weixin->accesstoken.'&media_id='.$res;
        $file = 'Public/uploads/images/wximgs/'.$res.'.jpg';
        $r = file_put_contents($file,file_get_contents($url));
        if($r > 50){
        	json($file,1);
        }else{
        	json('图片保存失败，请刷新重试!');
        }
	}

	#生成自定义参数的微信二维码#
	protected function DefineQR($str=''){
		import("@.ORG.WeiXin");
        $weixin = new WeiXin();
        return $weixin->makecode($str);
	}
	#获取某用户的推广二维码#
	protected function WxQRcode($uid){
		if(!$uid && $_SESSION['uid'])  $uid = $_SESSION['uid']; //默认当前登录
		$file = "Public/uploads/ercode/SR-".$uid.'.jpg';
        if(file_exists($file)){
            return $file; //返回二维码路径
        }else{
            // 生成
           	$info = M('user_list')->where(array('id'=>$uid))->find();
            $r = $this->DefineQR('SR-'.$uid);
            if(is_array($r)){
            	import("@.ORG.Util.ImgMake");
            	$ImgMake = new ImgMake();
            	$avt = 'Public/uploads/tmp/avatar_'.$info['id'].'.jpg';
            	if(!file_exists($avt)) file_put_contents($avt, file_get_contents($info['headimgurl']));
            	$bg = 'Public/res/bg.jpg'; //背景
            	$wz = array('size' => 18, 'left' => 190, 'top' => 55);
				$txt = 'Public/uploads/tmp/txt_'.$uid.'.jpg';
				$ImgMake->writeText($bg,$txt,$info['nickname'],$wz);
				$av = array('left' => 44, 'top' => 40, 'width' => 81, 'height' => 81);
				$avtbg = 'Public/uploads/tmp/avt_'.$uid.'.jpg';
				$ImgMake->mergeImage($txt,$avt,$avtbg,$av);
				$er = array('left' =>139, 'top' => 274, 'width' => 334, 'height' => 334);
				$ImgMake->mergeImage($avtbg,$r['pic'],$file,$er);
				if(file_exists($file)){
					@unlink($txt);
					@unlink($avtbg);
					@unlink($avt);
				}
                return $file;
            }else{
                return false;
            }
        }
	}

	#微信网页支付参数 (订单编号 金额 回调地址 名称 后缀)#
	protected function SetWxPay($no,$fee,$url,$body='商品名称',$attch=''){
		import("@.ORG.WeiXin");
        $WX = new WeiXin();
        $payinfo = $WX->payconfig($no,$fee*100,$body,$attch,$url);
        $payjsapi = $WX->payjsapi($payinfo['prepay_id']);
        $this->assign('payjsapi',$payjsapi);
        return $payjsapi;
	}

	#微信企业付款#
	protected function WxPayTo($openid,$fee,$remark='资金提现'){
		import("@.ORG.WeiXin");
		$weixin = new WeiXin();
		$r = $weixin->payto($openid,$fee*100,$remark);
		if($r['result_code'] == 'SUCCESS' && $r['return_code'] == 'SUCCESS'){
			// $r['payment_no']  $r['payment_time']
			return $r;
		}else{
			if($r['err_code_des']) return $r['err_code_des'];
			return $r['return_msg'];
		}
	}

	#微信红包发放#
	protected function WxRedPack($openid,$fee,$host='红包奖励',$ext=array()){
		import("@.ORG.WeiXin");
		$weixin = new WeiXin();
		$weixin->red = $ext; //附加参数
		$r = $weixin->sendmoney($openid,$fee*100,$host);
		if($r['result_code'] == 'SUCCESS' && $r['return_code'] == 'SUCCESS'){
			// $r['send_listid']  $r['send_time'] $r['total_amount']
			return $r;
		}else{
			if($r['err_code_des']) return $r['err_code_des'];
			return $r['return_msg'];
		}
	}

	#微信支付订单退款#
	protected function WxRefund($wxid,$no,$fee){
		import("@.ORG.WeiXin");
		$weixin = new WeiXin();
		$r = $weixin->refund($wxid,$no,$fee);
		if($r['result_code'] == 'SUCCESS' && $r['return_code'] == 'SUCCESS'){
			return true;
		}else{
			//if($r['err_code_des']) return $r['err_code_des'];
			//return $r['return_msg']; 失败原因描述
			return false;
		}
	}
	
	#发送模版消息#
	protected function TplMsg($data,$uid=false){
		if(is_numeric($uid)){
			// 从用户表获取openid
			$openid = M('user_list')->where(array('id'=>$uid))->getField('openid');
		}else{
			if(!$uid){
				$openid = $_SESSION['openid'];
			}else{
				$openid = $uid;
			}
		}
		if(!$openid) return false;
		$data['touser'] = $openid;
		import("@.ORG.WeiXin");
		$WeiXin = new WeiXin();
		$r = $WeiXin->tplmsg($data);
		return $r;
	}

	#获取用户微信资料#
	protected function WxProfile($uid){
		if(is_numeric($uid)){
			// 从用户表获取openid
			$openid = M('user_list')->where(array('id'=>$uid))->getField('openid');
		}else{
			if(!$uid){
				$openid = $_SESSION['openid'];
			}else{
				$openid = $uid;
			}
		}
		if(!$openid) return false;
		import("@.ORG.WeiXin");
		$WeiXin = new WeiXin();
		$r = $WeiXin->userinfo($openid);
		return $r;
	}
	/*
 	{  "subscribe": 1,  "openid": "o6_bmjrPTlm6_2sgVt7hMZOPfL2M",  "nickname": "Band", 
 	"sex": 1,  "language": "zh_CN",  "city": "广州",  "province": "广东",  "country": "中国", 
  "headimgurl":    "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0", 
   "subscribe_time": 1382694957} */
	#上传微信素材#
   protected function WxScUpload($file,$type = 1){
   		// 默认图片素材
   		import("@.ORG.WeiXin");
		$WeiXin = new WeiXin();
		return $WeiXin->putpic($file);
   }

/**
	####微信相关操作结束
**/
	#短信验证码 获取及验证#
	public function SMSCode(){
		if(IS_GET){
			$tel = I('tel');
			$type = I('type');
			$user = I('user');
			$code = rand(1000,9999);
			if(NOW_TIME-$_SESSION['smscode']['lastsend'] < 60) json('操作太频繁请稍后再试!');
			if($type == 'reg'){
				// 检查是否已占用
				if(M('user_list')->where(array('tel'=>$tel))->count() > 0) json('该手机已注册，请换用其他号码!');
			}else if($type == 'forgot'){
				// 读取帐号
				$user = M('user_list')->where(array('tel'=>$tel))->getField('user');
				if(!$user) json('该手机尚未注册!');
			}else if($type == 'reset'){
				// 总店帐号
				$user= M('sys_user')->where(array('type'=>2,'user'=>$user))->find();
				if(!$user) json('找不到相关帐号!');
				$biz = M('biz_list')->where(array('id'=>$user['sid']))->getField('tel');
				if($biz != $tel) json('手机号码与帐号不匹配！');
			}
			// 发送短信
			$r = $this->SMSSend($tel,'SMS_5060511',"{\"code\":\"$code\",\"product\":\"帐号信息\"}");
			if($r === true){
				$_SESSION['smscode'] = array('tel'=>$tel,'code'=>$code,'type'=>$type,'check'=>false,'lastsend'=>NOW_TIME);
				json('发送成功!',1);
			}else{
				json($r); //发送失败
			}
		}else{
			// 验证
			$tel = I('tel');
			$type = I('type');
			$code = I('code');
			if(!$_SESSION['smscode']) json('请重新获取短信验证码!');
			if($_SESSION['smscode']['tel'] == $tel && $_SESSION['smscode']['code'] == $code && $_SESSION['smscode']['type'] == $type && $_SESSION['smscode']['check'] == false){
				// 验证通过
				$_SESSION['smscode']['check'] = true;
				if($_SESSION['smscode']['type'] == 'forgot'){
					// 读取帐号
					$user = M('user_list')->where(array('tel'=>$_SESSION['smscode']['tel']))->getField('user');
					json($user,1);
				}else{
					json("ok",1);
				}
			}else{
				json("验证错误!");
			}
		}
	}

	#发送短信#
	protected function SMSSend($tel,$code='',$msg = ''){
		return true; //TO DO...
	}

    #显示二维码#
    public function ShowQRImg(){
    	$str = I('str');
    	if(!$str) return false;
    	//$this->qrcode($str);
    	import("@.ORG.QRcode");
        QRcode::png($word,false,4,10);
    }

	#显示验证码#
	public function VerifyCodeImg() {
		ob_clean();
	  $type	 =	 isset($_GET['type'])?$_GET['type']:'gif';
	  import("@.ORG.Util.Image");
	  Image::buildImageVerify(4,1,$type);
	}

	#上传图片#
	public function loadimg(){
		if(!$_SESSION['uid'] && !$_SESSION['sys_uid'] && !$_SESSION['openid']) json('请重新登录!');
		$body = I('get.body');
		$thumb = I('get.thumb'); //是否缩略图
		if($body == 1){
			$filed = I('post.filed');
			if($filed){
				// 移动端编辑器上传
				//匹配出图片的格式
				if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $filed, $result)){
				  $type = $result[2];
				  $file = 'Public/uploads/images/'.date('Y-m-d').'/'.md5(NOW_TIME).'.'.$type;
				  if (file_put_contents($file, base64_decode(str_replace($result[1], '', $filed)))){
				    exit($file);
				  }else{
				  	exit('保存图片失败！');
				  }
				}else{
					exit('上传失败!');
				}
			}
			//百度编辑器上传
			$type = $_REQUEST['type'];
    		$editorId=$_GET['editorid'];
			$p  =   $this->upload('images/'.date('Y-m-d'),array('ext'=>'png,jpg,gif,jpeg,bmp'));
			if(is_array($p)){//成功!
				die(json_encode(array('error'=>0,'url'=>$p['file'])));
				//$status = 'SUCCESS';
			}else{//失败
				//$status = $p;
				die(json_encode(array('error'=>1,'message'=>$p)));
			}
			// if($type == "ajax"){
			// 	die($p['file']);
			// }else{
			// 	die("<script>parent.UM.getEditor('". $editorId ."').getWidgetCallback('image')('" . $p['file'] . "','" . $status . "')</script>");
			// }
		}
		if($thumb){
			$p	=	$this->upload('images/'.date('Y-m-d'),array('ext'=>'png,jpg,gif,jpeg','thumb'=>2,'width'=>320,'height'=>220,'del'=>false));
		}else{
			$p	=	$this->upload('images/'.date('Y-m-d'),array('ext'=>'png,jpg,gif,jpeg'));
		}
		if(is_array($p)){//成功!
			json($p,1);
		}else{//失败
			json($p);
		}
	}

	#上传文件  传入参数  1. 文件类型 (存放目录)  2. 参数#
	protected function upload($type,$op = ''){
		$path = C('FILE_DIR').$type.'/';
		if(!is_dir($path)) mkdir($path,0777,true); //不存在 则创建目录
		import("@.ORG.Util.UploadFile");
		$upload = new UploadFile();
		if(isset($op['size'])){
			$upload->maxSize = $op['size']; //传入的允许上传文件大小
		}else{
			$upload->maxSize = C('FILE_SIZE'); //获取全局允许上传文件大小
		}

		if(isset($op['ext'])){
			$upload->allowExts = explode(',', strtolower($op['ext'])); //传入的允许文件格式
		}else{
			$upload->allowExts = explode(',', strtolower(C('FILE_EXT')));//全局允许的文件格式
		}
		$upload->savePath = $path;
		$upload->saveRule = 'uniqid';

		if (!$upload->upload()){
		   return $upload->getErrorMsg();
		}else{
			import("@.ORG.Util.ImgMake");
            $ImgMake = new ImgMake();
		   $info  = $upload->getUploadFileInfo();
		   $file  = $info[0]['savepath'].$info[0]['savename']; //上传的文件路径
		   $info['cover'] = $file;
		   if($op['thumb'] == 2){ //从中间点裁剪
			$info['cover'] = $ImgMake->thumb($info[0]['savepath'].$info[0]['savename'],$op['width'],$op['height']);//缩略图路径
		   }elseif($op['thumb'] == 1){ //原始宽容裁剪
			$thumb = explode('.',$file);
			$info['cover'] = $thumb[0].'_m.'.$thumb[1]; //缩略图路径
			$ImgMake->thumbnails($file,$info['cover'],$op['width'],$op['height']);
		   }
		   if($op['del']) {
		   		@unlink($file); //删除原图保留缩略图
		   		$tmp['file'] = $file;
		   		//edit_size($tmp);
		   } else {
		   		//原图和缩略图都保留
		   		$tmp['file'] = $file;
		   		$tmp['cover'] = $info['cover'];
		   		//edit_size($tmp);
		   	 }
		   $info['file'] = $file; //上传的文件路径
		   return $info;
		}
	}


}