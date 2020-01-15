<%--
    Document   : CadFuncionario
    Created on : 24/11/2019, 01:41:13
    Author     : gustavo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <meta charset="iso-8859-1">
        <title>Funcionarios</title>
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

                <h1>Funcionarios</h1>
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
                        <a class="nav-item nav-link active" id="cadastrotab" data-toggle="tab" href="#cadastro" role="tab" aria-controls="nav-home" aria-selected="true">Cadastro de Funcionarios</a>
                        <a class="nav-item nav-link" id="listatab" data-toggle="tab" href="#lista" role="tab" aria-controls="nav-profile" aria-selected="false">Lista de Funcionarios</a>
                    </div>
                </nav>

                <div class="tab-content" id="nav-tabContent">                       
                    <div class="tab-pane fade show active" id="cadastro" role="tabpanel" aria-labelledby="cadastro">
                        <br>

                        <form action="${pageContext.request.contextPath}/CadFuncionario" method="post">
                            <c:if test="${empty funcionarioEditando}">

                                <div class="form-group">
                                    <label for="exampleInputNome">Nome do funcionario</label>
                                    <input type="text" class="form-control" name="nome" required id="exampleInputNome" aria-describedby="nomeHelp" placeholder="Nome do funcionario">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Senha</label>
                                    <input type="password" name="senha" class="form-control" required id="exampleInputPassword1" placeholder="Senha">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputAcesso">Nivel de acesso</label>
                                    <select name="acesso" class="custom-select" required>
                                        <option value=null>Selecione o nivel</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="1">1</option>                                        
                                    </select>
                                </div>
                                <button type="submit" name="cadastrar" class="btn btn-outline-primary">Cadastrar</button>
                                <button type="reset" class="btn btn-outline-danger">Cancelar</button>
                            </c:if>
                            <c:if test="${not empty funcionarioEditando}">
                                <div class="form-group">
                                    <label for="exampleInputNome">Nome do funcionario</label>
                                    <input type="text" class="form-control" name="nome" required id="exampleInputNome" value="${funcionarioEditando.nome}" aria-describedby="nomeHelp" placeholder="Nome do funcionario">
                                </div>
                                <input type="hidden" name="idfuncionario" value="${funcionarioEditando.idfuncionario}"/>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Senha</label>
                                    <input type="password" name="senha"  required class="form-control" value="${funcionarioEditando.senha}" id="exampleInputPassword1" placeholder="Senha">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputAcesso">Nivel de acesso</label>
                                    <select name="acesso"  required class="custom-select">
                                        <option value="${funcionarioEditando.acesso}">${funcionarioEditando.acesso}</option>
                                        <option value=null>Selecione o nivel</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="1">1</option>                                        
                                    </select>
                                </div>
                                <button type="submit" name="alterar" id="alterar" class="btn btn-outline-primary">Alterar</button>
                                <button type="reset" class="btn btn-outline-danger">Cancelar</button>
                            </c:if>

                        </form>
                    </div>
                    <div class="tab-pane fade " id="lista" role="tabpanel" aria-labelledby="lista"> 
                        <form action="${pageContext.request.contextPath}/CadFuncionario" method="post">    
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
                                        <th>Senha</th>
                                        <th>Nivel de acesso</th>                                                
                                        <th><button type="submit" name="editar" class="btn btn-info" value="Editar" style=" float: right;" disabled id="1"><i class="fa fa-edit"></i>Editar</button>
                                            <button type="submit" name="excluir" class="btn btn-info" value="excluir" style=" float: right;" disabled id="2"><i class="fa fa-handshake-o"></i>Excluir</button>

                                        </th>
                                    </tr>
                                </thead>
                                <c:forEach var="funcionarios" items="${funcionarios}">
                                    <tr>
                                        <td>${funcionarios.nome}</td>
                                        <td>${funcionarios.senha}</td>
                                        <td>${funcionarios.acesso}</td>
                                        <td>                               
                                            <input type ="radio" name="idfuncionario" onclick="habilitar(1);
                                                    habilitar(2);
                                                   "required="Selecione" value ="${funcionarios.idfuncionario}"/>
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
