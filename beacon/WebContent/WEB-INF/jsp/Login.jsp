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
	<spring:url value="/resources/javascript/common.js" var="commonjs" />
	<script src="${commonjs}" type="text/javascript"></script>
</head>
 <script type="text/javascript">
/* $(function(){
	 $( '#signinForm' ).each(function(){
		    this.reset();
	});
}); */
$(function() {
	 
    if (localStorage.chkbx && localStorage.chkbx != '') {
        $('#remember_me').attr('checked', 'checked');
        $('#inputusername').val(localStorage.usrname);
        $('#inputPassword').val(localStorage.pass);
    } else {
        $('#remember_me').removeAttr('checked');
        $('#inputusername').val('');
        $('#inputPassword').val('');
    }

    $('#remember_me').click(function() {

        if ($('#remember_me').is(':checked')) {
            // save username and password
            localStorage.usrname = $('#inputusername').val();
            localStorage.pass = $('#inputPassword').val();
            localStorage.chkbx = $('#remember_me').val();
        } else {
            localStorage.usrname = '';
            localStorage.pass = '';
            localStorage.chkbx = '';
        }
    });
});
</script>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top menubar">
			<div class="col-sm-12">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">
						<div class="loginimg">
						<img class="swing img-position" src="<c:url value="/resources/images/CompanyLogo.jpg"/>" id="img" /></div></a>

					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
					
						<ul class="nav navbar-nav navbar-right">
							
							<li class="page-scroll"><a><span onclick="signup()">Sign up</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	<div class="loginform">
		<img src="<c:url value='/resources/images/loginbg.jpg'/>" style="width:100%; height:100%">
		
		<div class="Details">

	<span style="color:#fff">Login</span><br><br>
	
	
	<form:form class="form-horizontal" id="signinForm" method="post" action="./login" commandName="login">
	<form:input type="email" path="email" class="form-control" id="inputusername" name="email" placeholder="email"/>
	<form:errors path="email" class="errormsg"/><br>
	<!-- <input type="email" class="form-control" Placeholder = "Email"></br> -->
	<form:input type="password" path="password" class="form-control" id="inputPassword" name="password" placeholder="Password"/>
    <form:errors path="password" class="errormsg"/><br>
     <label style="float: left;"><input type="checkbox" id="remember_me">Remember me</label>
	<!-- <input type="email" class="form-control" Placeholder = "Password"> --><br><br>
	<form:button type="submit" value="login" class="btn btn-success" style="width: 100%;">Login</form:button><br><br>
	<%-- <a href="showRegistration"><form:button type="button" value="signup" style="width: 100%;" class="btn btn-primary">SignUp</form:button></a> --%>
	<!-- <button type="button" class="btn btn-success" style="width: 100%;">Sign in</button> -->
	</form:form>
	
	
</div>
	    <%-- <form:form class="form-horizontal" method="post" action="./login" commandName="login">
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
	        <div class="form-group">
	            <div class="col-md-offset-2 col-md-10">
	                <div class="checkbox">
	                    <label><input type="checkbox">Remember me</label>
	                </div>
	            </div>
	        </div>
	        <div class="form-group">
	            <div class="col-md-offset-2 col-md-10">
	                <form:button type="submit" value="login" class="btn btn-primary">Login</form:button>
	                <a href="showRegistration"><form:button type="button" value="signup" class="btn btn-primary">SignUp</form:button></a>
	            </div>
	        </div>
	    </form:form> --%>
	</div>
	<div id="overlayid" class="k-overlay"></div>


	<div class="signuppopup" id="signup">
	
	<span class="closepopup"><i class="glyphicon glyphicon-remove" onclick="signup()"></i></span>
		<h4>SignUp</h4><br>
	<form:form class="form-horizontal" id="signupForm" method="post" action="./registration" commandName="vendor">
	<!-- <input type="email" class="form-control" Placeholder = "Email"> -->
	<form:input type="text" path="company" class="form-control" id="inputcompany" name="company" placeholder="company"/>
 	<form:errors path="company" class="errormsg"/>
	<br>
	
	<!-- <input type="password" class="form-control" Placeholder = "Password"> -->
	<form:input type="email" path="email" class="form-control" id="inputusername" name="email" placeholder="email"/>
    <form:errors path="email" class="errormsg"/>
	<br>
	<!-- <input type="password" class="form-control" Placeholder = "Confirm Password"> -->
	<form:input type="password" path="password" class="form-control" id="inputPassword" name="password" placeholder="Password"/>
    <form:errors path="password" class="errormsg"/>
	<br>
	<!-- <button type="button" class="btn btn-success" style="width: 100%;">Create Account</button> -->
	 <form:button type="submit" value="signup" class="btn btn-primary">Signup</form:button>
	</form:form>
	</div>
</body>
</html>                                 		