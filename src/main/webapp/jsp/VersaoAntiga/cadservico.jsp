<%-- 
    Document   : cadservico
    Created on : 16/07/2019, 15:00:45
    Author     : gustavo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="jsp/css/estilo.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Comfortaa" />
        <script type="text/javascript" src="jsp/js/servico.js"></script>
        <title>Serviços</title>
    </head>
    <body>
        <div class="barra">

            <div id="titulo" align="center">
                Salão da Mari
            </div>

        </div>

        <div class="sidebar">
            <a href="jsp/inicio.jsp"><i class="fa fa-fw fa-home"></i> Inicio</a>
            <a href="${pageContext.request.contextPath}/venda"><i class="fa fa-money"></i> Caixa</a>
            <a href="${pageContext.request.contextPath}/agendar"><i class="fa fa-book"></i> Agendamento</a>
            <a href="${pageContext.request.contextPath}/cadcliente"><i class="fa fa-user-plus" ></i> Clientes</a>
            <a class="active" href="${pageContext.request.contextPath}/cadservico"><i class="fa fa-handshake-o"></i></i> Serviços</a>
            <a class="selecionado"  href="#about" ><i class="fa fa-bar-chart" ></i> Relatorios</a>
        </div>
        <div class="content">

            <c:if test="${empty servicoEditando}"> 

                <div class="formulario">
                    <div style="color: green" id="msgerro"> ${mensagemSucesso} </div>
                    <div style="color: red">${mensagemErro}</div>
                    <form action="${pageContext.request.contextPath}/cadservico"  method="post" name="formulariocadastro" onsubmit="return validarformservico(this)">

                        <br>
                        <label class="titulo">Serviços</label>
                        <fieldset id="tabelaconteudo">


                            <%-- SERVICO --%>
                            <label for="servico" class="alinhamento">Nome do serviço prestado:</label>
                            <input type="text" name="servico" id="servico" placeholder="Escova" style="width: 300px; height: 28px;"/>
                            <span class="style1">*</span>                        
                            <br>
                            <br>
                            <%-- VALOR --%>
                            <label for="valor" class="alinhamento">R$</label>
                            <input type="text" name="valor" id="valor" placeholder=" R$79,90" onkeypress="return sonumeros(event)"style="width: 300px; height: 28px;"/>
                            <span class="style1">*</span>                        
                            <br>
                            <br>    
                            <fieldset>
                                <div class="botao"  >
                                    <input type="submit" class="escondido" name="cadastrar" value="Gravar Serviço" id="cadastrar" />
                                    <br>
                                    <input type="reset" class="escondido" name="reset" value="Limpar Campos " id="reset"  />
                                </div>

                            </fieldset>
                        </fieldset>
                    </form>
                </div>


            </c:if>
            <c:if test="${not empty servicoEditando}">
                <div class="formulario">
                    <div style="color: green" id="msgerro"> ${mensagemSucesso} </div>
                    <div style="color: red">${mensagemErro}</div>

                    <form action="${pageContext.request.contextPath}/cadservico"  method="post" name="formulariocadastro" onsubmit="return validarformservico(this)">

                        <br>
                        <label class="titulo">Serviços</label>
                        <fieldset id="tabelaconteudo">
                            <input type="hidden" name="idservico" value="${servicoEditando.idservico}"/>
                            <%-- SERVICO --%>
                            <label for="servico" class="alinhamento">Nome do serviço prestado:</label>
                            <input type="text" name="servico" id="servico" value="${servicoEditando.servico}" placeholder="Escova" style="width: 300px; height: 28px;"/>
                            <span class="style1">*</span>                        
                            <br>
                            <br>
                            <%-- VALOR --%>
                            <label for="valor" class="alinhamento">R$</label>
                            <input type="text" name="valor" id="valor" value="${servicoEditando.valor}"placeholder=" R$79,90" onkeypress="return sonumeros(event)"style="width: 300px; height: 28px;"/>
                            <span class="style1">*</span>                        
                            <br>
                            <br>    
                            <fieldset>
                                <div class="botao"  >
                                    <input type="submit" class="escondido" name="alterar" value="Gravar Alteração" id="alterar" />
                                    <br>
                                    <input type="reset" class="escondido" name="reset" value="Limpar Campos " id="reset"  />
                                </div>

                            </fieldset>
                        </fieldset> 
                    </form>
                </div>  
            </c:if> 
            <fieldset>
                <table style="border: 1px solid black; border-collapse: collapse; margin-top: 20px;  width:100%; font-size: 15px" border="1" >
                    <form method="post" action="${pageContext.request.contextPath}/cadservico" >
                        <button type="submit" name="editar" value="Editar" style="font-size: 10px;
                                            background-color: #E6F8E0;
                                            width: 60px; height: 30px;margin: 0 auto; float: right;"><i class="fa fa-edit"></i>Editar</button>
                    <thead>
                        <tr>
                            <th>Serviço</th>
                            <th>Valor R$</th>
                            <th>Opção</th>   

                        </tr>
                    </thead>
                    <c:forEach var="servicos" items="${servicos}">
                        <tr>
                            <td>${servicos.servico}</td>
                            <td>R$${servicos.valor}0</td>
                            <td>                               
                                <input type ="radio" name="idservico" value ="${servicos.idservico}"/>
                            </td>
                        </tr>
                    </c:forEach>
                        </form>
                </table>

            </fieldset>




        </div>    
    </body>


</body>
</html>
