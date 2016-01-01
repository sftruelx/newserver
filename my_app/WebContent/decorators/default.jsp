<%@ include file="/common/taglibs.jsp" %>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <title><decorator:title default="欢迎"/> | <fmt:message key="webapp.name"/></title>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${ctx}/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${ctx}/webjars/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/styles/app.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css/font-awesome.css">
    <script type="text/javascript" src="${ctx}/webjars/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/webjars/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/app.js"></script>
    <decorator:head/>
</head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<a name="top"></a>

    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="<c:url value='/'/>">My Application</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="nav navbar-nav">
                <li><a href="${ctx}/" title="Home">主页</a></li>
                <li><a href="${ctx}/homePage" title="View function">功能区</a></li>
                <!-- Add new menu items here -->
                <security:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
                    <li class="logout"><a id="logout" href="${ctx}/logout">注销</a></li>
                </security:authorize>
            </ul>
        </div>
        <script type="text/javascript">
            $('a[href="${pageContext.request.requestURI}"]').parent().addClass('active');
        </script>
    </div>

    <div class="container">
        <div class="row">
            <%@ include file="/messages.jsp"%>
            <decorator:body/>
        </div>
    </div>

    <div id="footer" class="container"  style="position:absolute;bottom:0px;padding:0px;margin:20px;">
        <p>
            Created by <a href="./common/contact-form.jsp">Larry<i class="fa fa-send login-with"></i></a>.
        </p>
    </div>
</body>
</html>
