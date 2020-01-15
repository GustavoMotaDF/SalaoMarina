<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Inicio</title>
        <jsp:include page="includes/importscss.jsp"/>
    </head>

    <body style="background-color: #D3D3D3">

        <jsp:include page="includes/menu.jsp"/>

        <main role="main">
            <br>
            <br>
            <!-- Main jumbotron for a primary marketing message or call to action -->

            <div class="container">
                <%
                    String nome = (String) session.getAttribute("nome");
                    request.setAttribute(nome, nome);
                %>
                <div class="container">
                    <h1 class="display-3">Hello, ${nome}!</h1>
                </div>
                <div class="container" style="width: auto">
                    <div class="accordion   " id="accordionExample"  >
                        <div class="card">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-auto">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Notificações
                                    </button>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <h5>Você está com ${agendamentospendente[0]} agendamento(s) pendente(s) de uma data anterior a hoje!</h5>
                                    <h5>Você está com ${agendamentos[0]} agendamento(s) hoje!</h5>
                                    <a class="btn btn-outline-info" href="${pageContext.request.contextPath}/agendar#listatab" >Ver Agendamentos</a>
                                    <hr>
                                    <h5>Voce está com ${mensagens[0]} mensagen(s) não lida(s)!</h5>
                                    <a class="btn btn-outline-info" href="${pageContext.request.contextPath}/Mensagens" >Ver Mensagens</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <br>
                <br>
                <hr>
            </div>

            ${Bemvindo}
 
        </main>  

        
        <jsp:include page="includes/footer.jsp"/>
        <jsp:include page="includes/imports.jsp"/>
    </body>
</html>
