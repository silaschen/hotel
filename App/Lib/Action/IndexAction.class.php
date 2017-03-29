<?php
class IndexAction extends CommonAction {
	#站点主页#
    public function index(){
		$this->title = C('SITE_NAME');
		$this->eq = 0;
		// 读取轮播图
		$imgs = M('sys_advs')->where(array('status'=>1,'type'=>1))->field('id,pic,url')->select();
		$this->assign('img',$imgs);
		$this->display();
    }

    #文章列表#
    public function artlist(){
    	$this->eq = 0;
    	$id = I('id');
    	$info = M('art_category')->where(array('id'=>$id,'status'=>1))->find();
		if(!$info) alert('该分类不存在！',U('Index/index'));
		$this->title = $info['title'];
    	$page = I('p');
    	$word = I('word');
		if($page == '') $page = 1;
		//读取文章
		$model = M('art_list');
		$map = array();
		if($word) $map['title'] = array('like','%'.$word.'%');
		$map['status'] = 1; //显示状态 
		import('@.ORG.Util.Page');// 导入分页类
		$list = $model->where($map)->order('addtime desc')->page($page.',10')->select();
		$this->assign('list',$list);// 赋值数据集
		$count	= $model->where($map)->count();// 查询满足要求的总记录数
		$page 	= new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数
		$page->setConfig('theme','%upPage%  %linkPage%  %downPage%');
		$page->rollPage = 3 ;
		$show	= $page->show();// 分页显示输出
		$this->assign('page',$show);// 赋值分页输出
		//分页跳转的时候保证查询条件
		foreach($map as $key=>$val) {
			$page->parameter   .=   "$key=".urlencode($val).'&';
		}
		if($info['tmp']){
			$this->display($info['tmp']);
		}else{
    		$this->display();
    	}
    }

    #阅读文章内容#
    public function artinfo(){
    	if(IS_GET){
	    	$this->eq = 0;
	    	$id = I('id');
	    	M('art_list')->where(array('id'=>$id,'status'=>1))->setInc('views',1); //浏览量+1
	    	$info = M('art_list')->where(array('id'=>$id,'status'=>1))->find();
	    	$this->title = $info['title'];
	    	$this->assign('info',$info);
	    	if($info['tmp']){
				$this->display($info['tmp']);
			}else{
	    		$this->display();
	    	}
	    }
	}
}