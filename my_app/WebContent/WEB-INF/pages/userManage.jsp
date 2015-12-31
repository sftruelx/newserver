
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Basic CRUD Application - jQuery EasyUI CRUD Demo</title>
</head>
<body>
<div style="margin-left:10px;padding-bottom:6px">
    <h4>请输入查询条件</h4>
    <div id="tb" style="padding:3px">
	<span>   User name:</span>
	<input id="username" class="easyui-textbox">
	<span>Email:</span>
	<input id="email" class="easyui-textbox">
	</div>
</div>
    <table id="dg" title="My Users" class="easyui-datagrid" style="width:100%;height:80%"
            url="jsonlist"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="firstName" width="50">First Name</th>
                <th field="lastName" width="50">Last Name</th>
                <th field="phoneNumber" width="50">电话</th>
                <th field="email" width="50">Email</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-user" plain="true" onclick="newUser()">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-pencil" plain="true" onclick="editUser()">编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-trash" plain="true" onclick="destroyUser()">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="fa fa-search" plain="true" onclick="doSearch()">查找</a>
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
        		username: $('#username').val(),
        		email: $('#email').val()
        	});
        }
    </script>

</body>
</html>