/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var modal = document.getElementById("myModal");
var modal1 = document.getElementById("myModal1");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close1")[0];

// When the user clicks the button, open the modal 
function abrir() {
    modal.style.display = "block";
}
function abrir1() {
    modal1.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function () {
    modal.style.display = "none";
    fechar();
};
span1.onclick = function () {
    modal1.style.display = "none";
    fechar();
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target === modal) {
        modal.style.display = "none";
        fechar();

    } else if (event.target === modal1) {
        modal1.style.display = "none";
        fechar();
    }
}
// fechar modal
function fechar1() {
    modal1.style.display = "none";
}
function fechar() {
    modal.style.display = "none";
}
function habilitar(id) {
    if (document.getElementById(id).disabled) {
        document.getElementById(id).disabled = false;
    } else {
        document.getElementById(id).disabled = true;
    }
}



