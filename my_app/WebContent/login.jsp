<%@ include file="/common/taglibs.jsp"%>

<title>Login</title>
<body id="login" class="templatemo-bg-gray">
<p>  
<br>
</p>

	<form method="post" id="loginForm"
		action="<c:url value='/j_security_check'/>"
		class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30"
		autocomplete="off">
		<h1 class="margin-bottom-15">Login Form</h1>
		<c:if test="${param.error != null}">
			<div class="alert alert-error alert-dismissable">
				${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</div>
		</c:if>
		<div class="form-group">
			<div class="col-xs-12">
				<div class="control-wrapper">
					<label for="username" class="control-label fa-label"></label> <input type="text"
						name="j_username" id="j_username" class="form-control"
						placeholder="Username" required tabindex="1">
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="control-wrapper">
					<label for="password" class="control-label fa-label"></label> <input
						type="password" class="form-control" name="j_password"
						id="j_password" tabindex="2" placeholder="Password" required>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-12">
				<div class="checkbox control-wrapper">
					<label> <input type="checkbox"
						class="checkbox control-wrapper"
						name="_spring_security_remember_me" id="rememberMe" tabindex="3" />
						Remember Me
					</label>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-12">
				<div class="control-wrapper">
					<input type="submit" class="btn btn-info" name="login" id="login"
						 value="Login">
				</div>
			</div>
		</div>
		
		<hr>
		        <div class="form-group">
		        	<div class="col-md-12">
	        		
		        	</div>
		        </div>
	</form>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("input[type='text']:visible:enabled:first",
							document.forms['loginForm']).focus();
				});
	</script>
</body>

