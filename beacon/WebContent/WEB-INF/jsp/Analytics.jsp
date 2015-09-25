<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<spring:url value="/resources/bootstrap/css/bootstrap.min.css"	var="bootstrapcss" />
<link rel="stylesheet" href="${bootstrapcss}">
<spring:url value="/resources/css/common.css" var="commoncss" />
<link rel="stylesheet" type="text/css" href="${commoncss}">
<link rel="stylesheet" type="text/css" href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'>
<spring:url value="/resources/javascript/jquery.js" var="jqueryjs" />
<script src="${jqueryjs}"></script>
<spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapjs" />
<script src="${bootstrapjs}"></script>
<spring:url value="/resources/javascript/common.js" var="commonjs" />
<script src="${commonjs}" type="text/javascript"></script>
<spring:url value="/resources/javascript/chart.js" var="chartjs" />
<script src="${chartjs}"></script>
<jsp:include page="Header.jsp" />
<title>Analytics</title>
</head>
<%-- <header>
	<div class="row">
		<nav class="navbar navbar-inverse navbar-fixed-top menubar">
			<div class="col-sm-12">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="showDashboard"><img
							src="<c:url value="/resources/images/CompanyLogo.jpg"/>" id="img" /></a>

					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class="page-scroll"><a href="<c:url value="/resources/jsp/Zone.jsp"/>">
							<li class="page-scroll"><a href="showZones"> <span
									class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
									Zone
							</a></li>
							<li class="page-scroll"><a href="showContent"><span
									class="glyphicon glyphicon-edit" aria-hidden="true"></span>
									Content</a></li>
							<li class="page-scroll"><a href="showAnalytics"><span
									class="glyphicon glyphicon-object-align-bottom"></span>
									Analytics</a></li>
							<li class="page-scroll"><a href="showProfile"><span
									class="glyphicon glyphicon-user" aria-hidden="true"></span>
									Profile</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="page-scroll"><a href="showSupport"><span
									class="glyphicon glyphicon-question-sign"></span>Support</a></li>
							<li class="page-scroll"><a href="showLogin"><span
									class="glyphicon glyphicon-off"></span>Logout</a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</div>
</header> --%>
<body>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<center><h2>Analytics Page under construction.</h2></center>
</body>
</html>