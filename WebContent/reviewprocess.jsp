<%@page import="user.Fetch"%> 
<%@page import="user.FetchBean"%> 
<%@page import="java.util.*" %> 
<jsp:useBean id="obj" class="user.ReviewBean"/>  
  
<jsp:setProperty property="*" name="obj"/>

<%
obj.setUserId((Integer)(session.getAttribute("userId")));
	Boolean status = Fetch.reviewInsert(obj);
	if(status){
		response.sendRedirect("index.jsp");
	}
	else{
		out.print("Try again");
	}
%>