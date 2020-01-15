<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Material design navigation</title>
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'><link rel="stylesheet" href="jsp/css/styleMENU.css">

</head>
<body>
<!-- partial:index.partial.html -->
<nav>   
  <ul>
       <img src="jsp/css/user1.png" alt="Matthew Greenberg"/><span>${Login["0"]["0"]}</span> 
      <c:forEach var="Login" items="${Login}">
          <li><a href="${Login["3"]}">${Login["4"]}</a></li> 
      </c:forEach>
    
  </ul>
</nav>
<div class="openNav">
  <div class="icon"></div>
  <br>
  <br>
  <label> Olá, ${Login["0"]["0"]}</label>
</div>


<div class="wrapper">
    
  
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="jsp/js/scriptMENU.js"></script>

</body>
</html>