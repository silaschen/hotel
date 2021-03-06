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
    
  <div class="box box-solid">
    <div class="box-header with-border">
      <h3 class="box-title"><?php echo ($title); ?></h3>
       <a href="<?php echo U('AreaAdm/hotellist');?>" class="btn btn-default pull-right">返回</a>
    </div><!-- /.box-header -->
    <div class="box-body">
      <form method="GET" action="<?php echo U('AreaAdm/roomlist');?>" id='search' style="margin-bottom:15px;">
      <input type="hidden" name="hid" value="<?php echo ($_GET['hid']); ?>">
      <div class="row">
             <div class="col-xs-4 col-md-3">
                  <select name="status" class="form-control">
                     <option value="2">全部</option>
                     <option value="1">正常</option>
                     <option value="3">禁用</option>
                  </select>
              </div>

        <div class="col-xs-8 col-md-3">
          <div class="input-group">
            <input name="word" type='text' class='form-control' value="<?php echo I('word');?>" placeholder='名称/关键词搜索..'>
            <span class="input-group-addon" onclick="$('#search').submit();"><i class="fa fa-search"></i></span>
            <?php if($_GET['word'] != '' OR $_GET['id'] != '' OR $_GET['status'] != ''): ?><a title='清除条件' class="input-group-addon" href="<?php echo U('AreaAdm/roomlist',array('hid'=>I('hid')));?>"><i class="fa fa-remove"></i></a><?php endif; ?>
          </div>
        </div>
      </div>
      </form>
      <table class="table table-bordered">
        <thead>
          <th>ID</th>
          <th>封面</th>
          <th>房型名称</th>
          <th>市场价(元)</th>
          <th>普通会员价(元)</th>
          <th>VIP价(元)</th>
          <th>库存</th>
          <th>累计预订</th>
          <th>添加时间</th>
          <th>状态</th>
          <th>操作</th>
        </thead>
        <tbody>
      <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
          <td><?php echo ($vo["id"]); ?></td>
          <td><?php if($vo["cover"] != ''): ?><img onclick="ShowPic('<?php echo ($vo['cover']); ?>')" src="<?php echo ($vo["cover"]); ?>" class="img-responsive" height="40" width="40"><?php endif; ?></td>
          <td><?php echo ($vo["title"]); ?></td>
          <td><?php echo ($vo["price0"]); ?></td>
          <td><?php echo ($vo["price1"]); ?></td>
          <td><?php echo ($vo["price2"]); ?></td>
          <td><span class="badge bg-blue"><?php echo ($vo["num"]); ?></span></td>
          <td>2</td>
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
                <li><a href="javascript:RoomInfo(<?php echo ($vo["id"]); ?>)">详情</a></li>
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
//查看房型详情 if need
function RoomInfo(id){
    loading2("loading...");
  $.get(location.href,{"id":id},function(data){
      if (data.ret == 1) {
        var str = "";
        str = "<table class='table table-bordered'><tbody><tr><td>店铺名称</td><td>"+data.shop.name+"</td><td>联系人</td><td>"+data.shop.contact+"</td></tr><tr><td>累计收入</td><td><span class='label label-info'>"+data.shop.total+"</span></td><td>联系电话</td><td>"+data.shop.tel+"</td></tr><tr><td>地址</td><td colspan='3'>"+data.shop.adr+"</td></tr></tbody></table>";
        $(".con-modal").html(str);
        loading2("",0);
        $("#cover").modal('show');

      }
  },'JSON');
} 
function ShowPic(src){
  if (src != '') {
      $(".con-modal").html("<img class='img-responsive' src='"+src+"'>");
    $("#cover").modal('show');
  }
}
function setstat(id,t){
  if (t == 1) {
    var w = confirm("是否启用该房型?");
  }else if(t == 0){
    var w = confirm("是否禁用该房型?");
  }else{
    w = confirm("是否删除该房型?");
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
  <?php if($_GET['status'] != ''): ?>$("select[name='status']").val(<?php echo ($_GET['status']); ?>);<?php endif; ?>
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