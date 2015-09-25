<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<spring:url value="/resources/bootstrap/css/bootstrap.min.css"	var="bootstrapcss" />
	<link rel="stylesheet" href="${bootstrapcss}">
	<spring:url value="/resources/bootstrap/css/simple-sidebar.css"	var="simplesidebarcss" />
	<link rel="stylesheet" href="${simplesidebarcss}">
	<spring:url value="/resources/css/editContent.css" var="editContentcss" />
	<link rel="stylesheet" type="text/css" href="${editContentcss}">
	<link rel="stylesheet" type="text/css" href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'>
	<spring:url value="/resources/javascript/jquery.js" var="jqueryjs" />
	<script src="${jqueryjs}"></script>
	<spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapjs" />
	<script src="${bootstrapjs}"></script>
	<spring:url value="/resources/javascript/common.js" var="commonjs" />
	<script src="${commonjs}" type="text/javascript"></script>
	<jsp:include page="Header.jsp" />
</head>
<script>
		$( document ).ready( function() {
			tabs('coupon');
		});
		function tabs(divid){
		$(".contentTabs").hide();
		$("#"+divid).show();
		
		
		
		}
		
		
	$(document).ready(function(){
    $("#Title").keyup(function () {
        $("#message").val($('#Title').val());
		
    });
	$("#productTitle").keyup(function () {
        $("#message").val($('#productTitle').val());
		
    });
	$("#Text1").keyup(function () {
        $("#message1").val($('#Text1').val());
		
    });
	$("#productText1").keyup(function () {
        $("#message1").val($('#productText1').val());
		
    });
	$("#Text2").keyup(function () {
        $("#message2").val($('#Text2').val());
		
    });
	$("#Text3").keyup(function () {
        $("#message3").val($('#Text3').val());
		
    });
	
});
/* function crcontent(){

	$("#create_content").toggle();
       
    
} */
function showeditpopup(){

	$("#editpopup").toggle();
	$("#overlayid").toggle();
       
    
}


</script>
 
 <body>
 <!---<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Dashboard.html">Company name</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class=""><a href="Zone.html"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Zone </a></li>
        <li><a href="Content.html"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Content</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-object-align-bottom"></span> Analytics</a></li>
        <li><a href="Profile.html"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Profile</a></li>
  </ul>
  <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-question-sign"></span> Support</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-off"></span> Sign Up</a></li>
      </ul>
    </div>
  </div>
</nav> --->
	<div class="contentpage">
		<div class="row" style="margin-bottom: 0px">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="contentdesc">
					<div class="contentdeschead">
						<button type="button" class="btn btn-info">
							<b>CREATE CONTENT</b>
						</button>
						<div class="rightcomponents">
							<ul class="nav navbar-nav navbar-right">
								<li>Coupon</li>
								<li>Product</li>
								<li>Web Content</li>
							</ul>
						</div>
					</div>
					<div class="contentdescdetails">
						<div class="coupondesc">
							<h3>COUPON</h3><hr>
							<div class="coupon1">
								<div class="coupon1content">
									<ul>
										<li><span><img src="logo_50.png"></span> <span><b>Smart Around</b></span></li>
										<li><span><img src="../../resources/images/beacon.png" style="width: 40%; height: 40%"></span></li>
										<li><span><b>Title</b></span></li>
										<li>
											<div class="textcontent">
												<span class="text2content">Text2</span>
												<span class="text3content">Text3</span>
												<span class="text4content">Text4</span>
											</div>
										</li>
										<li><span>Text1</span></li>
									</ul>
								</div>
								<div class="editcontent">
									<span class="glyphicon glyphicon-pencil " onclick="showeditpopup()"></span>&nbsp&nbsp&nbsp 
									<span class="glyphicon glyphicon-trash "></span>
								</div>
							</div>
						</div>
						<div class="productdesc">
							<h3>PRODUCT</h3>
							<hr>
							<div class="coupon1">
								<div class="coupon1content">
									<ul>
										<li><span><img src="logo_50.png"></span> <span><b>Smart	Around</b></span></li>
										<li><span><img src="../../resources/images/beacon.png"	style="width: 40%; height: 40%"></span></li>
										<li><span><b>Title</b></span></li>
										<li>
											<div class="textcontent">
												<span class="text2content">Text2</span>
												<span class="text3content">Text3</span>
												<span class="text4content">Text4</span>
											</div>
										</li>
										<li><span>Text1</span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="webcontentdesc"></div>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<!-- </div> -->
	<!----Edit popups---->
	<div id="overlayid" class="k-overlay"></div>
	<div class="editcoupon" id="editpopup">
		<div class="row">
			<div class="col-md-2">Title:</div>
			<div class="col-md-10"><input type="text" class="form-control" id="Title" placeholder="Title"/></div>
		</div>
		<div class="row">
			<div class="col-md-2">Title:</div>
			<div class="col-md-10"><input type="text" class="form-control" id="Title" placeholder="Title"></div>
		</div>
		<div class="row">
			<div class="col-md-2">Text1:</div>
			<div class="col-md-10"><input type="text" class="form-control" id="Title" placeholder="Title"></div>
		</div>
		<div class="row">
			<div class="col-md-2">Text2:</div>
			<div class="col-md-10"><input type="text" class="form-control" id="Title" placeholder="Title"></div>
		</div>
		<div class="row">
			<div class="col-md-2">Text3:</div>
			<div class="col-md-4"><input type="text" class="form-control" id="Title" placeholder="Title"></div>
			<div class="col-md-2">Text4:</div>
			<div class="col-md-4"><input type="text" class="form-control" id="Title" placeholder="Title"></div>
		</div>
		<div class="row">
			<div class="col-md-2">Image:</div>
			<div class="col-md-10"><input type="File" class="form-control" id="Title" placeholder="Title"></div>
		</div>
		<div class="row">
			<div class="col-md-2">Start Date:</div>
			<div class="col-md-4"><input type="date" class="form-control" id="Title" placeholder="Title"></div>
			<div class="col-md-2">End Date:</div>
			<div class="col-md-4"><input type="date" class="form-control" id="Title" placeholder="Title"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-4"><button type="button" class="btn btn-success" style="width: 100%;">Save</button></div>
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<button type="button" class="btn btn-info" style="width: 100%;" onclick="showeditpopup()">Cancel</button>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>