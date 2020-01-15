/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validarformvenda(frm) {
    if (frm.idcliente.value === "") {
        alert("Por favor, Selecione o Cliente");
        frm.idcliente.focus();
        return false;
    }
    else if (frm.datavenda.value === "") {
        alert("Por favor, Escolha a data para a Venda!");
        frm.datavenda.focus();
        return false;
        
    }
    else if (frm.idservico.value === "") {
        alert("Por favor, Selecione o serviço que foi prestado");
        frm.idservico.focus();
        return false;
        
    }
    else if (frm.formatovenda.value === "") {
        alert("Por favor, Selecione o formato do pagamento");
        frm.formatovenda.focus();
        return false;
        
    }
   
    
    
}