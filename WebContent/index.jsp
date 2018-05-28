<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Iwantthat</title>
<style>
body{
	margin: 0px;
}
.header{
	padding: 20px;
    background: lightblue;
    margin: 0px;
}
	.popular,.electronic,.new,.books{
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
<div class="header">
	<center><h1>IwantThat</h1></center>
	<% if(session.getAttribute("session") == null){ %>
		<a href="login.jsp" style="padding:5px 10px;background:red;color:black;">Login</a>
	<% }else{
		out.print("<b style='padding:5px 10px;background:blue;color:black;'>"+session.getAttribute("userName")+"</b>");
		%>
		<a href="logout.jsp" style=" padding:5px 10px;background:red;color:black;">logout</a>
		<%
	}
		%>
</div>
<div class = "mainBody">
	<div class="popular">
		<h2>Popular Searches</h2>
		<a href="fetch.jsp?id=1"><img src="images/1.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=2"><img src="images/2.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=12"><img src="images/12.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=10"><img src="images/10.jpg" alt="img1"/></a>
	</div>
	<div class = "electronic">
		<h2>Electronics</h2>
		<a href="fetch.jsp?id=1"><img src="images/1.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=2"><img src="images/2.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=3"><img src="images/3.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=4"><img src="images/4.jpg" alt="img1"/></a>
	</div>
	<div class="New">
		<h2>New in the market</h2>
		<a href="fetch.jsp?id=11"><img src="images/11.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=7"><img src="images/7.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=13"><img src="images/13.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=14"><img src="images/14.jpg" alt="img1"/></a>
	</div>
	<div class="books">
		<h2>Books</h2>
		<a href="fetch.jsp?id=8"><img src="images/8.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=9"><img src="images/9.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=12"><img src="images/12.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=11"><img src="images/11.jpg" alt="img1"/></a>
	</div>
</div>
</body>
</html>