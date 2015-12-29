
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title><decorator:title default="Welcome" /> | <fmt:message
		key="webapp.name" /></title>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${ctx}/styles/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet"
	href="${ctx}/styles/jqwidgets/styles/jqx.arctic.css" type="text/css" />
	<link rel="stylesheet"
	href="${ctx}/styles/jqwidgets/styles/jqx.arctic.css" type="text/css" />
<link rel="stylesheet"
	href="${ctx}/webjars/bootstrap/3.3.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="${ctx}/styles/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/styles/scripts/demos.js"></script>
<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqx-all.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// Create a jqxMenu
		$("#jqxMenu").jqxMenu({
			width : '100%',
			height : '40px',
			theme : 'arctic'
		});
		$("#jqxMenu").css('visibility', 'visible');

		$("#events").append('<span>${pageContext.request.requestURI}</span');
	});
</script>
<decorator:head />
</head>
<body>

	<div id='jqxMenu' style='visibility: hidden; margin-right: 3px;'>
		<ul>
			<li><a href="#Home">主页</a></li>
			<li>解决方案
				<ul style='width: 250px;'>
					<li><a href="#Education">教育</a></li>
					<li><a href="#Financial">金融服务</a></li>
					<li><a href="#Government">政府</a></li>
					<li><a href="#Manufacturing">供应商</a></li>
					<li type='separator'></li>
					<li>Software Solutions
						<ul style='width: 220px;'>
							<li><a href="#ConsumerPhoto">Consumer photo and video</a></li>
							<li><a href="#Mobile">Mobile</a></li>
							<li><a href="#RIA">Rich Internet applications</a></li>
							<li><a href="#TechnicalCommunication">Technical
									communication</a></li>
							<li><a href="#Training">Training and eLearning</a></li>
							<li><a href="#WebConferencing">Web conferencing</a></li>
						</ul>
					</li>
					<li><a href="#">All industries and solutions</a></li>
				</ul>
			</li>
			<li>产品
				<ul>
					<li><a href="#PCProducts">PC products</a></li>
					<li><a href="#MobileProducts">Mobile products</a></li>
					<li><a href="#AllProducts">All products</a></li>
				</ul>
			</li>
			<li>技术支持
				<ul style='width: 200px;'>
					<li><a href="#SupportHome">Support home</a></li>
					<li><a href="#CustomerService">Customer Service</a></li>
					<li><a href="#KB">Knowledge base</a></li>
					<li><a href="#Books">Books</a></li>
					<li><a href="#Training">Training and certification</a></li>
					<li><a href="#SupportPrograms">Support programs</a></li>
					<li><a href="#Forums">Forums</a></li>
					<li><a href="#Documentation">Documentation</a></li>
					<li><a href="#Updates">Updates</a></li>
				</ul>
			</li>
			<li>社区
				<ul style='width: 200px;'>
					<li><a href="#Designers">Designers</a></li>
					<li><a href="#Developers">Developers</a></li>
					<li><a href="#Educators">Educators and students</a></li>
					<li><a href="#Partners">Partners</a></li>
					<li type='separator'></li>
					<li>By resource
						<ul>
							<li><a href="#Labs">Labs</a></li>
							<li><a href="#TV">TV</a></li>
							<li><a href="#Forums">Forums</a></li>
							<li><a href="#Exchange">Exchange</a></li>
							<li><a href="#Blogs">Blogs</a></li>
							<li><a href="#Experience Design">Experience Design</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li>公司信息
				<ul style='width: 180px;'>
					<li><a href="#About">关于我们</a></li>
					<li><a href="#Press">Press</a></li>
					<li><a href="#Investor">Investor Relations</a></li>
					<li><a href="#CorporateAffairs">Corporate Affairs</a></li>
					<li><a href="#Careers">职业</a></li>
					<li><a href="#Showcase">成功案例</a></li>
					<li><a href="#Events">事件</a></li>
					<li><a href="#ContactUs">Contact Us</a></li>
					<li><a href="#Become an affiliate">Become an affiliate</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="titlePanel"
		style="background-color: #86bfa0; height: 30px; padding-top: 5px; padding-left: 10px;">
		<div id='events'></div>
	</div>

	<div id="ContentPanel">
		<decorator:body />
	</div>
	</div>


	<div id="footer" class="container">
		<p>
			Created by <a href="http://appfuse.org">Larry</a>.
		</p>
	</div>
</body>
</html>
