<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜品种类管理</title>

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
	//处理显示居中问题
	$(function(){
		$(".col-xs-3").attr("style","text-align: center");
		var msg = '${msg}';
		if(''!=msg){
			layer.msg(msg);
		}
		initSelect();
	});
	
	//初始化翻页下拉框
	function initSelect() {
		var vhtml = '';
		for(var i=1; i<='${page.pageCount}'; i++){
			if('${page.pageNum}' == i) {
				vhtml += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			} else {
				vhtml += "<option value='" + i + "'>" + i + "</option>";
			}
		}
		$("#selectPageNum").html(vhtml);
	};
	
	function query() {
		$("#searchPageNum").val($("#selectPageNum").val());
	};
	
	function searchByClassName() {
		$("#searchPageNum").val($("#selectPageNum").val());
		$("#searchForm").submit();
	};
	
	//清空查询条件
	function clean() {
		$("#searchPageNum").val('1');
		$("#searchClassName").val('');
		$("#searchForm").submit();
	};
	
	//点击显示描述信息
	function gotoDetail(detail) {
		layer.alert(detail);
		
	};
	
	function gotoUpdate(id) {
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: '<%=request.getContextPath() %>/foodClass/findById.do',
			data:{"id":id},
			success: function(data) {
				if(null != data || "" != data) {
					$("#updateId").val(data.id);
					$("#updateClassName").val(data.className);
					$("#updateClassInformation").val(data.classInformation);
				}
			}
		});
	};
	function checkClassName(types) {
		var id = '';
		var className = '';
		if(types == 'save') {
			className = $("#saveClassName").val();
			if(className == '' || className == null) {
				layer.msg("名称不能为空");
				return;
			}
		}
		if(types == 'update') {
			className = $("#updateClassName").val();
			id = $("#updateId").val();
			if(className == '' || className == null) {
				layer.msg("名称不能为空");
				return;
			}
		}
		$.ajax({
			type : 'post',
			dataType : 'json',
			url: '<%=request.getContextPath()%>/foodClass/checkForm.do',
			data : {
				'className' : className,
				'id' : id
			},
			success : function(data) {
				if(!data) {
					layer.msg("名称重复，请充填");
				}
			}
		});
	};
	
	//删除数据
	function gotoDelete(id) {
		$("#deleteID").val(id);
	};
</script>
</head>
<body>
<!--菜品管理模块-->
<div role="tabpanel" class="tab-pane" id="user">
	<div class="check-div form-inline">
		<div class="col-xs-2">
			<button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加菜品种类 </button>
		</div>
		<div class="col-xs-4">
			<form action="<%=request.getContextPath()%>/foodClass/pageList.do" method="post" id="searchForm">
				<input type="text" class="form-control input-sm" placeholder="输入文字搜索" id="searchClassName" name="className" value="${foodClass.className}">
				<input type="hidden" id="searchPageNum" name="pageNumber">
				<button type="submit" class="btn btn-white btn-xs " onclick="query();">查 询 </button>
				<button class="btn btn-white btn-xs " onclick="clean();">清 空 </button>
			</form>
		</div>
	</div>
	<div class="data-div">
		<div class="row tableHeader">
			<div class="col-xs-3 " style="text-align: center;">
				菜品种类名称
			</div>
			<div class="col-xs-3">
				菜品种类描述
			</div>
			<div class="col-xs-3">
				添加时间
			</div>
			<div class="col-xs-3">
				操作
			</div>
		</div>
		<div class="tablebody">
			<c:forEach items="${foodClassList }" var="foodClass">
				<div class="row">
					<div class="col-xs-3">
						${foodClass.className}
					</div>
					<div class="col-xs-3">
						<a data-toggle="modal" data-target="#classDetail"
							onclick="gotoDetail('${foodClass.classInformation}');">菜品种类详情</a>
					</div>
					<div class="col-xs-3">
						${foodClass.createTime}
					</div>
					<div class="col-xs-3">
						<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="gotoUpdate('${foodClass.id}')">修改</button>
						<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="gotoDelete('${foodClass.id}')">删除</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!--页码块-->
	<footer class="footer">
		<ul class="pagination">
			<li>
				<select id="selectPageNum" onchange="searchByClassName()">
				</select>
				页
			</li>
			<li class="gray">
				共${page.pageCount}页
			</li>
		</ul>
	</footer>

	<!--弹出添加菜品种类窗口-->
	<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">添加菜品种类</h4>
				</div>
				<form class="form-horizontal" action="<%=request.getContextPath()%>/foodClass/save.do" method="post">
					<div class="modal-body">
						<div class="container-fluid">
							
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">种类名称：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi" id="saveClassName" name="className"
											onblur="checkClassName('save');">
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">种类描述：</label>
									<div class="col-xs-6 ">
										<textarea class="form-control input-sm duiqi" id="saveClassInformation" name="classInformation" ></textarea>
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

	<!--弹出修改用户窗口-->
	<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">修改菜品种类</h4>
				</div>
				<form class="form-horizontal" action="<%=request.getContextPath()%>/foodClass/update.do" method="post">
					<div class="modal-body">
						<div class="container-fluid">
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">种类名称：</label>
									<div class="col-xs-8 ">
										<input type="hidden" id="updateId" name="id">
										<input type="text" class="form-control input-sm duiqi" id="updateClassName" name="className"
											onblur="checkClassName('update');">
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">种类描述：</label>
									<div class="col-xs-8 ">
										<textarea cols="3" class="form-control duiqi" id="updateClassInformation" name="classInformation">
										</textarea>
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
						确定要删除该菜品种类？删除后不可恢复！
					</div>
				</div>
				<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/foodClass/delete.do">
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
</div>
</body>
</html>
