<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<spring:url value="/resources/bootstrap/css/bootstrap.min.css" var="bootstrapcss" />
	<link rel="stylesheet" href="${bootstrapcss}">
	<spring:url value="/resources/bootstrap/css/bootstrap-theme.min.css" var="bootstrapthemecss" />
	<link rel="stylesheet" href="${bootstrapthemecss}">
	<spring:url value="/resources/css/common.css" var="commoncss" />
	<link rel="stylesheet" type="text/css" href="${commoncss}">
	<spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapjs" />
	<script src="${bootstrapjs}"></script>
	<spring:url value="/resources/javascript/jquery.js" var="jqueryjs" />
	<script src="${jqueryjs}"></script>
</head>
<body>
	<div class="loginform">
	    <form:form class="form-horizontal" method="post" action="./registration" commandName="vendor">
	    <div class="form-group" id="form-group">
	            <label for="inputCompany" class="control-label col-md-2">Company Name</label>
	            <div class="col-md-10">
	           <form:input type="text" path="company" class="form-control" id="inputcompany" name="company" placeholder="company"/>
	           <form:errors path="company" class="errormsg"/>
	            </div>
	        </div>
	        <div class="form-group" id="form-group">
	            <label for="inputEmail" class="control-label col-md-2">Email</label>
	            <div class="col-md-10">
	           <form:input type="email" path="email" class="form-control" id="inputusername" name="email" placeholder="email"/>
	           <form:errors path="email" class="errormsg"/>
	            </div>
	        </div>
	        <div class="form-group" id="form-group">
	            <label for="inputPassword" class="control-label col-md-2">Password</label>
	            <div class="col-md-10">
	                <form:input type="password" path="password" class="form-control" id="inputPassword" name="password" placeholder="Password"/>
	                <form:errors path="password" class="errormsg"/>
	            </div>
	        </div>
	        <!-- <div class="form-group">
	            <div class="col-md-offset-2 col-md-10">
	                <div class="checkbox">
	                    <label><input type="checkbox"> Remember me</label>
	                </div>
	            </div>
	        </div> -->
	        <div class="form-group">
	            <div class="col-md-offset-2 col-md-10">
	                <form:button type="submit" value="signup" class="btn btn-primary">Signup</form:button>
	            </div>
	        </div>
	    </form:form>
	</div>
</body>
</html>                                 		