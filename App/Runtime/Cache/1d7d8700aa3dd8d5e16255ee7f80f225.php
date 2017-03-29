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
    
  <div class="box box-warning">
    <div class="box-header with-border">
      <h3 class="box-title">修改密码</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
      <form role="form" id='form' action="<?php echo U('CheckAdm/profile');?>" method="POST">
        <div class="form-group">
          <label>当前密码</label>
          <input type="password" name='old' class="form-control" placeholder="">
        </div>
       	<div class="form-group">
          <label>新密码</label>
          <input type="password" name='pwd' class="form-control" placeholder="">
        </div>
        <div class="form-group">
          <label>确认新密码</label>
          <input type="password" name='rpwd' class="form-control" placeholder="">
        </div>
      </form>
    </div><!-- /.box-body -->
    <div class="box-footer">
	    <button type="button" onclick="savechange();" class="btn btn-success pull-right">确定修改</button>
	  </div>
  </div>
<script type="text/javascript">
function savechange(){
	if(vr('old') == ''){
		alert('请输入当前密码!');
	}else if(vr('pwd') == ''){
		alert('请输入新密码!');
	}else if(vr('pwd') != vr('rpwd')){
		alert('两次输入的密码不一致!');
	}else{
		$("#form").submit();
	}
}
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