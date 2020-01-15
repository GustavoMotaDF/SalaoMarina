

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

<%-- 
    Document   : teste layout
    Created on : 16/07/2019, 19:34:08
    Author     : gustavo
--%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="jsp/css/estilo.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Comfortaa" />
        <script type="text/javascript" src="jsp/js/venda.js"></script>

        <title>Caixa</title>
    </head>
    <body>
        <div class="barra">
            
            <div id="titulo" align="center">
                Salão da Mari
            </div>
            
        </div>
        <div class="sidebar">
            <a  href="jsp/inicio.jsp"><i class="fa fa-fw fa-home"></i> Inicio</a>
            <a class="active"href="${pageContext.request.contextPath}/venda"><i class="fa fa-money"></i> Caixa</a>
            <a href="${pageContext.request.contextPath}/agendar"><i class="fa fa-book"></i> Agendamento</a>
            <a href="${pageContext.request.contextPath}/cadcliente"><i class="fa fa-user-plus" ></i> Clientes</a>
            <a href="${pageContext.request.contextPath}/cadservico"><i class="fa fa-handshake-o"></i></i> Serviços</a>
            <a class="selecionado"  href="#about" ><i class="fa fa-bar-chart" ></i> Relatorios</a>
        </div>

        <div class="content">
            <div class="formulario">
                <div style="color: green" id="msgerro"> ${mensagemSucesso} </div>
                <div style="color: red">${mensagemErro}</div>


                <form action="${pageContext.request.contextPath}/venda"  method="post" name="formulariocadastro" onsubmit="return validarformvenda(this)">
                    <br>
                    <label class="titulo">Realizar Venda</label>
                    
                    <fieldset id="tabelaconteudo">
                       


                        <%-- cliente --%>
                        <label for="idcliente" class="alinhamento">Cliente:</label>
                        <select name ="idcliente" id="idcliente" style="width: 305px; height: 35px;">
                            <option value="">Selecione o Cliente...</option> 
                            <c:forEach var="clientes" items="${clientes}">
                                <option value="${clientes.idcliente}">"${clientes.nomecliente}"</option>
                            </c:forEach>
                        </select>                       
                        <span class="style1">*</span>
                        <br>
                        <br>         
                        <%-- DATA DA VENDA --%>
                        <label for="datavenda" class="alinhamento">Data da Venda:</label>
                        <input type="date" name="datavenda" id="datavenda" style="width: 300px; height: 35px;"/>
                        <span class="style1">*</span>                        
                        <br>
                        <br>
                        <%-- Serviço a ser Vendido --%>
                        <label for="idservico" class="alinhamento">Serviço Realizado</label>
                        <select name ="idservico" id="idservico" style="width: 305px; height: 35px;">
                            <option value="">Selecione o Serviço...</option> 
                            <c:forEach var="servico" items="${servico}">                                
                                <option value="${servico.idservico}">${servico.servico}</option>                           
                            </c:forEach>
                        </select>    
                        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

                            <script>
                                $(document).ready(function(){
                                        $("#idservico").change(function() {
                                                $("#valores").val($(this).val());
                                        });
                                });
                                
                            </script>
                            
                            <input type="text" value="R$ "  name="valores" id="valores"/>
                        <span class="style1">*</span>
                        <br>
                        <br>      
                        <%-- Formato de pagamento--%>
                        <label for="formatovenda" class="alinhamento">Formato do Pagamento</label>
                        <select name ="formatovenda" id="formatovenda" style="width: 305px; height: 35px;">
                            <option value="">Selecione o formato ...</option> 
                            <option value="Dinheiro">Dinheiro</option> 
                            <option value="Credito">Crédito</option> 
                            <option value="Debito">Débito</option> 
                        </select>                       
                        
                        <span class="style1">*</span>
                        <br>
                        <br> 
                        <fieldset>
                            <div class="botao" >
                                <input type="submit" class="escondido" name="cadastrar" value="Realizar Venda" id="cadastrar" />
                                <br>
                                <input type="reset" class="escondido" name="reset" value="Limpar Campos " id="reset"  />
                            </div>
                        </fieldset>


                    </fieldset>

                </form>
            </div>            


    </body>
</div>

</body>
</html>

