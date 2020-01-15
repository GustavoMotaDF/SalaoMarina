<%-- 
    Document   : menu
    Created on : 24/11/2019, 01:07:46
    Author     : gustavo
--%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.salaomarina.negocio.MenuBO"%>
<%@page import="com.salaomarina.negocio.FuncionarioBO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%               
    String nome = (String) session.getAttribute("nome");
    if(nome == null || nome.isEmpty()){
        session.invalidate();
        response.sendRedirect("/SalaoMarina/");                
    }else{
        MenuBO menu = new MenuBO();
        
        request.setAttribute("Menu",menu.getMenus(nome));
                            SimpleDateFormat ftm = new SimpleDateFormat("dd/MM/yyyy");
                            Date data = Date.from(Instant.now());
                            String dataftm = ftm.format(data);
                            request.setAttribute("data", dataftm);  
        
%>
 
                            
                            
<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #FFB6C1">
    <a class="navbar-brand" href="#"><img src="jsp/css/salaomarina3.jpg" width=80px" height="40px" alt="Será que existe um easteregg neste sistema?  use seu conhecimento para descobrir!"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <c:forEach var="menus" items="${Menu}">
          <li class="nav-item active">
            <a class="nav-link" href="${menus[0]}">${menus[1]}<span class="sr-only">(current)</span></a>
          </li>
           </c:forEach>          
        </ul>             
          <button class="btn btn-outline-success my-2 my-sm-0" type="">Olá, ${Menu[2][2]}, Hoje é ${data}</button>       
      </div>
</nav>
      ${deslogado}
          <%
          }
          %>