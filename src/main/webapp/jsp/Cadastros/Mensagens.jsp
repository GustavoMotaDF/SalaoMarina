<%-- 
    Document   : Mensagens
    Created on : 09/01/2020, 02:59:11
    Author     : gustavo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <meta charset="iso-8859-1">
        <title>Mensagens</title>
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

            <!-- Main jumbotron for a primary marketing message or call to action -->

            <div class="container"style="background-color: #DCDCDC">
                <br>
                <br>

                <h1>Mensagens</h1>
                <div class="foo" id="foo"> 
                    ${mensagemSucesso}
                    ${mensagemErro}
                </div>
                <script>
                    $().ready(function () {
                        setTimeout(function () {
                            $('#foo').hide();
                        }, 10000);
                    });
                </script>

                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nãolidastab" data-toggle="tab" href="#naolidas" role="tab" aria-controls="nav-home" aria-selected="true">Mensagens Não Respondidas</a>
                        <a class="nav-item nav-link" id="lidastab" data-toggle="tab" href="#lidas" role="tab" aria-controls="nav-profile" aria-selected="false">Mensagens Respondidas</a>
                    </div>
                </nav>

                <div class="tab-content" id="nav-tabContent">                       
                    <div class="tab-pane fade show active" id="naolidas" role="tabpanel" aria-labelledby="naolidas">
                        <form action="${pageContext.request.contextPath}/Mensagens" method="post">
                            <table class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Telefone</th>
                                        <th>E-mail</th>
                                        <th>Mensagem</th>                                         
                                    </tr>
                                </thead>
                                <c:forEach var="naolidas" items="${naolidas}">
                                    <tr>
                                        <td>${naolidas[0]}</td>
                                        <td>${naolidas[1]}</td>
                                        <td>${naolidas[2]}</td>
                                        <td>${naolidas[3]}</td>
                                        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${naolidas[4]}" var="dataFormatada" />  
                                        <td>${dataFormatada}</td> 
                                        <td>
                                            <button class="btn btn-outline-light" name="idmensagem" value="${naolidas[5]}">Marcar como respondidas</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                    </div>
                    <div class="tab-pane fade " id="lidas" role="tabpanel" aria-labelledby="lidas"> 
                        <table class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Telefone</th>
                                        <th>E-mail</th>
                                        <th>Mensagem</th>                                         
                                        <th>Recebida</th>                                         
                                        <th>Lida</th>                                         
                                    </tr>
                                </thead>
                                <c:forEach var="lidas" items="${lidas}">
                                    <tr>
                                        <td>${lidas[0]}</td>
                                        <td>${lidas[1]}</td>
                                        <td>${lidas[2]}</td>
                                        <td>${lidas[3]}</td>
                                        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${lidas[4]}" var="dataFormatada4" />  
                                        <td>${dataFormatada4}</td>  
                                        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${lidas[5]}" var="dataFormatada5" />  
                                        <td>${dataFormatada5}</td>  
                                    </tr>
                                </c:forEach>
                            </table>
                           
                    </div>
                </div>


                <hr>
            </div> <!-- /container -->

        </main>
        <jsp:include page="../includes/footer.jsp"/>
        <jsp:include page="../includes/imports.jsp"/>

    </body>
</html>

