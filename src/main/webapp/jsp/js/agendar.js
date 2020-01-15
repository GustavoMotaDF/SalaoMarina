/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function validarformagendar(frm) {
    if (frm.dataagendamento.value === "") {
        alert("Por favor, Selecione a Data para o Agendamento");
        frm.dataagendamento.focus();
        return false;
    }
    else if (frm.horaagendamento.value === "") {
        alert("Por favor, Selecione a hora que será realizado o Atendimento!");
        frm.horaagendamento.focus();
        return false;
        
    }
    
     if (frm.idcliente.value === "") {
        alert("Por favor, Selecione o Cliente");
        frm.idcliente.focus();
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