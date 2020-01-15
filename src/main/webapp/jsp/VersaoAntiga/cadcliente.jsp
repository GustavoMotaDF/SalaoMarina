<%-- 
    Document   : cadcliente
    Created on : 15/07/2019, 20:35:33
    Author     : gustavo
--%>


<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
 


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="jsp/css/estilo.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Comfortaa" />
        <script type="text/javascript" src="jsp/js/cadastro.js"></script>
        
        
        <title>Cliente</title>
    </head>
    <body>
        <div class="barra">
            
            <div id="titulo" align="center">
                Salão da Mari
            </div>
            
        </div>
        <div class="sidebar">
            <a  href="jsp/inicio.jsp"><i class="fa fa-fw fa-home"></i> Inicio</a>
            <a href="${pageContext.request.contextPath}/venda"><i class="fa fa-money"></i> Caixa</a>
            <a href="${pageContext.request.contextPath}/agendar"><i class="fa fa-book"></i> Agendamento</a>
            <a class="active"href="${pageContext.request.contextPath}/cadcliente"><i class="fa fa-user-plus" ></i> Clientes</a>
            <a href="${pageContext.request.contextPath}/cadservico"><i class="fa fa-handshake-o"></i> Serviços</a>
            <a class="selecionado"  href="#about" ><i class="fa fa-bar-chart" ></i> Relatorios</a>
        </div>

        <div class="content">
            <div class="formulario">
                <div style="color: green" id="msgerro"> ${mensagemSucesso} </div>
                <div style="color: red">${mensagemErro}</div>


                <form action="${pageContext.request.contextPath}/cadcliente"  method="post" name="formulariocadastro" onsubmit="return validarform(this)">
                    <br>
                    <label class="titulo">Cadastro de Clientes</label>
                    
                    <fieldset id="tabelaconteudo">
                        

                        <%-- CLIENTE --%>
                        <label for="nomecliente" class="alinhamento">Cliente:</label>
                        <input type="text" name="nomecliente" id="nomecliente" placeholder="José Maria" style="width: 300px; height: 28px;"/>
                        <span class="style1">*</span>                        
                        <br>
                        <br>
                        <%-- CPF --%>
                        <label for="cpf" class="alinhamento">Cpf:</label>
                        <input type="text" name="cpf" id="cpf" onkeypress="return sonumeros(event)" maxlength="11" pattern="[0-9]{11}" title="Digite apenas numeros!" placeholder="000.000.000-00" style="width: 300px; height: 28px;"/>
                        <span class="style1">*</span>                        
                        <br>
                        <br>                         
                        <%-- ENDEREÇO --%>
                        <label for="endereco" class="alinhamento">Endereço:</label>
                        <input type="text" name="endereco" id="endereco" placeholder="Ex: Quadra 10, Rua Maria, Conjunto K " style="width: 300px; height: 28px;"/>
                        <span class="style1">*</span>                        
                        <br>
                        <br>
                        <%--TELEFONE --%>
                        <label for="telefone" class="alinhamento">Telefone:</label>
                        <input type="text" name="telefone" id="telefone" onkeypress="return sonumeros(event)"placeholder="61 9 9999 9999" style="width: 300px; height: 28px;"/>
                        <span class="style1">*</span>                        
                        <br>
                        <br>
                        <%-- DATANASCIMENTO --%>
                        <label for="datanascimento" class="alinhamento">Dt nascimento:</label>
                        <input type="date" name="datanascimento" id="datanascimento" style="width: 300px; height: 28px;"/>
                        <span class="style1">*</span>                        
                        <br>
                        <br>
                        <%-- SEXO --%>
                        <label for="sexo" class="alinhamento">Sexo:</label>
                        <select name ="sexo" id="sexo" style="width: 305px; height: 35px;">
                            <option value="">Selecione o sexo...</option>                                
                            <option value="M">M</option>
                            <option value="F">F</option>
                        </select>
                        <span class="style1">*</span>
                        <br>
                        <br>
                        <fieldset >
                            <div class="botao" >
                                <input type="submit" class="escondido" name="cadastrar" value="Realizar Cadastro" id="cadastrar" />
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

