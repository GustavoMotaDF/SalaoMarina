<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="jsp/css/salaomarina3.jpg">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="jsp/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jsp/css/floating-labels.css" rel="stylesheet">
  </head>

  <body style="background-color: #FFB6C1">
      
      
    <form class="form-signin" action="${pageContext.request.contextPath}/Inicio" method="post">
      <div class="text-center mb-4">
          <style>
              #titulogin{
                  font-family: "Times New Roman";
                  
              }
          </style>
                 
           
          <img class="mb-4" src="jsp/css/salaomarina2.jpg" alt="" width="320" height="150" style="border-radius: 20%">
        
      </div>

      <div class="form-label-group">
        <input type="text" id="inputEmail" class="form-control" name="nome" placeholder="Nome de usu�rio" required autofocus>
        <label for="inputEmail">Nome de usu�rio</label>
      </div>

      <div class="form-label-group">
        <input type="password" id="inputPassword" name="senha" class="form-control" placeholder="Password" required>
        <label for="inputPassword">Senha</label>
      </div>

      
      <button class="btn btn-lg btn-primary btn-block" name="Entrar" type="submit">Entrar</button>
      ${mensagemErro}
     
        
      <p class="mt-5 mb-3 text-muted text-center">&copy; Marina Vasconcelos 2019
          <br> 
          <a  href="Site/index.html" target="_blank">Ir para site</a>
      </p>
      

      
    </form>
      
      
      
      
  </body>
</html>
