<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
	<title>Zone</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%-- <spring:url value="/resources/images/search_icon.png" var="searchicon" /> --%>
	<spring:url value="/resources/bootstrap/css/bootstrap.min.css"	var="bootstrapcss" />
	<link rel="stylesheet" href="${bootstrapcss}">
	<spring:url value="/resources/bootstrap/css/simple-sidebar.css"	var="simplesidebarcss" />
	<link rel="stylesheet" href="${simplesidebarcss}">
	<spring:url value="/resources/css/common.css" var="commoncss" />
	<link rel="stylesheet" type="text/css" href="${commoncss}">
	<!-- <link rel="stylesheet" type="text/css" href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'> -->
	<spring:url value="/resources/javascript/jquery.js" var="jqueryjs" />
	<script src="${jqueryjs}"></script>
	<spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapjs" />
	<script src="${bootstrapjs}"></script>
	<spring:url value="/resources/javascript/common.js" var="commonjs" />
	<script src="${commonjs}" type="text/javascript"></script>
	<spring:url value="/resources/javascript/zone.js" var="zonejs" />
	<script src="${zonejs}" type="text/javascript"></script>
	<%-- <spring:url value="/resources/javascript/search.js" var="searchjs" />
	<script src="${searchjs}"></script> --%>
	<jsp:include page="Header.jsp" />
</head>
<body>
	<div id="wrapper">
		<!-- Sidebar -->
		
		<div id="sidebar-wrapper" class="sidebar">
				<div class="zonesearch">
				<input type="text" id="search" placeholder="search" class="form-control"/></div>												
		
			<div id="exZones">
				<ul class="sidebar-nav slidetopnext" id="createdZonesList">
				</ul>
			</div>
		</div>
	<div class="beaconPage_img"> 
	<img src="<c:url value='/resources/images/beaconbg.jpg'/>" style="width:100%; height:100%">
		<div class="zonepagecontent">
	<!-- <button class="btn btn-info" onclick="createZone()">
							<b>CREATE ZONE</b>
						</button> -->
		<div class="zonelistshowcontent">
		<span class="closepopup"><i class="glyphicon glyphicon-plus" id="createZone" data-toggle="tooltip" title="Create Zone" style="right: 50%;"></i><i class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="Edit Zone" id="updateZone"></i></span>
		<div class="row">
			<div class="col-lg-12">
				<form:form id="zoneFormId" action="./editZone" method="post" commandName="zone">
					<form:input type="hidden" id="zonId" class="form-control" path="id" />
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
							<form:label path="description">Description</form:label>
							</div>
							<div class="col-md-7">
								<form:input type="text" id="desc" class="form-control formEdit" path="description"
									name="Description" readonly="true"/>
									
							</div>
							<div class="col-md-1"></div>
						</div>
						<form:errors path="description" class="errormsg"/>
						<div class="row" >
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="uuid">UUID</form:label>
							</div>
							<div class="col-md-7">
								<form:input type="text" id="uuid" name="UUID" class="form-control formEdit" path="uuid" readonly="true"/>
							</div>
							<div class="col-md-1"></div>
						</div>
						<form:errors path="uuid" class="errormsg"/>
						<div class="row" >
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="major">MAJOR</form:label>
							</div>
							<div class="col-md-7">
								<form:input type="text" name="major" class="form-control formEdit" path="major" readonly="true"/>
							</div>
							<div class="col-md-1"></div>
						</div>
						<form:errors path="major" class="errormsg"/>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="minor">MINOR</form:label>
							</div>
							<div class="col-md-7">
								<form:input type="text" name="minor" class="form-control formEdit" path="minor" readonly="true"/>
							</div>
							<div class="col-md-1"></div>
						</div>
						<form:errors path="minor" class="errormsg"/>
						<div class="zonelistshowcontenteditbtn" style="display:none;" id="updateBtn">
							<form:button path="type"  id="btnModify" class="btn btn-info" style="width:20%;margin-top:3%">Update</form:button>
						</div>
						<div class="zonelistshowcontenteditbtn" style="display:none;" id="createBtn">
							<form:button path="type"  id="btnModify" class="btn btn-info" style="width:20%;margin-top:3%">Create</form:button>
						</div>
				</form:form>
			</div>
		</div>
	</div>
	    
	    
	</div>
</div>
<div id="hideData"></div>
</body>
</html>