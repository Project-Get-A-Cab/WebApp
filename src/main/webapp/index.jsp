<%@page import="java.sql.Time"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*,java.sql.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/welcomeFileHelper.css"/>
<script src="./javascripts/jquery-1.11.0.min.js"></script>
<script src="./javascripts/jquery-migrate-1.2.1.min.js"></script>	
<script src="./javascripts/jquery-ui.js"></script>
<script>
var data = "";

function getSuggestions(){
  	//alert(dishId+" "+resId);
    $.ajax({
        type: "post",
        url: "./getSuggestionList",
		//data: $("#"+formId).serialize(),
		
        success: function(msg){
		
				data = msg;
				 
        },
    });
}

	
  $.widget( "custom.catcomplete", $.ui.autocomplete, {
    _renderMenu: function( ul, items ) {
      var that = this,
        currentCategory = "";
      $.each( items, function( index, item ) {
        if ( item.category != currentCategory ) {
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
          currentCategory = item.category;
        }
        that._renderItemData( ul, item );
      });
    }
  });
  
  $(function() { 
    $( "#SEARCH_STRING" ).catcomplete({
      delay: 0,
      source: data
    });
  });
  </script>
<title>Welcome to XYZ- Guwahati's most preferred online food ordering website </title>
</head>
<body width="100%"  onload="getSuggestions()">
<div class="header-cont" >
<div class="header" ></div>
</div>
<div style="height: 800px; width:100%; border: 0px;display: inline-block;">
<center>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="gradientBoxesWithOuterShadows">
<form id="login" action="./searchProcessor" method="POST">
<div class="dynamiclabel">
    <input id="SEARCH_STRING" name="SEARCH_STRING" placeholder="Place, Cuisine, Locality" type="text" />
 </div>
 </form>
</div>
<br>
<br>
</div>
<div id="bottom" >
</div>
</body>
</html>