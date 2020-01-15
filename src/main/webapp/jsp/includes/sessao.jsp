<%-- 
    Document   : sessao
    Created on : 17/11/2019, 01:14:20
    Author     : Gusta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   try{    
    response.sendRedirect("/SalaoMarina/");      
    session.invalidate();
    
   }catch(Exception e){
       out.print(e);
   }
%>