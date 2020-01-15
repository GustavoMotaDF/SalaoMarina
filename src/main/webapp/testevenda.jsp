<%-- 
    Document   : testevenda
    Created on : 06/01/2020, 22:49:35
    Author     : gustavo
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <link rel="stylesheet" href="jsp/css/modalNone.css">
        <jsp:include page="jsp/includes/importscss.jsp"/>
    </head>
    <body>


        <main role="main">

            <!-- Main jumbotron for a primary marketing message or call to action -->

            <div class="container bg-dark" style="color: white">
                <br>
                <br>
                <h1>Caixa</h1>
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
                        <a class="nav-item nav-link" id="caixa" data-toggle="tab" href="Caixa" role="tab" aria-controls="nav-home" aria-selected="false" onclick="abrir()" >Realizer Venda</a>
                        <a class="nav-item nav-link" id="listatab" data-toggle="tab" href="#lista" role="tab" aria-controls="nav-home" aria-selected="false">Vendas do Dia</a>
                        <a class="nav-item nav-link" id="relatoriotab" data-toggle="tab" href="#relatorio" role="tab" aria-controls="nav-home" aria-selected="true">Relatorios</a>
                    </div>
                </nav>

                <div class="tab-content" id="nav-tabContent">   
                    <%-- Lista de vendas--%>
                    <div class="tab-pane fade " id="lista" role="tabpanel" aria-labelledby="lista">
                        <form action="${pageContext.request.contextPath}/venda" method="post">
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
                                        <th>Clientes</th>
                                        <th>Servico</th>
                                        <th>Valor</th>
                                        <th>Formato Pagamento</th>

                                        <th><button type="submit" name="editar" class="btn btn-info" value="Editar" style="float: right;" disabled id="1"><i class="fa fa-edit"></i>Editar</button>

                                        </th>
                                    </tr>
                                </thead>
                                <c:forEach var="vendas" items="${vendas}">
                                    <tr>
                                        <td>${vendas.cliente.nomecliente}</td>
                                        <td>${vendas.servico.servico}</td>
                                        <td>R$ ${vendas.servico.valor}0</td>
                                        <td>${vendas.formatovenda}</td>

                                        <td>
                                            <input type ="radio" name="idvenda" onclick="habilitar(1); habilitar(2);" required="Selecione" value ="${vendas.idvenda}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>

                    </div>
                    <%--Relatorios--%>
                    <div class="tab-pane fade " id="relatorio" role="tabpanel" aria-labelledby="relatorio">

                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link" id="vendastab" data-toggle="tab" href="#vendas" role="tab" aria-controls="nav-home" aria-selected="true">Vendas</a>
                                <a class="nav-item nav-link" id="relatorio15diastab" data-toggle="tab" href="#relatorio15dias" role="tab" aria-controls="nav-home" aria-selected="true">Em breve</a>
                            </div>  
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="vendas" role="tabpanel" aria-labelledby="vendas">
                                <table class="table table-striped table-hover table-sm" >
                                    <thead>
                                        <tr>
                                            <th>Valor total de vendas do dia</th>
                                            <th>Data</th>
                                        </tr>

                                    </thead>    
                                    <c:forEach var="relatorio" items="${relatorio}"> 
                                        <tr> 
                                            <td>R$${relatorio["1"]}0</td>
                                            <%
                                                SimpleDateFormat ftm = new SimpleDateFormat("dd-MM-yyyy");
                                            %>
                                            <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${relatorio[0]}" var="dataFormatada" />                                        
                                            <td>
                                                <form action="${pageContext.request.contextPath}/VendaDia" method="post"> 
                                                    <button class="btn-light" name="datavenda" value="${relatorio[0]}" ><a target="_blank"> ${dataFormatada}</a> </button>
                                                </form>
                                            </td>

                                        </tr>

                                    </c:forEach>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="relatorio15dias" role="tabpanel" aria-labelledby="relatorio15dias">
                                <table class="table table-striped table-hover table-sm" >

                                </table>
                            </div>
                        </div>

                    </div>
                </div>
                <%--Modal do caixa--%>
                <div id="myModal" class="modal ">                             
                    <div class="modal-content container" style="background-color: #777; border-radius: 10px">  
                        <main role="main"> 
                            <!-- Main jumbotron for a primary marketing message or call to action -->

                            <div class="container bg-dark" style="color: white">
                                <br>
                                <div class="row">
                                    <div class="input-group mb-3 col-md-4">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text close" onclick="fechar()">&times;</span>
                                        </div>                                    
                                    </div>

                                    <h1 class="col-md-4">Caixa</h1> 
                                </div>
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



                                <div class="tab-content" id="nav-tabContent">


                                    <br>

                                    <form action="${pageContext.request.contextPath}/venda" method="post">
                                        <c:if test="${empty vendaEditando}">

                                            <div class="form-group">
                                                <label for="idcliente">Cliente</label>
                                                <select name ="idcliente" id="idcliente" class="custom-select" required>
                                                    <option value="">Selecione o Cliente...</option>
                                                    <c:forEach var="clientes" items="${clientes}">
                                                        <option value="${clientes.idcliente}">"${clientes.nomecliente}"</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="idservico">Serviço Realizado</label>
                                                    <select name ="idservico" id="idservico" class="custom-select" required>
                                                        <option value="">Selecione o Serviço...</option>
                                                        <c:forEach var="servico" items="${servico}">
                                                            <option value="${servico.idservico}">${servico.servico}, Valor:R$ ${servico.valor}0</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="formatovenda" >Formato do Pagamento</label>
                                                    <select name ="formatovenda" id="formatovenda" class="custom-select" required>
                                                        <option value="">Selecione o formato ...</option>
                                                        <option value="Dinheiro">Dinheiro</option>
                                                        <option value="Credito">Crédito</option>
                                                        <option value="Debito">Débito</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <label class="col-md-3"></label>    
                                                <button type="submit" name="cadastrar" class="btn btn-outline-primary col-md-3">Realizar Venda</button>
                                                <button type="reset" class="btn btn-outline-danger col-md-3" onclick="fechar()">Cancelar</button>
                                            </div>
                                        </c:if>
                                        <c:if test="${not empty vendaEditando}">

                                            <input name="idvenda" type="hidden" value="${vendaEditando.idvenda}"/>

                                            <div class="form-group">
                                                <label for="idcliente">Cliente</label>
                                                <select name ="idcliente" id="idcliente" class="custom-select" required>
                                                    <option value="${vendaEditando.cliente.idcliente}">"${vendaEditando.cliente.nomecliente}"</option>
                                                    <option value="">Selecione o Cliente...</option>
                                                    <c:forEach var="clientes" items="${clientes}">
                                                        <option value="${clientes.idcliente}">"${clientes.nomecliente}"</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="idservico">Serviço Realizado</label>
                                                    <select name ="idservico" id="idservico" class="custom-select" required>
                                                        <option value="${vendaEditando.servico.idservico}">${vendaEditando.servico.servico}</option>
                                                        <option value="">Selecione o Serviço...</option>
                                                        <c:forEach var="servico" items="${servico}">
                                                            <option value="${servico.idservico}">${servico.servico} Valor: R$ ${servico.valor}0</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="formatovenda" >Formato do Pagamento</label>
                                                    <select name ="formatovenda" id="formatovenda" class="custom-select" required>
                                                        <option value="${vendaEditando.formatovenda}">${vendaEditando.formatovenda}</option>
                                                        <option value="">Selecione o formato ...</option>
                                                        <option value="Dinheiro">Dinheiro</option>
                                                        <option value="Credito">Crédito</option>
                                                        <option value="Debito">Débito</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-md-3"></label>   
                                                <button type="submit" name="alterar" id="alterar" class="btn btn-outline-primary col-md-3">Alterar</button>
                                                <button type="reset" class="btn btn-outline-danger col-md-3" onclick="fechar()">Cancelar</button>
                                            </div>
                                        </c:if>

                                    </form>


                                </div>


                                <hr>
                            </div> <!-- /container -->

                        </main> 
                    </div>
                </div>      

                <hr>
            </div> <!-- /container -->

        </main> 
        <script type="text/javascript" src="jsp/js/modalNone.js"></script> 
        <jsp:include page="jsp/includes/imports.jsp"/>
    </body>
</html>
