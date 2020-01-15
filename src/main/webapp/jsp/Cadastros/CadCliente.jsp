<%-- 
    Document   : CadCliente
    Created on : 14/12/2019, 18:01:29
    Author     : gustavo
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <meta charset="iso-8859-1">
        <title>Clientes</title>
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
                <h1>Clientes</h1>
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
                        <a class="nav-item nav-link active" id="cadastrotab" data-toggle="tab" href="#cadastro" role="tab" aria-controls="nav-home" aria-selected="true">Cadastro de Clientes</a>
                        <a class="nav-item nav-link" id="listatab" data-toggle="tab" href="#lista" role="tab" aria-controls="nav-profile" aria-selected="false">Lista de Clientes</a>
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/HistoricoCliente">Historico do Cliente</a>

                    </div>
                </nav>

                <div class="tab-content" id="nav-tabContent">                       
                    <div class="tab-pane fade show active" id="cadastro" role="tabpanel" aria-labelledby="cadastro">
                        <br>
                        <form action="${pageContext.request.contextPath}/cadcliente" method="post">
                            <c:if test="${empty clienteEditando}">

                                <div class="form-group">
                                    <label for="exampleInputNome">Nome do Cliente</label>*
                                    <input type="text" class="form-control" required name="nomecliente" id="exampleInputNome" aria-describedby="nomeHelp" placeholder="Nome do cliente">
                                </div>
                                <div class="row"> 
                                    <div class=" col-md-3">
                                        <label for="exampleInputCpf">Instagram</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">@</span>
                                            </div>
                                            <input type="text" name="instagram" class="form-control"  maxlength="20" id="exampleInputCpf" placeholder="Instagram, Coloque o @">
                                        </div> 
                                    </div>
                                    <div class="  col-md-3">
                                        <label for="postarfotos">Postar Fotos?</label>
                                        <select class="custom-select" name="postarfotos" id="postarfotos" required>
                                            <option value="">Selecione..</option>
                                            <option value="Sim">Sim</option>
                                            <option value="Nao">Nao</option>
                                        </select> 
                                    </div>
                                    <div class="col-md-3">
                                        <label for="exampleInputTelefone">Telefone</label>*
                                        <input type="text" name="telefone" class="form-control" onkeypress="return sonumeros(event)" maxlength="11" required id="exampleInputTelefone" placeholder="Telefone">
                                    </div>
                                </div>    
                                <div class="form-group">
                                    <label for="exampleInputEndereco">Endereco</label>
                                    <input type="text" name="endereco" class="form-control" id="exampleInputEndereco" placeholder="Endereço">
                                </div>

                                <div class="form-group">

                                </div>


                                <button type="submit" name="cadastrar" class="btn btn-outline-primary">Cadastrar</button>
                                <button type="reset" class="btn btn-outline-danger">Cancelar</button>
                            </c:if>
                            <c:if test="${not empty clienteEditando}">

                                <input name="idcliente" type="hidden" value="${clienteEditando.idcliente}"/>

                                <div class="form-group">
                                    <label for="exampleInputNome">Nome do Cliente</label>*
                                    <input type="text" class="form-control" name="nomecliente" required id="exampleInputNome" value="${clienteEditando.nomecliente}"aria-describedby="nomeHelp" placeholder="Nome do cliente">
                                </div>
                                <div class="row"> 
                                    <div class=" col-md-3">
                                        <label for="exampleInputCpf">Instagram</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">@</span>
                                            </div>
                                            <input type="text" name="instagram" class="form-control" id="exampleInputCpf"  maxlength="20" value="${clienteEditando.instagram}" placeholder="Instagram, Coloque o @">
                                        </div> 
                                    </div>
                                    <div class="col-md-3">
                                        <label for="postarfotos">Postar Fotos?</label>
                                        <select class="custom-select" name="postarfotos" id="postarfotos">
                                            <option value="${clienteEditando.postarfotos}">${clienteEditando.postarfotos}</option>
                                            <option value="">Selecione..</option>
                                            <option value="Sim">Sim</option>
                                            <option value="Nao">Nao</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="exampleInputTelefone">Telefone</label>*
                                        <input type="text" name="telefone" class="form-control" required value="${clienteEditando.telefone}"onkeypress="return sonumeros(event)" maxlength="11" id="exampleInputTelefone" placeholder="Telefone">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEndereco">Endereco</label>
                                    <input type="text" name="endereco" class="form-control" value="${clienteEditando.endereco}" id="exampleInputEndereco" placeholder="Endereço">
                                </div>


                                <button type="submit" name="alterar" id="alterar" class="btn btn-outline-primary">Alterar</button>
                                <button type="reset" class="btn btn-outline-danger">Cancelar</button>
                            </c:if>

                        </form>
                    </div>
                    <div class="tab-pane fade " id="lista" role="tabpanel" aria-labelledby="lista"> 
                        <form action="${pageContext.request.contextPath}/cadcliente" method="post">    
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
                                        <th>Instagram</th>
                                        <th>Telefone</th>  
                                        <th>Endereço</th> 
                                        <th>Postar Fotos?</th> 

                                        <th><button type="submit" name="editar" class="btn btn-info" value="Editar" style="float: right;" disabled id="1"><i class="fa fa-edit"></i>Editar</button>
                                            <button type="submit" name="excluir" class="btn btn-info" value="excluir" style="float: right;" disabled id="2"><i class="fa fa-handshake-o"></i>Excluir</button>

                                        </th>
                                    </tr>
                                </thead>
                                <c:forEach var="clientes" items="${clientes}">
                                    <tr>
                                        <td>${clientes.nomecliente}</td>
                                        <td>${clientes.instagram}</td>
                                        <td>${clientes.telefone}</td>
                                        <td>${clientes.endereco}</td>
                                        <td>${clientes.postarfotos}</td>
                                        <td>                               
                                            <input type ="radio" name="idcliente" onclick="habilitar(1);
                                                    habilitar(2);
                                                   "required="Selecione" value ="${clientes.idcliente}"/>
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
