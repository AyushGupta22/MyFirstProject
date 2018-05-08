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
</head>
<body>
<form action="reviewprocess.jsp" method="GET">
	<input type="text" name="id" value="<%=obj.getId()%>"/>
 	Review: <input type="text" name="review" />
	<br/>
	<input type="submit"/>
</form>
</body>
</html> 
<%  



%>