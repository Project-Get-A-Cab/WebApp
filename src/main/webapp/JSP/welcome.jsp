<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Beta Version of our site</title>
</head>
<body>


<form id="searchRestaurant" action="./searchProcessor" method="POST">
<input type="text" name="SEARCH_STRING" value="restaurant,cusine,location"/>
<input type="submit" name="SUBMIT" value="Search"/>
</form>


</body>
</html>