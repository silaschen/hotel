<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo ($title); ?></title>

        <!-- CSS -->
        <link rel="stylesheet" href="Public/com/AdminLTE/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="Public/res/form-elements.css">
        <link rel="stylesheet" href="Public/res/login.css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
	        <script src="//cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	        <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong><?php echo APP_NAME;?></strong>平台管理</h1>
                            <div class="description">
                            	<p> </p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>管理登录</h3>
                            		<p>输入管理员帐号密码:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="<?php echo U('Sys/login');?>" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="user">帐号</label>
			                        	<input type="text" name="user" placeholder="帐号..." class="form-username form-control" id="user">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="pwd">密码</label>
			                        	<input type="password" name="pwd" placeholder="密码..." class="form-password form-control" id="pwd">
			                        </div>
			                        <button type="submit" class="btn">Login</button>
			                    </form>

		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<p><a href="http://binguo.me/wx/" title='智慧成就梦想!' style='color:#ccc;font-size:12px;'>&copy; 宾果智造</a></p>
                        	<!-- <div class="social-login-buttons">
	                        	<a class="btn btn-link-1 btn-link-1-facebook" href="#">
	                        		<i class="fa fa-facebook"></i> Facebook
	                        	</a>
	                        	<a class="btn btn-link-1 btn-link-1-twitter" href="#">
	                        		<i class="fa fa-twitter"></i> Twitter
	                        	</a>
	                        	<a class="btn btn-link-1 btn-link-1-google-plus" href="#">
	                        		<i class="fa fa-google-plus"></i> Google Plus
	                        	</a>
                        	</div> -->
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="//cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
    	<script src="Public/com/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
        <script src="Public/res/jquery.backstretch.min.js"></script>        
<script type="text/javascript">
jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch("Public/res/admin-login.jpg");
    
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    
});
</script>
<!--[if lt IE 10]>
<script type="text/javascript">
$(document).ready(function(){
	$(".form-username").val("Username...");
	$(".form-password").val("Password...");
});
</script>
<![endif]-->
</body>
</html>