<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>content</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<spring:url value="/resources/bootstrap/css/bootstrap.min.css"	var="bootstrapcss" />
	<link rel="stylesheet" href="${bootstrapcss}">
	<spring:url value="/resources/bootstrap/css/simple-sidebar.css"	var="simplesidebarcss" />
	<link rel="stylesheet" href="${simplesidebarcss}">
	<spring:url value="/resources/css/common.css" var="commoncss" />
	<link rel="stylesheet" type="text/css" href="${commoncss}">
	<%-- <spring:url value="/resources/css/editContent.css" var="editContentcss" />
	<link rel="stylesheet" type="text/css" href="${editContentcss}"> --%>
	<link rel="stylesheet" type="text/css" href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'>
	<spring:url value="/resources/javascript/jquery.js" var="jqueryjs" />
	<script src="${jqueryjs}"></script>
	<spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapjs" />
	<script src="${bootstrapjs}"></script>
	<spring:url value="/resources/javascript/common.js" var="commonjs" />
	<script src="${commonjs}" type="text/javascript"></script>
	<spring:url value="/resources/javascript/content.js" var="contentjs" />
	<script src="${contentjs}" type="text/javascript"></script>
	<spring:url value="/resources/javascript/angular.js" var="angularjs" />
	<script src= "${angularjs}"></script>
	<jsp:include page="Header.jsp" />
</head>
<body>
	<div class="contentpage">
		<div class="row" style="margin-bottom: 0px">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="contentdesc">
					<div class="contentdeschead"><a href="createContent">
						<button type="button" class="btn btn-info"><!-- onclick="showCreatePopup()" -->
							<b>CREATE CONTENT</b>
						</button></a>
					</div>
					<div class="tabs">
			<ul>
	            <li><div id="couponListId" class="tabsList" onclick="tabs('couponList')">Coupon</div></li>
	            <li><div id="productListId" class="tabsList" onclick="tabs('productList')">Product</div></li>
	            <li><div id="webProductListId" class="tabsList" onclick="tabs('webProductList')">Web Content</div></li>
            </ul>  
			</div>
					<div class="contentdescdetails">
						<div class="coupondesc tabsListContent" id="couponList">
							
							<div class="uldiv"><ul class="contentList " id="couponsDiv">
							</ul></div>
						</div>
						<div class="productdesc tabsListContent" id="productList">
							
							<div class="uldiv"><ul class="contentList" id="productsDiv">
							</ul></div>
						</div>
						<div class="webproductdesc tabsListContent" id="webProductList">
							
							<div><ul class="contentList " id="webProductsDiv">
							</ul></div>
						</div>
					</div>
					<!-- <div class="webcontentdesc"></div> -->
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<!-- </div> -->
	<!----Edit popups---->
	<div id="overlayid" class="k-overlay"></div>
	<!-- edit coupon start -->
	<form:form action="./saveCoupon"  method="post" enctype="multipart/form-data" commandName="content">
	<div class="editcoupon" id="editpopup">
		<div class="row">
			<div class="col-md-2">Title:</div>
			<div class="col-md-10"><form:input type="text" path="title" class="form-control" id="title" placeholder="Title" /></div>
		<form:input type="hidden" id="hiddenCId" path="id"></form:input>
		<form:input type="hidden" id="hiddenCType" path="type"></form:input>
		</div>
		<!-- <div class="row">
			<div class="col-md-2">Title:</div>
			<div class="col-md-10"><input type="text" class="form-control" id="Title" placeholder="Title"></div>
		</div> -->
		<div class="row">
			<div class="col-md-2">Text1:</div>
			<div class="col-md-10"><form:input type="text" path="text1" name="text1" class="form-control" id="text1" placeholder="description" /></div>
		</div>
		<div class="row">
			<div class="col-md-2">Text2:</div>
			<div class="col-md-10"><form:input type="text" path="text2" name="text2" class="form-control" id="text2" placeholder="text2"  /></div>
		</div>
		<div class="row">
			<div class="col-md-2">Text3:</div>
			<div class="col-md-4"><%-- <form:input path="text3" maxlength="50" class="form-control" name="text3" placeholder="Note 1" id="text3" type="text" /> --%>
			<form:input path="text3" maxlength="50" class="form-control" name="text3" placeholder="Note 1" id="text3" type="text" />
			</div>
			<div class="col-md-2">Text4:</div>
			<div class="col-md-4"><!-- <input type="text" class="form-control" id="Title" placeholder="Title"> -->
			<form:input path="text4" maxlength="50" class="form-control" name="text4" placeholder="Note 2" id="text4" type="text" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">Image:</div>
			<div class="col-md-10"><input type="File" class="form-control" id="Title" placeholder="Title"></div>
		</div>
		<div class="row">
			<div class="col-md-2">Zone:</div>
			<div class="col-md-10"><%-- <select class="form-control" id="Title" placeholder="Title" items="${content.zones}"></select> --%>
			<%-- <form:input path="zoneId" type="hidden" name="Zone" class="form-control zoneId" id="zoneId" placeholder="Text"/> --%>
								<form:select path="zoneId" name="Zone" class="form-control zoneId" id="zoneSelect1">
								 	<%-- <form:option value="-1L" label="--- Select ---" />  --%>
									<form:options items="${content.zones}" />
								</form:select>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">Start Date:</div>
			<div class="col-md-4"><form:input path="startDate" type="date" name="startDate" class="form-control" id="startDate" placeholder="Text"/></div>
			<div class="col-md-2">End Date:</div>
			<div class="col-md-4"><form:input path="endDate" type="date" name="endDate" class="form-control" id="endDate" placeholder="Text"/></div>
		</div>
		<div class="row">
			<div class="col-md-2">Category:</div>
			<div class="col-md-10"><form:input path="category" type="text" name="category" class="form-control" id="category" placeholder="category" /></div>
		</div>
		<div class="row">
			<div class="col-md-2">Color:</div>
			<div class="col-md-10"><form:input path="color" type="color" name="color" class="form-control" id="colorPic" placeholder="Choose color" /></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-4"><form:button type="submit" class="btn btn-success" style="width: 100%;">Save</form:button></div>
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<button type="button" class="btn btn-info" style="width: 100%;" onclick="closePopup('editpopup')">Cancel</button>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	</form:form>
	<!-- edit coupon end -->
	<!-- edit product start -->
	<form:form action="./saveProduct"  method="post" enctype="multipart/form-data" commandName="content">
	<div class="editcoupon" id="editproductpopup">
		<div class="row">
			<div class="col-md-2">Title:</div>
			<div class="col-md-10"><form:input type="text" path="title" class="form-control" id="title_pr" placeholder="Title" /></div>
			<form:input type="hidden" id="hiddenCId" path="id"></form:input>
		<form:input type="hidden" id="hiddenCType" path="type"></form:input>
		</div>
		<div class="row">
			<div class="col-md-2">Text1:</div>
			<div class="col-md-10"><form:input type="text" path="text1" name="text1" class="form-control" id="text1_pr" placeholder="description" /></div>
		</div>
		<div class="row">
			<div class="col-md-2">Text2:</div>
			<div class="col-md-10"><form:input type="text" path="text2" name="text2" class="form-control" id="text2_pr" placeholder="text2"  /></div>
		</div>
		<div class="row">
			<div class="col-md-2">Image:</div>
			<div class="col-md-10"><input type="File" class="form-control" id="Title" placeholder="Title"></div>
		</div>
		<div class="row">
			<div class="col-md-2">Zone:</div>
			<div class="col-md-10"><%-- <select class="form-control" id="Title" placeholder="Title" items="${content.zones}"></select> --%>
			<%-- <form:input path="zoneId" type="hidden" name="Zone" class="form-control zoneId" id="zoneId_pr" placeholder="Text"/> --%>
								<form:select path="zoneId" name="Zone" class="form-control zoneId" id="zoneSelect">
								 	<%-- <form:option value=-1L label="--- Select ---" /> --%>
									<form:options items="${content.zones}" />
								</form:select>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">Start Date:</div>
			<div class="col-md-4"><form:input path="startDate" type="date" name="startDate" class="form-control" id="startDate_pr" placeholder="Text"/></div>
			<div class="col-md-2">End Date:</div>
			<div class="col-md-4"><form:input path="endDate" type="date" name="endDate" class="form-control" id="endDate_pr" placeholder="Text"/></div>
		</div>
		<div class="row">
			<div class="col-md-2">Category:</div>
			<div class="col-md-10"><form:input path="category" type="text" name="category" class="form-control" id="category_pr" placeholder="category" /></div>
		</div>
		<div class="row">
			<div class="col-md-2">Color:</div>
			<div class="col-md-10"><form:input path="color" type="color" name="color" class="form-control" id="colorPic_pr" placeholder="Choose color" /></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-4"><form:button type="submit" class="btn btn-success" style="width: 100%;">Save</form:button></div>
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<button type="button" class="btn btn-info" style="width: 100%;" onclick="closePopup('editproductpopup')">Cancel</button>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	</form:form>
	<!-- edit product end -->
	<!-- edit web product start -->
	<form:form action="./saveWebProduct"  method="post" enctype="multipart/form-data" commandName="content">
	<div class="editcoupon" id="editwebproductpopup">
		<div class="row">
			<div class="col-md-2">Title:</div>
			<div class="col-md-10"><form:input type="text" path="title" class="form-control" id="title_wpr" placeholder="Title" /></div>
			<form:input type="hidden" id="hiddenCId" path="id"></form:input>
			<form:input type="hidden" id="hiddenCType" path="type"></form:input>
		</div>
		<!-- <div class="row">
			<div class="col-md-2">Title:</div>
			<div class="col-md-10"><input type="text" class="form-control" id="Title" placeholder="Title"></div>
		</div> -->
		<div class="row">
			<div class="col-md-2">Text1:</div>
			<div class="col-md-10"><form:input type="text" path="text1" name="text1" class="form-control" id="text1_wpr" placeholder="description" /></div>
		</div>
		<div class="row">
			<div class="col-md-2">Text2:</div>
			<div class="col-md-10"><form:input type="text" path="text2" name="text2" class="form-control" id="text2_wpr" placeholder="text2"  /></div>
		</div>
		<div class="row">
			<div class="col-md-2">URL:</div>
			<div class="col-md-10"><form:input path="url" type="text" name="Url" class="form-control" id="url_wpr" placeholder="http://www.example.com"/></div>
		</div>
		
		<div class="row">
			<div class="col-md-2">Zone:</div>
			<div class="col-md-10"><%-- <select class="form-control" id="Title" placeholder="Title" items="${content.zones}"></select> --%>
			<%-- <form:input path="zoneId" type="hidden" name="Zone" class="form-control zoneId" id="zoneId_wpr" placeholder="Text"/> --%>
								<form:select path="zoneId" name="Zone" class="form-control zoneId" id="zoneSelect">
								 	<%-- <form:option value=-1L label="--- Select ---" /> --%>
									<form:options items="${content.zones}" />
								</form:select>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">Start Date:</div>
			<div class="col-md-4"><form:input path="startDate" type="date" name="startDate" class="form-control" id="startDate_wpr" placeholder="Text"/></div>
			<div class="col-md-2">End Date:</div>
			<div class="col-md-4"><form:input path="endDate" type="date" name="endDate" class="form-control" id="endDate_wpr" placeholder="Text"/></div>
		</div>
		<div class="row">
			<div class="col-md-2">Category:</div>
			<div class="col-md-10"><form:input path="category" type="text" name="category" class="form-control" id="category_wpr" placeholder="category" /></div>
		</div>
		<div class="row">
			<div class="col-md-2">Color:</div>
			<div class="col-md-10"><form:input path="color" type="color" name="color" class="form-control" id="colorPic_wpr" placeholder="Choose color" /></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-4"><form:button type="submit" class="btn btn-success" style="width: 100%;">Save</form:button></div>
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<button type="button" class="btn btn-info" style="width: 100%;" onclick="closePopup('editwebproductpopup')">Cancel</button>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	</form:form>
	<!-- edit web product end -->
	<!-- Start -->
	<!-- <div id="overlayid" class="k-overlay"></div> -->
	<%-- <div class="createcontent" ng-app = "">
		<div id="overlayid" class="k-overlay"></div>

		<div class="create_content" id="create_content" style="z-index: 10003;">

			<span class="closepopup"><i class="glyphicon glyphicon-remove" onclick="showCreatePopup()"></i></span>

			

			<div class="content">
				<ul class="nav nav-tabs">
					<li><a href="#" onclick="tabs('coupon')">Coupon</a></li>
					<li><a href="#" onclick="tabs('product')">Product</a></li>
					<li><a href="#" onclick="tabs('webproduct')">Web Product</a></li>
				</ul>
			</div>

			<form:form action="./saveCoupon"  method="post" enctype="multipart/form-data" commandName="content"> 
			<form:form action="./saveCoupon"  method="post" commandName="content">
				<!-- <input type="hidden" value="{}" id="couponDetails"/> -->
				<div class="container-fluid">
					<div class="coupon_inputs contentTabs coupon" id="coupon">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label for="text" path="title">Title</form:label>
							</div>
							<div class="col-md-7">
								<form:input type="text" path="title" class="form-control" id="Title" ng-model="Title" placeholder="Title" />
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label for="text" path="text1">Text1</form:label>
							</div>
							<div class="col-md-7">
								<form:input type="text" path="text1" name="text1" class="form-control" id="Text1" placeholder="description" ng-model="Text1"/>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="text2" for="text">Text2</form:label>
							</div>
							<div class="col-md-7">
								<form:input type="text" path="text2" name="text2" class="form-control" id="text2" placeholder="text2" ng-model="Text2" />
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label for="text" path="text3" >Text3andtext4</form:label>
							</div>
							<div class="col-md-3">
								<div class="smallTextRight">
									<form:input path="text3" maxlength="50" class="form-control" name="text3" placeholder="Note 1" id="text3" type="text" ng-model="Text3"/>
								</div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<div class="smallTextLeft">
									<form:input path="text4" maxlength="50" class="form-control" name="text4" placeholder="Note 2" id="text4" type="text" ng-model="Text4"/>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="myImage" for="text">Image</form:label>
							</div>
							<div class="col-md-7">
							 	<input type="file" name="myImage" class="form-control" id="chooseFiles" accept="image/*" onchange="loadFile1(event)"/> 
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="zoneId" for="text">Zone</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="zoneId" type="text" name="Zone" class="form-control" id="zone"/>
								<form:select path="zoneId" name="Zone" class="form-control" id="zoneSelect">
								 	<form:option value=-1L label="--- Select ---" />
									<form:options items="${content.zones}" />
								</form:select>
								
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="startDate" for="text">Start Date</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="startDate" type="date" name="startDate" class="form-control"/>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="endDate" for="text">End Date</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="endDate" type="date" name="endDate" class="form-control"/>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="category" for="text">Category</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="category" type="text" name="category" class="form-control" id="category" placeholder="category" />
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="color" for="text">Choose Color</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="color" type="color" name="color" class="form-control" id="colorPic" placeholder="Choose color" />
							</div>
							<div class="col-md-1"></div>
						</div> 
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3"></div>
							<div class="col-md-7">
								<form:input path="type" type="submit" id="btnCoupon" value="Coupon" class="btn btn-success" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</form:form>
			<form:form action="./saveProduct" method="post" enctype="multipart/form-data" commandName="content">
				<div class="APIinputs contentTabs" id="product">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="title" for="text">Title</form:label>
						</div>
						<div class="col-md-7">
							<form:input type="text" path="title" name="Title" class="form-control" id="productTitle" placeholder="Title" ng-model="Title"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="text1" for="text">Text1</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="text1" type="text" name="Text1" class="form-control" id="productText1" placeholder="Text"	ng-model="Text1"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="text2" for="text">Text2</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="text2" type="text" name="Text2" class="form-control" id="productText2" placeholder="Text2"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="myImage" for="text">Image</form:label>
						</div>
						<div class="col-md-7">
							<input  type="file" name="myImage" class="form-control" id="chooseFiles1" accept="image/*" onchange="loadFile2(event)"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="zoneId" for="text">Zone</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="zoneId" type="hidden" name="Zone" class="form-control" id="" placeholder="Text"/>
							<form:select path="zoneId" name="Zone" class="form-control" id="zoneSelect">
									<form:options items="${content.zones}" />
								</form:select>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="startDate" for="text">Start Date</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="startDate" type="date" name="StartDate" class="form-control"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="endDate" for="text">End Date</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="endDate" type="date" name="EndDate" class="form-control"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="category" for="text">Category</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="category" type="text" name="category" class="form-control" id="category" placeholder="category" />
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="color" for="text">Choose Color</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="color" type="color" name="color" class="form-control" id="colorPic" placeholder="Choose color" />
							</div>
							<div class="col-md-1"></div>
						</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3"></div>
						<div class="col-md-7">
							<form:input path="type" type="submit" value="Product" class="btn btn-success" />
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</form:form>
			<form:form action="./saveWebProduct" method="post" commandName="content">
				<div class="APIinputs contentTabs" id="webproduct">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="title" for="text">Title</form:label>
						</div>
						<div class="col-md-7">
							<form:input type="text" path="title" name="Title" class="form-control" id=""	placeholder="Title" ng-model="Title"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="text1" for="text">Text1</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="text1" type="text" name="Text1" class="form-control" id="productText1" placeholder="Text"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="text2" for="text">Text2</form:label>
						</div>
						<div class="col-md-7">
							<form:input type="text" path="text2" name="Text2" class="form-control" id="productText2" placeholder="Text"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="url" for="text">Url</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="url" type="text" name="Url" class="form-control" id="" placeholder="http://www.example.com"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="zoneId" for="text">Zone</form:label>
						</div>
						<div class="col-md-7">
							<form:input type="hidden" path="zoneId" name="Zone" class="form-control" id=""	placeholder="Text"/>
							<form:select path="zoneId" name="Zone" class="form-control" id="zoneSelect">
									<form:options items="${content.zones}" />
								</form:select>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="startDate" for="text">Start Date</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="startDate" type="date" name="Start&EndDate" class="form-control" id="" placeholder="Text"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form:label path="endDate" for="text">End Date</form:label>
						</div>
						<div class="col-md-7">
							<form:input path="endDate" type="date" name="endDate" class="form-control" id="" placeholder="Text"/>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="category" for="text">Category</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="category" type="text" name="category" class="form-control" id="category" placeholder="category" />
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<form:label path="color" for="text">Choose Color</form:label>
							</div>
							<div class="col-md-7">
								<form:input path="color" type="color" name="color" class="form-control" id="colorPic" placeholder="Choose color" />
							</div>
							<div class="col-md-1"></div>
						</div> 
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3"></div>
						<div class="col-md-7">
							<form:input path="type" type="submit" value="Webproduct" class="btn btn-success" />
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</form:form> 
			<!-- Start -->
			<div class="side" style="background-image: url(<c:url value="/resources/images/phone.jpg"/>);">
				<div class="sideone" id="couponmobile">
					<div class="imageview"><img id="output" width="100%" height="100%" /></div>
					<div class="info_pic">
						<label class="titlebigbox" id="title" ng-bind="Title"></label>
						<div class="bigtext">
							<div class="contentcoupontext2"><span id=Text_2 ng-bind="Text2"></span></div>
							<div class="contentcoupontext3"><span id=Text_3 ng-bind="Text3"></span></div>
							<div class="contentcoupontext4"><span id=Text_4 ng-bind="Text4"></span></div>
						</div>
						<p class="contentcoupontext1" id=Text_1 ng-bind="Text1"></p>
					</div>
				</div>
				<div class="sideone" id="productmobile">
					<div class="productimageview"><img id="output1" width="100%" height="100%" /></div>
					<div class="info_pic">
						<div class="Product_title">
							<div class="titlebackground"></div>
							<label class="titlebigbox_product" id="producttitle" ng-bind="Title"></label>
						</div>
						<div class="contentproducttext1"><p id=productText_1 ng-bind="Text1"></p></div>
					</div>
				</div>
			</div>
			<!-- End -->
		</div>
	</div> --%>
	<!-- End -->
	<div id="hideContentData"></div>
</body>