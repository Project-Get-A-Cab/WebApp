<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mihir.testing.test.CacheFillerTest" %>  
<%@ page import="com.mihir.testing.cache.InMemoryCache" %>  
<%@ page import="com.mihir.testing.action.handler.RestaurantCompleteDetailFetcher" %> 
<%@ page import="com.mihir.testing.data.types.RestaurantFullDetails" %>
<%@ page import="com.mihir.testing.data.types.Menu"%>
<%@ page import="com.mihir.testing.data.types.VegMenu"%>
<%@ page import="com.mihir.testing.data.types.NonVegMenu"%>
<%@ page import="com.mihir.testing.data.types.FoodCategories"%>
 <%@ page import="com.mihir.testing.data.types.SingleFoodDish"%>
 <%@ page import="com.mihir.testing.data.types.RestaurantLightInfo"%>
<%@ page import="com.mihir.testing.cache.InMemoryCache"%>
 <%@page import="java.util.*" %>
<%
out.println("welcome");
if(request.getParameter("START_CACHE")!= null) {
	if(request.getParameter("START_CACHE").equalsIgnoreCase("true")){
		CacheFillerTest test = new 	CacheFillerTest();
		test.fillCacheWithTestProperties();
		out.println("<p>Refresh done");
		
	}
}

if(request.getParameter("GET_COUNT")!=null) {
	if(request.getParameter("GET_COUNT").equalsIgnoreCase("true")){
		out.println("<p>Count in Cache:");
		InMemoryCache cache = new InMemoryCache();
		out.println(cache.getRestaurantFullDetailCacheSize()+" "+cache.getSeachByAreaCacheSize()+" "+cache.getSearchbyCusineSize());
	}
}


if(request.getParameter("GET_COUNT_DISH")!=null) {
	if(request.getParameter("GET_COUNT_DISH").equalsIgnoreCase("true")){
		out.println("<p>Count of Dishes in Cache:");
		InMemoryCache cache = new InMemoryCache();
		out.println(cache.getDishCount());
	}
}

if(request.getParameter("search")!=null) {
	if(request.getParameter("search").equalsIgnoreCase("true")){
		String restaurantName = request.getParameter("resId");
		 RestaurantCompleteDetailFetcher fetcher = new RestaurantCompleteDetailFetcher();
		 RestaurantFullDetails resFullDetails = fetcher.getCompleteDetails(restaurantName); 
		
		 out.println(resFullDetails.getRestaurantLightInfo().getRestuarantName().getRestaurantName());

			Menu menu = resFullDetails.getMenu();
			VegMenu veg = menu.getVegMenu();
			NonVegMenu non = menu.getNonVegMenu();

			out.println("_-------VEG----------");
			for(FoodCategories category : veg.getFoodCategories()) {

				out.println(category.getCategoryName());
				for(SingleFoodDish dish : category.getListFoodItems()) {

					out.println(dish.getDishDescription()+" "+dish.getDishName()+" "+dish.getDishDescription()+" "+dish.getPrice());

				}

			}
			out.println("_-------NON-VEG----------");
			for(FoodCategories category : non.getFoodCategories()) {
				out.println(category.getCategoryName());
				for(SingleFoodDish dish : category.getListFoodItems()) {

					out.println(dish.getDishDescription()+" "+dish.getDishName()+" "+dish.getDishDescription()+" "+dish.getPrice());

				}

			}
		
		
	}
}


if(request.getParameter("searchLOC")!=null) {
	if(request.getParameter("searchLOC").equalsIgnoreCase("true")){
		String location = request.getParameter("location");
		InMemoryCache cache = new InMemoryCache();
		ArrayList<RestaurantLightInfo> list = cache.getListofRestaurantforArea(location);

		for(RestaurantLightInfo res : list) {
			out.println("<a href=./RestaurantDetailPage.jsp?RestaurantID="+res.getRestuarantName().getRestaurantId()+">"+res.getRestuarantName().getRestaurantName()+"</a><p>");
			
		}
	}
}


if(request.getParameter("searchCUI")!=null) {
	if(request.getParameter("searchCUI").equalsIgnoreCase("true")){
		String cuisine = request.getParameter("cuisine");
		InMemoryCache cache = new InMemoryCache();
		ArrayList<RestaurantLightInfo> list = cache.getListofRestaurantsforCuisine(cuisine);

		for(RestaurantLightInfo res : list) {
			out.println("<a href=./RestaurantDetailPage.jsp?RestaurantID="+res.getRestuarantName().getRestaurantId()+">"+res.getRestuarantName().getRestaurantName()+"</a><p>");
		}
	}
}

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Controller</title>
</head>
<body>

<form id="refreshCache" method="POST" >
<table>
<input type="hidden" name="START_CACHE" value="true"/>
<tr>
<td>
Refresh All the Caches
</td>
<td>
<input type="submit" value="REFRESH"/>
</td>
</tr>
<tr>
<br><br>
<form id="getCount" method="post">	
<td>
<input type="hidden" name="GET_COUNT" value="true"/>
</td>
<td>
<input type="submit" value="GET COUNT"/>
</td>
</form>
</tr>
<tr>
<form id="getCountOfDishes" method="post">	
<td>
<input type="hidden" name="GET_COUNT_DISH" value="true"/>
</td>
<td>
<input type="submit" value="GET COUNT DISH"/>
</td>
</form>


</tr>
</table>
</form>

<form id="res" method="post">
<input type="hidden" name="search" value="true"/>
Get Restaurant <input type = "text" name="resId" />
<input type="submit" value = "search" / >
</form>


<form id="location" method="post">
<input type="hidden" name="searchLOC" value="true"/>
Search Restuarants by Location<input type = "text" name="location" />
<input type="submit" value = "search" / >
</form>

<form id="cuisine" method="post">
<input type="hidden" name="searchCUI" value="true"/>
Search Restuarants by Cuisines<input type = "text" name="cuisine" />
<input type="submit" value = "search" / >



</form>
</body>
</html>