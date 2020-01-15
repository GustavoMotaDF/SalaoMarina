/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function sonumeros(e)
{
	var tecla=new Number();
	if(window.event) {
		tecla = e.keyCode;
	}
	else if(e.which) {
		tecla = e.which;
	}
	else {
		return true;
	}
	if((tecla >= "97") && (tecla <= "122")){
		return false;
	}
}


function Login() {
    var done=0;
    var usuario = document.getElementsByName('login')[0].value;    
    usuario=usuario.toLowerCase();

    var senha= document.getElementsByName('senha')[0].value;
    senha=senha.toLowerCase();    

        if (usuario=="" && senha=="") {       
            window.location="jsp/inicio.jsp";
            done=1;
        }
    
        else if (done==0) { 
            alert("Login ou senha incorreta! Tente novamente"); 
        }
}