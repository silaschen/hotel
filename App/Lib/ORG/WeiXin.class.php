<?php
/* 微信公众平台高级接口类操作

	Author YangLin http://BinGuo.me

*/
class WeiXin
{
    public $accesstoken = '';
    public $results = '';
    public $red = array();
    public $tokenurl = '';
    public $appId;
    public $appSecret;
    public $mchid;
    public $openid;
    function __construct($appId = '', $appSecret = ''){
        if (!$appId) $appId = C('AppId');
        if (!$appSecret) $appSecret = C('AppSecret');
        $this->appId = $appId;
        $this->appSecret = $appSecret;
        $this->mchid = C('MCHID');
        $this->openid = $_SESSION['openid']; //默认从SESSION获取
        $this->tokenurl = C('WXOPEN_URL') . "/Auth-GetAccessToken";
        $this->cktoken();
    }
    #检查赋值凭证#
    public function cktoken(){
        // 授权模式
        if (C('WX_MODEL')) {
            $this->token();
            return ture;
        }else{
            // 部署模式
            $file = RUNTIME_PATH.md5($this->AppId.$this->appSecret).'.php';
            if(!file_exists($file)) file_put_contents($file,array()); //创建空文件
            $cfg = json_decode(file_get_contents($file),true);
            if ($cfg['ACCESSTOKEN'] == '') {
                $this->token();
            }else{
                //若凭证为空则进行获取
                $from = $cfg['ASTFROM'];
                $expire = $cfg['EXPIREIN'];
                if (NOW_TIME - $from > $expire || !$expire) {
                    $this->token();
                    //检查是否过期 重新获取
                }else{
                    $this->accesstoken = $cfg['ACCESSTOKEN'];
                }
            }
        }
    }
    #获取token凭证#
    public function token()
    {
        if (C('WX_MODEL')) {
            // 授权模式
            $res = json_decode(file_get_contents($this->tokenurl . "?appid=" .$this->appId), true);
            if ($res['status'] == 'ok') {
                $this->accesstoken = $res['access_token'];
                return $res['access_token'];
            } else {
                return $res['mess'];
            }
        }
        // 部署模式
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appId&secret=$this->appSecret";
      	$js = json_decode($this->httpGet($url),true);
        if ($js['access_token']) {
            //保存到配置文件中
            $r = $this->savetoken($js['access_token'], $js['expires_in'], $js['from']);
            if ($r) {
                $this->accesstoken = $js['access_token'];
                return true;
            } else {
                return 'ACCESSTOKEN 更新失败!请检查配置文件是否可写。';
            }
        } else {
            $msg = $this->lang($js['errcode']);
            return $msg;
        }
    }
    #短网址生成#
    public function shorturl($url)
    {
        if ($this->accesstoken == '') {
            $this->cktoken();
        }
        $data['action'] = 'long2short';
        $data['long_url'] = $url;
        $data['access_token'] = $this->accesstoken;
        $url = "https://api.weixin.qq.com/cgi-bin/shorturl?access_token=" . $this->accesstoken;
        $curl = curl_init();
        // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url);
        // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1);
        // 从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        // 使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1);
        // 自动设置Referer
        curl_setopt($curl, CURLOPT_TIMEOUT, 0);
        // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, 0);
        // 显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // 获取的信息以文件流的形式返回
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        $tmpInfo = curl_exec($curl);
        // 执行操作
        if (curl_errno($curl)) {
            return false;
        }
        curl_close($curl);
        // 关闭CURL会话
        $r = json_decode($tmpInfo, true);
        if ($r['short_url']) {
            return $r['short_url'];
        }
        return $r;
    }
    
    #上传素材#
    public function putpic($file){
        if ($this->accesstoken == '') {
            $this->cktoken();
        }
        if(!file_exists($file)) return false;
        $url = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=" . $this->accesstoken . "&type=image";
        $data = array("media" => "@".$file);
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($curl);
        curl_close($curl);
        $val=json_decode($output,true);
        if(!$val['media_id']) return false;
        $media_id = $val['media_id']; //获取的media id
        return $media_id;
    }

    #发送客服消息#
    public function kefusend($openid, $type = 'text', $msg = '', $token = '')
    {
        if (!empty($token)) {
            $this->accesstoken = $token;
        }
        $url = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" . $this->accesstoken;
        if ($type == 'text') {
            $data = array('touser' => $openid, 'msgtype' => $type, 'text' => array('content' => urlencode($msg)));
        } else {
            if ($type == 'news') {
                $data = array('touser' => $openid, 'msgtype' => $type, 'news' => array('articles' => $msg));
            } else {
                if ($type == 'wxcard') {
                    $data = array('touser' => $openid, 'msgtype' => $type, 'wxcard' => $msg);
                }
            }
        }
        $data = urldecode(json_encode($data));
        //echo $data."<br><Br>";
        $opts = array('http' => array('method' => 'POST', 'header' => "Content-type: application/x-www-form-urlencodedrn" . "Content-Length: " . strlen($data) . "rn", 'content' => urldecode($data)));
        $context = stream_context_create($opts);
        $html = file_get_contents($url, false, $context);
        return json_decode($html, true);
    }
    public function listuser($nextopenid = '', $time = 1)
    {
        if ($this->accesstoken == '') {
            $this->cktoken();
        }
        $url = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=" . $this->accesstoken . "&next_openid=" . $nextopenid;
        $curl = curl_init();
        // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url);
        // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1);
        // 从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        // 使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1);
        // 自动设置Referer
        curl_setopt($curl, CURLOPT_TIMEOUT, 0);
        // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, 0);
        // 显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // 获取的信息以文件流的形式返回
        $tmpInfo = curl_exec($curl);
        // 执行操作
        if (curl_errno($curl)) {
            return false;
        }
        curl_close($curl);
        // 关闭CURL会话
        $r = json_decode($tmpInfo, true);
        if (isset($r['total'])) {
            $arr = $r['data']['openid'];
            //获取正常
            $user = array();
            for ($i = 0; $i < count($arr); $i++) {
                $user['info'][$i] = $this->userinfo($arr[$i]);
            }
            $user['next'] = $r['next_openid'];
            $user['total'] = $r['total'];
            //用户总数
            $user['count'] = $r['count'];
            //当前统计
            return $user;
        } else {
            if ($r['errcode'] == 42001) {
                if ($time < 3) {
                    //过期的TOKEN
                    $this->token();
                    //重新获取
                    $this->listuser($nextopenid, $time + 1);
                } else {
                    return false;
                }
            } else {
                return $r['errcode'];
            }
        }
    }
    #根据openid获取用户信息#
    public function userinfo($openid, $time = 1)
    {
        if ($this->accesstoken == '') {
            $this->cktoken();
        }
        $url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=" . $this->accesstoken . "&&openid=" . $openid;
        $curl = curl_init();
        // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url);
        // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1);
        // 从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        // 使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1);
        // 自动设置Referer
        curl_setopt($curl, CURLOPT_TIMEOUT, 0);
        // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, 0);
        // 显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // 获取的信息以文件流的形式返回
        $tmpInfo = curl_exec($curl);
        // 执行操作
        if (curl_errno($curl)) {
            return false;
        }
        curl_close($curl);
        // 关闭CURL会话
        $r = json_decode($tmpInfo, true);
        if (isset($r['openid'])) {
            return $r;
        } else {
            //if($r['errcode'] == 42001){
            if ($time < 3) {
                //过期的TOKEN
                $this->token();
                //重新获取
                $this->userinfo($openid, $time + 1);
            } else {
                return false;
            }
            // }else{
            // 	return $r['errcode'];
            // }
        }
        /*
 {  "subscribe": 1,  "openid": "o6_bmjrPTlm6_2sgVt7hMZOPfL2M",  "nickname": "Band", 
        
            "sex": 1,  "language": "zh_CN",  "city": "广州",  "province": "广东",  "country": "中国", 
        
            "headimgurl":    "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0", 
        
           "subscribe_time": 1382694957
        
        		} */
    }
    #发送模板消息#
    public function tplmsg($data, $time = 1)
    {
        if (is_array($data)) {
            $data = json_encode($data);
        }
        //如果是数组转换为JSON
        if ($this->accesstoken == '') {
            $this->cktoken();
        }
        $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" . $this->accesstoken;
        $curl = curl_init();
        // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url);
        // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1);
        // 从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        // 使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1);
        // 自动设置Referer
        curl_setopt($curl, CURLOPT_TIMEOUT, 0);
        // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, 0);
        // 显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // 获取的信息以文件流的形式返回
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        $tmpInfo = curl_exec($curl);
        // 执行操作
        if (curl_errno($curl)) {
            return false;
        }
        curl_close($curl);
        // 关闭CURL会话
        $r = json_decode($tmpInfo, true);
        if ($r['errmsg'] == 'ok') {
            return $r;
        } else {
            if ($time < 3) {
                //过期的TOKEN
                $this->token();
                //重新获取
                $this->tplmsg($data, $time + 1);
            } else {
                return false;
            }
        }
    }
    #JS领取卡券TICKET#
    public function cardticket()
    {
        $info = json_decode(file_get_contents("JSCARD.txt"), true);
        if ($info['ticket'] && $info['expires_at'] > NOW_TIME) {
            return $info['ticket'];
        } else {
            $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" . $this->accesstoken . "&type=wx_card";
            $r = json_decode(file_get_contents($url), true);
            if ($r['ticket']) {
                $r['expires_at'] = NOW_TIME + 7200;
                file_put_contents('JSCARD.txt', json_encode($r));
                return $r['ticket'];
            } else {
                return false;
            }
        }
    }
    #创建带参数的二维码#
    public function makecode($id, $expire = 0, $time = 1)
    {
        if ($this->accesstoken == '') {
            $this->cktoken();
        }
        $url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" . $this->accesstoken;
        if (is_numeric($id)) {
            if ($expire > 0) {
                // 临时数字ID
                if ($expire > 604800) {
                    $expire = 604800;
                }
                //最大7天
                $data['expire_seconds'] = $expire;
                $data['action_name'] = 'QR_SCENE';
                $data['action_info']['scene']['scene_id'] = $id;
                $file = 'Public/uploads/tmp/' . md5(uniqid()) . '.jpg';
            } else {
                // 永久数字ID
                $data['action_name'] = 'QR_LIMIT_SCENE';
                $data['action_info']['scene']['scene_id'] = $id;
                $file = 'Public/uploads/ercode/' . $id . '.jpg';
            }
        } else {
            // 永久字符串ID
            $data['action_name'] = 'QR_LIMIT_STR_SCENE';
            $data['action_info']['scene']['scene_str'] = $id;
            $file = 'Public/uploads/ercode/' . $id . '.jpg';
        }
        $tmpInfo = $this->do_post_request($url, json_encode($data));
        $r = json_decode($tmpInfo, true);
        if ($r['ticket']) {
            // 保存二维码图片
            $res = file_put_contents($file, file_get_contents('https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=' . $r['ticket']));
            if ($res > 20) {
                $r['pic'] = $file;
                return $r;
            } else {
                return '二维码保存失败!';
            }
        } else {
            if ($time < 3) {
                $this->token();
                return $this->makecode($id, $expire, $time + 1);
            } else {
                return $tmpInfo . $this->accesstoken;
            }
        }
    }
    protected function do_post_request($url, $data, $optional_headers = null)
    {
        $params = array('http' => array('method' => 'POST', 'content' => $data));
        if ($optional_headers !== null) {
            $params['http']['header'] = $optional_headers;
        }
        $ctx = stream_context_create($params);
        $fp = @fopen($url, 'rb', false, $ctx);
        if (!$fp) {
            throw new Exception("Problem with {$url}, {$php_errormsg}");
        }
        $response = @stream_get_contents($fp);
        if ($response === false) {
            throw new Exception("Problem reading data from {$url}, {$php_errormsg}");
        }
        return $response;
    }
    #保存TOKEN#
    protected function savetoken($token, $time = 7200, $from = '')
    {
        if(!$from) $from = $_SERVER['REQUEST_TIME'];
        //$file = CONF_PATH . 'mp.php';
        $file = RUNTIME_PATH.md5($this->AppId.$this->appSecret).'.php'; //存储相关参数在缓存目录
        //检测文件是否可写
        if (!is_writeable($file)) return false;
        if(file_exists($file)){
            $config = json_decode(file_get_contents($file),true); //读取赋值
        }else{
            $config = array(); //文件不存在
        }
        $config['ACCESSTOKEN'] = $token;
        $config['EXPIREIN'] = $time;
        $config['ASTFROM'] = $from;
        arr2file($file, $config);
        file_put_contents($file,json_encode($config));
        @unlink(RUNTIME_PATH . '~runtime.php');
        //更新缓存
        return true;
    }
    public function lang($i)
    {
        $arr[0] = '请求成功';
        $arr[40001] = '获取access_token时AppSecret错误，或者access_token无效';
        $arr[40002] = '不合法的凭证类型';
        $arr[40003] = '不合法的OpenID';
        $arr[40004] = '不合法的媒体文件类型';
        $arr[40005] = '不合法的文件类型';
        $arr[40006] = '不合法的文件大小';
        $arr[40007] = '不合法的媒体文件id';
        $arr[40008] = '不合法的消息类型';
        $arr[40009] = '不合法的图片文件大小';
        $arr[40010] = '不合法的语音文件大小';
        $arr[40011] = '不合法的视频文件大小';
        $arr[40012] = '不合法的缩略图文件大小';
        $arr[40013] = '不合法的APPID';
        $arr[40014] = '不合法的access_token';
        $arr[40015] = '不合法的菜单类型';
        $arr[40016] = '不合法的按钮个数';
        $arr[40017] = '不合法的按钮个数';
        $arr[40018] = '不合法的按钮名字长度';
        $arr[40019] = '不合法的按钮KEY长度';
        $arr[40020] = '不合法的按钮URL长度';
        $arr[40021] = '不合法的菜单版本号';
        $arr[40022] = '不合法的子菜单级数';
        $arr[40023] = '不合法的子菜单按钮个数';
        $arr[40024] = '不合法的子菜单按钮类型';
        $arr[40025] = '不合法的子菜单按钮名字长度';
        $arr[40026] = '不合法的子菜单按钮KEY长度';
        $arr[40027] = '不合法的子菜单按钮URL长度';
        $arr[40028] = '不合法的自定义菜单使用用户';
        $arr[40029] = '不合法的oauth_code';
        $arr[40030] = '不合法的refresh_token';
        $arr[40031] = '不合法的openid列表';
        $arr[40032] = '不合法的openid列表长度';
        $arr[40033] = '不合法的请求字符，不能包含\\uxxxx格式的字符';
        $arr[40035] = '不合法的参数';
        $arr[40038] = '不合法的请求格式';
        $arr[40039] = '不合法的URL长度';
        $arr[40050] = '不合法的分组id';
        $arr[40051] = '分组名字不合法';
        $arr[41001] = '缺少access_token参数';
        $arr[41002] = '缺少appid参数';
        $arr[41003] = '缺少refresh_token参数';
        $arr[41004] = '缺少secret参数';
        $arr[41005] = '缺少多媒体文件数据';
        $arr[41006] = '缺少media_id参数';
        $arr[41007] = '缺少子菜单数据';
        $arr[41008] = '缺少oauth code';
        $arr[41009] = '缺少openid';
        $arr[42001] = 'access_token超时';
        $arr[42002] = 'refresh_token超时';
        $arr[42003] = 'oauth_code超时';
        $arr[43001] = '需要GET请求';
        $arr[43002] = '需要POST请求';
        $arr[43003] = '需要HTTPS请求';
        $arr[43004] = '需要接收者关注';
        $arr[43005] = '需要好友关系';
        $arr[44001] = '多媒体文件为空';
        $arr[44002] = 'POST的数据包为空';
        $arr[44003] = '图文消息内容为空';
        $arr[44004] = '文本消息内容为空';
        $arr[45001] = '多媒体文件大小超过限制';
        $arr[45002] = '消息内容超过限制';
        $arr[45003] = '标题字段超过限制';
        $arr[45004] = '描述字段超过限制';
        $arr[45005] = '链接字段超过限制';
        $arr[45006] = '图片链接字段超过限制';
        $arr[45007] = '语音播放时间超过限制';
        $arr[45008] = '图文消息超过限制';
        $arr[45009] = '接口调用超过限制';
        $arr[45010] = '创建菜单个数超过限制';
        $arr[45015] = '回复时间超过限制';
        $arr[45016] = '系统分组，不允许修改';
        $arr[45017] = '分组名字过长';
        $arr[45018] = '分组数量超过上限';
        $arr[46001] = '不存在媒体数据';
        $arr[46002] = '不存在的菜单版本';
        $arr[46003] = '不存在的菜单数据';
        $arr[46004] = '不存在的用户';
        $arr[47001] = '解析JSON/XML内容错误';
        $arr[48001] = 'api功能未授权';
        $arr[50001] = '用户未授权该api';
        if ($i == -1) {
            return '系统繁忙';
        } else {
            if ($arr[$i]) {
                return $arr[$i];
            }
            return '未知';
        }
    }
/**
##  微信支付相关
##
**/
	
	public function payconfig($no, $fee,$body,$attach="",$notifyurl=""){
        $url = "https://api.mch.weixin.qq.com/pay/unifiedorder";
        $data['appid'] = $this->appId;
        $data['mch_id'] = $this->mchid;
        //商户号
        $data['device_info'] = 'WEB';
        $data['body'] = $body;
        $data['attach'] = $attach;
        $data['out_trade_no'] = $no;
        //订单号
        $data['total_fee'] = $fee;
        //金额
        $data['spbill_create_ip'] = get_client_ip();
        if(strpos($notifyurl,'http') === false){
        	$data['notify_url'] = U($notifyurl,'','','',true);
        }else{
        	$data['notify_url'] = $notifyurl;
        }
        if(!$data['notify_url']) $data['notify_url'] = U('Wx/PayNotify','','','',true);//默认
        //通知url
        $data['trade_type'] = 'JSAPI';
        $data['openid'] = $this->openid;
        $data['nonce_str'] = $this->createNoncestr();
        $data['sign'] = $this->MakeSign($data);
        //print_r($data);
        $xml = $this->ToXml($data);
        $curl = curl_init();
        // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url);
        // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        //设置header
        curl_setopt($curl, CURLOPT_HEADER, FALSE);
        //要求结果为字符串且输出到屏幕上
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_POST, TRUE);
        // 发送一个常规的Post请求
        curl_setopt($curl, CURLOPT_POSTFIELDS, $xml);
        // Post提交的数据包
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);
        // 设置超时限制防止死循环
        $tmpInfo = curl_exec($curl);
        // 执行操作
        curl_close($curl);
        // 关闭CURL会话
        $arr = $this->FromXml($tmpInfo);
        return $arr;
	}
 
   public function queryorder($transaction_id){
        $url = "https://api.mch.weixin.qq.com/pay/orderquery";
        $data['appid'] = $this->appId;
        $data['mch_id'] = $this->mchid;
        $data['nonce_str']=$this->createNoncestr();
        $data['transaction_id'] = $transaction_id;
        $data['sign'] = $this->MakeSign($data);
        $xml = $this->ToXml($data);
        $curl = curl_init();
        // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url);
        // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        //设置header
        curl_setopt($curl, CURLOPT_HEADER, FALSE);
        //要求结果为字符串且输出到屏幕上
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_POST, TRUE);
        // 发送一个常规的Post请求
        curl_setopt($curl, CURLOPT_POSTFIELDS, $xml);
        // Post提交的数据包
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);
        // 设置超时限制防止死循环
        $tmpInfo = curl_exec($curl);
        // 执行操作
        curl_close($curl);
        // 关闭CURL会话
        $arr = $this->FromXml($tmpInfo);
        return $arr;
    }

    #微信支付#
    public function payto($openid, $fee, $desc = '付款', $name = '', $no = false)
    {
        $url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
        $data['mch_appid'] = $this->appId;
        $data['mchid'] = $this->mchid;
        //商户号
        if (!$no) {
            $data['partner_trade_no'] = $this->OnlyId($data['mchid']);
            //随机生成
        } else {
            $data['partner_trade_no'] = $no;
        }
        $data['nonce_str'] = $this->createNoncestr();
        $data['openid'] = $openid;
        if ($name == '') {
            $data['check_name'] = 'NO_CHECK';
            //NO_CHECK  FORCE_CHECK
        } else {
            $data['check_name'] = 'FORCE_CHECK';
            //OPTION_CHECK
            $data['re_user_name'] = $name;
        }
        $data['amount'] = $fee;
        $data['desc'] = $desc;
        //付款说明
        $data['spbill_create_ip'] = get_client_ip();
        $data['sign'] = $this->MakeSign($data);
        //print_r($data);
        $xml = $this->ToXml($data);
        $tmpInfo = $this->postXmlSSLCurl($xml, $url);
        $arr = $this->FromXml($tmpInfo);
        return $arr;
    }
    
    #微信支付退款#
    public function refund($wxpayid, $no, $fee)
    {
        $url = "https://api.mch.weixin.qq.com/secapi/pay/refund";
        $data['appid'] = $this->appId;
        $data['mch_id'] = $this->mchid;
        //商户号
        $data['nonce_str'] = $this->createNoncestr();
        $data['op_user_id'] = $this->mchid;
        $data['out_trade_no'] = $no;
        $data['out_refund_no'] = $no;
        $data['refund_fee'] = $fee;
        $data['total_fee'] = $fee;
        $data['transaction_id'] = $wxpayid;
        $data['sign'] = $this->MakeSign($data);
        //print_r($data);
        $xml = $this->ToXml($data);
        $tmpInfo = $this->postXmlSSLCurl($xml, $url);
        $arr = $this->FromXml($tmpInfo);
        return $arr;
    }

    // 效验签名
    public function CheckSign($arr){
        if(!$arr['sign']){
            return false;
        }
        $sign = $this->MakeSign($arr);
        if($arr['sign'] == $sign){
            return true;
        }
        return false;
    }

    public function payjsapi($prepay_id){
        $jsApi["appId"] = $this->appId;
        $timeStamp = NOW_TIME;
        $jsApi["timeStamp"] = "$timeStamp";
        $jsApi["nonceStr"] = $this->createNoncestr();
        $jsApi["package"] = "prepay_id=".$prepay_id;
        $jsApi["signType"] = "MD5";
        $jsApi["paySign"] = $this->MakeSign($jsApi);
        $payjsapi = json_encode($jsApi);
        return $payjsapi;
    }

    /**
     * 	作用：使用证书，以post方式提交xml到对应的接口url
     */
    function postXmlSSLCurl($xml, $url, $second = 30)
    {
        $ch = curl_init();
        //超时时间
        curl_setopt($ch, CURLOPT_TIMEOUT, $second);
        //这里设置代理，如果有的话
        //curl_setopt($ch,CURLOPT_PROXY, '8.8.8.8');
        //curl_setopt($ch,CURLOPT_PROXYPORT, 8080);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        //设置header
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        //要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        //设置证书
        //使用证书：cert 与 key 分别属于两个.pem文件
        //默认格式为PEM，可以注释
        curl_setopt($ch, CURLOPT_SSLCERTTYPE, 'PEM');
        curl_setopt($ch, CURLOPT_SSLCERT, dirname(__FILE__) . '/apiclient_cert.pem');
        //默认格式为PEM，可以注释
        curl_setopt($ch, CURLOPT_SSLKEYTYPE, 'PEM');
        curl_setopt($ch, CURLOPT_SSLKEY, dirname(__FILE__) . '/apiclient_key.pem');
        //post提交方式
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
        $data = curl_exec($ch);
        //返回结果
        if ($data) {
            curl_close($ch);
            return $data;
        } else {
            $error = curl_errno($ch);
            echo "curl出错，错误码:{$error}" . "<br>";
            echo "<a href='http://curl.haxx.se/libcurl/c/libcurl-errors.html'>错误原因查询</a></br>";
            curl_close($ch);
            return false;
        }
    }
    /**
     * 输出xml字符
     * @throws WxPayException
     **/
    public function ToXml($arr)
    {
        $xml = "<xml>";
        foreach ($arr as $key => $val) {
            if (is_numeric($val)) {
                $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
            } else {
                $xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
            }
        }
        $xml .= "</xml>";
        return $xml;
    }
    /**
     * 将xml转为array
     * @param string $xml
     * @throws WxPayException
     */
    public function FromXml($xml)
    {
        //将XML转为array
        return json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
    }
    /**
     * 格式化参数格式化成url参数
     */
    protected function ToUrlParams($arr)
    {
        $buff = "";
        foreach ($arr as $k => $v) {
            if ($k != "sign" && $v != "" && !is_array($v)) {
                $buff .= $k . "=" . $v . "&";
            }
        }
        $buff = trim($buff, "&");
        return $buff;
    }
    /**
     * 生成签名
     * @return 签名，本函数不覆盖sign成员变量，如要设置签名需要调用SetSign方法赋值
     */
    protected function MakeSign($arr)
    {
        //签名步骤一：按字典序排序参数
        ksort($arr);
        $string = $this->ToUrlParams($arr);
        //签名步骤二：在string后加入KEY
        $string = $string . "&key=" . C('SIGNKEY');
        //签名步骤三：MD5加密
        $string = md5($string);
        //签名步骤四：所有字符转为大写
        $result = strtoupper($string);
        return $result;
    }
    /**
     * 	作用：产生随机字符串，不长于32位
     */
    public function createNoncestr($length = 32)
    {
        $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        $str = "";
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return $str;
    }
    public function sendmoney($openid, $money, $shop = '')
    {
        $url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack";
        $data['mch_id'] = $this->mchid;
        //商户号
        if (!$data['mch_id']) {
            $data['mch_id'] = $this->mchid;
        }
        $data['mch_billno'] = $this->OnlyId($data['mch_id']);
        //商户订单号
        $data['wxappid'] = $this->appId;
        if ($this->red['nick_name']) {
            $nickname = $this->red['nick_name'];
        } else {
            $nickname = C('SITE_NAME');
        }
        $data['nick_name'] = $nickname;
        $data['send_name'] = $shop;
        //发送者名称
        $data['re_openid'] = $openid;
        //红包接收者openid oQ3g8t4xZVTS5M7dIhG5ViBVGTKo
        $data['total_amount'] = $money;
        //金额
        $data['min_value'] = $money;
        $data['max_value'] = $money;
        $data['total_num'] = 1;
        //红包总人数
        if ($this->red['wishing']) {
            $wishing = $this->red['wishing'];
        } else {
            $wishing = '恭喜发财!';
        }
        if ($this->red['act_name']) {
            $actname = $this->red['act_name'];
        } else {
            $actname = '红包奖励';
        }
        $data['wishing'] = $wishing;
        //祝福语
        $data['client_ip'] = get_client_ip();
        $data['act_name'] = $actname;
        //活动名称
        $data['remark'] = '红包';
        //备注
        if ($this->red['logo_imgurl']) {
            $data['logo_imgurl'] = $this->red['logo_imgurl'];
        }
        //LOGO
        if ($this->red['share_content']) {
            $data['share_content'] = $this->red['share_content'];
        }
        if ($this->red['share_url']) {
            $data['share_url'] = $this->red['share_url'];
        }
        //分享链接
        if ($this->red['share_imgurl']) {
            $data['share_imgurl'] = $this->red['share_imgurl'];
        }
        //分享的图片
        $data['nonce_str'] = $this->createNoncestr();
        $data['sign'] = $this->MakeSign($data);
        $vars = $this->ToXml($data);
        $ch = curl_init();
        //超时时间
        curl_setopt($ch, CURLOPT_TIMEOUT, 50);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_SSLCERTTYPE, 'PEM');
        curl_setopt($ch, CURLOPT_SSLCERT, dirname(__FILE__) . '/apiclient_cert.pem');
        curl_setopt($ch, CURLOPT_SSLKEY, dirname(__FILE__) . '/apiclient_key.pem');
        curl_setopt($ch, CURLOPT_CAINFO, dirname(__FILE__) . '/rootca.pem');
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $vars);
        $tmpInfo = curl_exec($ch);
        curl_close($ch);
        $arr = $this->FromXml($tmpInfo);
        return $arr;
    }
    protected function OnlyId($id = '')
    {
        $only = $id . date('Ymd', NOW_TIME) . date('His', NOW_TIME) . rand(1, 9) . rand(1, 9) . rand(1, 9) . rand(1, 9);
        return $only;
        //返回唯一
    }
    /**
    	##
    	## 微信JS API
    	##
    **/
    public function getSignPackage()
    {
        if ($this->accesstoken == '')  $this->cktoken();
        $jsapiTicket = $this->getJsApiTicket();
        // 注意 URL 一定要动态获取，不能 hardcode.
        $protocol = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443 ? "https://" : "http://";
        $url = "{$protocol}{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
        $timestamp = $_SERVER['REQUEST_TIME'];
        $nonceStr = $this->createNonceStr(16);
        // 这里参数的顺序要按照 key 值 ASCII 码升序排序
        $string = "jsapi_ticket={$jsapiTicket}&noncestr={$nonceStr}&timestamp={$timestamp}&url={$url}";
        $signature = sha1($string);
        $signPackage = array("appId" => $this->appId, "nonceStr" => $nonceStr, "timestamp" => $timestamp, "url" => $url, "signature" => $signature, "rawString" => $string);
        return $signPackage;
    }

    private function getJsApiTicket(){
        if ($this->accesstoken == '') $this->cktoken();
        // jsapi_ticket 应该全局存储与更新，以下代码以写入到文件中做示例
        $file = RUNTIME_PATH.md5($this->AppId.$this->appSecret).'.php';
        if(!file_exists($file)) file_put_contents($file,array()); //创建空文件
        $cfg = json_decode(file_get_contents($file),true);
        $JSAPI_TICKET = $cfg['JSAPI_TICKET'];
        $JSAPI_EXPIRE = $cfg['JSAPI_EXPIRE'];
        if ($JSAPI_EXPIRE < $_SERVER['REQUEST_TIME'] || !$JSAPI_EXPIRE || !$JSAPI_TICKET) {
            $accessToken = $this->accesstoken;
            // 如果是企业号用以下 URL 获取 ticket
            // $url = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token=$accessToken";
            $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token={$accessToken}";
            $res = json_decode($this->httpGet($url));
            $ticket = $res->ticket;
            if ($ticket) {
		        //检测文件是否可写
		        if (!is_writeable($file)) return false;
		        $cfg['JSAPI_TICKET'] = $ticket;
		        $cfg['JSAPI_EXPIRE'] = $_SERVER['REQUEST_TIME'] + 7000;
		        arr2file($file, $cfg);
                file_put_contents($file,json_encode($cfg));
		        @unlink(RUNTIME_PATH . '~runtime.php');
            }
        } else {
            $ticket = $JSAPI_TICKET;
        }
        return $ticket;
    }

    private function httpGet($url){
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 500);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_URL, $url);
        $res = curl_exec($curl);
        curl_close($curl);
        return $res;
    }
}