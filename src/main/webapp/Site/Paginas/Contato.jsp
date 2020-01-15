<%-- 
    Document   : Contato
    Created on : 08/01/2020, 20:08:04
    Author     : gustavo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Marina Vasconselos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Custom styles for this template -->

        <link rel="icon" href="jsp/css/salaomarina3.jpg" >
        <link href="jsp/css/bootstrap.min.css" rel="stylesheet">
        <link href="jsp/css/jumbotron.css" rel="stylesheet" >
        <link href="jsp/css/modalNone.css" rel="stylesheet" >
    </head>
    <body> 
         <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #FFB6C1">
            <a class="navbar-brand" href="#"><img src="jsp/css/salaomarina3.jpg" width=80px" height="40px" alt="Será que existe um easteregg neste sistema?  use seu conhecimento para descobrir!"/></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
               
                 <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Site/index.html">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Site/Paginas/Servicos.html">Serviços</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/SalaoMarina/Site-Paginas-Contato">Contato</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Site/Paginas/Galeria.html">Galeria</a>
                    </li>                    
                </ul>
                
            </div>
        </nav>

        <div class="container">
            <form class="form-signin" action="/SalaoMarina/Site-Paginas-Contato" name="enviarmensagem"  method="post">
                <br>
                <div class="form-group" style="text-align: center;">
                    <label class="h1">Envie uma mensagem para nós!</label><br>
                    <label class="h6">Duvidas<br>Críticas<br>Sugestões</label>
                </div>
                <div class="form-group" id="foo" style="text-align: center">
                    ${mensagemErro}
                    ${mensagemSucesso}
                </div>
                <div class="card-body" style="border: #D3D3D3 1px solid"> 
                    <div class="form-group">                        
                        <input class="form-control" type="text" name="nome" id="nome" required placeholder="Seu nome*"/>                    
                    </div>
                    <div class="form-group">

                        <input class="form-control" type="text" name="Telefone" onkeypress="return sonumeros(event)" maxlength="11" disabled id="Telefone" required placeholder="Seu Telefone* DDD 9 + numero"/>                    
                    </div>
                    <div class="form-group">                         
                        <input class="form-control" type="text" name="Email" id="Email" disabled placeholder="Seu Email"/>                    
                    </div>

                    <div class="form-group">                         
                        <textarea class="form-control" name="mensagem" id="mensagem" disabled required placeholder="Sua mensagem*"></textarea>
                    </div>
                    <div class=" form-group row">
                        <div class="col-md-6">
                            <button  type="submit" class="btn btn-outline-success form-control"  disabled id="enviar" name="enviar" >Enviar Mensagem</button>
                        </div>
                        <div class="col-md-6">
                            <button type="reset" class="btn btn-outline-warning form-control" name="reset" >Limpar campos</button>
                        </div>                        
                    </div> 
                </div>

                <div id="myModal" class="modal">
                    <!-- Modal conteudo -->
                    <div class="modal-content">                                
                        <span class="close" onclick="fechar()">&times;</span>
                        <p>Sua Mensagem foi enviada com sucesso! </p>
                        <br>
                        <div style="float: left">               
                            <input type="button" value="Ok"  id="close" name="cancelar"  class="btn btn-danger" onclick="fechar()"/>
                        </div>                                
                    </div>
                </div>    
            </form>

        </div>
        <br>
        <footer class="row align-items-sm-center"style="position: inherit; bottom: -0; font-size: 15px; text-align: center; background-color: #F6CECE; color:black">
            <p class="col-md-3">&copy; Marina Vasconcelos 2019-2020 </p>
            <p class="col-md-3">Riacho fundo II<br>Qn 18, Conjunto 1, casa 14</p>
            <p class="col-md-3"><a class="" href="/SalaoMarina/Site-Paginas-Contato" target="_blank">@MarinaVasconcelos<br>(61) 9 9123-4567</a></p>
            <p class="col-md-3"><a class="" target="_blank" href="/SalaoMarina/">Ir para Gestão</a></p>
        </footer>
 
        <script src="jsp/js/jquery-3.3.1.slim.min.js"></script>
        <script src="jsp/js/jquery-slim.min.js"></script>
        <script src="jsp/js/popper.min.js"></script>
        <script src="jsp/js/modalNone.js"></script>
        <script src="jsp/js/bootstrap.min.js"></script>
        <script src="jsp/js/cadastro.js"></script>
        <script>window.jQuery || document.write('<script src="jsp/js/jquery-3.3.1.slim.min.js"><\/script>')</script>         
        <script src="Site/js/holder.min.js"></script>
        <script src="Site/js/contato.js"></script>
        <script>

                                document.body.querySelector('#nome').addEventListener("input", function () {
                                    var tel = document.body.querySelector('#Telefone');
                                    tel.disabled = this.value.length >= 3 ? false : true;

                                });
                                document.body.querySelector('#Telefone').addEventListener("input", function () {
                                    var email = document.body.querySelector('#Email');
                                    email.disabled = this.value.length >= 9 ? false : true;
                                    var tel = document.body.querySelector('#mensagem');
                                    tel.disabled = this.value.length >= 5 ? false : true;

                                });

                                document.body.querySelector('#mensagem').addEventListener("input", function () {
                                    var botao = document.body.querySelector('#enviar');
                                    botao.disabled = this.value.length >= 5 ? false : true;

                                });
        </script>
        <script>
            $(document).ready(function () {
                setTimeout(function () {
                    $('#foo').hide();
                }, 20000);
            });</script>
    </body>
</html>

