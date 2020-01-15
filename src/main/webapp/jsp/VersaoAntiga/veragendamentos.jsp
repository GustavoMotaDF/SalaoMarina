<%-- 
    Document   : veragendamentos
    Created on : 17/07/2019, 01:35:34
    Author     : gustavo
--%>


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
        <script type="text/javascript" src="jsp/js/agendar.js"></script>
        <title>Agendamentos</title>

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
            <a href="${pageContext.request.contextPath}/cadservico"><i class="fa fa-handshake-o"></i> Serviços</a>
            <a class="active" class="selecionado"  href="#about" ><i class="fa fa-bar-chart" ></i> Relatorios</a>
        </div>
        <c:if test="${empty agendamentoEditando}">
            <div class="content">
                <br>
                <label class="titulo">Agendamentos</label>
                <fieldset>
                    <table style="border: 1px solid black; border-collapse: collapse; margin-top: 20px;  width:100%; font-size: 15px" border="1" >
                        <form method="post" action="${pageContext.request.contextPath}/veragendamentos" >  
                            <button type="submit" name="editar" value="Editar" style="font-size: 10px;
                            background-color: #E6F8E0;
                            width: 60px; margin: 0 auto; float: right;"><i class="fa fa-edit"></i>Editar</button>
                        <thead>
                            <tr>

                                <th>Data da marcação</th>
                                <th>Cliente</th>
                                <th>Descrição</th>
                                <th>Data e Hora Agendada</th>

                            </tr>
                        </thead>
                        <c:forEach var="agendamentos" items="${agendamentos}">
                            <tr>
                                <td>${agendamentos.datahoraultmov}</td>
                                <td>${agendamentos.cliente.nomecliente}</td>
                                <td>${agendamentos.descricaoagendamento}</td>
                                <td>${agendamentos.dataagendamento}, ${agendamentos.horaagendamento}</td>
                                <td>                                     
                                    <input type ="radio" name="idagendamento" value ="${agendamentos.idagendamento}"/>
                                </td>
                            </tr>
                        </c:forEach>
                       </form> 
                    </table>

                </fieldset>
            </div> 
        </c:if>
        <c:if test="${not empty agendamentoEditando}">
            <div class="content">

                <div class="formulario">
                    <div style="color: green" id="msgerro"> ${mensagemSucesso} </div>
                    <div style="color: red">${mensagemErro}</div>


                    <form action="${pageContext.request.contextPath}/veragendamentos"  method="post" name="formulariocadastro" onsubmit="return validarformagendar(this)">
                        <br>
                        <label class="titulo">Agenda</label>

                        <fieldset id="tabelaconteudo">
                            <input type ="hidden" name="idagendamento" value="${agendamentoEditando.idagendamento}"/>
                            <%-- DATA AGENDAMENTO --%>
                            <label for="dataagendamento" class="alinhamento">Dt Agendamento</label>
                            <input type="date" name="dataagendamento" value="${agendamentoEditando.dataagendamento}"id="dataagendamento" style="width: 300px; height: 28px;"/>
                            <span class="style1">*</span>                        

                            <%-- HORA--%>
                            <label for="horaagendamento" class="alinhamento">Hora Desejada:</label>
                            <select name ="horaagendamento" id="horaagendamento" style="width: 305px; height: 35px;">
                                <option value="${agendamentoEditando.horaagendamento}">${agendamentoEditando.horaagendamento}</option> 
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
                            <br>
                            <br>
                            <%-- DESCRIÇÃO AGENDAMENTO --%>
                            <label for="descricaoagendamento" class="alinhamento">Descrição do Agendamento:</label>
                            <input type="text" name="descricaoagendamento" value="${agendamentoEditando.descricaoagendamento}" id="descricaoagendamento" placeholder="Opcional" style="width: 300px; height: 40px;"/>
                            <span class="style1">opcional</span>                        
                            <br>
                            <br>                         
                            <%-- ID DO CLIENTE--%>
                            <label for="idcliente" class="alinhamento" onchange="javascript:associaInput();">Cliente:</label>
                            <select name ="idcliente" id="idcliente" style="width: 305px; height: 35px;">
                                <option value="${agendamentoEditando.cliente.idcliente}">${agendamentoEditando.cliente.nomecliente}</option> 
                            </select>

                            <span class="style1">*</span>
                            <br>
                            <br>
                            <fieldset> 
                                <div class="botao" >

                                    <input type="submit" class="escondido" name="alterar" value="Gravar Alteração" id="alterar" />
                                    <br>
                                    <input type="reset" class="escondido" name="reset" value="Limpar Campos " id="reset"  />
                                </div>
                            </fieldset>

                        </fieldset>

                    </form>
                </div>  

            </div> 
        </c:if>


    </body>
</html>



