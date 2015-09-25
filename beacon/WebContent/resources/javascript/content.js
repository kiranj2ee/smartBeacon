/**
 * 
 */

$(function() {
	//tabs('coupon');
	formTabs('coupon');
	buildContents();
	tabs('couponList');
	initTimePicker();
});

	
function buildContents(){
	var contentUrl = url+"getContents.json";
	$.ajax ({
       url: contentUrl,
       type: "POST",
       success: function(data){
    	   console.log('in success'+JSON.stringify(data));
    	  $.each(data.contentBOList,function(key,content){
    		  var textVal = $("#zoneSelect1 option[value='"+content.zoneId+"']").text();
    		 //alert(textVal);
    		
    		  var buildContentList = "<li id=\"content_"+content.id+"\"><div class='coupon1' style=\"background:"+content.color+"\"><div class='coupon1content'><ul><li><span><img src=\"/beacon/resources/images/logo_50.png\"></span> <span><b>Smart Around</b></span></li><li><span><img src=\"/beaconProject/images/"+content.image+"\" style=\"width: 35%; height: 35%;\"></span></li><li><span><b>"+content.title+"</b></span></li><li><div class='textcontent'><span class='text2content'>"+content.text2+"</span><span class='text3content'>"+content.text3+"</span><span class='text4content'>"+content.text4+"</span></div></li><li><span>"+content.text1+"</span></li></ul></div>";
    		  buildContentList = buildContentList + "<div class=\"editcontent\"><span class=\"glyphicon glyphicon-pencil\" id=\"editPOPUP_"+content.id+"\" onclick=\"\"></span>&nbsp;&nbsp;&nbsp;<span class=\"glyphicon glyphicon-trash\" onclick=\"deleteContent("+content.id+")\"></span></div></div><div class=\"zonnam\"><h4>"+textVal+"</h4></div></li>";
    		  $("#hideContentData").append("<input type=\"hidden\" id=\"hiddenContent_"+content.id+"\" value='"+JSON.stringify(content)+"'>");//onclick=\"showeditpopup("+content.id+")\"
    		  var methodEdit="";
    		  if(content.typeId == 1){
    			  methodEdit = "showeditpopup("+content.id+")";
    			  $("#couponsDiv").append(buildContentList);
    			  $("#editPOPUP_"+content.id).attr("onclick",methodEdit);
    		  }if(content.typeId == 2){
    			  methodEdit = "showeditproductpopup("+content.id+")";
    			  $("#productsDiv").append(buildContentList);
    			  $("#editPOPUP_"+content.id).attr("onclick",methodEdit);
    		  } if(content.typeId == 3){
    			  methodEdit = "showeditwebproductpopup("+content.id+")";
    		   $("#webProductsDiv").append(buildContentList);
    		   $("#editPOPUP_"+content.id).attr("onclick",methodEdit);
    		  }
    	   });
    	  $(".coupondesc").append("<br>");
    	  $(".productdesc").append("<br>");
       },
       complete: function(){
    	   console.log('in complte');
       }
   });
}

function deleteContent(id){
	 //alert(id);
	 $("#content_"+id).remove();
	 var delContentUrl = url+"deleteContent?contentId="+id;
	 $.ajax ({
	       url: delContentUrl,
	       type: "POST",
	       success: function(data){
	        console.log('in success'+JSON.stringify(data));
	        $('.contentList').on('click', '#content_'+id, function () {
	             $(this).remove();
	         });
	       }
	   });
	}

function tabs(divid){
	//$(".contentTabs").hide();
	$(".tabsListContent").hide();
	$("#"+divid).show();
	/*if (divid != "coupon") {
		$("#couponmobile").hide();
		$("#productmobile").show();
	} else {
		$("#productmobile").hide();
		$("#couponmobile").show();
	}
	if (divid == "webproduct") {
		$("#productmobile").hide();
	}*/
	if(divid == "couponList"){
		if(!($(".tabsList").hasClass("selectedTab"))){
			$(".tabsList").removeClass("selectedTab");
			$("couponListId").addClass("selectedTab");
		}
	}
	if(divid == "productList"){
		if($(".tabsList").hasClass("selectedTab")){
			$(".tabsList").removeClass("selectedTab");
			$("productListId").addClass("selectedTab");
		}
	}
	if(divid == "webProductList"){
		if($(".tabsList").hasClass("selectedTab")){
			$(".tabsList").removeClass("selectedTab");
			$("webProductListId").addClass("selectedTab");
		}
	}
	
}


function showeditpopup(cid){
	var data = $("#hiddenContent_"+cid).val();
	console.log("edit content data===>"+data);
	var content = JSON.parse(data);
	$("#hiddenCId").val(cid);
	$("#hiddenCType").val("Coupon");
	$("#editpopup").toggle();
	$("#overlayid").toggle();
	$("#title").val(content.title);
	$("#text1").val(content.text1);
	$("#text2").val(content.text2);
	$("#text3").val(content.text3);
	$("#text4").val(content.text4);
	var millisDate = new Date(content.startDate);
	var day = ("0" + millisDate.getDate()).slice(-2);
	var month = ("0" + (millisDate.getMonth() + 1)).slice(-2);
	var startDate = millisDate.getFullYear()+"-"+(month)+"-"+(day);
	$("#startDate").val(startDate);
	millisDate = new Date(content.endDate);
	day = ("0" + millisDate.getDate()).slice(-2);
	month = ("0" + (millisDate.getMonth() + 1)).slice(-2);
	var endDate = millisDate.getFullYear()+"-"+(month)+"-"+(day);
	$("#endDate").val(endDate);
	$(".zoneId").val(content.zoneId);
	/*var startdate = convertMillisToDate(content.startDate);
	alert(startdate);
	$("#startDate").val(convertMillisToDate(content.startDate));
	$("#endDate").val(convertMillisToDate(content.endDate));*/
	$("#category").val(content.category);
	$("#colorPic").val(content.color);
	
}
function showeditproductpopup(cid){
	var data = $("#hiddenContent_"+cid).val();
	console.log("edit content data===>"+data);
	var content = JSON.parse(data);
	
	$("#editproductpopup").toggle();
	$("#overlayid").toggle();
	$("#title_pr").val(content.title);
	$("#text1_pr").val(content.text1);
	$("#text2_pr").val(content.text2);
	var millisDate = new Date(content.startDate);
	var day = ("0" + millisDate.getDate()).slice(-2);
	var month = ("0" + (millisDate.getMonth() + 1)).slice(-2);
	var startDate = millisDate.getFullYear()+"-"+(month)+"-"+(day) ;
	$("#startDate_pr").val(startDate);
	millisDate = new Date(content.endDate);
	day = ("0" + millisDate.getDate()).slice(-2);
	month = ("0" + (millisDate.getMonth() + 1)).slice(-2);
	var endDate = millisDate.getFullYear()+"-"+(month)+"-"+(day) ;
	$("#endDate_pr").val(endDate);
	$(".zoneId").val(content.zoneId);
	/*var startdate = convertMillisToDate(content.startDate);
	alert(startdate);
	$("#startDate").val(convertMillisToDate(content.startDate));
	$("#endDate").val(convertMillisToDate(content.endDate));*/
	$("#category_pr").val(content.category);
	$("#colorPic_pr").val(content.color);
	
}
function showeditwebproductpopup(cid){
	var data = $("#hiddenContent_"+cid).val();
	console.log("edit content data===>"+data);
	var content = JSON.parse(data);
	
	$("#editwebproductpopup").toggle();
	$("#overlayid").toggle();
	$("#title_wpr").val(content.title);
	$("#text1_wpr").val(content.text1);
	$("#text2_wpr").val(content.text2);
	var millisDate = new Date(content.startDate);
	var day = ("0" + millisDate.getDate()).slice(-2);
	var month = ("0" + (millisDate.getMonth() + 1)).slice(-2);
	var startDate = millisDate.getFullYear()+"-"+(month)+"-"+(day) ;
	$("#startDate_wpr").val(startDate);
	millisDate = new Date(content.endDate);
	day = ("0" + millisDate.getDate()).slice(-2);
	month = ("0" + (millisDate.getMonth() + 1)).slice(-2);
	var endDate = millisDate.getFullYear()+"-"+(month)+"-"+(day) ;
	$("#endDate_wpr").val(endDate);
	$(".zoneId").val(content.zoneId);
	/*var startdate = convertMillisToDate(content.startDate);
	alert(startdate);
	$("#startDate").val(convertMillisToDate(content.startDate));
	$("#endDate").val(convertMillisToDate(content.endDate));*/
	$("#category_wpr").val(content.category);
	$("#colorPic_wpr").val(content.color);
	$("#url_wpr").val(content.url);
	
}

function convertMillisToDate(millis){
	var millisDate = new Date(content.startDate);
	var day = ("0" + millisDate.getDate()).slice(-2);
	var month = ("0" + (millisDate.getMonth() + 1)).slice(-2);
	var returnDate = millisDate.getFullYear()+"-"+(month)+"-"+(day) ;
	return returnDate;
}

function closePopup(id){
	$("#title").val("");
	$("#text1").val("");
	$("#text2").val("");
	$("#text3").val("");
	$("#text4").val("");
	$("#"+id).toggle();
	$("#overlayid").toggle();
}
function showCreatePopup(){
	$("#overlayid").toggle();
	$("#create_content").toggle();
	tabs('coupon');
}
/*
$('a.list-group-item').click(function(){
	$(this).removeClass('active');
	$(this).addClass('active');
});*/

function formTabs(id){
	//$('a.list-group-item').addClass('active');
	$('a.list-group-item').removeClass('active');
	$(".contentTabs").hide();
	$("#"+id).show();
	if (id == "product") {
		$("#couponmobile").hide();
		$("#productmobile").show();
		$('.2').addClass('active');
	} else if (id == "coupon") {
		$("#productmobile").hide();
		$("#couponmobile").show();
		$('.1').addClass('active');
	}else if (id == "webproduct") {
		$("#productmobile").hide();
		$('.3').addClass('active');
	}
}

function initTimePicker(){
	  var $mmss = $(".0-59");
	     for (i=0;i<=59;i++){
	      if(i<10)
	       $mmss.append($('<option></option>').val(i).html("0"+i));
	         else
	          $mmss.append($('<option></option>').val(i).html(i));
	     }
	   var $hrs = $(".0-23");
	   for (i=0;i<=23;i++){
	      if(i<10)
	       $hrs.append($('<option></option>').val(i).html("0"+i));
	         else
	          $hrs.append($('<option></option>').val(i).html(i));
	     }
	}
