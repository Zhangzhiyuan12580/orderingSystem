<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.1.1.min.js" ></script>
<link href="<%=request.getContextPath() %>/css/index.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		
	})
	
	var myclick = function(v) {  
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
</script>
</head>
<body>
	<div class="warp_meeu">
		<div class="header">
			<div class="logo">
        		<a href="/"><img src="<%=request.getContextPath() %>/images/logo.jpg" height="165" width="317"></a>
        	</div>
        	<div class="header_top">
        		<span>
        			<a href="<%=request.getContextPath() %>/login.jsp">[注册][登录]</a>
        			<a href="<%=request.getContextPath() %>/homePage.jsp">进入后台管理</a>
        		</span>
        	</div>
        	<div class="nav_mian" id="nav">
        		<ul id="nav_mian">
        			<li id="tab1" onclick="myclick(1)" style="background-color: orange">
        				<a href="<%=request.getContextPath() %>/foodInfo/findAllFoodInfo.do">首页</a>
        			</li>
        			
        			<li id="tab2" onclick="myclick(2)">
        				<a href="#content">美味菜单</a>
        			</li>
        			
        			<li id="tab3" onclick="myclick(3)">
        				<a href="#">新闻中心</a>	
        			</li>
        			<li id="tab4" onclick="myclick(4)">
        				<a href="#">关于我们</a>	
        			</li>
        			<li id="tab5" onclick="myclick(5)">
        				<a href="#">诚聘英才</a>
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
				<iframe src=""></iframe>
			</div>
			<%-- <div class="content" id="tab2_content" >
				<div class="side_nav" style="float:left;">
					<ul id="bar">
						<li id="bar1" onclick="myclickBar(1)" style="background-color: red"><a href="#" class="hover">新品体验</a></li>
						<c:forEach items="${foodClassList}" var="foodClass">
							<li id="${foodClass.id}" onclick="myclickBar('${foodClass.id}')">
								<a href="<%=request.getContextPath() %>/foodInfo/findFoodInfoBySearchFilter.do?foodClassId=${foodClass.id}">  ${foodClass.className }  </a>
							</li>
							<input type="hidden" value="${foodClass.id}"/>
						</c:forEach>
					</ul>
				</div>
				<div class="meeu_mian" style="float:left;width:746px;">
					<div id="container" style="position: relative; height: 227px;" class="masonry">
						<c:forEach items="${foodInfoList}" var="foodInfo">
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
							
						</c:forEach>
 
					</div>
					<div class="clear"></div>
				</div>
				
			</div> --%>
			<div class="content" id="tab3_content" >
				<div class="meeu_mian">
					<span style="color: #F30D11">新闻中心</span>
				</div>
			</div>
			<div class="content" id="tab4_content" >
				<div class="meeu_mian">
					<span style="color: #F30D11">关于我们</span>
				</div>
			</div>
			<div class="content" id="tab5_content" >
				<div class="meeu_mian">
					<span style="color: #F30D11">诚聘英才</span>
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
</body>
</html>