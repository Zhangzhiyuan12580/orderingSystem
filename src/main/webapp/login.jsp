<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册/登陆</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<!-- 引入layer插件 -->
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/layer.js"></script>
<script src="<%=request.getContextPath() %>/layer-v2.3/layer/laydate/laydate.js"></script>

<script type="text/javascript">
	function check(types) {
		var username = '';
		if(types == 'username') {
			username = $("#username").val();
			if(username == '' || username == null) {
				layer.msg("名称不能为空");
				return false;
			}
		}
		if(types == 'password') {
			password = $("#password").val();
			if(password == '' || password == null) {
				layer.msg("密码不能为空");
				return false;
			}
		}
		$.ajax({
			type : 'post',
			dataType : 'json',
			url: '<%=request.getContextPath()%>/userManagement/check.do',
			data : {
				'username' : username
			},
			success : function(data) {
				if(!data) {
					layer.msg("用户名重复，请重填");
					return false;
				}
			}
		});
	};

	//手机号验证
	function checkPhone() {
		var phone = $("#phone").val();
		if(phone == '' || phone == null) {
			layer.msg("电话不能为空");
			return false;
		}
		if(!(/^1[34578]\d{9}$/.test(phone))){
			 layer.msg("手机号码有误，请重填");
		 } 
	};
	//邮箱验证
	function checkEmail() {
		var email = $("#email").val();
		if(email == '' || email == null) {
			layer.msg("邮箱不能为空");
			return false;
		}
		if(!(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/).test(email)) {
			layer.msg("邮箱格式不正确，请重填");
			return false;
		}
	};
	
	function submitForm() {
		if(check('username') == false
				|| check('password') == false
				|| checkPhone() == false
				|| checkEmail() == false) {
			layer.msg("不能为空,请重填");
		} else {
			$("#form").submit();
		}
	}
</script>
</head>
<body>
	<div style="height:30px;"></div>
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked /><label for="tab-1" class="tab">登录</label>
			<input id="tab-2" type="radio" name="tab" class="sign-up" /><label for="tab-2" class="tab">注册</label>
			<div class="login-form">
				<div class="sign-in-htm">
					<form action="<%=request.getContextPath() %>/userManagement/login.do" method="post">
						<div class="group">
							<label for="user" class="label">用户名</label>
							<input name="username"  type="text" class="input" />
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input name="password"  type="password" class="input" data-type="password" />
						</div>
						<div class="group">
							<input id="check" type="checkbox" class="check" checked />
							<label for="check"><span class="icon"></span> 记住密码</label>
						</div>
						<div class="group">
							<input type="submit" class="button" value="登录" />
						</div>
					</form>
					<div class="hr"></div>
					<div class="foot-lnk">
						<a href="#forgot">${msg}</a>
					</div>
				</div>
				<form action="<%=request.getContextPath() %>/userManagement/register.do" method="post" id="form">
					<div class="sign-up-htm">
					<div class="group">
						<label for="user" class="label">用户名</label>
						<input name="username" type="text" class="input" id="username" onblur="check('username');" />
					</div>
					<div class="group">
						<label for="pass" class="label">密码</label>
						<input name="password" type="password" id="password" class="input" data-type="password" onblur="check('password');" />
					</div>
					<div class="group">
						<label for="pass" class="label">手机号</label>
						<input name="phone" type="text" class="input" id="phone" onblur="checkPhone();"/>
					</div>
					<div class="group">
						<label for="pass" class="label">地址</label>
						<input name="address" type="text" class="input"/>
					</div>
					<div class="group">
						<label for="pass" class="label">邮箱</label>
						<input name="email" type="text" class="input" id="email" onblur="checkEmail();"/>
					</div>
					<div class="group">
						<input class="button" value="注册" onclick="submitForm();"/>
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label for="tab-1">已注册登录?</a>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>