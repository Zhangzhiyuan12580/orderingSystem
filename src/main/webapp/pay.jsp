<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.min.css" />

<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<!-- 引入layer插件 -->
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/layer.js"></script>
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function() {
		$('#addUser').modal();
	});
</script>
</head>
<body>
<!--用户管理模块-->
<div role="tabpanel" class="tab-pane" id="user">
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
</body>
</html>
