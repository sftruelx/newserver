
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

		</div>
	</div>
	<table id="dg" title="专辑管理" class="easyui-datagrid" 
		style="width: 100%; height: 80%" url="albums" toolbar="#toolbar"
		pagination="true" rownumbers="true" fitColumns="true" showPageList="false"
		singleSelect="true">
		<thead>
			<tr>
				<th field="id" width="50">ID</th>
				<th field="albumName" width="50">名称</th>
				<th field="author" width="50">作者</th>
				<th field="discripe" width="50">简介</th>
				<th field="publishDate" width="50">发表日期</th>
				<th field="imgPath" width="50">图片路径</th>
				<th field="createTime" width="50">新建日期</th>
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
		<div class="ftitle">专辑 Information</div>
		<form id="fm" action="classifyFrom" method="post"
			enctype="multipart/form-data">
			<div class="fitem">
				<label>选择图片:</label> <input class="easyui-filebox" name="files"
					data-options="prompt:'Choose another file...'" style="width: 70%">
			</div>
			<div class="fitem">
				<label>专辑名称:</label> <input id="albumName" name="albumName"
					class="easyui-textbox"  required="true">
			</div>
			<div class="fitem">
				<label>作者:</label> <input id="author" name="author"
					class="easyui-textbox">
			</div>
			<div class="fitem">
				<label>简介:</label> <input id="discripe" name="discripe"
					class="easyui-textbox">
			</div>
			<div class="fitem">
				<label>发布日期:</label> <input id="publishDate" name="publishDate"
					class="easyui-textbox">
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
		var url = "albumFrom";
		function newUser() {

				$('#dlg').dialog('open').dialog('center').dialog('setTitle',
						'新分类');
				$('#fm').form('clear');
				$('#parent_id').textbox('setValue', row.id);
				$("#level").textbox("setValue", row.level + 1);
				url = 'albumFrom';
			
		}
		function editUser() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('center').dialog('setTitle',
						'Edit User');
				$('#fm').form('load', row);
				url = 'albumform?id=' + row.id + "&version=" + row.version;
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