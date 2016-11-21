<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>Bootstrap基础入门</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link href="${ctx }/static/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="${ctx }/static/js/jQuery/js/jquery-2.1.4.min.js"></script>
	<script src="${ctx }/static/js/bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="padding:50px;background-color:#ccc">
	<div class="logo"></div>
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<div class="container">
			<!--品牌图标-->
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Brand</a>
				<p class="navbar-text"><a href="#">欢迎光临！</a></p>
			</div><!--//品牌图标-->
			<!--折叠菜单-->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">起步</a></li>
					<li><a href="#">全局CSS样式</a></li>
					<li><a href="#">组件</a></li>
					<li><a href="#">插件</a></li>
					<li><a href="#">定制</a></li>
					<li><a href="#">网站实例</a></li>
				</ul>
				<!--导航条中的表单-->
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="button" class="btn btn-default">Search</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							中文版 <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">HTML</a></li>
							<li><a href="#">CSS</a></li>
							<li><a href="#">JavaScript</a></li>
							<li><a href="#">Apache</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
