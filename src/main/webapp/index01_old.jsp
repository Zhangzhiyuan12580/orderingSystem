<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
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
	$(function() {
		if('${user.username}' == null || '${user.username}' == '') {
			$('#login').show();
			$('#management').hide();
		} else {
			$('#login').hide();
			if('${user.username}' == 'admin') {
				$('#management').show();
			} else {
				$('#management').hide();
				$('#look').show();
			}
		}
	});
	
	<%-- function initFoodInformation() {
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: '<%=request.getContextPath() %>/foodInfo/findAllFoodInfo.do',
			success:function (data) {
				
			}
		});
	}; --%>
</script>
</head>
	<body class="bg01">
		<div class="header hidden-xs hidden-sm clearfix">
			<div class="container">				
				<a  class="logo">
					<a style="font-size: xx-large;">${user.username}祝您能用餐愉快！</a>
					<a id="management" style="float: right;" href="<%=request.getContextPath() %>/homePage.jsp">进入后台管理</a>
					<a id="login" style="float: right;" href="<%=request.getContextPath() %>/login.jsp">注册/登陆</a>
					<a id="look" style="float: right; display: none;" href="<%=request.getContextPath() %>/homePage.jsp">查看历史订单</a>
				</a>
				<div class="nav">
			    	<ul>
			        	<li class="on"><a href="index.jsp">首页</a></li>
			        	<c:forEach items="${foodClassList}" var="foodClass">
			        	 	<li><a href="">${foodClass.className}</a></li>
			        	</c:forEach>
			      	</ul>
			    </div>
			</div>
		</div>
	
		<div class="index_section sec02">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 text-center">
						<img class="adv_img img-circle" src="<%=request.getContextPath() %>/upload/pic03-1.jpg"/>
						<p class="adv_tit">热销菜品1</p>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 text-center">
						<img class="adv_img img-circle" src="<%=request.getContextPath() %>/upload/pic04-1.jpg"/>
						<p class="adv_tit">热销菜品2</p>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 text-center">
						<img class="adv_img img-circle" src="<%=request.getContextPath() %>/upload/pic05-1.jpg"/>
						<p class="adv_tit">热销菜品3</p>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 text-center">
						<img class="adv_img img-circle" src="<%=request.getContextPath() %>/upload/pic06-1.jpg"/>
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
						<c:forEach items="${foodInfoList}" var="foodInfo">
							<li class="pro_item col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<a class="pro_pic" href="#">
									<img src="<%=request.getContextPath() %>/${foodInfo.photoPath}"/>
								</a>
								<a href="#" class="pro_tit">${foodInfo.name }</a>
							</li>
						
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>	
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="footer_ewm col-lg-3 col-md-3 col-sm-3 hidden-xs">
							<img src="<%=request.getContextPath() %>upload/code.png"/>
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