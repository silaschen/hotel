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
<link rel="stylesheet" href="Public/com/AdminLTE/css/skins/skin-blue.css">
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
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <!-- Main Header -->
<header class="main-header">

  <!-- Logo -->
  <a href="#" target='_blank' class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><i class='fa fa-television'></i></span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><i class='fa fa-television'></i> <?php echo APP_NAME;?></span>
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
            <span class="hidden-xs"><?php echo $_SESSION['sys_user'];?></span>
          </a>
          <ul class="dropdown-menu">
            <!-- The user image in the menu -->
            <li class="user-header">
              <img src="Public/res/admin.png" class="img-circle" alt="User Image">
              <p>
                <?php echo $_SESSION['sys_user'];?>
                <small>上次登录：<?php echo cookie('lastlogin');?></small>
              </p>
            </li>
      
            <!-- Menu Footer-->
            <li class="user-footer">
              <div class="pull-left">
                <a href="<?php echo U('Sys/profile');?>" class="btn btn-default btn-flat">修改密码</a>
              </div>
              <div class="pull-right">
                <a href="<?php echo U('Sys/logout');?>" onclick="return confirm('确定退出登录？');" class="btn btn-default btn-flat">退出系统</a>
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
      <li><a href="<?php echo U('Sys/index');?>"><i class="fa fa-bar-chart"></i> <span>管理概况</span></a></li>
      <li class="treeview">
      <a href="#"><i class="fa fa-clone"></i> <span>酒店管理</span><i class="fa fa-angle-left pull-right"></i></a>
      <ul class="treeview-menu">
          <li><a href="<?php echo U('HotelSys/hotellist');?>">酒店列表</a></li>
        </ul>
      </li>
      <li><a href="<?php echo U('HotelSys/userlist');?>"><i class="fa fa-user"></i>会员管理</a></li>

      <li class="treeview">
      <a href="#"><i class="fa fa-database"></i> <span>财务管理</span><i class="fa fa-angle-left pull-right"></i></a>
      <ul class="treeview-menu">
          <li><a href="<?php echo U('HotelSys/hotellist');?>">酒店列表</a></li>
          <li><a href="<?php echo U('Sys/artcategory');?>">分类管理</a></li>
        </ul>
      </li>

      <li class="treeview">
      <a href="#"><i class="fa fa-file-word-o"></i> <span>文章管理</span><i class="fa fa-angle-left pull-right"></i></a>
      <ul class="treeview-menu">
          <li><a href="<?php echo U('Sys/artlist');?>">文章列表</a></li>
          <li><a href="<?php echo U('Sys/artcategory');?>">分类管理</a></li>
        </ul>
      </li>
      <li class="treeview">
        <a href="#"><i class="fa fa-cog"></i> <span>系统设置</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="<?php echo U('HotelSys/AreaUserList');?>">地区账号</a></li>
          <li><a href="<?php echo U('Mate/text');?>">微信素材</a></li>
          <li><a href="<?php echo U('Cmd/text');?>">回复规则</a></li>
          <li><a href="<?php echo U('ModMenu/edit');?>">微信菜单</a></li>
          <li><a href="<?php echo U('Sys/site');?>">站点设置</a></li>
          <li><a href="<?php echo U('Sys/advs');?>">轮播广告</a></li>
          <li><a href="<?php echo U('Sys/vendor');?>">微信配置</a></li>
          <li><a href="<?php echo U('Sys/group');?>">权限控制</a></li>
          <li><a href="<?php echo U('Sys/admin');?>">系统管理员</a></li>
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
    
  <div class="box box-solid">
    <div class="box-header with-border">
      <h3 class="box-title">添加/编辑地区管理账号</h3><a href="<?php echo U('HotelSys/AreaUserList');?>" class='btn btn-default btn-xs pull-right'>返回列表</a>
    </div><!-- /.box-header -->
    <div class="box-body">
         <form method="POST" id="form">
          <input name='id' class='hide' value='<?php echo ($info["id"]); ?>'>
              <div class="row">
            <div class="col-xs-4 col-md-6">
              <select name='a1' class='form-control' onchange="GetArea('a1','a2',true);">
              </select>
            </div>
            <div class="col-xs-4 col-md-6" style="padding:0 5px;">
              <select name='a2' class='form-control' onchange="GetArea('a2','a3',true);"></select>
            </div>
         </div>
   
            <div class="form-group">
              <label>管理员账号</label>
              <input type="text" name="user" class="form-control" value="<?php echo ($info["user"]); ?>">
            </div>
             <div class="form-group">
              <label>管理员密码</label>
              <input type="password" name="pwd" class="form-control" placeholder="留空默认为原密码">
            </div>
         </form>
    </div><!-- /.box-body -->
    <div class="box-footer clearfix">
      <button type="button" onclick="SaveAreaUser();" class="btn btn-success pull-right saveuser">确定</button>
    </div>   
  </div>
<script type="text/javascript">
function SaveAreaUser(){
  if(vr('user') == ''){
    alert('请填写管理员账号!');
  }else if(vr('a1') == ''){
    alert("请选择省份");
  }else if(vr('a2') == ''){
    alert("请选择城市");
  }else{
    $(".saveuser").addClass('disabled');
    loading2("操作中...");
    $.post(location.href,$("#form").serializeArray(),function(data){
        alert(data.msg);
        if (data.ret == 1) {
          location.href = "<?php echo U('HotelSys/AreaUserList');?>";
        }else{
          loading2("",0);
        }
    },'JSON');
  }
}
</script>
<script type="text/javascript" src="Public/com/area.js"></script>
<script type="text/javascript">
$(function(){
  AreaInit(true);//初始化地区
  <?php if($info['a1'] != ''): ?>$("select[name='a1']").val(<?php echo ($info['a1']); ?>);
  GetArea('a1','a2',true);<?php endif; ?>
  <?php if($info['a2'] != ''): ?>$("select[name='a2']").val(<?php echo ($info['a2']); ?>);
  GetArea('a2','a3',true);<?php endif; ?>
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
<div id="mask"><div class='loading'></div></div>
</body>
</html>