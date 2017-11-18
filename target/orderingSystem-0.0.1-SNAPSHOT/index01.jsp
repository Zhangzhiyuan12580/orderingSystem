<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.min.css" />

<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<!-- 引入layer插件 -->
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/layer.js"></script>
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/laydate/laydate.js"></script>

<link href="<%=request.getContextPath() %>/css/index.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		if('${user.username}' == null || '${user.username}' == '') {
			$('#loginOrRegister').show();
			$('#loginUser').hide();
			$('#goToHome').hide();
			$('#historyPage').hide();
			$('#exitLogin').hide();
		} else {
			if('${user.username}' == 'admin') {
				$('#loginOrRegister').hide();
				$('#loginUser').show();
				$('#goToHome').show();
				$('#historyPage').hide();
				$('#exitLogin').show();
			} else {
				$('#loginOrRegister').hide();
				$('#loginUser').show();
				$('#goToHome').hide();
				$('#historyPage').show();
				$('#exitLogin').show();
			}
		}
		searchAllFoodInfo();
	})
	
	var myclick = function(v) {
		if(v == 2 && '${user.username}' != null && '${user.username}' != '') {
			$("#myShop").show();
			loadShoppingCart();
		} else {
			$("#myShop").hide();
		}
		var ul = document.getElementById("nav_mian"); 
		var llis = ul.getElementsByTagName("li");
		
		for(var i = 0; i < llis.length; i++) {  
			var lli = llis[i];  
			if(lli == document.getElementById("tab" + v)) {  
				lli.style.backgroundColor = "orange";  
			} else {  
				lli.style.backgroundColor = "";  
			}  
		}  
	
		var divs = document.getElementsByClassName("content");  
		for(var i = 0; i < divs.length; i++) {  
	
			var divv = divs[i];  
	
			if(divv == document.getElementById("tab" + v + "_content")) {  
				divv.style.display = "block";  
			} else {  
				divv.style.display = "none";  
			}  
		}  
	
	} 
	
	var myclickBar = function(v){
		var ul = document.getElementById("bar"); 
		var llis = ul.getElementsByTagName("li");
		for(var i = 0; i < llis.length; i++) {  
			var lli = llis[i]; 
			
			if(lli == document.getElementById(v)) {
				lli.style.backgroundColor = "red";  
			} else {  
				lli.style.backgroundColor = "";  
			}  
		}
	}
	
	function showFoodInformation(information, id) {
		layer.tips(information, '#'+id, {
			  tips: [1, '#78BA32']
			});
	}
	
	function searchFoodInfo(id) {
		
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: "<%=request.getContextPath() %>/foodInfo/findFoodInfoBySearchFilter.do?foodClassId=" + id,
			success: function(data) {
				var vhtml = '';
				if(null != data || "" != data) {
					for(var i=0; i<data.length; i++) {
						vhtml += "<div class='item masonry-brick' style='width: 234px; height: 227px;'>";
						vhtml += "<dl><dt><a href='#'>";
						vhtml += "<img id='";
						vhtml += data[i].id;
						vhtml += "' onmousemove=\"showFoodInformation('";
						vhtml += data[i].information;
						vhtml += "', '";
						vhtml += data[i].id;
						vhtml += "');\" src=";
						vhtml += "'";
						vhtml += "<%=request.getContextPath() %>";
						vhtml += "/";
						vhtml += data[i].photoPath;
						vhtml += "'";
						vhtml += " width='230' height='172.5px'>";
						vhtml += "</a></dt><dd class='radius_5_hb'><a href='#'>";
						vhtml += data[i].name;
						vhtml += "&nbsp;￥：";
						vhtml += data[i].price;
						vhtml += "&nbsp;<button style='color: red; background-color: yellow;' onclick=\"addToShoppingCart('";
						vhtml += data[i].id;
						vhtml += "');\">添加</button>";
						vhtml += "</a></dd></dl></div>";
					}
					$("#tab2").click();
					$("#" + id).click();
					$("#container").html(vhtml);
				}
			}
		});
	}
	
	function searchAllFoodInfo() {
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: "<%=request.getContextPath() %>/foodInfo/findAll.do",
			success: function(data) {
				var vhtml = '';
				if(null != data || "" != data) {
					for(var i=0; i<data.length; i++) {
						vhtml += "<div class='item masonry-brick' style='width: 234px; height: 227px;'>";
						vhtml += "<dl><dt><a href='#'>";
						vhtml += "<img id='";
						vhtml += data[i].id;
						vhtml += "' onmousemove=\"showFoodInformation('";
						vhtml += data[i].information;
						vhtml += "', '";
						vhtml += data[i].id;
						vhtml += "');\" src=";
						vhtml += "'";
						vhtml += "<%=request.getContextPath() %>";
						vhtml += "/";
						vhtml += data[i].photoPath;
						vhtml += "'";
						vhtml += " width='230' height='172.5px'>";
						vhtml += "</a></dt><dd class='radius_5_hb'><a href='#'>";
						vhtml += data[i].name;
						vhtml += "&nbsp;￥：";
						vhtml += data[i].price;
						vhtml += "&nbsp;<button style='color: red; background-color: yellow;' onclick=\"addToShoppingCart('";
						vhtml += data[i].id;
						vhtml += "');\">添加</button>";
						vhtml += "</a></dd></dl></div>";
					}
					$("#container").html(vhtml);
				}
			}
		});
	}
	
	//购物车功能实现
	function loadShoppingCart() {
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: '<%=request.getContextPath() %>/orderDetailInfo/loadShoppingCart.do',
			data: {
				"userId": '${user.id}'
			},
			success: function(data) {
				var vhtml = '';
				var totalPrice = 0;
				if(null != data || "" != data) {
					for(var i=0; i<data.length; i++) {
						vhtml += "<div class='tableHeadernew'><div class='col-xs-new'>";
						vhtml += data[i].foodInfo.name;
						vhtml += "</div><div class='col-xs-new'>";
						vhtml += data[i].foodInfo.price;
						vhtml += "</div><div class='col-xs-new'>";
						vhtml += data[i].amount;
						vhtml += "</div><div class='col-xs-new'>";
						vhtml += data[i].foodInfo.price * data[i].amount;
						vhtml += "</div><div class='col-xs-new'>";
						vhtml += "<a href=\"javascript:deleteShoppingCart('";
						vhtml += data[i].foodInfo.id;
						vhtml += "');\">删除</a>";
						vhtml += "</div></div>";
						totalPrice += data[i].foodInfo.price * data[i].amount;
					}
					
					$("#myShopData").html(vhtml);
					$("#totalPrice").html(totalPrice);
					$("#price").val(totalPrice);
				}
			}
		});
	}
	//添加菜品到购物车
	function addToShoppingCart(foodInfoId) {
		if('${user.username}' == null || '${user.username}' == '') {
			layer.alert('请先登录！', {icon: 6});
		} else {
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '<%=request.getContextPath() %>/orderDetailInfo/save.do',
				data: {
					"userId": '${user.id}',
					"foodInfoId": foodInfoId
				},
				success: function(data) {
					if(data) {
						loadShoppingCart();
					}
				}
			});
		}
	}
	
	//删除购物车中的菜品
	function deleteShoppingCart(foodInfoId) {
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: '<%=request.getContextPath() %>/orderDetailInfo/delete.do',
			data: {
				"userId": '${user.id}',
				"foodInfoId": foodInfoId
			},
			success: function(data) {
				if(data) {
					loadShoppingCart();
				}
			}
		});
	}
	
	//提交订单
	function goToSubmit() {
		$('#addUser').modal();
	}
	
	//查看历史订单
	function goToHistory() {
		$("#historyForm").submit();
	}
</script>
</head>
<body>
	<div class="warp_meeu">
		<div class="header">
			<div class="logo">
        		<a href="/"><img src="<%=request.getContextPath() %>/images/logo.png" height="165" width="317"></a>
        	</div>
        	<div class="header_top">
        		<span>
        			<a href="<%=request.getContextPath() %>/login.jsp" id="loginOrRegister" style="display: none;">[注册][登录]</a>
        			<a id="loginUser" style="display: none;"> ${user.username}</a>
        			<a href="<%=request.getContextPath() %>/homePage.jsp" id="goToHome" style="display: none;">进入后台管理</a>
        			<a href="javascript:goToHistory();" id="historyPage" style="display: none;">查看历史订单</a>
        			<a href="<%=request.getContextPath() %>/index.jsp" id="exitLogin" style="display: none;">退出登录</a>
        		</span>
        	</div>
        	<form action="<%=request.getContextPath() %>/orderInfo/findOrderInfoByUser.do" id="historyForm">
        		<input type="hidden" id="userId" name="userId" value="${user.id}">
        	</form>
        	<div class="nav_mian" id="nav">
        		<ul id="nav_mian">
        			<li id="tab1" onclick="myclick(1)" style="background-color: orange">
        				<a href="#index01">首页</a>
        			</li>
        			
        			<li id="tab2" onclick="myclick(2)">
        				<a href="#content">美味菜单</a>
        			</li>
        			<li id="tab4" onclick="myclick(4)">
        				<a href="#">关于我们</a>	
        			</li>
        		
        		</ul>
        	</div>        	
		</div>
		<div>
		<div class="content" id="tab1_content" style="display: block">
			<div class="meeu_mian">
				<span style="color: #F30D11">特色推荐</span>
				<div>
					<img src="http://www.haidilao.com/uploadfile/2016/0513/20160513074910184.jpg" width="234">
					<img src="http://www.haidilao.com/uploadfile/2016/0513/20160513075436724.jpg" width="234">
					<img src="http://www.haidilao.com/uploadfile/2016/0513/20160513075557516.jpg" width="234">
				</div>
			</div>
		</div>
		<div class="content" id="tab2_content" >
			<div class="side_nav" style="float:left;">
				<ul id="bar">
					<li id="bar1" onclick="myclickBar(1)" style="background-color: red">
						<a href="javascript:searchAllFoodInfo();" class="hover">新品体验</a>
					</li>
					<c:forEach items="${foodClassList}" var="foodClass">
						<li id="${foodClass.id}" onclick="myclickBar('${foodClass.id}')">
							<a href="javascript:searchFoodInfo('${foodClass.id}');">  ${foodClass.className }  </a>
						</li>
						<input type="hidden" value="${foodClass.id}"/>
					</c:forEach>
				</ul>
			</div>
			<div class="meeu_mian" style="float:left;width:746px;">
				<div id="container" style="position: relative; height: 227px;" class="masonry">
					<%-- <c:forEach items="${foodInfoList}" var="foodInfo">
						<div class="item masonry-brick" style="width: 234px; height: 227px;">
							<dl>
								<dt>
									<a href="#">
										<img src="<%=request.getContextPath() %>/${foodInfo.photoPath}" width="230" height="172.5px">
									</a>
									<input type="hidden" id="${foodInfo.id}" value="${foodInfo.id}">
								</dt>
								
								<dd class="radius_5_hb">
									<a href="#">${foodInfo.name }&nbsp;￥：${foodInfo.price }&nbsp;
										<button style="color: red; background-color: yellow;">添加</button>
									</a>
								</dd>
							</dl>
						</div>
						
					</c:forEach> --%>

				</div>
			</div>
			<div class="shop_main">
			
			</div>
		</div>
			
			<div class="content" id="tab4_content" >
				<div class="meeu_mian">
					<span style="color: #F30D11">关于我们<br></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="<%=request.getContextPath() %>/images/suda.jpg" width="600px" height="400px">
					<span style="color: orange;"><br><br> 苏州大学坐落于素有“人间天堂”之称的古城苏州<br>是国家“211工程”重点建设高校、“2011计划”首批认定高校<br>国防科技工业局和江苏省人民政府共建高校<br>是江苏省属重点综合性大学。<br></span>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="content_bottombg"></div>
		<div class="footer_main">
			<p>© 2017 版权所有 XXXXXXX股份有限公司 京ICP备10218174号</p>
		</div>
	</div>
	<div class="shop_main" id="myShop">
		<div class="tableHeadernew" style="text-align: center;">购物车</div>
		<div class="tableHeadernew">
			<div class="col-xs-new ">
				名称
			</div>
			<div class="col-xs-new">
				单价
			</div>
			<div class="col-xs-new">
				数量
			</div>
			<div class="col-xs-new">
				总价
			</div>
			<div class="col-xs-new">
				操作
			</div>
		</div>
		<div id="myShopData">
		
		</div>
		<div class="tableHeadernew" style="text-align: center;">
			<div class="col-xs-new">
				总价：
			</div>
			<div class="col-xs-new" id='totalPrice'>
			</div>
			<div class="col-xs-new">
				-
			</div>
			<div class="col-xs-new">
				-
			</div>
			<div class="col-xs-new" onclick="goToSubmit();">
				提交订单
			</div>
		</div>
	</div>
	<!--用户管理模块-->
	<div role="tabpanel" class="tab-pane" id="user">
		<!--弹出添加用户窗口-->
		<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="gridSystemModalLabel">订单配送信息</h4>
					</div>
					<form class="form-horizontal" method="post" action="<%=request.getContextPath() %>/orderInfo/save.do">
					<div class="modal-body">
						<div class="container-fluid">
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">用户名：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi" name="username" id="username" value='${user.username }'>
										<input type="hidden" name="userId" id="userId" value='${user.id }'>
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">送货地址：</label>
									<div class="col-xs-6 ">
										<textarea class="form-control input-sm duiqi" id="address" name="address" ></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">联系电话：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi" name="phone">
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">总价格：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi" name="price" id="price">
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
							<button type="submit" class="btn btn-xs btn-green">提 交</button>
						</div>
					</form>
				</div>
						
				</div>
				
				<!-- /.modal-content -->
			</div>
		
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
</html>