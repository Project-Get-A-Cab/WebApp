$(document).ready(function() {
var sequenceNumber = 11;
var sequenceId;
var stopLoadingMore = "false";
var getMoreRestaurants = function()	 {
	
	sequenceId = document.getElementsByName("sequenceName")[0].value;
	$.ajax({
        type: "post",
        url: "./getNextRestuarantList?Sequence_Id="+sequenceId+"&Sequence_number="+sequenceNumber,
        success: function(msg){
        	fillPageWithNewContent(msg);
        },
    });
	
}



var fillPageWithNewContent = function(msg){
	
	var myData = JSON.parse(msg);
	 var result ="";
	 for (var counter in myData.list) {
		 if(myData.list[counter].restuarantName.restaurantName.indexOf("END_OF_RESULT")!=-1) {
		// alert(myData.list[counter].restuarantName.restaurantName);
		 stopLoadingMore =  "true";
		 break;
		 }
		 // alert(myData.list[counter].restuarantName.restaurantName);
		 result += "<a href=./RestaurantDetailPage?RestaurantID="+myData.list[counter].restuarantName.restaurantId+" style='text-decoration: none'><br><div class='resMainDiv'><div style='float: left;' id='rightImageBlock' class='subDiv'><br><p> <center> <img src='http://blog.whatsupgurgaon.in/wp-content/uploads/2014/05/restaurant-opening.jpg' height='100' width='190'/></div><div id='RestaurantName' class='restName'>"+myData.list[counter].restuarantName.restaurantName+"<div class='address'>"+ myData.list[counter].addressLine1 +", " +myData.list[counter].addressLine2 + " </div><hr></hr></div><div style='margin-left: 210px;height:90px;width:auto' class='subDiv' id='info'></div> </div></a> <p></a><p>"
	 }
    
insertText(result);
    	//	}
	
	sequenceNumber = sequenceNumber + 10;
}
	
$(window).scroll(function () {
	   if ($(window).scrollTop() >= $(document).height() - $(window).height() - 10) {
		   
	      if(stopLoadingMore.indexOf("true") == -1){
		  //alert(stopLoadingMore);
	    	  getMoreRestaurants();
	      }
	   }
});


function insertText(val){
	document.getElementById("resultList").innerHTML+=val;
	}


});

