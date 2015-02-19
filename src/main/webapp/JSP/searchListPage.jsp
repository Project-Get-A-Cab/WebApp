<%@page import="com.mihir.testing.json.utils.JsonConverter"%>
<%@page import="com.mihir.testing.user.request.cache.UserRequestInMemoryBuffer"%>
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
<%@ page import="com.mihir.testing.user.request.cache.UserRequestInMemoryBuffer" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%%></title>
<script src="./javascripts/jquery-1.11.0.min.js"></script>
<script src="./javascripts/jquery-migrate-1.2.1.min.js"></script>	
<script src="./javascripts/searchListPage.js"></script>
<link rel="stylesheet" type="text/css" href="./css/welcomeFileHelper.css"/>
<link rel="stylesheet" type="text/css" href="./css/resultListPage.css"/>
</head>
<body>
<form id="hidden">
	<input type="hidden" name="sequenceNumber" value="<%=request.getParameter("sequence")%>"/>
	<input type="hidden" name="sequenceName" value="<%=request.getParameter("sequenceName")%>"/>
	
</form>
<div class="header-cont" >
<div class="header" ></div>
</div>
<div id="resultList">
<%
if(request.getParameter("sequence").equalsIgnoreCase("firstBatchLoad")){
	String requestId = request.getParameter("sequenceName");
UserRequestInMemoryBuffer bufferHandler = new UserRequestInMemoryBuffer();
JsonConverter converter = new JsonConverter();
for(int i = 1;i<=10;i++){
	RestaurantLightInfo res = bufferHandler.getCurrentSequenceContent(requestId ,String.valueOf(i));
	out.println("<a href=./RestaurantDetailPage?RestaurantID="+res.getRestuarantName().getRestaurantId()+" style='text-decoration: none'><br><div class='resMainDiv'><div style='float: left;' id='rightImageBlock' class='subDiv'><br><p> <center> <img src='http://blog.whatsupgurgaon.in/wp-content/uploads/2014/05/restaurant-opening.jpg' height='100' width='190'/></div><div id='RestaurantName' class='restName'>"+res.getRestuarantName().getRestaurantName()+"<div class='address'>"+ res.getAddressLine1() +", " +res.getAddressLine2() + " </div><hr></hr></div><div style='margin-left: 210px;height:90px;width:auto' class='subDiv' id='info'></div> </div></a> <p></a><p>");
}
}
%>
</div>
</body>
</html>