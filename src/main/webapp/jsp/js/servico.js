/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validarformservico(frm) {
    if (frm.servico.value === "") {
        alert("Por favor, Digite o nome do servico que deseja cadastrar");
        frm.servico.focus();
        return false;
    }
    else if (frm.valor.value === "") {
        alert("Por favor, Digite o valor para o servico que está cadastrando!");
        frm.valor.focus();
        return false;
        
    }
    
}

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