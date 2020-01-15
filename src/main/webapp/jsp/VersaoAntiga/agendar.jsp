<%-- 
    Document   : agendar
    Created on : 16/07/2019, 16:22:19
    Author     : gustavo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="jsp/css/estilo.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Comfortaa" />
        <script type="text/javascript" src="jsp/js/agendar.js"></script>
        <title>Agenda</title>
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
            <a class="active" href="${pageContext.request.contextPath}/agendar"><i class="fa fa-book"></i> Agendamento</a>
            <a href="${pageContext.request.contextPath}/cadcliente"><i class="fa fa-user-plus" ></i> Clientes</a>
            <a href="${pageContext.request.contextPath}/cadservico"><i class="fa fa-handshake-o"></i></i> Serviços</a>
            <a class="selecionado"  href="#about" ><i class="fa fa-bar-chart" ></i> Relatorios</a>
        </div>

        <div class="content">

            <div class="formulario">
                <div style="color: green" id="msgerro"> ${mensagemSucesso} </div>
                <div style="color: red">${mensagemErro}</div>


                <form action="${pageContext.request.contextPath}/agendar"  method="post" name="formulariocadastro"onsubmit="return validarformagendar(this)" >
                    <br>
                    <label class="titulo">Agenda</label>
                    
                    <fieldset id="tabelaconteudo">
                        <%-- DATA AGENDAMENTO --%>
                        <label for="dataagendamento" class="alinhamento">Dt Agendamento</label>
                        <input type="date" name="dataagendamento" id="dataagendamento"style="width: 300px; height: 28px;"/>
                        <span class="style1">*</span>                        
                        
                        <%-- HORA--%>
                        <label for="horaagendamento" class="alinhamento">Hora Desejada:</label>
                        <select name ="horaagendamento" id="horaagendamento" style="width: 305px; height: 35px;">
                     
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
                        <span class="style1">*</span>
                        <br>
                        <br>
                        <%-- DESCRIÇÃO AGENDAMENTO --%>
                        <label for="descricaoagendamento" class="alinhamento">Descrição do Agendamento:</label>
                        <input type="text" name="descricaoagendamento" id="descricaoagendamento" placeholder="Opcional" style="width: 300px; height: 40px;"/>
                                               
                        <br>
                        <br>                         
                        <%-- ID DO CLIENTE--%>
                        <label for="idcliente" class="alinhamento" onchange="javascript:associaInput();">Cliente:</label>
                        <select name ="idcliente" id="idcliente" style="width: 305px; height: 35px;">
                            <option value="">Selecione o Cliente...</option> 
                            <c:forEach var="clientes" items="${clientes}">
                                <option value="${clientes.idcliente}">"${clientes.nomecliente}"</option>

                            </c:forEach>
                        </select>

                        <span class="style1">*</span>
                        <br>
                        <br>
                        <fieldset> 
                            <div class="botao" >
                                
                                <input type="submit" class="escondido" name="cadastrar" value="Gravar Agendamento" id="cadastrar" />
                                <br>
                                <input type="reset" class="escondido" name="reset" value="Limpar Campos " id="reset"  />
                            </div>
                        </fieldset>

                    </fieldset>

                </form>
            </div>        
        </div> 


    </body>


</body>
</html>

