<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Beacon Dashboard</title>
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
<spring:url value="/resources/javascript/chart.js" var="chartjs" />
<script src="${chartjs}"></script>
<spring:url value="/resources/javascript/common.js" var="commonjs" />
<script src="${commonjs}" type="text/javascript"></script>
<jsp:include page="Header.jsp" />
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h4>Dashboard</h4>
			<div class="row">
				<div class="col-md-3">
					<div class="user">
						<div class="usercount">
							<img src="<c:url value="/resources/images/user.png"/>">
						</div>
						<div class="usercountright">
							<span>Users</span><br> <span>6318</span>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="user">
						<div class="visitscount">
							<img src="<c:url value="/resources/images/visits.png"/>">
						</div>
						<div class="usercountright">
							<span>Visits</span><br> <span>6318</span>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="user">
						<div class="detailscount">
							<img src="<c:url value="/resources/images/detail.png"/>">
						</div>
						<div class="usercountright">
							<span>Details</span><br> <span>6318</span>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="user">
						<div class="socialcount">
							<img src="<c:url value="/resources/images/social.png"/>">
						</div>
						<div class="usercountright">
							<span>Social</span><br> <span>6318</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8">
				<div class="graph">
					<div class="chart" id="canvas-holder">
						<canvas id="canvas" width="350px" height="160px" /></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<ul class="nav nav-pills nav-stacked sidebar mainsidelist">
					<li class="Active"><a href="showZones"><span
							class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
							Zone </a></li>
					<li class="Active"><a href="showContent"><span
							class="glyphicon glyphicon-edit" aria-hidden="true"></span>
							Content</a></li>
					<li class="Active"><a href="showAnalytics"><span
							class="glyphicon glyphicon-object-align-bottom"></span> Analytics</a></li>
					<li class="Active"><a href="showProfile"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span>
							Profile</a></li>
					<li class="Active">
					<div class="dashboardimage">
					<img
						src="<c:url value="/resources/images/dashbeacons.jpg"/>" width="100%"
						height="100%" id="myimg"></div></li>
				</ul>
			</div>
			<div class="clearfix visible-lg"></div>
		</div>
	</div>
</body>
<!-- <script type="text/javascript">
$(function(){
	//alert("Hello");
	slid();
});
</script> -->
</html>