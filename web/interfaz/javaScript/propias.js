/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function carga() {
  $("#info1").hide();
  $("#info2").hide();
  $("#info3").hide();
  $("#info4").hide();
  $("#info5").hide();
}

function mysFAQ(nombre) {
  nombre2 = '"#'+nombre+'"';
  alert(nombre2);
  $(nombre2).slideToggle();
}