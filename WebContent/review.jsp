<%@page import="user.Fetch"%> 
<%@page import="user.FetchBean"%> 
<%@page import="java.util.*" %> 
<jsp:useBean id="obj" class="user.FetchBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	h2{
		margin: 0;
    	padding: 10px 20px;
    	background-color: lightgoldenrodyellow;
	}
</style>
</head>
<body>
<h2>Give Your valuable Review</h2>
<form action="reviewprocess.jsp" method="GET">
	<input type="text" name="id" value="<%=obj.getId()%>" style="display:none"/>
 	Review: <textarea name="review" row="5" col="30"></textarea>
	<br/>
	<input type="submit"/>
</form>
</body>
</html> 
<%  



%>