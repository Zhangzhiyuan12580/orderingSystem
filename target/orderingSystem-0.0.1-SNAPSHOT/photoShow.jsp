<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜品展示</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/global.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.11.3.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/main.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/TouchSlide.1.1.js" ></script>
<script type="text/javascript">
	TouchSlide({ 
		slideCell:"#slideBox", 
		titCell:".hd li",
		mainCell:".bd ul",
		effect:"leftLoop"
	   //autoPlay:true//自动播放
	});
	TouchSlide({ 
		slideCell:"#news_slide",
		mainCell:".bd ul",
		effect:"leftLoop",
		autoPlay:true//自动播放
	});
</script>
</head>
	<body class="bg01">
		<div class="mobile_header hidden-md hidden-lg">
			<a href="index.html" class="logo">
				<img src="upload/logo.png"/>
			</a>
			<span class="menu_icon"></span>
			<ul class="menu">
				<li class="on"><a href="index.html">首页</a></li>
	        	<li><a href="">热菜1</a></li>
	        	<li><a href="">热菜2</a></li>
	        	<li><a href="">热菜3</a></li>
	        	<li><a href="">热菜4</a></li>
	        	<li><a href="">热菜5</a></li>
	        	
			</ul>
		</div>
		<div class="header hidden-xs hidden-sm clearfix">
			<div class="container">				
				<!-- <a href="index.html" class="logo">
					<img src="upload/logo.png"/>
				</a> -->
				<div class="nav">
			    	<ul>
			        	<li class="on"><a href="index.html">首页</a></li>
			        	<li><a href="">热菜1</a></li>
			        	<li><a href="">热菜2</a></li>
			        	<li><a href="">热菜3</a></li>
			        	<li><a href="">热菜4</a></li>
			        	<li><a href="">热菜5</a></li>
			        	
			      	</ul>
			    </div>
			</div>
		</div>
	
		<div class="index_section sec02">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 text-center">
						<img class="adv_img img-circle" src="upload/pic03-1.jpg"/>
						<p class="adv_tit">热销菜品1</p>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 text-center">
						<img class="adv_img img-circle" src="upload/pic04-1.jpg"/>
						<p class="adv_tit">热销菜品2</p>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 text-center">
						<img class="adv_img img-circle" src="upload/pic05-1.jpg"/>
						<p class="adv_tit">热销菜品3</p>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 text-center">
						<img class="adv_img img-circle" src="upload/pic06-1.jpg"/>
						<p class="adv_tit">热销菜品4</p>
					</div>
				</div>
			</div>
		</div>
		<div class="index_section sec03">
			<div class="container">
				<div class="row index_section_hd text-center">
					展示列表
				</div>
				<div class="row">					
					<ul class="product_list">
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-1.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品一</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-2.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品二</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-3.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品三</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-4.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品四</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-5.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品五</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-6.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品六</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-7.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品七</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-8.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品八</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-9.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品九</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-10.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品十</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-11.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品十一</a>
						</li>
						<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
							<a class="pro_pic" href="#">
								<img src="upload/pic02-12.jpg"/>
							</a>
							<a href="#" class="pro_tit">热销菜品十二</a>
						</li>
					</ul>
				</div>
			</div>
		</div>	
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="footer_ewm col-lg-3 col-md-3 col-sm-3 hidden-xs">
							<img src="upload/code.png"/>
						</div>
						<ul class="footer_contact col-lg-9 col-md-9 col-sm-9 hidden-xs">
							<li>电话：<i>111111111</i></li>
							<li>服务时间：周一到周日早8:00到晚5:00</li>
							<li>邮箱：xxx@163.com</li>
							<li>地址：苏大</li>
						</ul>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<ul class="footer_nav hidden-xs">
							<li><a href="#">关于我们</a></li>
						</ul>
						<p class="copyr">
							<a href="http://www.miitbeian.gov.cn">
								Copyright © 版权所有苏大毕设 
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>