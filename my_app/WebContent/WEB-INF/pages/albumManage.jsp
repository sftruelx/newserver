
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>

	<div style="margin-left: 10px; padding-bottom: 6px">
		<h4>请输入查询条件</h4>
		<div id="tb" style="padding: 3px"></div>
	</div>
	<table id="dgalbum" title="专辑管理" class="easyui-datagrid"  data-options="url:'classifies',onClickRow:ClickRow,fitColumns:true,singleSelect:true"
		style="width: 100%; height: 370px" url="albums" toolbar="#toolbar"
		pagination="true" rownumbers="true" >
		<thead>
			<tr>
				<th field="id" width="50">ID</th>
				<th field="classifyId" formatter="Common.ClassifyFormatter" width="50">分类</th>
				<th field="albumName" width="50">名称</th>
				<th field="author" width="50">作者</th>
				<th field="descripe" width="50">简介</th>
				<th field="publishDate" formatter="Common.TimeFormatter" width="50">发表日期</th>
				<th field="imgPath" width="50">图片路径</th>
				<th field="createTime" formatter="Common.TimeFormatter" width="50">新建日期</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-user" plain="true" onclick="newAlbum()">新增</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-pencil" plain="true" onclick="editAlbum()">编辑</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-trash" plain="true" onclick="destroyUser()">删除</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
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
					data-options="prompt:'Choose another file...'" style="width: 70%" />
			</div>
			<div class="fitem">
				<label>专辑分类:</label> <input id="classifyId" name="classifyId"  class="easyui-combobox" 
				data-options="valueField:'id',textField:'title',url:'classifyparent?title=0'"/>
			</div>			
			<div class="fitem">
				<label>专辑名称:</label> <input id="albumName" name="albumName"
					class="easyui-textbox" required="true" />
			</div>
			<div class="fitem">
				<label>作者:</label> <input id="author" name="author"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label>简介:</label> <input id="descripe" name="descripe"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label>发布日期:</label><input class="easyui-datebox"
					formatter="Common.TimeFormatter" id="publishDate"
					name="publishDate" />
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
	<table id="dg-artist" title="音频管理" class="easyui-datagrid"
		style="width: 100%; height: 370px" url="artists" toolbar="#artistToolbar"
		pagination="true" rownumbers="true" fitColumns="true"
		singleSelect="true">
		<thead>
			<tr>
				<th field="artistId" width="50">ID</th>
				<th field="artistName" width="50">名称</th>
				<th field="artistPath" width="50">图片路径</th>
			</tr>
		</thead>
	</table>
	<div id="artistToolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-user" plain="true" onclick="newArtist()">新增</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-pencil" plain="true" onclick="editArtist()">编辑</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-trash" plain="true" onclick="destroyArtist()">删除</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-search" plain="true" onclick="doArtistSearch()">查找</a>
	</div>

	<div id="dlg-artist" class="easyui-dialog"
		style="width: 400px; height: 320px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">音频 Information</div>
		<form id="artistfm" action="classifyFrom" method="post"
			enctype="multipart/form-data">
			<div class="fitem">
				<label>选择图片:</label> <input class="easyui-filebox"
					name="files" data-options="prompt:'Choose another file...'"
					style="width: 70%" />
			</div>
			<div class="fitem">
				<label>专辑ID:</label> <input id="albumId" name="albumId"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label>音频名称:</label> <input id="artistName" name="artistName"
					class="easyui-textbox" required="true" />
			</div>
		</form>
	</div>
	<div id="dlg-buttons">

		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="fa fa-save" onclick="saveArtist()" style="width: 90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="fa fa-pause"
			onclick="javascript:$('#dlg-artist').dialog('close')"
			style="width: 90px">Cancel</a>
	</div>
	<script type="text/javascript">
	function ClickRow(index,row){
		$('#dg-artist').datagrid('load', {
				albumId : row.id
		});
	}
		toDate = function(str) {
			var s = value.toString();
			var da = new Date(parseInt(s.replace("/Date(", "")
					.replace(")/", ""), 10));
			return da;
		};

		formatterDate = function(date) {
			var day = date.getDate() > 9 ? date.getDate() : "0"
					+ date.getDate();
			var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
					+ (date.getMonth() + 1);
			return date.getFullYear() + '-' + month + '-' + day;
		};

		var url = "albumForm";
		function newAlbum() {
			$('#dlg').dialog('open').dialog('center').dialog('setTitle', '新分类');
			$('#fm').form('clear');

			$('#publishDate').datebox('setValue', formatterDate(new Date()));
			url = 'albumForm';

		}
		function editAlbum() {
			var row = $('#dgalbum').datagrid('getSelected');
			if (row) {
				var id = row.id;
				url = 'albumForm?id=' + id;
				$('#dlg').dialog('open').dialog('center').dialog('setTitle',
						'Edit Album');
				$('#fm').form('load', row);
			
				
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
						$('#dgalbum').datagrid('reload'); // reload the user data
					}
				}
			});
		}
		function destroyUser() {
			var row = $('#dgalbum').datagrid('getSelected');
			if (row) {
				$.messager.confirm('Confirm',
						'Are you sure you want to destroy this user?',
						function(r) {
							if (r) {
								$.post('classifyFrom?delete=true', {
									id : row.id
								}, function(result) {
									if (result.success) {
										$('#dgalbum').datagrid('reload'); // reload the user data
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
	
/* 			var lev = $('#find_level').textbox('getValue');
			if (lev == '') {
				lev = -1;
			} */

			$('#dgalbum').datagrid('load', {
			
			});
		}
		var Common = {
			//EasyUI用DataGrid用日期格式化
			TimeFormatter : function(value, rec, i) {

				if (value == undefined || value == null) {
					return "null";
				}
				//alert(value);
				/*json格式时间转js时间格式*/
				var s = value.toString();
				var da = new Date(parseInt(s.replace("/Date(", "").replace(
						")/", ""), 10));
				//alert(date);
				return da.getFullYear() + "-" + (da.getMonth() + 1) + "-"
						+ (da.getDay());// +da.getHours()+":"+da.getSeconds()+":"+da.getMinutes(); 

			},
		ClassifyFormatter : function(value, rec, i) {

			if (value == undefined || value == null) {
				return "null";
			}
			//alert(value);
			var data = $("#classifyId").combobox('getData');
			
			var s = value.toString();
			for( i=0;i<data.length;i++){
				if(data[i].id == s){
					return data[i].title;
				}
				//alert(data[i]);
			}
			
			return ''; 

		}
		};
		var artist_url = "artistFrom";
		function newArtist() {
			var row = $('#dgalbum').datagrid('getSelected');
			if (row) {
			$('#dlg-artist').dialog('open').dialog('center').dialog('setTitle',
					'新分类');
			$('#artistfm').form('clear');
			$('#albumId').textbox('setValue', row.id);

			url = 'artistFrom';
			}
		}
		function editArtist() {

			var row = $('#dg-artist').datagrid('getSelected');
			if (row) {
				$('#dlg-artist').dialog('open').dialog('center').dialog(
						'setTitle', 'Edit User');
				$('#artistfm').form('load', row);
				url = 'artistFrom?artistId=' + row.artistId;
			}
		}
		function saveArtist() {
			$('#artistfm').form('submit', {
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
						$('#dlg-artist').dialog('close'); // close the dialog
						$('#dg-artist').datagrid('reload'); // reload the user data
					}
				}
			});
		}
		function destroyArtist() {
			var row = $('#dg-artist').datagrid('getSelected');
			if (row) {
				$.messager.confirm('Confirm',
						'Are you sure you want to destroy this user?',
						function(r) {
							if (r) {
								$.post('classifyFrom?delete=true', {
									id : row.id
								}, function(result) {
									if (result.success) {
										$('#dg-artist').datagrid('reload'); // reload the user data
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
		function doArtistSearch() {
			var lev = $('#find_level').textbox('getValue');
			if (lev == '') {
				lev = -1;
			}
			var lev1 = $('#findparent').textbox('getValue');
			if (lev1 == '') {
				lev1 = -1;
			}
			$('#dg-artist').datagrid('load', {
				level : lev,
				parent_id : lev1
			});
		}
	</script>

