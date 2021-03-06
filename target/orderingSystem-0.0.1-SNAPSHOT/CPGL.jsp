<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
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


</head>
<body>
<!--用户管理模块-->
<div role="tabpanel" class="tab-pane" id="user">
	<div class="check-div form-inline">
		<div class="col-xs-3">
			<button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加用户 </button>
		</div>
		<div class="col-xs-4">
			<input type="text" class="form-control input-sm" placeholder="输入文字搜索">
			<button class="btn btn-white btn-xs ">查 询 </button>
		</div>
		<div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
			<label for="paixu">排序:&nbsp;</label>
			<select class=" form-control">
				<option>地区</option>
				<option>地区</option>
				<option>班期</option>
				<option>性别</option>
				<option>年龄</option>
				<option>份数</option>
			</select>
		</div>
	</div>
	<div class="data-div">
		<div class="row tableHeader">
			<div class="col-xs-2 ">
				用户名
			</div>
			<div class="col-xs-2">
				地区
			</div>
			<div class="col-xs-2">
				真实姓名
			</div>
			<div class="col-xs-2">
				电话
			</div>
			<div class="col-xs-2">
				状态
			</div>
			<div class="col-xs-2">
				操作
			</div>
		</div>
		<div class="tablebody">

			<div class="row">
				<div class="col-xs-2 ">
					goodmoning
				</div>
				<div class="col-xs-2">
					国际关系地区
				</div>
				<div class="col-xs-2">
					李豆豆
				</div>
				<div class="col-xs-2">
					13688889999
				</div>
				<div class="col-xs-2">
					状态
				</div>
				<div class="col-xs-2">
					<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser">修改</button>
					<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser">删除</button>
				</div>
			</div>

		</div>

	</div>
	<!--页码块-->
	<footer class="footer">
		<ul class="pagination">
			<li>
				<select>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
				</select>
				页
			</li>
			<li class="gray">
				共20页
			</li>
			<li>
				<i class="glyphicon glyphicon-menu-left">
					</i>
			</li>
			<li>
				<i class="glyphicon glyphicon-menu-right">
					</i>
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
				<div class="modal-body">
					<div class="container-fluid">
						<form class="form-horizontal">
							<div class="form-group ">
								<label for="sName" class="col-xs-3 control-label">用户名：</label>
								<div class="col-xs-8 ">
									<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
								<div class="col-xs-8 ">
									<input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
								<div class="col-xs-8">
									<input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">电话：</label>
								<div class="col-xs-8">
									<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">地区：</label>
								<div class="col-xs-8">
									<select class=" form-control select-duiqi">
										<option value="">国际关系地区</option>
										<option value="">北京大学</option>
										<option value="">天津大学</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">权限：</label>
								<div class="col-xs-8">
									<select class=" form-control select-duiqi">
										<option value="">管理员</option>
										<option value="">普通用户</option>
										<option value="">游客</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="situation" class="col-xs-3 control-label">状态：</label>
								<div class="col-xs-8">
									<label class="control-label" for="anniu">
										<input type="radio" name="situation" id="normal">正常</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="control-label" for="meun">
										<input type="radio" name="situation" id="forbid"> 禁用</label>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
					<button type="button" class="btn btn-xs btn-green">保 存</button>
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
				<div class="modal-body">
					<div class="container-fluid">
						<form class="form-horizontal">
							<div class="form-group ">
								<label for="sName" class="col-xs-3 control-label">用户名：</label>
								<div class="col-xs-8 ">
									<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
								<div class="col-xs-8 ">
									<input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
								<div class="col-xs-8">
									<input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">电话：</label>
								<div class="col-xs-8">
									<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">地区：</label>
								<div class="col-xs-8">
									<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-3 control-label">权限：</label>
								<div class="col-xs-8">
									<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="situation" class="col-xs-3 control-label">状态：</label>
								<div class="col-xs-8">
									<label class="control-label" for="anniu">
										<input type="radio" name="situation" id="normal">正常</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="control-label" for="meun">
										<input type="radio" name="situation" id="forbid"> 禁用</label>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
					<button type="button" class="btn btn-xs btn-green">保 存</button>
				</div>
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
				<div class="modal-footer">
					<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
					<button type="button" class="btn  btn-xs btn-danger">保 存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</div>
</body>
</html>
