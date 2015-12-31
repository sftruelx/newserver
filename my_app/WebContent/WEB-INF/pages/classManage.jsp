
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div style="margin-left: 10px; padding-bottom: 6px">
		<h4>请输入查询条件</h4>
		<div id="tb" style="padding: 3px">
			<span> 层级:</span> <input id="find_level" class="easyui-combobox"
				data-options="valueField:'id',textField:'text',url:'classifylevel'">
			<span>父层级:</span> <input id="findparent" class="easyui-combobox"
				data-options="valueField:'id',textField:'title',url:'classifyparent?title='"">
		</div>
	</div>
	<table id="dg" title="My Users" class="easyui-datagrid" 
		style="width: 100%; height: 80%" url="classifies" toolbar="#toolbar"
		pagination="true" rownumbers="true" fitColumns="true" showPageList="false"
		singleSelect="true">
		<thead>
			<tr>
				<th field="parent_id" width="50">父ID</th>
				<th field="level" width="50">层级</th>
				<th field="title" width="50">标题</th>
				<th field="end" width="50">最终节点</th>
				<th field="img_url" width="50">图片URL</th>
				<th field="img_path" width="50">图片路径</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-user" plain="true" onclick="newUser()">新增</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-pencil" plain="true" onclick="editUser()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-trash" plain="true" onclick="destroyUser()">删除</a> <a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-search" plain="true" onclick="doSearch()">查找</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 320px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">Classify Information</div>
		<form id="fm" action="classifyFrom" method="post"
			enctype="multipart/form-data">
			<div class="fitem">
				<label>选择图片:</label> <input class="easyui-filebox" name="files"
					data-options="prompt:'Choose another file...'" style="width: 70%">
			</div>
			<div class="fitem">
				<label>父节点:</label> <input id="parent_id" name="parent_id"
					class="easyui-textbox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>层级:</label> <input id="level" name="level"
					class="easyui-textbox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>标题:</label> <input id="title" name="title"
					class="easyui-textbox">
			</div>
			<div class="fitem">
				<label>是否最终分类:</label> <input id="end" name="end"
					class="easyui-switchbutton" data-options="onText:'是',offText:'否'">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">

		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="fa fa-save" onclick="saveUser()" style="width: 90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-pause" onclick="javascript:$('#dlg').dialog('close')"
			style="width: 90px">Cancel</a>
	</div>

	<script type="text/javascript">
		var url = "classifyFrom";
		function newUser() {

			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('center').dialog('setTitle',
						'新分类');
				$('#fm').form('clear');
				$('#parent_id').textbox('setValue', row.id);
				$("#level").textbox("setValue", row.level + 1);
				url = 'classifyFrom';
			}
		}
		function editUser() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('center').dialog('setTitle',
						'Edit User');
				$('#fm').form('load', row);
				url = 'userform?id=' + row.id + "&version=" + row.version;
			}
		}
		function saveUser() {
			$('#fm').form('submit', {
				url : url,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.errorMsg) {
						$.messager.show({
							title : 'Error',
							msg : result.errorMsg
						});
					} else {
						$('#dlg').dialog('close'); // close the dialog
						$('#dg').datagrid('reload'); // reload the user data
					}
				}
			});
		}
		function destroyUser() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$.messager.confirm('Confirm',
						'Are you sure you want to destroy this user?',
						function(r) {
							if (r) {
								$.post('classifyFrom?delete=true', {
									id : row.id
								}, function(result) {
									if (result.success) {
										$('#dg').datagrid('reload'); // reload the user data
									} else {
										$.messager.show({ // show error message
											title : 'Error',
											msg : result.errorMsg
										});
									}
								}, 'json');
							}
						});
			}
		}
		function doSearch() {
			var lev = $('#find_level').textbox('getValue');
			if (lev == '') {
				lev = -1;
			}
			var lev1 = $('#findparent').textbox('getValue');
			if (lev1 == '') {
				lev1 = -1;
			}
			$('#dg').datagrid('load', {
				level : lev,
				parent_id : lev1
			});
		}
	</script>

</body>
</html>