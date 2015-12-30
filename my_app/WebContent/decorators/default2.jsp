
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic Layout - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/easyui/demo.css">
    <script type="text/javascript" src="${ctx}/styles/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/styles/easyui/jquery.easyui.min.js"></script>
<decorator:head/>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north'" style="height:50px">
        <h2>广告位隆重招商</h2>
        </div>
        <div data-options="region:'west',split:true" title="West" style="width:200px;"></div>
        <div data-options="region:'center',title:'   ',iconCls:'icon-page_white_text'">
             <decorator:body/>
        </div>
    </div>
 
</body>
</html>