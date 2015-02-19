
	
	 function add(dishId,resId,action){
		  
		  
		  	//alert(dishId+" "+resId);
	        $.ajax({
	            type: "get",
	            url: "./updateOrderCart?DISH_ID="+dishId+"&resId="+resId+"&action="+action,
				//data: $("#"+formId).serialize(),
				
	            success: function(msg){
				
						insertText(msg);
						 
	            },
	        });
		
	  }
	  
	  


function addToCart(dishId,resId,action){
	//alert(action);
	add(dishId,resId,action);
}
 function insertText(val){
	 
	 var myData = JSON.parse(val);
	 var result ="";
	 if(myData.total != "0") {	
	 for (var counter in myData.orderList) {
	  result += myData.orderList[counter].foodDish.dishName+" "+myData.orderList[counter].quantity+" "+myData.orderList[counter].total+" ";
	  result +="<form id='remove' method='get'><input type='button' id='remove' value='Remove' onclick = 'addToCart("+myData.orderList[counter].foodDish.dishId+","+myData.resId+",2);'/></form><p>";
	 
	 }
	 result += "Tax"+myData.taxInPercent+"%<p>";
	 result +="Total Charge"+myData.total;
	 
	
		  }
	 document.getElementById("right_Pane").innerHTML = result;
 }