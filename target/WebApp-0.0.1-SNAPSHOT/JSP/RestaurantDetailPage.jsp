<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ page import="com.mihir.testing.action.handler.RestaurantCompleteDetailFetcher" %> 
<%@ page import="com.mihir.testing.data.types.RestaurantFullDetails" %>
<%@ page import="com.mihir.testing.test.CacheFillerTest" %>  
<%@ page import="com.mihir.testing.cache.InMemoryCache" %>  
<%@ page import="com.mihir.testing.data.types.Menu"%>
<%@ page import="com.mihir.testing.data.types.VegMenu"%>
<%@ page import="com.mihir.testing.data.types.NonVegMenu"%>
<%@ page import="com.mihir.testing.data.types.FoodCategories"%>
<%@ page import="com.mihir.testing.data.types.SingleFoodDish"%>
<%@ page import="com.mihir.testing.data.types.RestaurantLightInfo"%>
<%@ page import="com.mihir.testing.cache.InMemoryCache"%>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><% %></title>

<script src="./javascripts/jquery-1.11.0.min.js"></script>
<script src="./javascripts/jquery-migrate-1.2.1.min.js"></script>	
<script src="./javascripts/detailPageHelper.js"></script>
<link rel="stylesheet" type="text/css" href="./css/resultListPage.css"/>
<link rel="stylesheet" type="text/css" href="./css/welcomeFileHelper.css"/>
</head>
<body width="100%">
<div class="header-cont">
<div class="header" ></div>

<div class="mainDiv">
<div class="left_Pane">

left

</div>
<div class="central_Pane">
 <%
 String restaurantName = request.getParameter("RestaurantID");
 RestaurantCompleteDetailFetcher fetcher = new RestaurantCompleteDetailFetcher();
 RestaurantFullDetails resFullDetails = fetcher.getCompleteDetails(restaurantName); 
 String add = "add";
 out.println(resFullDetails.getRestaurantLightInfo().getRestuarantName().getRestaurantName());

	Menu menu = resFullDetails.getMenu();
	VegMenu veg = menu.getVegMenu();
	NonVegMenu non = menu.getNonVegMenu();
	int count =100;
	out.println("<h3>-------VEG----------</h3><p>");
	for(FoodCategories category : veg.getFoodCategories()) {

		out.println("<h4>"+category.getCategoryName()+"</h4><p>");
		for(SingleFoodDish dish : category.getListFoodItems()) {

			out.println(dish.getDishDescription()+" "+dish.getDishName()+" "+dish.getDishDescription()+" "+dish.getPrice()+"<form id='order_dish_add' method='get'><input type='button' id='dish' name='dish_select' onclick = 'addToCart("+dish.getDishId()+","+resFullDetails.getRestaurantLightInfo().getRestuarantName().getRestaurantId()+",1);' value='ADD'/></form><p>");
			count++;
		}

	}
	out.println("<h3>-------NON-VEG----------</h3><p>");
	for(FoodCategories category : non.getFoodCategories()) {
		out.println("<h4>"+category.getCategoryName()+"</h4><p>");
		for(SingleFoodDish dish : category.getListFoodItems()) {

			out.println(dish.getDishDescription()+" "+dish.getDishName()+" "+dish.getDishDescription()+" "+dish.getPrice()+"<form id='order_dish_add' method='get'><input type='button' id='dish' name='dish_select' onclick = 'addToCart("+dish.getDishId()+","+resFullDetails.getRestaurantLightInfo().getRestuarantName().getRestaurantId()+",1);' value='ADD'/></form><p>");
			count++;
		}

	}
 %>
</div>
<div class="right_Pane" id="right_Pane">

right
</div>


</div>
<div class="bottom_pane">

bottom
</div>
</body>
</html>