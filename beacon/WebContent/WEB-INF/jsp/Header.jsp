<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<spring:url value="/resources/javascript/jquery.jrumble.1.3.js" var="jrumblejs" />
	<script src="${jrumblejs}" type="text/javascript"></script>
	<script>
	$(function() {
		$('#viblogo').jrumble({
		x: 0,
		y: 0,
		rotation: 8,
		speed: 70,
		
		});
		$('#viblogo').hover(function() {
		$(this).trigger('startRumble');
		}, function() {
		$(this).trigger('stopRumble');
		});
		})
	</script>
</head>

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
						<a class="navbar-brand" href="showDashboard">
						<div class="img-circle swing">
						<img class="swing img-position" src="<c:url value="/resources/images/CompanyLogo.jpg"/>" style="width:100%;height:100%" id="viblogo" /></div></a>

					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<%-- <li class="page-scroll"><a href="<c:url value="/resources/jsp/Zone.jsp"/>"> --%>
							<li class="page-scroll"><a href="showZones"> <span
									class="glyphicon glyphicon-map-marker"></span>
									Zone
							</a></li>
							<li class="page-scroll"><a href="showContent"><span
									class="glyphicon glyphicon-edit"></span>
									Content</a></li>
							<li class="page-scroll"><a href="showAnalytics"><span
									class="glyphicon glyphicon-object-align-bottom"></span>
									Analytics</a></li>
							<li class="page-scroll"><a href="showProfile"><span
									class="glyphicon glyphicon-user"></span>
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
</html>