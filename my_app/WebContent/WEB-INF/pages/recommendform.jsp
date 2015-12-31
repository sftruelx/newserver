<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="recommendDetail.title"/></title>
    <meta name="menu" content="RecommendMenu"/>
    <meta name="heading" content="<fmt:message key='recommendDetail.heading'/>"/>
</head>

<c:set var="delObject" scope="request"><fmt:message key="recommendList.recommend"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<div class="col-sm-3">
    <h2><fmt:message key="recommendDetail.heading"/></h2>
    <fmt:message key="recommendDetail.message"/>
</div>

<div class="col-sm-6">
<form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
<form:form commandName="recommend" method="post" action="recommendform" cssClass="well"
           id="recommendForm" onsubmit="return validateRecommend(this)">
<form:hidden path="id"/>
    <spring:bind path="recommend.content">
    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
    </spring:bind>
        <appfuse:label key="recommend.content" styleClass="control-label"/>
        <form:input cssClass="form-control" path="content" id="content"  maxlength="3000"/>
        <form:errors path="content" cssClass="help-block"/>
    </div>
    <spring:bind path="recommend.createId">
    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
    </spring:bind>
        <appfuse:label key="recommend.createId" styleClass="control-label"/>
        <form:input cssClass="form-control" path="createId" id="createId"  maxlength="255"/>
        <form:errors path="createId" cssClass="help-block"/>
    </div>
    <spring:bind path="recommend.createTime">
    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
    </spring:bind>
        <appfuse:label key="recommend.createTime" styleClass="control-label"/>
        <form:input cssClass="form-control" path="createTime" id="createTime"  maxlength="19"/>
        <form:errors path="createTime" cssClass="help-block"/>
    </div>
    <spring:bind path="recommend.title">
    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
    </spring:bind>
        <appfuse:label key="recommend.title" styleClass="control-label"/>
        <form:input cssClass="form-control" path="title" id="title"  maxlength="450"/>
        <form:errors path="title" cssClass="help-block"/>
    </div>
    <spring:bind path="recommend.type">
    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
    </spring:bind>
        <appfuse:label key="recommend.type" styleClass="control-label"/>
        <form:input cssClass="form-control" path="type" id="type"  maxlength="255"/>
        <form:errors path="type" cssClass="help-block"/>
    </div>
    <spring:bind path="recommend.url">
    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
    </spring:bind>
        <appfuse:label key="recommend.url" styleClass="control-label"/>
        <form:input cssClass="form-control" path="url" id="url"  maxlength="3000"/>
        <form:errors path="url" cssClass="help-block"/>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-primary" id="save" name="save" onclick="bCancel=false">
            <i class="icon-ok icon-white"></i> <fmt:message key="button.save"/>
        </button>
        <c:if test="${not empty recommend.id}">
            <button type="submit" class="btn btn-danger" id="delete" name="delete" onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
                <i class="icon-trash icon-white"></i> <fmt:message key="button.delete"/>
            </button>
        </c:if>

        <button type="submit" class="btn btn-default" id="cancel" name="cancel" onclick="bCancel=true">
            <i class="icon-remove"></i> <fmt:message key="button.cancel"/>
        </button>
    </div>
</form:form>
</div>

<v:javascript formName="recommend" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $("input[type='text']:visible:enabled:first", document.forms['recommendForm']).focus();
    });
</script>
