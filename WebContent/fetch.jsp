<%@page import="user.Fetch"%> 
<%@page import="user.FetchBean"%> 
<%@page import="user.ReviewBean"%> 
<%@page import="java.util.*" %> 
<jsp:useBean id="obj" class="user.FetchBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
List<ReviewBean> itemReviews = new ArrayList<ReviewBean>();
List<FetchBean> items= Fetch.itemFetch(obj,itemReviews);  

FetchBean abc = items.get(0); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Testing</title>
<style>
body{
	margin: 0px;
}
.header{
	padding: 20px;
    background: lightblue;
    margin: 0px;
}
	.recommend{
		width:100%;
	}
	h2{
		margin: 0;
    	padding: 10px 20px;
    	background-color: lightgoldenrodyellow;
	}
	img{
		max-width:24%;
		height:250px;
		padding:40px;
		
	}
</style>
</head>
<body>
<div class="header"><center><h1>IwantThat</h1></center></div>
<%
out.print("<h3>"+abc.getName()+"</h3>");
out.print("<img src=\"images/"+abc.getId()+".jpg\" />");
out.print("<a href='buy.jsp?itemId="+abc.getId()+"'>Buy Now </a>");
out.print("<a href='review.jsp?id="+abc.getId()+"'> Review</a>");
out.print("<div class = 'recommend'><h2>Recommended Items</h2>");
for(int i=1;i<items.size();i++){
	abc = items.get(i);
	out.print("<a href='fetch.jsp?id="+abc.getId() +"'><img src=\"images/"+abc.getId()+".jpg\" /></a>");
}
out.print("</div>");
out.print("<div class = 'reviews'><h2>Reviews</h2>");
for(int i=0;i<itemReviews.size();i++){
	ReviewBean review = itemReviews.get(i);
	out.print("<p>"+review.getReview()+"</p>");
}
out.print("</div>");
%>
  