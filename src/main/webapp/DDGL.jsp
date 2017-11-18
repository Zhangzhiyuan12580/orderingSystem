<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>

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
	$(function(){
		$(".col-xs-2").attr("style","text-align: center");
		var msg = '${msg}';
		if(''!=msg){
			layer.msg(msg);
		}
		$("#isDealSelect").val('${isDeal}');
		initPageNumSelect();
	});
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

	//处理订单
	function gotoDeal(id) {
		$("#dealID").val(id);
	}
	
	function searchByName(){
		$("#pageNum1").val($("#selectPageNum").val());
		$("#isDeal1").val($("#isDealSelect").val());
		$("#searchForm").submit();
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
		$("#selectPageNum").html(vhtml);
	};
</script>
</head>
<body>
<!--用户管理模块-->
<div role="tabpanel" class="tab-pane" id="user">
	<div class="check-div form-inline">
			<div class="col-xs-4">
				<form id="searchForm" action="<%=request.getContextPath()%>/orderInfo/pageList.do" method="post">
					<input type="hidden" name="pageNum1" id="pageNum1" value=""/>
					<input type="hidden" name="isDeal" id="isDeal1" value=""/>
				</form>
			</div>
			<div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
				<label for="paixu">订单状态:&nbsp;</label>
				<select class=" form-control" id="isDealSelect" onchange="searchByName();">
					<option value="">--请选择--</option>
					<option value="0">未处理</option>
					<option value="1">已处理</option>
					<option value="2">已完成</option>
				</select>
			</div>
		</div>
	<div class="data-div">
		<div class="row tableHeader">
			<div class="col-xs-2 ">
				订单号
			</div>
			<div class="col-xs-2">
				用户
			</div>
			<div class="col-xs-2">
				联系电话
			</div>
			<div class="col-xs-2">
				总价格
			</div>
			<div class="col-xs-2">
				订单状态
			</div>
			<div class="col-xs-2">
				操作
			</div>
		</div>
		<div class="tablebody">
			<c:forEach items="${orderInfoList }" var="orderInfo" varStatus="index">
			
				<div class="row">
					<div class="col-xs-2">
						${orderInfo.orderNo}
					</div>
					<div class="col-xs-2">
						${orderInfo.user.username}
					</div>
					<div class="col-xs-2">
						${orderInfo.phone}
					</div>
					<div class="col-xs-2">
						${orderInfo.totalPrice}
					</div>
					<div class="col-xs-2">
						${orderInfo.isDeal}
					</div>
					<div class="col-xs-2">
						<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#dealUser" onclick="gotoDeal('${orderInfo.id}')">处理</button>
						<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="gotoDelete('${orderInfo.id}')">删除</button>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
	<!--页码块-->
	<footer class="footer">
		<ul class="pagination">
			<li>
				<select id="selectPageNum" onchange="searchByName();">
				</select>
				页
			</li>
			<li class="gray">
				共${page.pageCount}页
			</li>
		</ul>
	</footer>
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
						确定要删除该订单？删除后不可恢复！
					</div>
				</div>
				<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/orderInfo/delete.do">
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

	<!--弹出删除用户警告窗口-->
	<div class="modal fade" id="dealUser" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						是否处理该订单？
					</div>
				</div>
				<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/orderInfo/dealOrderInfo.do">
					<input type="hidden" id="dealID" name="id">
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
						<button type="submit" class="btn  btn-xs btn-danger" >处 理</button>
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
