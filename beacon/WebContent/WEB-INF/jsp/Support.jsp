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
<title>Support</title>
</head>
<body>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<center><h2>Support Page under construction.</h2></center>
</body>
</html>