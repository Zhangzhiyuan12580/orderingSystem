<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script>
	$(function() {
		changeFrameHeight();
		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
			var itmeObj = $(".meun-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});
			var attrObj = $(this).find("img").attr("src");;
			attrObj = attrObj.replace("_grey.png", ".png");
			$(this).find("img").attr("src", attrObj);
		});
		$("#topAD").click(function() {
			$("#topA").toggleClass(" glyphicon-triangle-right");
			$("#topA").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topBD").click(function() {
			$("#topB").toggleClass(" glyphicon-triangle-right");
			$("#topB").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topCD").click(function() {
			$("#topC").toggleClass(" glyphicon-triangle-right");
			$("#topC").toggleClass(" glyphicon-triangle-bottom");
		});
		$(".toggle-btn").click(function() {
			$("#leftMeun").toggleClass("show");
			$("#rightContent").toggleClass("pd0px");
		});
	})
	
	window.onresize = function(){
		changeFrameHeight();
	}
	
	function changeFrameHeight(){
		var ifm = $("#myframe");
		ifm.height=$(document).height();
	}
	
	function toURL(url) {
		$("#myframe").attr("src", url);
	}
</script>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css" />
</head>
<body>
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP"><img id="logo" alt="我的主页" src="<%=request.getContextPath() %>/images/logo.png"><span>我的主页</span></p>
			</div>
			<div id="personInfor">
				<p id="userName"> ${user.username}</p>
				<p><span>${user.email}</span></p>
				<p>
					<a href="<%=request.getContextPath() %>/index.jsp">退出登录</a><br><br>
					<a href="<%=request.getContextPath() %>/myTimer/startTimer.do">开始接单</a>
				</p>
			</div>
			<div class="meun-title">后台管理</div>
			<div class="meun-item meun-item-active" href="#sour" aria-controls="sour" role="tab" data-toggle="tab"
				onClick="toURL('<%=request.getContextPath() %>/orderInfo/pageList.do')">
			<img src="<%=request.getContextPath() %>/images/icon_source.png">订单管理</div>
			<div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"
				onClick="toURL('<%=request.getContextPath() %>/userManagement/pageList.do')">
			<img src="<%=request.getContextPath() %>/images/icon_chara_grey.png">用户管理</div>
			<div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab"
				onClick="toURL('<%=request.getContextPath() %>/foodInfo/pageList.do')">
			<img src="<%=request.getContextPath() %>/images/icon_user_grey.png">菜品管理</div>
			<div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab"
				onClick="toURL('<%=request.getContextPath() %>/foodClass/pageList.do')">
			<img src="<%=request.getContextPath() %>/images/icon_user_grey.png">菜品种类管理</div>
		</div>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<iframe id="myframe" width="100%" height="740px;" src=""></iframe>
		</div>
	</div>
</body>
</html>