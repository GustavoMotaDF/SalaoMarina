<%--
    Document   : HistoricoCliente
    Created on : 01/01/2020, 19:33:41
    Author     : gustavo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Historico do Clientes</title>
        <jsp:include page="../includes/importscss.jsp"/>
    </head>

    <body style="background-color: #D3D3D3">
        <%

            String nome = (String) session.getAttribute("nome");
            if (nome == null || nome.isEmpty()) {
                session.invalidate();
                response.sendRedirect("/SalaoMarina/");
            } else {
        %>
        <jsp:include page="../includes/menu.jsp"/>
        <%
            }
        %>

        <main role="main">

            <div class="container" style="background-color: #DCDCDC">
                <br>
                <br>
                <div class="container form-group alert-dismissible">
                    <%
                        SimpleDateFormat ftm = new SimpleDateFormat("dd-MM-yyyy");
                    %>
                    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${vendasdia[0][3]}" var="dataFormatada" />

                    <h4>Vendas do dia ${dataFormatada}</h4>

                    <table class="table table-striped table-hover table-sm" >
                        <thead>
                            <tr>
                                <th>Nome do Cliente</th>
                                <th>Serviço feito</th>
                                <th>Valor</th>

                            </tr>
                            <c:forEach var="vendasdia" items="${vendasdia}">
                                <tr>
                                    <td>${vendasdia[0]}</td>
                                    <td>${vendasdia[1]}</td>
                                    <td>R$${vendasdia[2]}0</td>
                                </tr>
                            </c:forEach>


                        </thead>
                    </table>
                </div>
                    <a class=" btn btn-light" href="javascript:history.back()">Voltar</a>
            </div>

        </main>


        <jsp:include page="../includes/footer.jsp"/>
        <jsp:include page="../includes/imports.jsp"/>
         
    </body>
</html>

