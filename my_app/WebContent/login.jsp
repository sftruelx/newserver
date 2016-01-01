<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<head>
<title>Login</title>
<link href="${ctx}/styles/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="${ctx}/styles/css/templatemo_style.css" rel="stylesheet" type="text/css">

</head>
<body id="login" class="templatemo-bg-gray">
	<p>
		<br>
	</p>

	<form method="post" id="loginForm"
		action="<c:url value='/j_security_check'/>"
		class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30"
		autocomplete="off">
		<h1 class="margin-bottom-15">登录</h1>
		<c:if test="${param.error != null}">
			<div class="alert alert-error alert-dismissable">
				${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</div>
		</c:if>
		<div class="form-group">
			<div class="col-xs-12">
				<div class="control-wrapper">
					<label for="username" class="control-label fa-label">
					<i class="fa fa-user"></i></label> 
					<input type="text"	name="j_username" id="j_username" class="form-control"	placeholder="用户名" required tabindex="1">
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="control-wrapper">
					   	<label for="password" class="control-label fa-label"><i class="fa fa-lock"></i></label> <input
						type="password" class="form-control" name="j_password"
						id="j_password" tabindex="2" placeholder="密码" required>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-12">
				<div class="checkbox control-wrapper">
					<label> <input type="checkbox"
						class="checkbox control-wrapper"
						name="_spring_security_remember_me" id="rememberMe" tabindex="3" />
						记住我
					</label>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-12">
				<div class="control-wrapper">
					<input type="submit" class="btn btn-info" name="login" id="login"
						value="登录">

		          		<a href="./common/forgotpassword.jsp" class="text-right pull-right">忘记密码?</a>
		          	</div>
		          </div>
		        </div>

		<hr>
		        <div class="form-group">
		        	<div class="col-md-12">
		        		<label>其它账号登录: </label>
		        		<div class="inline-block">
		        			<a href="#"><i class="fa fa-facebook-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-twitter-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-google-plus-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-tumblr-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-github-square login-with"></i></a>
		        		</div>		        		
		        	</div>
		        </div>
	</form>
	<div class="text-center">
		 <a href="./common/create-account.jsp" class="templatemo-create-new">注册新账号 <i class="fa fa-arrow-circle-o-right"></i></a>	
	</div>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("input[type='text']:visible:enabled:first",
							document.forms['loginForm']).focus();
				});
	</script>
</body>

