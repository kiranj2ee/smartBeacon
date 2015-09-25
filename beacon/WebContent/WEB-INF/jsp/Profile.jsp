<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Profile</title>
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
<jsp:include page="Header.jsp" />
<script>
$(function(){
	tab("profile");
});

function profileupdate() {
	$("#profileupdatepopup").toggle();
	$("#overlayid").toggle();
}

</script>
</head>
<body>
	<div class="container profilecontainer" id="container">
		<div class="profile">
			<ul class="nav nav-tabs" role="tablist">
				<li><a href="#" onclick="tabs('profile')">PROFILE</a></li>

				<li><a href="#" onclick="tabs('API')">API KEY</a></li>

			</ul>
		</div>
		<form:form action="./updateProfile"  method="post" enctype="multipart/form-data" commandName="profile">
			<div class="profileinputs beacontabs" id="profile">
				<div class="row">
					<div class="col-md-3">
							<form:label for="text" path="shopName">Shop Name</form:label>
					</div>
					<div class="col-md-6">
							<form:input type="text" class="form-control" id="" path="shopName" name="shopName" placeholder="Enter Shop Name"></form:input>
					</div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-3">
							<form:label for="email" path="email">Email</form:label>
					</div>
					<div class="col-md-6">
							<form:input type="email" name="email" path="email" class="form-control" id="" placeholder="Enter Email"></form:input>
					</div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-3">
							<form:label for="text" path="initialPassword">Initial Password</form:label>
					</div>
					<div class="col-md-6">
							<form:input name="initialPassword" path="initialPassword" class="form-control" id="" placeholder="Initial Password" type="password"></form:input>
					</div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-3">
							<form:label for="pwd" path="newPassword">New Password</form:label>
					</div>
					<div class="col-md-6">
							<form:input type="password" path="newPassword" name="newPassword" class="form-control" id="" placeholder="New Password"></form:input>
					</div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-3">
							<form:label for="pwd" path="repeatNewPassword">Repeat New Password</form:label>
					</div>
					<div class="col-md-6">
							<form:input type="password" name="repeatNewPassword" path="repeatNewPassword"	class="form-control" id="" placeholder="Reapeat New Password"></form:input>
					</div>
					<div class="col-md-3"></div>
				</div>
				<%-- <div class="row">
					<div class="col-md-3">
							<form:label for="text" path="timeZone">TimeZone</form:label>
					</div>
					<div class="col-md-6">
							<form:input type="time" name="timeZone" path="timeZone" class="form-control" id="" placeholder=""></form:input>
						<div class="bfh-selectbox bfh-timezones" data-country="US"></div>
	
					</div>
					<div class="col-md-3"></div>
				</div> --%>
				<div class="row">
					<div class="col-md-3">
							<form:label for="text" path="shopLogo">Shop Logo</form:label>
					</div>
					<div class="col-md-6">
							<form:input type="file" name="shopLogo" path="shopLogo" class="form-control" id=""></form:input>
					</div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<input type="submit" value="Update" class="btn btn-success"/><!-- onclick="profileupdate()" -->
						<!-- <input type="button" value="popup" class="btn btn-success" /> -->
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</form:form>
		<div class="APIinputs beacontabs" id="API" style="display:none;">
			<div>API KEY to be registered</div>
		</div>
	</div>
	<div id="overlayid" class="k-overlay"></div>


	<div class="profileupdatepopup" id="profileupdatepopup">
	<span class="closepopup"><i class="glyphicon glyphicon-remove" onclick="profileupdate()"></i></span>
		<h5>Thank you</h5>
		<h5>Your Profile Updated...:)</h5><br>
	
	</div>
</body>
</html>