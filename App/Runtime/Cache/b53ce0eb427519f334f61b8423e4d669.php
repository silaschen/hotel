<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo ($title); ?></title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="Public/com/AdminLTE/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="Public/com/AdminLTE/css/AdminLTE.css">
<link rel="stylesheet" href="Public/com/AdminLTE/css/skins/skin-yellow.css">
<!-- jQuery 2.1.4 -->
<script src="//cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="Public/com/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<script src="Public/com/common.js"></script>
<style type="text/css">
/*loading*/
#mask{position: fixed;z-index: 999999;top: 0;bottom: 0;left: 0;right: 0;display: none;}
#mask .loading{padding: 10px 15px;background: #333;opacity: 0.75;text-align: center;color: #FFF;line-height: 23px;position: fixed;left:0;right: 0;bottom: 0;top: 0;width: 120px;height: 65px;z-index: 999999;margin: auto;border-radius: 4px;}
</style>
<!--[if lt IE 9]>
<script src="//cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="hold-transition skin-yellow sidebar-mini">
<div class="wrapper">
  <!-- Main Header -->
<header class="main-header">

  <!-- Logo -->
  <a href="#" target='_blank' class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><i class='fa fa-television'></i></span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><i class='fa fa-television'></i> 商家后台</span>
  </a>

  <!-- Header Navbar -->
  <nav class="navbar navbar-static-top" role="navigation">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>
    <!-- Navbar Right Menu -->
    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <!-- User Account Menu -->
        <li class="dropdown user user-menu">
          <!-- Menu Toggle Button -->
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <!-- The user image in the navbar-->
            <img src="Public/res/admin.png" class="user-image" alt="User Image">
            <!-- hidden-xs hides the username on small devices so only the image appears. -->
            <span class="hidden-xs"><?php echo $_SESSION['area_user'];?></span>
          </a>
          <ul class="dropdown-menu">
            <!-- The user image in the menu -->
            <li class="user-header">
              <img src="Public/res/admin.png" class="img-circle" alt="User Image">
              <p>
                <?php echo $_SESSION['area_user'];?>
                <small>上次登录：<?php echo cookie('lastlogin');?></small>
              </p>
            </li>
            <!-- Menu Footer-->
            <li class="user-footer">
              <div class="pull-left">
                <a href="<?php echo U('AreaAdm/profile');?>" class="btn btn-default btn-flat">修改密码</a>
              </div>
              <div class="pull-right">
                <a href="<?php echo U('AreaAdm/logout');?>" onclick="return confirm('确定退出登录？');" class="btn btn-default btn-flat">退出系统</a>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
</header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
  <section class="sidebar">
    <ul class="sidebar-menu">
      <li><a href="<?php echo U('AreaAdm/index');?>"><i class="fa fa-pie-chart"></i> <span>管理概况</span></a></li>

      <li class="treeview">
        <a href="#"><i class="fa fa-shopping-cart"></i> <span>订单管理</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="<?php echo U('AreaAdm/module');?>">预定列表</a></li>
        </ul>
      </li>

        <li class="treeview">
        <a href="#"><i class="fa fa-institution"></i> <span>酒店管理</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="<?php echo U('AreaAdm/hotellist');?>">酒店列表</a></li>
        </ul>
      </li>

        <li class="treeview">
        <a href="#"><i class="fa  fa-line-chart"></i> <span>财务管理</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="<?php echo U('ShopStore/module');?>">房型列表</a></li>
        </ul>
      </li>
     

      <li class="treeview">
        <a href="#"><i class="fa fa-cog"></i> <span>系统设置</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="<?php echo U('AreaAdm/profile');?>">密码修改</a></li>
        </ul>
      </li>


    </ul><!-- /.sidebar-menu -->
  </section>
  <!-- /.sidebar -->
</aside>
<?php if($eq >= '0' OR $eq != ''): ?><script type="text/javascript">
if(!isNaN('<?php echo ($eq); ?>')){
  $(".sidebar-menu > li").eq(<?php echo ($eq); ?>).addClass('active');
}else{
  $(".sidebar-menu > li").each(function(){
    var txt = $.trim($(this).children('a').text());
    if(txt == '<?php echo ($eq); ?>'){
      $(this).addClass('active');
      return;
    }
  });
}
</script><?php endif; ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    
    <!-- Main content -->
    <section class="content">
    
  <link rel="stylesheet" href="Public/com/jQuery-File-Upload-9.9.3/css/jquery.fileupload.css">
  <script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<script>
var geocoder;
function init() {
  var map = new qq.maps.Map(document.getElementById('smap'),{
    zoom: 14,
    mapTypeId: qq.maps.MapTypeId.ROADMAP
  });
  var markersArray = []; //记录标注容器
  /*点击标注*/
  qq.maps.event.addListener(map,'click',function(event){
        //添加标注
        //清空标注
        if (markersArray) {
            for (i in markersArray) {
                markersArray[i].setMap(null);
            }
            markersArray.length = 0;
        }
          var marker = new qq.maps.Marker({
              map:map,
              position: event.latLng
          });
      $("input[name='lat']").val(event.latLng.lat);//记录坐标
      $("input[name='lng']").val(event.latLng.lng);
      markersArray.push(marker); //记录标注
      }
  );
  /*标注结束*/
 <?php if($info["lat"] == ''): ?>/*CityService 服务调用*/
  var callbacks={
      //若服务请求成功，则运行以下函数，并将结果传入
      complete:function(results){
          map.setCenter(results.detail.latLng);
      },
      //若服务请求失败，则运行以下函数
      error:function(){
          alert("位置信息获取失败，请刷新页面重试。");
      }
  }
  //创建类实例
  var cs=new qq.maps.CityService(callbacks);
  //以下示例：根据用户IP查询城市信息
  cs.searchLocalCity();                  
  /*CityService 服务调用结束*/
 <?php else: ?>
 map.panTo(new qq.maps.LatLng(<?php echo ($info["lat"]); ?>,<?php echo ($info["lng"]); ?>)); //设置地图中心
  var oldmarker = new qq.maps.Marker({
        map: map,
        position:new qq.maps.LatLng(<?php echo ($info["lat"]); ?>,<?php echo ($info["lng"]); ?>),
        animation: qq.maps.MarkerAnimation.BOUNCE
  });<?php endif; ?>
   //调用地址解析类
    geocoder = new qq.maps.Geocoder({
        complete : function(result){
            map.setCenter(result.detail.location);
        }
    });
}

function codeAddress() {
    var a1 = $("select[name='a1']").val();
  var a2 = $("select[name='a2']").val();
  var a3 = $("select[name='a3']").val();
  var w = '';
  var str = '';
  $("select[name='a1'] > option").each(function(){
    var i = $(this).text();
    var id = $(this).attr('value');
    if(id == a1){
      str = i;
      w = i;
    }
  });
  $("select[name='a2'] > option").each(function(){
    var i = $(this).text();
    var id = $(this).attr('value');
    if(id == a2){
      str += ' '+i;
    }
  });
  $("select[name='a3'] > option").each(function(){
    var i = $(this).text();
    var id = $(this).attr('value');
    if(id == a3){
      str += ' '+i;
    }
  });
  //str += $("input[name='address']").val();
  if(str != ''){
    //通过getLocation();方法获取位置信息值
    geocoder.getLocation(str);
  }
    
}
</script>
  <div class="box box-solid">
    <div class="box-header with-border">
      <h3 class="box-title">添加/编辑酒店</h3><a href="<?php echo U('AreaAdm/hotellist');?>" class='btn btn-default btn-xs pull-right'>返回列表</a>
    </div><!-- /.box-header -->
    <div class="box-body">
         <form method="POST" id="form">
          <input name='id' class='hide' value='<?php echo ($info["id"]); ?>'>
            <div class='form-group'>
              <label>酒店名称：</label>
              <input type='text' name='title' class='form-control' value='<?php echo ($info["title"]); ?>'>
            </div>

            <div class='form-group'>
              <label>展示图片：</label>
                <a href="javascript:$('#cover').val('');$('.showcover').html('');" onclick="return confirm('确定清除封面？');" class='pull-right'>清除封面</a> <br>
                  <button type='button' class='btn btn-success btn-sm fileinput-button'><i class="glyphicon glyphicon-picture"></i> <small>推荐尺寸 400*300 点击上传</small><input  id="uploadcover" type="file" name="files" accept="image/*" ></button>
                    <div id="progress" class="progress">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <div id="files" class="files">
                    </div>
                    <div class='showcover'>
                    <?php if($info["cover"] != ''): ?><img src='<?php echo ($info["cover"]); ?>'><?php endif; ?>
                    </div>
                <input class='hide' name='cover' id='cover' value='<?php echo ($info["cover"]); ?>'>
            </div>
           <div class='form-group'>
              <label>简介：</label>
                <textarea id="editor_id" name="intro" style="width:100%;min-height:260px;"></textarea>
            </div>

            <div class="form-group">
                <label>结算比例</label>
                <input type="number" name="js" class="form-control" placeholder="结算比例0.1为10%,填入对应小数" value="<?php echo ($info["js"]); ?>">
            </div>
            <div class="form-group">
              <label>管理员账号</label>
              <input type="text" name="user" class="form-control" value="<?php echo ($info["user"]); ?>">
            </div>
             <div class="form-group">
              <label>管理员密码</label>
              <input type="password" name="pwd" class="form-control" placeholder="留空默认为原密码">
            </div>

         <div class="row">
            <div class="col-xs-4 col-md-4">
              <select disabled="" name='a1' class='form-control' onchange="GetArea('a1','a2',true);codeAddress();">
              </select>
            </div>
            <div class="col-xs-4 col-md-4" style="padding:0 5px;">
              <select disabled="" name='a2' class='form-control' onchange="GetArea('a2','a3',true);codeAddress();"></select>
            </div>
            <div class="col-xs-4 col-md-4">
              <select name='a3' class='form-control' onchange="codeAddress();"></select>
            </div>
         </div>
        <div class='form-group'>
        <label class='text-red'><b>*</b> 地图标注：</label><br>
        <div id="smap" style="width:100%;min-height:300px;border:1px solid #ececec;"></div>
        <input class='hide' name='lat' value='<?php echo ($info["lat"]); ?>' data-old="<?php echo ($info["lat"]); ?>">
        <input class='hide' name='lng' value='<?php echo ($info["lng"]); ?>' data-old="<?php echo ($info["lng"]); ?>">
        </div>
         <div class='form-group'>
              <label>地址：</label>
              <input type='text' name='adr' class='form-control' value='<?php echo ($info["adr"]); ?>' placeholder="请填写详细地址">
            </div>
             <div class='form-group'>
            <label>酒店电话：</label>
            <input type='tel' name='tel' class='form-control' value='<?php echo ($info["tel"]); ?>'>
          </div>
        <div class='form-group'>
              <label>联系人：</label>
              <input type='text' name='contact' class='form-control' value='<?php echo ($info["contact"]); ?>'>
            </div>
          <div class='form-group'>
            <label>联系电话：</label>
            <input type='tel' name='mobile' class='form-control' value='<?php echo ($info["mobile"]); ?>'>
          </div>
          <div class="form-group">
          <label>排序</label>
            <input type="number" name="px" value="<?php echo ($info["px"]); ?>" class="form-control" placeholder="数字越大，排名越靠前">
          </div>
           <div class="row">

              <div class="col-md-3">
                  <label>wifi</label>
                  <select class="form-control" name="wifi">
                      <option value="1">有</option>
                      <option value="0">没有</option>
                  </select>
              </div>
               <div class="col-md-3">
                  <label>停车场</label>
                  <select class="form-control" name="park">
                      <option value="1">有</option>
                      <option value="0">没有</option>
                  </select>
              </div>
               <div class="col-md-3">
                  <label>会议室</label>
                  <select class="form-control" name="meeting">
                      <option value="1">有</option>
                      <option value="0">没有</option>
                  </select>
              </div>
               <div class="col-md-3">
                  <label>餐厅</label>
                  <select class="form-control" name="restaurant">
                      <option value="1">有</option>
                      <option value="0">没有</option>
                  </select>
              </div>
          </div>
         </form>
    </div><!-- /.box-body -->
    <div class="box-footer clearfix">
      <button type="button" onclick="SaveHotel();" class="btn btn-success pull-right savehotel">确定</button>
    </div>   
  </div>
<div class='hide temp'><?php echo ($info["intro"]); ?></div>
<script charset="utf-8" src="Public/com/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="Public/com/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
KindEditor.ready(function(K) {
    window.editor = K.create('#editor_id',{
      uploadJson:"<?php echo U('Common/loadimg',array('body'=>1));?>"
    });
    editor.html($('.temp').html());
});
function SaveHotel(){
  $("#editor_id").val(editor.html());
  if(vr('title') == ''){
    alert('请填写酒店名称!');
  }else if(vr('lat') == ''){
    alert("请标注地理位置");
  }else if(vr('tel') == ''){
    alert("请填写联系电话");
  }else if(vr('user') == ''){
    alert("请填写管理员账号");
  }else{
    loading2("操作中...");
    $.post(location.href,$("#form").serializeArray(),function(data){
        alert(data.msg);
        if (data.ret == 1) {
          location.href = "<?php echo U('AreaAdm/hotellist');?>";
        }else{
            loading2("",0);
        }
    },'JSON');
  }
}
</script>
<script src="Public/com/jQuery-File-Upload-9.9.3/js/vendor/jquery.ui.widget.js"></script>
<script src="Public/com/jQuery-File-Upload-9.9.3/js/load-image.all.min.js"></script>
<script src="Public/com/jQuery-File-Upload-9.9.3/js/canvas-to-blob.min.js"></script>
<script src="Public/com/jQuery-File-Upload-9.9.3/js/jquery.iframe-transport.js"></script>
<script src="Public/com/jQuery-File-Upload-9.9.3/js/jquery.fileupload.js"></script>
<script src="Public/com/jQuery-File-Upload-9.9.3/js/jquery.fileupload-process.js"></script>
<script src="Public/com/jQuery-File-Upload-9.9.3/js/jquery.fileupload-image.js"></script>
 <script type="text/javascript" src="Public/com/area.js"></script>
<script type="text/javascript">
$(function(){
  init();
  AreaInit(true);//初始化地区
  $("select[name='a1']").val(<?php echo $_SESSION['a1'];?>);
  GetArea('a1','a2',true);
  codeAddress();
  $("select[name='a2']").val(<?php echo $_SESSION['a2'];?>);
    GetArea('a2','a3',true);
    codeAddress();
  <?php if($info['a1'] != ''): ?>$("select[name='a1']").val(<?php echo ($info['a1']); ?>);
  GetArea('a1','a2',true);<?php endif; ?>
  <?php if($info['a2'] != ''): ?>$("select[name='a2']").val(<?php echo ($info['a2']); ?>);
  GetArea('a2','a3',true);<?php endif; ?>
  <?php if($info['a3'] != ''): ?>$("select[name='a3']").val(<?php echo ($info["a3"]); ?>);<?php endif; ?>
   <?php if($info['wifi'] != ''): ?>$("select[name='wifi']").val(<?php echo ($info["wifi"]); ?>);<?php endif; ?>
   <?php if($info['restaurant'] != ''): ?>$("select[name='restaurant']").val(<?php echo ($info["restaurant"]); ?>);<?php endif; ?>
   <?php if($info['meeting'] != ''): ?>$("select[name='meeting']").val(<?php echo ($info["meeting"]); ?>);<?php endif; ?>
   <?php if($info['park'] != ''): ?>$("select[name='park']").val(<?php echo ($info["park"]); ?>);<?php endif; ?>

    $('#uploadcover').fileupload({
        url: "<?php echo U('Common/loadimg');?>",
        dataType: 'JSON',
        acceptFileTypes: 'jpg,png,gif,jpeg,bmp',
      maxFileSize: 8000000, // 800kb
      disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator && navigator.userAgent),
        imageMaxWidth: 400, //自动裁剪保持该宽度
        // imageMaxHeight: 300,
        // imageCrop: true,
        done: function (e, data) {
          if(data.result.ret == 1){
              $("input[name='cover']").val(data.result.file);
              $(".showcover").html("<img src='"+data.result.file+"'>");
            }else{
              alert(data.result.msg);
            }
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css(
                'width',
                progress + '%'
            );
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');

});
</script>


    </section><!-- /.content -->
  </div><!-- /.content-wrapper -->
  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">值得信赖的移动互联网开发服务商!</div>
    <!-- Default to the left -->
    <a href="http://binguo.me/wx/" target='_blank'>&copy; 宾果智造</a>
  </footer>
</div><!-- ./wrapper -->
<!-- AdminLTE App -->
<script src="Public/com/AdminLTE/js/app.min.js"></script>

<script type="text/javascript">
  
  function getarea(f,t,m){
  if(m == undefined) m = false;
  var id = $("select[name='"+f+"']").val();
  if(id == 0 || id == undefined){
    $("select[name='"+t+"']").html("<option value='0'>全部地区</option>").show();
    return;
  }
  $.ajax({
    url:"<?php echo U('Common/location');?>",
    data:{"id":id},
    type:"GET",
    dataType:"JSON",
    async:false,
    success:function(data){
      if(data){
        if(m){
          var str = "<option value='0'>全部地区</option>";
        }else{
          var str = '';
        }
        for (var i = 0; i < data.length; i++) {
          str += "<option value='"+data[i].id+"'>"+data[i].name+"</option>";
        };
        $("select[name='"+t+"']").html(str).show();
        if(f == 'a1') getarea('a2','a3',m);
      }else{
        $("select[name='"+t+"']").html('');
      }
    }
  });
}

  
</script>
<div id="mask"><div class='loading'></div></div>
</body>
</html>