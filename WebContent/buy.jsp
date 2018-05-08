<%@page import="user.Fetch"%> 
<%@page import="user.FetchBean"%> 
<%@page import="java.util.*" %> 
<jsp:useBean id="obj" class="user.OrderBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
obj.setOrderId((Integer)(session.getAttribute("userId")));
boolean status= Fetch.orderInsert(obj);  

if(status){
	response.sendRedirect("index.jsp");
}
else{
	out.println("Try Again");
}
%>