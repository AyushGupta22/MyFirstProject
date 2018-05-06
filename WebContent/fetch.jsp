<%@page import="user.Fetch"%> 
<%@page import="user.FetchBean"%> 
<%@page import="java.util.*" %> 
<jsp:useBean id="obj" class="user.FetchBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
List<FetchBean> items= Fetch.itemFetch(obj);  

FetchBean abc = items.get(0); 
out.print(abc.getId());
out.print("<br/><img src=\"images/"+abc.getId()+".jpg\" />");
for(int i=1;i<items.size();i++){
	abc = items.get(i);
	out.print("<br/>"+abc.getId());
	out.print("<br/><img src=\"images/"+abc.getId()+".jpg\" />");
}
%>
  