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
<link rel="stylesheet" href="Public/com/AdminLTE/css/skins/skin-green.css">
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
<body class="hold-transition skin-green sidebar-mini">
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
            <span class="hidden-xs"><?php echo $_SESSION['hotel_user'];?></span>
          </a>
          <ul class="dropdown-menu">
            <!-- The user image in the menu -->
            <li class="user-header">
              <img src="Public/res/admin.png" class="img-circle" alt="User Image">
              <p>
                <?php echo $_SESSION['hotel_user'];?>
                <small>上次登录：<?php echo cookie('lastlogin');?></small>
              </p>
            </li>
            <!-- Menu Footer-->
            <li class="user-footer">
              <div class="pull-left">
                <a href="<?php echo U('HotelAdm/profile');?>" class="btn btn-default btn-flat">修改密码</a>
              </div>
              <div class="pull-right">
                <a href="<?php echo U('HotelAdm/logout');?>" onclick="return confirm('确定退出登录？');" class="btn btn-default btn-flat">退出系统</a>
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
      <li><a href="<?php echo U('HotelAdm/index');?>"><i class="fa fa-pie-chart"></i> <span>管理概况</span></a></li>

      <li class="treeview">
        <a href="#"><i class="fa fa-shopping-cart"></i> <span>订单管理</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="<?php echo U('ShopStore/module');?>">预定列表</a></li>
        </ul>
      </li>

        <li class="treeview">
        <a href="#"><i class="fa fa-institution"></i> <span>房型管理</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="<?php echo U('HotelAdm/roomlist');?>">房型列表</a></li>
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
          <li><a href="">绑定微信</a></li>
          <li><a href="<?php echo U('HotelAdm/profile');?>">密码修改</a></li>
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
  <div class="box box-solid">
    <div class="box-header with-border">
      <h3 class="box-title">添加/编辑酒店房型</h3><a href="<?php echo U('HotelAdm/roomlist');?>" class='btn btn-default btn-xs pull-right'>返回列表</a>
    </div><!-- /.box-header -->
    <div class="box-body">
         <form method="POST" id="form">
          <input name='id' class='hide' value='<?php echo ($info["id"]); ?>'>
            <div class='form-group'>
              <label>房型名称：</label>
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
              <label>门市价(元)</label>
              <input type="number" name="price0" class="form-control" value="<?php echo ($info["price0"]); ?>">
            </div>
            <div class="form-group">
              <label>普通会员价(元)</label>
              <input type="number" name="price1" class="form-control" value="<?php echo ($info["price1"]); ?>">
            </div>
            <div class="form-group">
              <label>VIP会员价(元)</label>
              <input type="number" name="price2" class="form-control" value="<?php echo ($info["price2"]); ?>">
            </div>
        <div class='form-group'>
            <label>库存：</label>
            <input type='number' name='num' class='form-control' value='<?php echo ($info["num"]); ?>'>
          </div>
        <div class='form-group'>
              <label>面积：</label>
              <input type='text' name='size' class='form-control' value='<?php echo ($info["size"]); ?>'>
            </div>
          <div class='form-group'>
            <label>床型：</label>
            <input type='text' name='bedtype' class='form-control' value='<?php echo ($info["bedtype"]); ?>'>
          </div>
            <div class='form-group'>
            <label>床宽：</label>
            <input type='text' name='bedsize' class='form-control' value='<?php echo ($info["bedsize"]); ?>'>
          </div>
          <div class="form-group">
              <label>窗户</label>
              <select name="window" class="form-control">
                <option value="1">有窗</option>
                <option value="0">无窗</option>
              </select>
          </div>
            <div class='form-group'>
            <label>所在楼层：</label>
            <input type='text' name='floor' class='form-control' value='<?php echo ($info["floor"]); ?>'>
          </div>
         <div class='form-group'>
            <label>入住人数说明：</label>
            <input type='text' name='people' class='form-control' value='<?php echo ($info["people"]); ?>'>
          </div>
          <div class='form-group'>
            <label>上网方式说明：</label>
            <input type='text' name='internet' class='form-control' value='<?php echo ($info["internet"]); ?>'>
          </div>

        <div class='form-group'>
            <label>抽烟说明：</label>
            <input type='text' name='smoke' class='form-control' value='<?php echo ($info["smoke"]); ?>'>
          </div>
        </form>
    </div><!-- /.box-body -->
    <div class="box-footer clearfix">
      <button type="button" onclick="SaveRoom();" class="btn btn-success pull-right saveroom">确定</button>
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
function SaveRoom(){
  $("#editor_id").val(editor.html());
  if(vr('title') == ''){
    alert('请填写房型名称!');
  }else if(vr('price0') == ''){
    alert("请填写门市价");
  }else if(vr('price1') == ''){
    alert("请填写普通会员价");
  }else if(vr('price2') == ''){
    alert("请填写管理员账号");
  }else{
    $(".saveroom").attr('disabled','true');
    loading2("操作中...");
    $.post(location.href,$("#form").serializeArray(),function(data){
        alert(data.msg);
        if (data.ret == 1) {
          location.href = "<?php echo U('HotelAdm/roomlist');?>";
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
  <?php if($info['window'] != ''): ?>$("select[name='window']").val(<?php echo ($info["window"]); ?>);<?php endif; ?>
 
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