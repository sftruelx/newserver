
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Layout - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/easyui/demo.css">
	<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/css/font-awesome.css">
<script type="text/javascript" src="${ctx}/styles/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/styles/easyui/jquery.easyui.min.js"></script>

<decorator:head />
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north'" style="height: 50px">
			<h2>广告位隆重招商</h2>
		</div>
		<div data-options="region:'west',split:true" title=""
			style="width: 200px;">
			<div class="easyui-accordion" style="width: 100%; height: 99.8%;">
			<div title="菜单栏" data-options="iconCls:'fa fa-mixcloud'"
					style="padding: 10px;">
					<ul id="menu-tree" class="easyui-tree" data-options="url:'${ctx}/styles/tree_data.json',method:'get',animate:true"></ul>
				</div>
				<div title="About" data-options="iconCls:'icon-application_xp'"
					style="overflow: auto; padding: 10px;">
					<h3 style="color: #0099FF;">Accordion for jQuery</h3>
					<p><i class="fa fa-camera-retro"></i>Accordion is a part of easyui framework for jQuery. It lets
						you define your accordion component<i class="fa fa-shield"></i> normal<br> on web page more easily.</p>
				</div>
				<div title="Help" data-options="iconCls:'icon-help'"
					style="padding: 10px;">
					<p>The accordion allows you to provide multiple panels and
						display one or more at a time. Each panel has built-in support for
						expanding and collapsing. Clicking on a panel header to expand or
						collapse that panel body. The panel content can be loaded via ajax
						by specifying a 'href' property. Users can define a panel to be
						selected. If it is not specified, then the first panel is taken by
						default.</p>
				</div>
				
			</div>

		</div>
		<div
			data-options="region:'center',title:'   ',iconCls:'icon-page_white_text'">
			<decorator:body />
		</div>
	</div>
	<!-- <script type="text/javascript">
	$('#menu-tree').tree({
	    onClick: function(node){
	        alert(node.text);  // alert node text property when clicked
	    }
	});
	</script> -->
</body>
</html>