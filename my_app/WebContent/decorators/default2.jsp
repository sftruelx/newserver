
<%@ include file="/common/taglibs.jsp" %>
 <%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <title><decorator:title default="Welcome"/> | <fmt:message key="webapp.name"/></title>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${ctx}/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${ctx}/webjars/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/styles/app.css">
    <script type="text/javascript" src="${ctx}/webjars/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/webjars/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/app.js"></script>
        <link rel="stylesheet" href="${ctx}/styles/jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="${ctx}/styles/scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/styles/scripts/demos.js"></script>
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxcore.js"></script>
        <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxexpander.js"></script>
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxsplitter.js"></script>
     <script type="text/javascript">
        $(document).ready(function () {
            // Create jqxTree
            $("#splitter").jqxSplitter({  width:'100%', height: 800, panels: [{ size: 250}] });
            $('#jqxTree').jqxTree({  height: '100%', width: '100%' });
            $('#jqxTree').css('visibility', 'visible');
            $('#jqxTree').on('select', function (event) {
                $("#ContentPanel").html("<div style='margin: 10px;'>" + event.args.element.id + "</div>");
            	//location.href='users'
            });
        });
    </script>
    <decorator:head/>
</head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<a name="top"></a>

    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value='/'/>">My Application</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="nav navbar-nav">
                <li><a href="${ctx}/" title="Home">Home</a></li>
                <li><a href="${ctx}/homePage" title="View function">Manage</a></li>
                <!-- Add new menu items here -->
                <security:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
                    <li class="logout"><a id="logout" href="${ctx}/logout">Logout</a></li>
                </security:authorize>
            </ul>
        </div>
        <script type="text/javascript">
            $('a[href="${pageContext.request.requestURI}"]').parent().addClass('active');
        </script>
    </div>
    
    <div id="splitter">
        <div>
            <div style="visibility: hidden; border: none;" id='jqxTree'>
                <ul>
                    <li id="Mail" item-expanded='true'>
                        <a href="users" "><img style='float: left; margin-right: 5px;' src='${ctx}/images/mailIcon.png' /><span
                            item-title="true">Mail</span></a>
                        <ul>
                            <li id="Calendar" item-expanded='true'>
                                <img style='float: left; margin-right: 5px;' src='${ctx}/images/calendarIcon.png' /><span
                                    item-title="true">Calendar</span> </li>
                            <li id="Contacts">
                                <img style='float: left; margin-right: 5px;' src='${ctx}/images/contactsIcon.png' /><span
                                    item-title="true">Contacts</span> </li>
                            <li id="Inbox">
                                <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                    item-title="true"><span>Inbox</span></span>
                                <ul>
                                    <li id="jQWidgets">
                                        <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                            item-title="true">jQWidgets</span>
                                        <ul>
                                            <li id="Admin">
                                                <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                                    item-title="true">Admin</span> </li>
                                            <li id="Corporate">
                                                <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                                    item-title="true">Corporate</span> </li>
                                            <li id="Finance">
                                                <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                                    item-title="true">Finance</span> </li>
                                            <li id="Other">
                                                <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                                    item-title="true">Other</span> </li>
                                        </ul>
                                    </li>
                                    <li id="Personal">
                                        <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                            item-title="true">Personal</span> </li>
                                </ul>
                            </li>
                            <li id="Deleted Items" item-expanded='true'>
                                <img style='float: left; margin-right: 5px;' src='${ctx}/images/recycle.png' /><span
                                    item-title="true"> <span>Deleted Items</span><span style='color: Blue;'> </span></span>
                                <ul>
                                    <li id="Today">
                                        <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                            item-title="true">Today</span> </li>
                                    <li id="Last Week">
                                        <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                            item-title="true">Last Week</span> </li>
                                    <li id="Last Month">
                                        <img style='float: left; margin-right: 5px;' src='${ctx}/images/folder.png' /><span
                                            item-title="true">Last Month</span> </li>
                                </ul>
                                <li id="Notes">
                                    <img style='float: left; margin-right: 5px;' src='${ctx}/images/notesIcon.png' /><span
                                        item-title="true">Notes</span> </li>
                                <li id="Settings">
                                    <img style='float: left; margin-right: 5px;' src='${ctx}/images/settings.png' /><span
                                        item-title="true">Settings</span> </li>
                                <li id="Favorites">
                                    <img style='float: left; margin-right: 5px;' src='${ctx}/images/favorites.png' /><span
                                        item-title="true">Favorites</span> </li>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div id="ContentPanel">
         <decorator:body/>
        </div>
    </div>
    
<div class="col-xs-3 col-sm-3 col-md-s">


</div>
<div class = "col-xs-9 col-sm-9 col-md-9">
 


</div>

    <div id="footer" class="container">
        <p>
            Created by <a href="http://appfuse.org">Larry</a>.
        </p>
    </div>
</body>
</html>
