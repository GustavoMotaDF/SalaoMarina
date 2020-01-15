<%-- 
    Document   : Agenda
    Created on : 15/12/2019, 00:32:40
    Author     : gustavo
--%>



<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        
        <title>Agenda</title>
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

            <div class="container" style="background-color: #DCDCDC">
                <br>
                <br>
                <h1>Agenda</h1>
                <div class="foo" id="foo"> 
                    ${mensagemSucesso}
                    ${mensagemErro}
                </div>

                <script>
                    $(document).ready(function () {
                        setTimeout(function () {
                            $('#foo').hide();
                            $('.foo').hide();
                        }, 10000);
                    });
                </script>

                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">          
                        <a class="nav-item nav-link active" id="cadastrotab" data-toggle="tab" href="#cadastro" role="tab" aria-controls="nav-home" aria-selected="true">Agendar</a>
                        <a class="nav-item nav-link" id="listatab" data-toggle="tab" href="#lista" role="tab" aria-controls="nav-profile" aria-selected="false">Agendamentos</a>
                        <a class="nav-item nav-link" id="concluidotav" data-toggle="tab" href="#concluido" role="tab" aria-controls="nav-profile" aria-selected="false">Agendamentos Concluidos</a>
                    </div>
                </nav>

                <div class="tab-content" id="nav-tabContent">                       
                    <div class="tab-pane fade show active" id="cadastro" role="tabpanel" aria-labelledby="cadastro">
                        <br>

                        <form action="${pageContext.request.contextPath}/agendar" method="post">
                            <c:if test="${empty agendamentoEditando}">

                                <div class="form-group">
                                    <label for="idcliente">Cliente</label>
                                    <select name ="idcliente" id="idcliente" class="custom-select" required>
                                        <option value="">Selecione o Cliente...</option>
                                        <c:forEach var="clientes" items="${clientes}">
                                            <option value="${clientes.idcliente}">"${clientes.nomecliente}"</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputdescricaoagendamento">Descrição do agendamento</label>
                                    <input type="text" name="descricaoagendamento" class="form-control" id="exampleInputdescricaoagendamento" placeholder="Descrição do agendamento" >
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputdataagendamento">Data do agendamento</label>
                                        <input type="date" name="dataagendamento" class="form-control" id="exampleInputdataagendamento" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="horaagendamento">Hora Desejada</label>
                                        <select name ="horaagendamento" id="horaagendamento" class="custom-select" required>
                                            <option value="">Selecione o Horario...</option> 
                                            <option value="08:00hrs">08:00hrs</option>
                                            <option value="09:00hrs">09:00hrs</option>
                                            <option value="10:00hrs">10:00hrs</option>
                                            <option value="11:00hrs">11:00hrs</option>
                                            <option value="12:00hrs">12:00hrs</option>
                                            <option value="13:00hrs">13:00hrs</option>
                                            <option value="14:00hrs">14:00hrs</option>
                                            <option value="15:00hrs">15:00hrs</option>
                                            <option value="16:00hrs">16:00hrs</option>
                                            <option value="17:00hrs">17:00hrs</option>
                                            <option value="18:00hrs">18:00hrs</option>
                                            <option value="19:00hrs">19:00hrs</option>
                                            <option value="20:00hrs">20:00hrs</option>
                                            <option value="21:00hrs">21:00hrs</option>
                                            <option value="22:00hrs">22:00hrs</option>


                                        </select>
                                    </div>
                                </div>



                                <button type="submit" name="cadastrar" class="btn btn-outline-primary">Agendar</button>
                                <button type="reset" class="btn btn-outline-danger">Cancelar</button>
                            </c:if>
                            <c:if test="${not empty agendamentoEditando}">

                                <input type="hidden" name="idagendamento" value="${agendamentoEditando.idagendamento}"/>

                                <div class="form-group">
                                    <label for="idcliente">Cliente</label>
                                    <select name ="idcliente" id="idcliente" class="custom-select" required>

                                        <option value="${agendamentoEditando.cliente.idcliente}">${agendamentoEditando.cliente.nomecliente}</option>
                                        <option value="">Selecione o Cliente...</option>
                                        <c:forEach var="clientes" items="${clientes}">
                                            <option value="${clientes.idcliente}">"${clientes.nomecliente}"</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputdescricaoagendamento">Descrição do agendamento</label>
                                    <input type="text" name="descricaoagendamento" class="form-control" id="exampleInputdescricaoagendamento" value="${agendamentoEditando.descricaoagendamento}" placeholder="Descrição do agendamento">
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputdataagendamento">Data do agendamento</label>
                                        <input type="date" name="dataagendamento" required="Escolha a data" class="form-control" value="${agendamentoEditando.dataagendamento}" id="exampleInputdataagendamento"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="horaagendamento">Hora Desejada</label>
                                        <select name ="horaagendamento" id="horaagendamento" required class="custom-select">
                                            <option value="${agendamentoEditando.horaagendamento}">${agendamentoEditando.horaagendamento}</option> 
                                            <option value="">Selecione o Horario...</option> 
                                            <option value="08:00hrs">08:00hrs</option>
                                            <option value="09:00hrs">09:00hrs</option>
                                            <option value="10:00hrs">10:00hrs</option>
                                            <option value="11:00hrs">11:00hrs</option>
                                            <option value="12:00hrs">12:00hrs</option>
                                            <option value="13:00hrs">13:00hrs</option>
                                            <option value="14:00hrs">14:00hrs</option>
                                            <option value="15:00hrs">15:00hrs</option>
                                            <option value="16:00hrs">16:00hrs</option>
                                            <option value="17:00hrs">17:00hrs</option>
                                            <option value="18:00hrs">18:00hrs</option>
                                            <option value="19:00hrs">19:00hrs</option>
                                            <option value="20:00hrs">20:00hrs</option>
                                            <option value="21:00hrs">21:00hrs</option>
                                            <option value="22:00hrs">22:00hrs</option>


                                        </select>
                                    </div>
                                </div>
                                <button type="submit" name="alterar" id="alterar" class="btn btn-outline-primary">Alterar</button>
                                <button type="reset" class="btn btn-outline-danger">Cancelar</button>
                            </c:if>

                        </form>
                    </div>
                    <div class="tab-pane fade " id="lista" role="tabpanel" aria-labelledby="lista"> 

                        <form action="${pageContext.request.contextPath}/agendar" method="post">    
                            <table class="table table-striped table-hover table-sm" >
                                <script>
                                    function habilitar(id) {
                                        if (document.getElementById(id).disabled) {
                                            document.getElementById(id).disabled = false;
                                        }
                                    }

                                </script>
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Descrição</th>
                                        <th>Data</th>  
                                        <th>Horario</th> 
                                        <th><button type="submit" name="editar" value="Editar" class="btn btn-info" style="float: right" disabled id="1"><i class="fa fa-edit"></i>Editar</button>
                                            <button type="submit" name="excluir" value="Excluir" class="btn btn-info" style="float: right" disabled id="2"><i class="fa fa-handshake-o"></i>Finalizar</button>

                                        </th>
                                    </tr>
                                </thead>
                                <c:forEach var="agendamentos" items="${agendamentos}">
                                    <tr>
                                        <td>${agendamentos.cliente.nomecliente}</td>
                                        <td>${agendamentos.descricaoagendamento}</td>
                                        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                                        <fmt:parseDate value="${agendamentos.dataagendamento}" pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${parsedDateTime}" />   </td>        
                                        <td>${agendamentos.horaagendamento}</td>
                                        <td>                               
                                            <input type ="radio" name="idagendamento" onclick="habilitar(1);habilitar(2);" required="Selecione" value ="${agendamentos.idagendamento}"/>
                                        </td>
                                    </tr>
                                </c:forEach>                                
                            </table>
                        </form>

                    </div>
                    <div class="tab-pane fade show" id="concluido" role="tabpanel" aria-labelledby="concluido">
                        <form action="${pageContext.request.contextPath}/agendar" method="post">   

                            <table class="table table-striped table-hover table-sm" >

                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Descrição</th>
                                        <th>Data</th>  
                                        <th>Horario</th> 

                                    </tr>
                                </thead>
                                <c:forEach var="agendamentosC" items="${agendamentosC}">
                                    <tr>
                                        <td>${agendamentosC.cliente.nomecliente}</td>
                                        <td>${agendamentosC.descricaoagendamento}</td>                                       
                                        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                                        <fmt:parseDate value="${agendamentosC.dataagendamento}" pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${parsedDateTime}" />   </td>    
                                        <td>${agendamentosC.horaagendamento}</td>

                                    </tr>
                                </c:forEach>                                
                            </table>
                        </form>
                    </div>

                </div>


                <hr>
            </div> <!-- /container -->

        </main>

        <jsp:include page="../includes/footer.jsp"/>
        <jsp:include page="../includes/imports.jsp"/>


    </body>



</html>
