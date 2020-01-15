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

            <div class="container">
                <br>
                <br>


                <c:if test="${ empty Historicovendas}">

                    <a class=" btn btn-outline-light" href="javascript:history.back()">Voltar</a>
                    <br>
                    <br>
                    <form action="${pageContext.request.contextPath}/HistoricoCliente" method="post"> 
                        <select name="nomeCliente"  class=" form-control selecionarrrr" required >                   
                                <option value="" class="form-group" >Selecione o cliente..</option>
                            <c:forEach var="clientes" items="${clientes}">
                                <option value="${clientes.nomecliente}">${clientes.nomecliente}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <br>
                        <input style="position: relative; float: right;" type="submit" name="historico" value="historico" class="btn btn-outline-success form-control"/>
                        <br>
                        <hr>
                    </form>
                    <div>
                        ${mensagemErro}
                    </div>   

                </c:if>
                <c:if  test="${ not empty Historicovendas}">
                    <a class=" btn btn-outline-light" href="javascript:history.back()">Voltar</a>
                    <br>
                    <br>
                    <div class=" container alert-info" style="
                         box-shadow: 0 0 0.3em black;" >
                        <br>
                        <div> <label> <h3> Cliente</h3></label> </div>
                        <table class="table table-striped table-hover table-sm" >
                            <thead>
                                <tr>
                                    <th>Código: ${Historicovendas[0][0]}</th>
                                    <th>Nome: ${Historicovendas[0][1]}</th>                                    
                                </tr> 
                                <tr>                                    
                                    <th>Instagram ${Historicovendas[0][4]}</th>
                                    <th>Postar foto? ${Historicovendas[0][3]}</th>
                                    <th>Telefone: ${Historicovendas[0][2]}</th>
                                </tr> 
                            </thead>
                        </table> 
                        <br> 
                    </div>

                    <div class="container alert-info" style="
                         box-shadow: 0 0 0.3em black;">
                        <br>
                        <h3>Compras do Cliente</h3>
                        <table class="table table-striped table-hover table-sm" >
                            <thead>
                                <tr>
                                    <th>Data da Venda</th>
                                    <th>Serviço feito</th>
                                    <th>Valor do serviço</th>
                                    <th>Formato de pagamento</th>
                                </tr>
                            </thead>
                            <c:forEach var="Historicovendas" items="${Historicovendas}">
                                <tr>

                                    <%
                                        SimpleDateFormat ftm = new SimpleDateFormat("dd-MM-yyyy");

                                    %>
                                    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${Historicovendas[5]}" var="dataFormatada" />                                        
                                    <td>${dataFormatada}</td>
                                    <td>${Historicovendas[6]}</td>
                                    <td>R$${Historicovendas[7]}0</td>
                                    <td>${Historicovendas[8]}</td>

                                </tr>    
                            </c:forEach>
                        </table>    
                    </div>    
                </c:if>
            </div>

        </main>


        <jsp:include page="../includes/footer.jsp"/>
        <jsp:include page="../includes/imports.jsp"/>
        <script>
            $(document).ready(function () {
                $(".selecionarrrr").select2();


            });
        </script>

        <link href="jsp/css/select2.css" rel="stylesheet" >
        <script src="jsp/js/select2.js"></script>
    </body>
</html>

