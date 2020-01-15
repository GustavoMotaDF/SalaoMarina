<%-- 
    Document   : CadServico
    Created on : 14/12/2019, 20:53:15
    Author     : gustavo
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <meta charset="iso-8859-1">
        <title>Serviços</title>
        <jsp:include page="../includes/importscss.jsp"/>
    </head>

    <body style="background-color: #D3D3D3">
        <%

            String servico = (String) session.getAttribute("nome");
            if (servico == null || servico.isEmpty()) {
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

                <h1>Serviços</h1>
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
                        <a class="nav-item nav-link active" id="cadastrotab" data-toggle="tab" href="#cadastro" role="tab" aria-controls="nav-home" aria-selected="true">Cadastro de Serviços</a>
                        <a class="nav-item nav-link" id="listatab" data-toggle="tab" href="#lista" role="tab" aria-controls="nav-profile" aria-selected="false">Lista de Serviços</a>
                    </div>
                </nav>

                <div class="tab-content" id="nav-tabContent">                       
                    <div class="tab-pane fade show active" id="cadastro" role="tabpanel" aria-labelledby="cadastro">
                        <br>

                        <form action="${pageContext.request.contextPath}/cadservico" method="post">
                            <c:if test="${empty servicoEditando}">

                                <div class="form-group">
                                    <label for="exampleInputNome">Nome do Serviço</label>*
                                    <input type="text" class="form-control" name="servico" required id="exampleInputNome" aria-describedby="servicoHelp" placeholder="Nome do serviço">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputValor">Valor</label>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">R$</span>
                                        </div>
                                        <input type="text" name="valor" class="form-control" required onkeypress="return sonumeros(event)" id="exampleInputvalor" placeholder="Valor">

                                        <div class="input-group-append">
                                            <span class="input-group-text">.00</span>
                                        </div>
                                    </div>

                                </div>

                                <button type="submit" name="cadastrar" class="btn btn-outline-primary">Cadastrar</button>
                                <button type="reset" class="btn btn-outline-danger">Cancelar</button>
                            </c:if>
                            <c:if test="${not empty servicoEditando}">

                                <input name="idservico" type="hidden" value="${servicoEditando.idservico}"/>

                                <div class="form-group">
                                    <label for="exampleInputNome">Nome do Serviço</label>*
                                    <input type="text" class="form-control" name="servico" required id="exampleInputNome" value="${servicoEditando.servico}"aria-describedby="servicoHelp" placeholder="Nome do serviço">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputValor">Valor</label>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">R$</span>
                                        </div>
                                        <input type="text" name="valor" class="form-control" required onkeypress="return sonumeros(event)" id="exampleInputvalor" value="${servicoEditando.valor}0" placeholder="Valor">
                                         
                                    </div>

                                </div>

                                <button type="submit" name="alterar" id="alterar" class="btn btn-outline-primary">Alterar</button>
                                <button type="reset" class="btn btn-outline-danger">Cancelar</button>
                            </c:if>

                        </form>
                    </div>
                    <div class="tab-pane fade " id="lista" role="tabpanel" aria-labelledby="lista"> 
                        <form action="${pageContext.request.contextPath}/cadservico" method="post">    
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
                                        <th>Serviço</th>
                                        <th>Valor</th>

                                        <th><button type="submit" name="editar" class="btn btn-info" value="Editar" style=" float: right;" disabled id="1"><i class="fa fa-edit"></i>Editar</button>
                                            <button type="submit" name="excluir" class="btn btn-info" value="excluir" style="float: right;" disabled id="2"><i class="fa fa-handshake-o"></i>Excluir</button>

                                        </th>
                                    </tr>
                                </thead>
                                <c:forEach var="servicos" items="${servicos}">
                                    <tr>
                                        <td>${servicos.servico}</td>
                                        <td>R$${servicos.valor}0</td>

                                        <td>                               
                                            <input type ="radio" name="idservico" onclick="habilitar(1);
                                                    habilitar(2);
                                                   "required="Selecione" value ="${servicos.idservico}"/>
                                        </td>
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

