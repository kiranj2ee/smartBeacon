/**
 * 
 */

$(function(){
	$('[data-toggle="tooltip"]').tooltip(); 
	initZones();
	$("#updateZone").click(function(){
		$("#createBtn").hide();
		showCreateOrUpdateButton("updateBtn");
		$("#zoneFormId").prop("action","./editZone");
		/*var uVal = $("#updateBtn").css("display");
		var cVal = $("#createBtn").css("display");
		alert(uVal+" and "+cVal);*/
		//$("#createZone").attr("disabled",true);
	});
	$("#createZone").click(function(){
		showCreateOrUpdateButton("createBtn");
		$( '#zoneFormId' ).each(function(){
		    this.reset();
		});
		$("#updateBtn").hide();
		$("#zoneFormId").prop("action","./createZone");
		//alert($("#updateBtn").css("display")+" and "+$("#createBtn").css("display"));
		//$("#updateZone").attr("disabled",true);
	});
	$("#updateBtn").click(function(){
		$(".formEdit").each(function(){
			$(this).attr("readonly",true);
		});
		showCreateOrUpdateButton("updateBtn");
	});
	$("#createBtn").click(function(){
		showCreateOrUpdateButton("createBtn");
		$(".formEdit").each(function(){
			$(this).attr("readonly",true);
		});
	});
});
function initZones(){
	buildZones();
	searchZones();
}

function showCreateOrUpdateButton(id){
	var rVal = $(".formEdit").attr("readonly");
	if(rVal == true||rVal == "readonly"){
		rVal=false;
	}else{
		rVal=true;
	}
	$("#"+id).animate({
		height: "toggle"
	});
	$(".formEdit").each(function(){
		$(this).attr("readonly",rVal);
	});
}
function searchZones(){
	$('#search').keyup(function () {
	    var valThis = this.value.toLowerCase();
	    var lenght  = this.value.length;
	    $('#createdZonesList>li>a').each(function () {
	    	var text  = $(this).text();
	        var textL = text.toLowerCase();
	        var htmlR = '<b>' + text.substr(0, lenght) + '</b>' + text.substr(lenght);
	        (textL.indexOf(valThis) == 0) ? $(this).html(htmlR).show() : $(this).hide();
	    });

	});
}

function buildZones(){
	//alert("buildZones");
	var zoneUrl = url+"getZones.json";
	$.ajax ({
       url: zoneUrl,
       type: "POST",
       success: function(data){
    	   $(".slidetopnext").html("");
    	   $("#hideData").html("");
    	   console.log('in success'+JSON.stringify(data));
    	   $.each(data.zoneBOList,function(key,zone){
    	   		$(".slidetopnext").append("<li class=\"\" id=\"listStyle\"><a href=\"#\" onclick=\"showEditZone("+zone.id+")\">"+zone.description+"</a></li>");
    	  		$("#hideData").append("<input type=\"hidden\" id=\"zone_"+zone.id+"\" value='"+JSON.stringify(zone)+"'>");
    	   });
       },
       complete: function(){
    	   console.log('in complte');
       }
   });
}
function showEditZone(zoneId){
 var zone = JSON.parse($('#zone_'+zoneId).val());
 //$("#zoneFormId").prop("action","./editZone");
 $("#desc").val(zone.description);
 $("#uuid").val(zone.uuid);
 $("#major").val(zone.major);
 $("#minor").val(zone.minor);
 $("#zonId").val(zoneId);
 //$("#btnModify").text("Update");
 //$("#createBtn").hide();
 //$("#updateBtn").show();
 //$("#page-content-wrapper").show();	
}

function createZone() {
	$("#zoneFormId").prop("action","./createZone");
	$("#desc").val("");
	$("#uuid").val("");
	$("#major").val("");
	$("#minor").val("");
	$("#zonId").val("");
	//$("#btnModify").text("CreateZone");
	/*$("#overlayid").toggle();
	$("#createzonepopup").toggle();*/
}