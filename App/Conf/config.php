<?php
return array(
	//'配置项'=>'配置值'
	// 'DB_DSN' => 'mysql://root:root@localhost:3306/hotel',
	'DB_DSN' => 'mysql://hotel:binguo88884224@localhost:3306/hotel',
	'DB_PREFIX' => 'bingo_', // 数据库表前缀 
	'URL_MODEL'          => 2, //URL模式 请勿修改此项
	'URL_PATHINFO_DEPR'     =>  '-', //分隔符 请勿修改此项
	'URL_HTML_SUFFIX'           =>  '.html',
	'FILE_DIR' => 'Public/uploads/',
	'FILE_SIZE' => '3000000',
	'FILE_EXT' => 'jpg,png,gif,jpeg,bmp,txt,doc,xls,rar,zip',
	'LOAD_EXT_CONFIG' => 'site,mp', // 加载扩展配置文件
);
?>