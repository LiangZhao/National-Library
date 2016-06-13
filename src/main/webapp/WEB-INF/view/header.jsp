<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<% 
	String tPath = request.getContextPath();
	String tBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+tPath+"/";
	request.setAttribute("basePath", tBasePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${title}- National Library AU</title>
<link rel='stylesheet' href='${basePath}css/bootstrap.css' />

<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}
</style>
<link href="${basePath}css/bootstrap-responsive.css" rel="stylesheet"/>
<link href='${basePath}css/bootstrap-select.css' rel="stylesheet"/>
<script src="${basePath}js/jquery.js"></script>
<script src="${basePath}js/bootstrap.js"></script>
<script src="${basePath}js/bootstrap-select.js"></script>
<script src="${basePath}js/jquery.masonry.min.js"></script>
<script>
	$(document).ready(function(){
		var title = "${title}";
		console.log(typeof title);
		if (title == 'Home')
			$(".li-shouye").addClass("active");
		else if (title == 'Profile')
			$(".li-usercenter").addClass("active");
		else if (title == 'Login')
			$(".li-login").addClass("active");
		//$('select').selectpicker();
		
	});
	var baseUrl = "${basePath}";
</script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="${basePath}index.do">National Library AU</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="li-shouye"><a href="${basePath}index.do">Home</a></li>
						<c:choose>
							<c:when test="${user != null }">
								<li class="li-usercenter"><a href="${basePath }patron/patron.do">Librarian</a></li>
<%-- 								<li class="li-usercenter"><a href="${basePath }librarian/user_center.do">Librarian</a></li> --%>
								<li><a href="${basePath }librarian/logout.do">Logout</a></li>
							</c:when>
							<c:otherwise>
								<li class="li-login"><a href="${basePath }librarian/login.do">Login</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<form class="navbar-search pull-left form-book-search" action="${basePath }book/searchBookUser.do" method="post">
    					<input type="text" class="search-query" name="name" placeholder="Enter book title search" />
    				</form>
				</div>
			</div>
		</div>
	</div>