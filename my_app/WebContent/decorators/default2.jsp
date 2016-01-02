
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/easyui/themes/metro-green/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/easyui/demo.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/css/font-awesome.css">
<script type="text/javascript" src="${ctx}/styles/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/styles/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/easyui/jgxLoader.js"></script>

<script type="text/javascript">
	function open1(url, a) {
		currPageItem = $(a).text();
		$('body>div.menu-top').menu('destroy');
		$('body>div.window>div.window-body').window('destroy');
		$('#demo').panel('refresh', url);
	}
</script>
<decorator:head />
</head>
<body>

	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north'" data-options="fit:true">
			<div class="easyui-panel" style="padding: 5px;">
				<a href="./" class="easyui-linkbutton" data-options="plain:true">主页</a>
				<a href="#" class="easyui-splitbutton"
					data-options="menu:'#mm1',iconCls:'fa fa-edit'">Edit</a> <a
					href="#" class="easyui-splitbutton"
					data-options="menu:'#mm2',iconCls:'fa fa-thumbs-o-up'">Ok</a> <a
					href="#" class="easyui-menubutton"
					data-options="menu:'#mm3',iconCls:'icon-help'">Help</a>
			</div>
			<div id="mm1" style="width: 150px;">
				<div data-options="iconCls:'fa fa-undo'">Undo</div>
				<div data-options="iconCls:'fa fa-arrow-right'">Redo</div>
				<div class="menu-sep"></div>
				<div>Cut</div>
				<div>Copy</div>
				<div>Paste</div>
				<div class="menu-sep"></div>
				<div>
					<span>Toolbar</span>
					<div>
						<div>Address</div>
						<div>Link</div>
						<div>Navigation Toolbar</div>
						<div>Bookmark Toolbar</div>
						<div class="menu-sep"></div>
						<div>New Toolbar...</div>
					</div>
				</div>
				<div data-options="iconCls:'icon-remove'">Delete</div>
				<div>Select All</div>
			</div>
			<div id="mm2" style="width: 100px;">
				<div data-options="iconCls:'icon-ok'">Ok</div>
				<div data-options="iconCls:'icon-cancel'">Cancel</div>
			</div>
			<div id="mm3" style="width: 150px;">
				<div>Help</div>
				<div>Update</div>
				<div>
					<span>About</span>
					<div class="menu-content" style="padding: 10px; text-align: left">
						<!-- <img src="http://www.jeasyui.com/images/logo1.png" style="width:150px;height:50px">
				<p style="font-size:14px;color:#444">Try jQuery EasyUI to build your modern, interactive, javascript applications.</p> -->
					</div>
				</div>
			</div>
		</div>
		<div data-options="region:'west',split:true" title=""
			style="width: 200px;">

			<ul>
				<li><a href='javascript:void(0)' onclick="open1('classManage',this)">分类管理</a></li>
				<li><a href='javascript:void(0)'
					onclick="open1('userManage',this)">用户管理</a></li>
				<li><a href='javascript:void(0)' onclick="open1('albumManage',this)">专辑管理</a></li>					
				<li><a href='javascript:void(0)' onclick="open1('#',this)">TODO内容管理</a></li>
				<li><a href='javascript:void(0)'
					onclick="open1('userManage',this)">TODO推荐管理</a></li>
				<li><a href='javascript:void(0)'
					onclick="open1('userManage',this)">TODO主播管理</a></li>
			</ul>



		</div>
		<div id="demo"
			data-options="region:'center',title:'   ',iconCls:'icon-page_white_text'">
			<decorator:body />
		</div>
	</div>
	</div>
	<style type="text/css">
#fm {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 80px;
}

.fitem input {
	width: 160px;
}
</style>
</body>
</html>