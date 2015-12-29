<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>

<head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var url = "http://localhost:8080/my_app/jsonusers";
						// prepare the data
						var source = {
							dataType : "json",
							dataFields : [ {
								name : 'username',
								type : 'string'
							}, {
								name : 'email',
								type : 'string'
							}, {
								name : 'phoneNumber',
								type : 'string'
							}, {
								name : 'firstName',
								type : 'string'
							}, {
								name : 'lastName',
								type : 'string'
							} ],
							id : 'id',
							url : url,
							data : {
								featureClass : "P",
								style : "full",
								maxRows : 20,
								username : "jqwidgets"
							}
						};
						var dataAdapter = new $.jqx.dataAdapter(source);
						$("#dataTable").jqxDataTable({
							width : '100%',
							theme : 'arctic',
							pageable : true,
							pagerButtonsCount : 10,
							source : dataAdapter,
							columnsResize : true,
							columns : [ {
								text : 'username',
								dataField : 'username',
								width : 300
							}, {
								text : 'email',
								dataField : 'email',
								width : 300
							}, {
								text : 'phoneNumber',
								dataField : 'phoneNumber',
								width : 180
							}, {
								text : 'firstName',
								dataField : 'firstName',
								width : 120
							}, {
								text : 'lastName',
								dataField : 'lastName'
							} ]
						});
						/*             $("#findButton").on('click', function () {
						 source.data.username='aaaa';
						 dataAdapter.dataBind();
						 $("#events").find('span').remove();
						 $("#events").append('<span>Submit Button Clicked</span');
						 }); */
						 
						$('#dataTable').on('pageChanged', function(event) {
							// event args.
							var args = event.args;
							// page num.
							var pageNum = args.pagenum;
							// old page num.
							var oldPageNum = args.oldpagenum;
							// page size.
							var pageSize = args.pagesize;

							alert(args + ' ' + pageNum);
						});
						$("#jqxToolBar")
								.jqxToolBar(
										{
											theme : 'arctic',
											width : "100%",
											height : 40,
											tools : " button | button | button | button",
											initTools : function(type, index,
													tool,
													menuToolIninitialization) {
												var icon_find = $("<span class='glyphicon glyphicon-search'> 查找</span>");
												var icon_add = $("<span class='glyphicon glyphicon-plus'> 新增   </span>");
												var icon_del = $("<span class='glyphicon glyphicon-minus'> 删除</span>");
												var icon_update = $("<span class='glyphicon glyphicon-edit'> 修改</span>");
												switch (index) {
												case 0:
													tool.append(icon_find)
													tool
															.on(
																	"click",
																	function() {
																		  $('#testForm').jqxValidator('validate');
																		source.data.username = 'bbbb';
																		dataAdapter
																				.dataBind();
																	});
													break;
												case 1:
													tool.append(icon_add);
													tool
															.on(
																	"click",
																	function() {
														                var index = 1;
														                var selection = $("#dataTable").jqxDataTable('getSelection');
														             //  alert(selection[0].username );
														                $("#dialog").jqxWindow('open');
																	});
													break;
												case 2:
													tool.append(icon_del);
													tool
															.on(
																	"click",
																	function() {
																		var selection = $(
																				"#dataTable")
																				.jqxDataTable(
																						'getSelection');
																		//alert(selection[0].username);
																	});
													break;
												case 3:
													tool.append(icon_update);
													tool
															.on(
																	"click",
																	function() {
																		var selection = $(
																				"#dataTable")
																				.jqxDataTable(
																						'getSelection');
																		alert(selection[0].username);
																	});
													break;
												}
											}
										});

						// place others 
						$("#jqxPanel").jqxPanel({
							width : '100%',
							theme : 'arctic',
							sizeMode: "wrap"
						});

						$("#ssnInput").jqxMaskedInput({
							mask : '###-##-####',
							width : 150,
							height : 22
						});
						$("#phoneInput").jqxMaskedInput({
							mask : '(###)###-####',
							width : 150,
							height : 22
						});
						$('.text-input').jqxInput({});
						$('#birthInput').jqxDateTimeInput({
							width : 150,
							height : 22,
							value : new Date(2014, 4, 1)
						});
						// initialize validator.
						$('#testForm')
								.jqxValidator(
										{
											rules : [
													{
														input : '#userInput',
														message : 'Username is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#userInput',
														message : 'Your username must be between 3 and 12 characters!',
														action : 'keyup, blur',
														rule : 'length=3,12'
													},
													{
														input : '#realNameInput',
														message : 'Real Name is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#realNameInput',
														message : 'Your real name must contain only letters!',
														action : 'keyup',
														rule : 'notNumber'
													},
													{
														input : '#realNameInput',
														message : 'Your real name must be between 3 and 12 characters!',
														action : 'keyup',
														rule : 'length=3,12'
													},
													{
														input : '#birthInput',
														message : 'Your birth date must be between 1/1/1900 and 1/1/2014.',
														action : 'valueChanged',
														rule : function(input,
																commit) {
															var date = $(
																	'#birthInput')
																	.jqxDateTimeInput(
																			'value');
															var result = date
																	.getFullYear() >= 1900
																	&& date
																			.getFullYear() <= 2014;
															// call commit with false, when you are doing server validation and you want to display a validation error on this field. 
															return result;
														}
													},
													{
														input : '#passwordInput',
														message : 'Password is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#passwordInput',
														message : 'Your password must be between 4 and 12 characters!',
														action : 'keyup, blur',
														rule : 'length=4,12'
													},
													{
														input : '#passwordConfirmInput',
														message : 'Password is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#passwordConfirmInput',
														message : 'Passwords doesn\'t match!',
														action : 'keyup, focus',
														rule : function(input,
																commit) {
															// call commit with false, when you are doing server validation and you want to display a validation error on this field. 
															if (input.val() === $(
																	'#passwordInput')
																	.val()) {
																return true;
															}
															return false;
														}
													},
													{
														input : '#emailInput',
														message : 'E-mail is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#emailInput',
														message : 'Invalid e-mail!',
														action : 'keyup',
														rule : 'email'
													},
													{
														input : '#ssnInput',
														message : 'Invalid SSN!',
														action : 'valuechanged, blur',
														rule : 'ssn'
													},
													{
														input : '#phoneInput',
														message : 'Invalid phone number!',
														action : 'valuechanged, blur',
														rule : 'phone'
													}]
										});
						//新增窗口的控件
						$('#birthInputnew').jqxDateTimeInput({
							width : 150,
							height : 22,
							value : new Date(2014, 4, 1)
						});
						
						// initialize validator.
						$('#addForm')
								.jqxValidator(
										{
											rules : [
													{
														input : '#userInput',
														message : 'Username is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#userInput',
														message : 'Your username must be between 3 and 12 characters!',
														action : 'keyup, blur',
														rule : 'length=3,12'
													},
													{
														input : '#realNameInput',
														message : 'Real Name is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#realNameInput',
														message : 'Your real name must contain only letters!',
														action : 'keyup',
														rule : 'notNumber'
													},
													{
														input : '#realNameInput',
														message : 'Your real name must be between 3 and 12 characters!',
														action : 'keyup',
														rule : 'length=3,12'
													},
													{
														input : '#birthInputnew',
														message : 'Your birth date must be between 1/1/1900 and 1/1/2014.',
														action : 'valueChanged',
														rule : function(input,
																commit) {
															var date = $(
																	'#birthInputnew')
																	.jqxDateTimeInput(
																			'value');
															var result = date
																	.getFullYear() >= 1900
																	&& date
																			.getFullYear() <= 2014;
															// call commit with false, when you are doing server validation and you want to display a validation error on this field. 
															return result;
														}
													},
													{
														input : '#passwordInput',
														message : 'Password is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#passwordInput',
														message : 'Your password must be between 4 and 12 characters!',
														action : 'keyup, blur',
														rule : 'length=4,12'
													},
													{
														input : '#passwordConfirmInput',
														message : 'Password is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#passwordConfirmInput',
														message : 'Passwords doesn\'t match!',
														action : 'keyup, focus',
														rule : function(input,
																commit) {
															// call commit with false, when you are doing server validation and you want to display a validation error on this field. 
															if (input.val() === $(
																	'#passwordInput')
																	.val()) {
																return true;
															}
															return false;
														}
													},
													{
														input : '#emailInput',
														message : 'E-mail is required!',
														action : 'keyup, blur',
														rule : 'required'
													},
													{
														input : '#emailInput',
														message : 'Invalid e-mail!',
														action : 'keyup',
														rule : 'email'
													},
													{
														input : '#ssnInput',
														message : 'Invalid SSN!',
														action : 'valuechanged, blur',
														rule : 'ssn'
													},
													{
														input : '#phoneInput',
														message : 'Invalid phone number!',
														action : 'valuechanged, blur',
														rule : 'phone'
													}]
										});
						$("#dialog").jqxWindow({
							theme : 'arctic',
	                        resizable: false,
	                        position: { left: $("#dataTable").offset().left + 175, top: $("#dataTable").offset().top - 35 },
	                        width: 670, height: 430,
	                        autoOpen: false
	                    });
	                    $("#dialog").css('visibility', 'visible');
					});
</script>
<style type="text/css">
.text-input {
	height: 21px;
	width: 150px;
}

.register-table {
	margin-top: 10px;
	margin-left: 20px;
	margin-bottom: 10px;
}

.register-table td, .register-table tr {
	margin: 0px;
	padding: 2px;
	border-spacing: 0px;
	border-collapse: collapse;
	font-family: Verdana;
	font-size: 12px;
}

h3 {
	display: inline-block;
	margin: 0px;
}
</style>
</head>
<body class='default'>


	<div id="jqxToolBar"></div>
	<div id="jqxPanel">
		<div>
			<form id="testForm" action="./">
				<table class="register-table">
					<tr>
						<td>Username:</td>
						<td><input type="text" id="userInput" class="text-input" /></td>
						<td>Password:</td>
						<td><input type="password" id="passwordInput"
							class="text-input" /></td>
					</tr>
					<tr>
						<td>Confirm password:</td>
						<td><input type="password" id="passwordConfirmInput"
							class="text-input" /></td>
						<td>Real name:</td>
						<td><input type="text" id="realNameInput" class="text-input" /></td>
					</tr>
					<tr>
						<td>Birth date:</td>
						<td><div id="birthInput"></div></td>
						<td>E-mail:</td>
						<td><input type="text" id="emailInput"
							placeholder="someone@mail.com" class="text-input" /></td>
					</tr>
					<tr>
						<td>SSN:</td>
						<td><div id="ssnInput"></div></td>
						<td>Phone:</td>
						<td><div id="phoneInput"></div></td>
					</tr>
				</table>
			</form>
		</div>
		<br>
	</div>
	<div id="dataTable"></div>
	<div id='events'></div>

	<!--  新增窗口 -->
	<div id="table"></div>
    <div style="visibility: hidden;" id="dialog">
        <div>Edit Dialog</div>
        <div style="overflow: hidden;">
            <form id="addForm" action="./">
				<table class="register-table">
					<tr>
						<td>Username:</td>
						<td><input type="text" id="userInput" class="text-input" /></td>
						<td>Password:</td>
						<td><input type="password" id="passwordInput"
							class="text-input" /></td>
					</tr>
					<tr>
						<td>Confirm password:</td>
						<td><input type="password" id="passwordConfirmInput"
							class="text-input" /></td>
						<td>Real name:</td>
						<td><input type="text" id="realNameInput" class="text-input" /></td>
					</tr>
					<tr>
						<td>Birth date:</td>
						<td><div id="birthInputnew"></div></td>
						<td>E-mail:</td>
						<td><input type="text" id="emailInput"
							placeholder="someone@mail.com" class="text-input" /></td>
					</tr>
					<tr>
						<td>SSN:</td>
						<td><div id="ssnInput"></div></td>
						<td>Phone:</td>
						<td><div id="phoneInput"></div></td>
					</tr>
				</table>
			</form>
        </div>
    </div>
	
	
	
</body>