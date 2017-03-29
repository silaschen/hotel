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
      <h3 class="box-title"><?php echo ($title); ?></h3>
    </div><!-- /.box-header -->
    <div class="box-body">
       <form method="GET" action="<?php echo U('HotelSys/hotellist');?>" id='search' style="margin-bottom:15px;">
      <div class="row">
      <div class="col-xs-4 col-md-3">
          <select class="form-control" name="status">
              <option value="3">全部</option>
              <option value="1">正常</option>
              <option value="2">禁用</option>
          </select>
      </div>
       <div class="col-xs-4 col-md-2">
          <select name='a1' class='form-control' onchange="GetArea('a1','a2',true);">
          </select>
        </div>
        <div class="col-xs-4 col-md-2">
          <select name='a2' class='form-control' onchange="GetArea('a2','a3',true);"></select>
        </div>
        <div class="col-xs-4 col-md-2">
          <select name='a3' class='form-control'></select>
        </div>
        <div class="col-xs-8 col-md-3">
          <div class="input-group">
            <input name="word" type='text' class='form-control' value="<?php echo I('word');?>" placeholder='酒店名称/关键词搜索..'>
            <span class="input-group-addon" onclick="$('#search').submit();"><i class="fa fa-search"></i></span>
            <?php if($_GET['word'] != '' OR $_GET['status'] != '' OR $_GET['a1'] > '0' OR $_GET['a2'] > '0' OR $_GET['a3'] > '0' OR $_GET['id'] != ''): ?><a title='清除条件' class="input-group-addon" href="<?php echo U('HotelSys/hotellist');?>"><i class="fa fa-remove"></i></a><?php endif; ?>
          </div>
        </div>
      </div>
      </form>
      <table class="table table-bordered">
        <thead>
          <th>ID</th>
          <th>封面</th>
          <th>酒店名称</th>
          <th>联系人</th>
          <th>联系电话</th>
          <th>账号</th>
          <th>房型</th>
          <th>账户余额(元)</th>
          <th>累计收入(元)</th>
          <th>添加时间</th>
          <th>状态</th>
          <th>操作</th>
        </thead>
        <tbody>
      <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
          <td><?php echo ($vo["id"]); ?></td>
          <td><?php if($vo["cover"] != ''): ?><img onclick="ShowPic('<?php echo ($vo['cover']); ?>')" src="<?php echo ($vo["cover"]); ?>" class="img-responsive" height="40" width="40"><?php endif; ?></td>
        
          <td><?php echo ($vo["title"]); ?></td>
          <td><?php echo ($vo["contact"]); ?></td>
          <td><?php echo ($vo["mobile"]); ?></td>
          <td><?php echo ($vo["user"]); ?></td>
          <td><a href="<?php echo U('HotelSys/roomlist',array('hid'=>$vo['id']));?>" class="badge bg-blue"><?php echo ($vo["roomnum"]); ?></a></td>
          <td><?php echo ($vo["money"]); ?></td>
          <td><?php echo ($vo["total"]); ?></td>
          <td><?php echo (date('Y-m-d H:i:s',$vo["addtime"])); ?></td>
          <td><?php if($vo["status"] == '0'): ?><small class="badge bg-red">禁用</small><?php elseif($vo["status"] == '1'): ?><small class="badge bg-green">正常</small><?php endif; ?></td>
          <td>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown">
                管理
                <span class="caret"></span>
                <span class="sr-only">+</span>
              </button>
              <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:loadpage('<?php echo U('HotelSys/HotelDetail',array('id'=>$vo['id']));?>')">详情</a></li>
                <li><a href="<?php echo U('HotelSys/addhotel',array('id'=>$vo['id']));?>">修改</a></li>
                <li class="divider"></li>
                <?php if($vo["status"] == '1'): ?><li><a href="javascript:setstat(<?php echo ($vo["id"]); ?>,0);">禁用</a></li><?php else: ?>
                <li><a href="javascript:setstat(<?php echo ($vo["id"]); ?>,1)">启用</a></li><?php endif; ?>
                <?php if($vo["status"] != '-1'): ?><li><a href="javascript:setstat(<?php echo ($vo["id"]); ?>,-1);">删除</a></li><?php endif; ?>
              </ul>
            </div>
          </td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
      </table>
    </div><!-- /.box-body -->
    <div class="box-footer clearfix">
      <ul class="pagination pagination-sm no-margin pull-left"><?php echo ($page); ?></ul>
      <a href="<?php echo U('HotelSys/addhotel');?>" class="btn btn-success pull-right">添加酒店</a>
    </div> 
  </div>
<!--   图片 -->
<div class="modal fade" id="cover" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
         <b>图片详情</b>
      </div>
      <div class="modal-body con-modal">
       <img src="" class="shoppic">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
      
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="Public/com/area.js"></script>
<script type="text/javascript">
function ShowPic(src){
  if (src != '') {
      $(".con-modal").html("<img class='img-responsive' src='"+src+"'>");
    $("#cover").modal('show');
  }
}
function setstat(id,t){
  if (t == 1) {
    var w = confirm("是否启用该酒店?");
  }else if(t == 0){
    var w = confirm("是否禁用该酒店?");
  }else{
    w = confirm("是否删除该酒店?");
  }
  if(w == true){
      loading2("操作中");
    $.post(location.href,{"id":id,"t":t},function(data){
          alert(data.msg);
          if (data.ret == 1) {
            location.reload();
          }else{
             loading2("",0);
          }
    },'JSON');
  }
}
$(function(){
    // $("select[name='status']").val(<?php echo ($_GET['status']); ?>);
  AreaInit(true);
<?php if($_GET['a1'] > '0'): ?>$("select[name='a1']").val(<?php echo I('a1');?>);
GetArea('a1','a2',true);<?php endif; ?>
<?php if($_GET['a2'] > '0'): ?>$("select[name='a2']").val(<?php echo I('a2');?>);
GetArea('a2','a3',true);<?php endif; ?>
<?php if($_GET['a3'] > '0'): ?>$("select[name='a3']").val(<?php echo I('a3');?>);<?php endif; ?>
 <?php if($_GET['status'] != '0'): ?>$("select[name='status']").val(<?php echo ($_GET['status']); ?>);<?php endif; ?>
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