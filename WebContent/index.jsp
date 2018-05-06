<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Testing</title>
<style>
	.popular{
		width:100%;
	}
	img{
		max-width:24%;
		
	}
</style>
</head>
<body>
<div class="header"><h1>IwantThat</h1></div>
<div class = "mainBody">
	<div class="popular">
		<h2>Popular Searches</h2>
		<a href="fetch.jsp?id=1"><img src="images/1.jpeg" alt="img1"/></a>
		<a href="fetch.jsp?id=2"><img src="images/2.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=3"><img src="images/3.jpeg" alt="img1"/></a>
		<a href="fetch.jsp?id=4"><img src="images/4.jpeg" alt="img1"/></a>
	</div>
	<div class = "electronic">
		<h2>Electronics</h2>
		<a href="fetch.jsp?id=1"><img src="images/1.jpeg" alt="img1"/></a>
		<a href="fetch.jsp?id=2"><img src="images/2.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=3"><img src="images/3.jpeg" alt="img1"/></a>
		<a href="fetch.jsp?id=4"><img src="images/4.jpeg" alt="img1"/></a>
	</div>
	<div class="New">
		<h2>New in the market</h2>
		<a href="fetch.jsp?id=1"><img src="images/1.jpeg" alt="img1"/></a>
		<a href="fetch.jsp?id=2"><img src="images/2.jpg" alt="img1"/></a>
		<a href="fetch.jsp?id=3"><img src="images/3.jpeg" alt="img1"/></a>
		<a href="fetch.jsp?id=4"><img src="images/4.jpeg" alt="img1"/></a>
	</div>
</div>
</body>
</html>