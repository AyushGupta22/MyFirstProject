<%@page import="user.Fetch"%> 
<%@page import="user.LoginBean"%> 
<%@page import="java.util.*" %> 
<jsp:useBean id="obj" class="user.LoginBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
boolean status=Fetch.validate(obj);
if(status){
session.setAttribute("session","TRUE");
session.setAttribute("userName" , obj.getUser());
session.setAttribute("userId" , obj.getId());
response.sendRedirect("index.jsp");
}
else
{
    session.setAttribute("session","FALSE");
response.sendRedirect("login.jsp");
}
%>