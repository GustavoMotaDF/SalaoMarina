<%-- 
    Document   : imports
    Created on : 15/12/2019, 09:06:37
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="jsp/js/jquery-3.3.1.slim.min.js"></script>
<script src="jsp/js/jquery-slim.min.js"></script>
<script src="jsp/js/popper.min.js"></script>
<script src="jsp/js/bootstrap.min.js"></script>
<script>
    function sonumeros(e)
    {
        var tecla = new Number();
        if (window.event) {
            tecla = e.keyCode;
        } else if (e.which) {
            tecla = e.which;
        } else {
            return true;
        }
        if ((tecla >= "97") && (tecla <= "122")) {
            return false;
        }
    }
</script>