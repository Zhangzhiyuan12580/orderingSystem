<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/slide.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.nouislider.css">

<script src="<%=request.getContextPath() %>/js/jquery.nouislider.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<!-- 引入layer插件 -->
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/layer.js"></script>
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/laydate/laydate.js"></script>
<script type="text/javascript">
	//修改数据
	function gotoUpdate(id){
		$.ajax({
			type: "post",
	        dataType: "json",
	        url: '<%=request.getContextPath() %>/userManagement/findById.do',
	        data: {"id":id},
	        success: function (data) {
	        	if(null!=data) {
					$("#updateId").val(id);
					$("#updateUsername").val(data.username);
					$("#password").val(data.password);
					$("#updatePhone").val(data.phone);
					$("#address").val(data.address);
					$("#updateEmail").val(data.email);
				}
	        }
		});
	};
	
	//删除数据
	function gotoDelete(id) {
		$("#deleteID").val(id);
	};

	$(function(){
		$(".col-xs-2").attr("style","text-align: center");
		var msg = '${msg}';
		if(''!=msg){
			layer.msg(msg);
		}
		initPageNumSelect();
	});
	
	function query(){
		$("#pageNum1").val($("#pageNum").val());
	};
	
	function searchByName(){
		$("#pageNum1").val($("#pageNum").val());
		$("#searchForm").submit();
	};
	
	function check(param, type) {
		switch(param) {
		case 'phone' : checkPhone(type);
			break;
		case 'email' : checkEmail(type);
			break;
		default :
			checkUsername(type);
		}
	};
	//手机号验证
	function checkPhone(type) {
		var phone = '';
		if(type == 'save') {
			phone = $("#savePhone").val();
		}
		if(type == 'update') {
			phone = $("#updatePhone").val();
		}
		 if(!(/^1[34578]\d{9}$/.test(phone))){
			 layer.msg("手机号码有误，请重填");
		 } 
	};
	//邮箱验证
	function checkEmail(type) {
		var email = '';
		if(type == 'save') {
			email = $("#saveEmail").val();
		}
		if(type == 'update') {
			email = $("#updateEmail").val();
		}
		if(!(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/).test(email)) {
			layer.msg("邮箱格式不正确，请重填");
		}
	};
	function checkUsername(types) {
		var id = '';
		var username = '';
		if(types == 'save') {
			username = $("#saveUsername").val();
			if(username == '' || username == null) {
				layer.msg("名称不能为空");
				return;
			}
		}
		if(types == 'update') {
			username = $("#updateUsername").val();
			id = $("#updateId").val();
			if(username == '' || username == null) {
				layer.msg("名称不能为空");
				return;
			}
		}
		$.ajax({
			type : 'post',
			dataType : 'json',
			url: '<%=request.getContextPath()%>/userManagement/checkForm.do',
			data : {
				'username' : username,
				'id' : id
			},
			success : function(data) {
				if(!data) {
					layer.msg("用户名重复，请重填");
				}
			}
		});
	};
	
	//初始化翻页下拉框
	function initPageNumSelect() {
		var vhtml = '';
		for(var i=1; i<='${page.pageCount}'; i++){
			if('${page.pageNum}' == i) {
				vhtml += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			} else {
				vhtml += "<option value='" + i + "'>" + i + "</option>";
			}
		}
		$("#pageNum").html(vhtml);
	};
</script>
</head>
<body>
<!--用户管理模块-->
<div role="tabpanel" class="tab-pane" id="user">
	<div class="check-div form-inline">
		<div class="col-xs-3">
			<button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加用户 </button>
		</div>
		<div class="col-xs-4">
		<form id="searchForm" action="<%=request.getContextPath()%>/userManagement/pageList.do" method="post">
			<input type="hidden" name="pageNum1" id="pageNum1" value=""/>
			<input type="text" class="form-control input-sm" placeholder="输入名称搜索" id="searchName" name="username" value="${user.username}">
			<button type="submit" class="btn btn-white btn-xs " onclick="query();">查询</button>
		</form>
		</div>
	</div>
	<div class="data-div">
		<div class="row tableHeader">
			<div class="col-xs-2 ">
				用户名
			</div>
			<div class="col-xs-2">
				手机号
			</div>
			<div class="col-xs-2">
				邮箱
			</div>
			<div class="col-xs-2">
				地址
			</div>
			<div class="col-xs-2">
				注册日期
			</div>
			<div class="col-xs-2">
				操作
			</div>
		</div>
		<div class="tablebody">
			<c:forEach items="${userList }" var="user" varStatus="index">
			
				<div class="row">
					<div class="col-xs-2">
						${user.username }
					</div>
					<div class="col-xs-2">
						${user.phone }
					</div>
					<div class="col-xs-2">
						${user.email }
					</div>
					<div class="col-xs-2">
						${user.address }
					</div>
					<div class="col-xs-2">
						${user.createTime }
					</div>
					<div class="col-xs-2">
						<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="gotoUpdate('${user.id}')">修改</button>
						<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="gotoDelete('${user.id}')">删除</button>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
	<!--页码块-->
	<footer class="footer">
		<ul class="pagination">
			<li>
				<select id="pageNum" onchange="searchByName();">
				</select>
				页
			</li>
			<li class="gray">
				共${page.pageCount}页
			</li>
		</ul>
	</footer>
	<!--弹出添加用户窗口-->
	<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
				</div>
				<form class="form-horizontal" method="post" action="<%=request.getContextPath() %>/userManagement/save.do">
				<div class="modal-body">
					<div class="container-fluid">
							<div class="form-group ">
								<label for="sName" class="col-xs-3 control-label">用户名：</label>
								<div class="col-xs-8 ">
									<input type="text" class="form-control input-sm duiqi" name="username" id="saveUsername" onblur="check('username','save');">
								</div>
							</div>
							<div class="form-group">
								<label for="sLink" class="col-xs-3 control-label">用户密码：</label>
								<div class="col-xs-8 ">
									<input type="password" class="form-control input-sm duiqi" name="password">
								</div>
							</div>
							<div class="form-group">
								<label for="sOrd" class="col-xs-3 control-label">手机号：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm duiqi" name="phone" id="savePhone" onblur="check('phone','save');">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">地址：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm duiqi" name="address" >
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">邮箱：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm duiqi" name="email" id="saveEmail" onblur="check('email', 'save');">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">权限：</label>
								<div class="col-xs-8">
									<select class=" form-control select-duiqi" name="isAdmin">
										<option value="1">管理员</option>
										<option value="0">普通用户</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
						<button type="submit" class="btn btn-xs btn-green">保 存</button>
					</div>
				</form>
			</div>
					
			</div>
			
			<!-- /.modal-content -->
		</div>
		
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!--弹出修改用户窗口-->
	<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
				</div>
				<form class="form-horizontal" method="post" action="<%=request.getContextPath() %>/userManagement/update.do">
					<div class="modal-body">
					
						<div class="container-fluid">
								<input type="hidden" id="updateId" name="id">
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">用户名：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi" id="updateUsername" name="username" onblur="check('username','update');">
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">用户密码：</label>
									<div class="col-xs-8 ">
										<input type="password" class="form-control input-sm duiqi" id="password" name="password">
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi" id="updateEmail" name="email" onblur="check('email', 'update');">
									</div>
								</div>
								<div class="form-group">
									<label for="sKnot" class="col-xs-3 control-label">电话：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi" id="updatePhone" name ="phone" onblur="check('phone', 'update');">
									</div>
								</div>
								<div class="form-group">
									<label for="sKnot" class="col-xs-3 control-label">地址：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi" id="address" name="address">
									</div>
								</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
						<button type="submit" class="btn btn-xs btn-green">保 存</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!--弹出删除用户警告窗口-->
	<div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						确定要删除该用户？删除后不可恢复！
					</div>
				</div>
				<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/userManagement/delete.do">
					<input type="hidden" id="deleteID" name="id">
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
						<button type="submit" class="btn  btn-xs btn-danger" >保 存</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</div>
</body>
</html>
