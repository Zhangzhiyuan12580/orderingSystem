<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜品管理</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/slide.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.nouislider.css">
<!--文件上传 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/fileinput.min.css">

<script src="<%=request.getContextPath() %>/js/jquery.nouislider.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

<script src="<%=request.getContextPath() %>/js/fileinput.min.js"></script>
<script src="<%=request.getContextPath() %>/js/fileinput_locale_zh.js"></script>
<!-- 引入layer插件 -->
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/layer.js"></script>
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/laydate/laydate.js"></script>
<script type="text/javascript">
	//处理显示居中问题
	$(function(){
		$(".col-xs-2").attr("style","text-align: center");
		var msg = '${msg}';
		if(''!=msg){
			layer.msg(msg);
		}
		initPageNumSelect();
		initSelect('');
		initFileInput("savePhotoPath");
		initFileInput("updatePhotoPath");
	});

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
	//初始化下拉框
	function initSelect(type) {
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: '<%=request.getContextPath() %>/foodInfo/findAllFoodClass.do',
			success: function(data) {
				if(null != data || "" != data) {
					var vhtml = '<option value=""></option>';
					for(var i=0; i<data.length; i++){
						vhtml += "<option value='" + data[i].id + "'>" + data[i].className + "</option>";
					}
					if(type == 'updateSelectFoodClass') {
						$("#updateSelectFoodClass").html(vhtml);
					}
					if(type == 'saveSelectFoodClass') {
						$("#saveSelectFoodClass").html(vhtml);
					}
					if(type == '') {
						$("#selectFoodClass").html(vhtml);
					}
				}
			}
		});
		
	};
	
	function query() {
		$("#searchPageNum").val($("#selectPageNum").val());
		$("#searchClassId").val($("#selectFoodClass").val());
	};
	
	function searchByClassName() {
		$("#searchPageNum").val($("#selectPageNum").val());
		$("#searchClassId").val($("#selectFoodClass").val());
		$("#searchForm").submit();
	};
	
	//清空查询条件
	function clean() {
		$("#searchPageNum").val('1');
		$("#searchName").val('');
		$("#selectFoodClass").val('')
		$("#searchForm").submit();
	};
	
	//点击显示描述信息
	function gotoDetail(detail) {
		layer.alert(detail);
		
	};
	
	function gotoUpdate(id) {
		initSelect('updateSelectFoodClass');
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: '<%=request.getContextPath() %>/foodInfo/findById.do',
			data:{"id":id},
			success: function(data) {
				if(null != data || "" != data) {
					$("#updateId").val(data.id);
					$("#updateName").val(data.name);
					$("#updatePrice").val(data.price);
					$("#updateInformation").val(data.information);
					$("#updateInformation").val(data.information);
					$("#updateSelectFoodClass").val(data.foodClass.id);
				}
			}
		});
	};
	function checkName(types) {
		var id = '';
		var name = '';
		if(types == 'save') {
			name = $("#saveName").val();
			if(name == '' || name == null) {
				layer.msg("名称不能为空");
				return;
			}
		}
		if(types == 'update') {
			name = $("#updateName").val();
			id = $("#updateId").val();
			if(name == '' || name == null) {
				layer.msg("名称不能为空");
				return;
			}
		}
		$.ajax({
			type : 'post',
			dataType : 'json',
			url: '<%=request.getContextPath()%>/foodInfo/checkForm.do',
			data : {
				'name' : name,
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
	
	//图片上传
	function initFileInput(ctrlName) {  
		 var control = $('#' + ctrlName);   
			 control.fileinput({  
			     //language: 'zh', //设置语言  
			     showUpload: false, //是否显示上传按钮  
			     showRemove:true,  
			     dropZoneEnabled: false,  
			     showCaption: true,//是否显示标题  
			     allowedPreviewTypes: ['image'],  
		         allowedFileTypes: ['image'],  
		         allowedFileExtensions:  ['jpg', 'png'],  
		         maxFileSize : 2000,  
		         maxFileCount: 1,
		         uploadAsync: false//同步上传   
			 })
	};
	
	//点击显示描述信息
	function gotoDetail(detail) {
		layer.alert(detail);
		
	};
	
	function submitForm(type) {
		if(type == 'addForm') {
			var savePhotoPath = $("#savePhotoPath").val();
			if(savePhotoPath == '' || savePhotoPath == null) {
				layer.msg("图片不能为空");
			} else {
				$("#addForm").submit();
			}
		} else {
			if(type == 'updateForm') {
				var updatePhotoPath = $("#updatePhotoPath").val();
				if(updatePhotoPath == '' || updatePhotoPath == null) {
					layer.msg("图片不能为空");
				} else {
					$("#updateForm").submit();
				}
			}
		}
	}
</script>
</head>
<body>
<!--菜品管理模块-->
<div role="tabpanel" class="tab-pane" id="user">
	<div class="check-div form-inline">
		<div class="col-xs-3">
			<button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser" onclick="initSelect('saveSelectFoodClass');">添加菜品 </button>
		</div>
		<div class="col-xs-4">
			<form action="<%=request.getContextPath()%>/foodInfo/pageList.do" method="post" id="searchForm">
				<input type="text" class="form-control input-sm" placeholder="输入文字搜索" id="searchName" name="name" value="${foodInfo.name}">
				<input type="hidden" id="searchPageNum" name="pageNumber">
				<input type="hidden" id="searchClassId" name="classId">
				<button type="submit" class="btn btn-white btn-xs " onclick="query();">查 询 </button>
				<button class="btn btn-white btn-xs " onclick="clean();">清 空 </button>
			</form>
		</div>
		<div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
			<label for="paixu">菜品种类:&nbsp;</label>
			<select class=" form-control" id="selectFoodClass">
			</select>
		</div>
	</div>
	<div class="data-div">
		<div class="row tableHeader">
			<div class="col-xs-2 ">
				菜品名称
			</div>
			<div class="col-xs-2">
				菜品价格
			</div>
			<div class="col-xs-2">
				菜品类别
			</div>
			<div class="col-xs-2">
				 上传时间
			</div>
			<div class="col-xs-2">
				菜品介绍
			</div>
			<div class="col-xs-2">
				操作
			</div>
		</div>
		<div class="tablebody">
			<c:forEach items="${foodInfoList }" var="foodInfo">
				<div class="row">
					<div class="col-xs-2 ">
						${foodInfo.name}
					</div>
					<div class="col-xs-2">
						${foodInfo.price}
					</div>
					<div class="col-xs-2">
						${foodInfo.foodClass.className}
					</div>
					<div class="col-xs-2">
						${foodInfo.createTime}
					</div>
					<div class="col-xs-2">
						<a data-toggle="modal" data-target="#classDetail"
							onclick="gotoDetail('${foodInfo.information}');">菜品介绍</a>
					</div>
					<div class="col-xs-2">
						<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="gotoUpdate('${foodInfo.id}')">修改</button>
						<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="gotoDelete('${foodInfo.id}')">删除</button>
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

	<!--弹出添加菜品窗口-->
	<div class="modal fade"  id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">添加菜品</h4>
				</div>
				<form class="form-horizontal" action="<%=request.getContextPath()%>/foodInfo/save.do" method="post" enctype="multipart/form-data" id="addForm">
					<div class="modal-body">
						<div class="container-fluid">
							
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">菜品名称：</label>
									<div class="col-xs-8 ">
										<input type="text" class="form-control input-sm duiqi" id="saveName" name="name"
											onblur="checkName('save');">
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">菜品价格：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi" id="savePrice" name="price">
									</div>
								</div>
								<div class="form-group">
									<label for="sKnot" class="col-xs-3 control-label">图片：</label>
									<div class="col-xs-8">
										<input type="file" id="savePhotoPath" name="photo">
									</div>
								</div>
								<div class="form-group">
									<label for="sKnot" class="col-xs-3 control-label">菜品类别：</label>
									<div class="col-xs-8">
										<select class=" form-control select-duiqi" id="saveSelectFoodClass" name="foodClassId">
										
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">菜品描述：</label>
									<div class="col-xs-6 ">
										<textarea class="form-control input-sm duiqi" id="saveInformation" name="information" ></textarea>
									</div>
								</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
						<button type="button" class="btn btn-xs btn-green" onclick="submitForm('addForm');">保 存</button>
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
					<h4 class="modal-title" id="gridSystemModalLabel">修改菜品</h4>
				</div>
				<form class="form-horizontal" action="<%=request.getContextPath()%>/foodInfo/update.do" method="post" enctype="multipart/form-data" id="updateForm">
					<div class="modal-body">
						<div class="container-fluid">
							
								<div class="form-group ">
									<label for="sName" class="col-xs-3 control-label">菜品名称：</label>
									<div class="col-xs-8 ">
										<input type="hidden" id="updateId" name="id">
										<input type="text" class="form-control input-sm duiqi" id="updateName" name="name"
											onblur="checkName('update');">
									</div>
								</div>
								<div class="form-group">
									<label for="sOrd" class="col-xs-3 control-label">菜品价格：</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm duiqi" id="updatePrice" name="price">
									</div>
								</div>
								<div class="form-group">
									<label for="sKnot" class="col-xs-3 control-label">图片：</label>
									<div class="col-xs-8">
										<input type="file" id="updatePhotoPath" name="photo">
									</div>
								</div>
								<div class="form-group">
									<label for="sKnot" class="col-xs-3 control-label">菜品类别：</label>
									<div class="col-xs-8">
										<select class=" form-control select-duiqi" id="updateSelectFoodClass" name="foodClassId">
											
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="sLink" class="col-xs-3 control-label">菜品描述：</label>
									<div class="col-xs-6 ">
										<textarea class="form-control input-sm duiqi" id="updateInformation" name="information" ></textarea>
									</div>
								</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
						<button type="button" class="btn btn-xs btn-green" onclick="submitForm('updateForm');">保 存</button>
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
						确定要删除该菜品？删除后不可恢复！
					</div>
				</div>
				<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/foodInfo/delete.do">
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
