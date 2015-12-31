
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<div style="margin-left:10px;padding-bottom:6px">
    <h4>请输入查询条件</h4>
    <div id="tb" style="padding:3px">
	<span>   层级:</span>
	<input id="username" class="easyui-textbox">
	<span>标题:</span>
	<input id="email" class="easyui-textbox">
	</div>
</div>
    <table id="dg" title="My Users" class="easyui-datagrid" style="width:100%;height:80%"
            url="classifies"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="level" width="50">层级</th>
                <th field="title" width="50">标题</th>
                <th field="phoneNumber" width="50">图片URL</th>
                <th field="email" width="50">图片路径</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-user" plain="true" onclick="newUser()">New User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-pencil" plain="true" onclick="editUser()">Edit User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-trash" plain="true" onclick="destroyUser()">Remove User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-search" plain="true" onclick="doSearch()">Retrieve User</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:320px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">User Information</div>
        <form id="fm" method="post" novalidate>
            <div class="fitem">
                <label>First Name:</label>
                <input name="firstName" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>Last Name:</label>
                <input name="lastName" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>Password:</label>
                <input name="password"  type="password" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>Phone:</label>
                <input name="phoneNumber" class="easyui-textbox">
            </div>
            <div class="fitem">
                <label>Email:</label>
                <input name="email" class="easyui-textbox" validType="email">
            </div>
            <div class="fitem">
                <label>user name:</label>
                <input name="username" class="easyui-textbox"  required="true">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="fa fa-save" onclick="saveUser()" style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-pause" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>

    <script type="text/javascript">
        var url="userform";
        function newUser(){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','New User');
            $('#fm').form('clear');
            url = 'userform';
        }
        function editUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit User');
                $('#fm').form('load',row);
                url = 'userform?id='+row.id+"&version="+row.version;
            }
        }
        function saveUser(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.errorMsg){
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    }
                }
            });
        }
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
                    if (r){
                        $.post('userform',{id:row.id},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        },'json');
                    }
                });
            }
        }
        function doSearch(){
        	$('#dg').datagrid('load',{
        		
        	});
        }
    </script>
    <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
    </style>
</body>
</html>