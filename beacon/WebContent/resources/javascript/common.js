
var url;
var connection = new Array();
//connection['server'] = '127.0.0.1';
connection['server'] = 'localhost';
connection['port'] = '8080';
connection['context'] = '/beacon/';
url = 'http://'+connection['server']+":"+connection['port']+connection['context'];


var randomScalingFactor = function(){ return Math.round(Math.random()*100);};

 var barChartData = {
  labels : ["Users","Visits","Details","Social"],
  datasets : [
   
   {
    fillColor : "rgba(220,220,220,0.5)",
    strokeColor : "rgba(220,220,220,0.8)",
    highlightFill: "rgba(220,220,220,0.75)",
    highlightStroke: "rgba(220,220,220,1)",
    data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
   },
   {
    fillColor : "rgba(151,187,205,0.5)",
    strokeColor : "rgba(151,187,205,0.8)",
    highlightFill : "rgba(151,187,205,0.75)",
    highlightStroke : "rgba(151,187,205,1)",
    data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
   }
  ]

 };
 window.onload = function(){
  var cid = document.getElementById("canvas");
  if(cid != undefined){
	  var ctx = document.getElementById("canvas").getContext("2d");
	  window.myBar = new Chart(ctx).Line(barChartData, {
	   responsive : true
	  });
  }
 };
 

 function signup() {
		$("#signup").toggle();
		$("#overlayid").toggle();
		$( '#signupForm' ).each(function(){
		    this.reset();
		});
}
 
function tabs(divid){
	$(".contentTabs").hide();
	$("#"+divid).show();
	if (divid != "coupon") {
		$("#couponmobile").hide();
		$("#productmobile").show();
	} else {
		$("#productmobile").hide();
		$("#couponmobile").show();
	}
	if (divid == "webproduct") {
		$("#productmobile").hide();
	}
	if(divid == "profile"){	
		$("#API").hide();
	}
	if(divid == "API"){
		$("#profile").hide();
	}
}
var loadFile1 = function(event) {
	var output = document.getElementById('output');
	output.src = URL.createObjectURL(event.target.files[0]);
};
var loadFile2 = function(event) {
	var output = document.getElementById('output1');
	output.src = URL.createObjectURL(event.target.files[0]);
};

function closepopup() {
	$(".createcontent").hide();
}
