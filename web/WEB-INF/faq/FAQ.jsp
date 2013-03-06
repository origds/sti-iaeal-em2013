<%-- 
    Document   : FAQ
    Created on : 11-feb-2013, 19:37:58
    Author     : ISA
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<style>
  .error{font-size: 10px;color: #cc0000; float:left; padding:0}
  .error ul{list-style: none;}
</style>
<script type="javascript" src="interfaz/"></script>
<div id="body">
  <div id="barraBusqueda">
    <div class="box"> 
      <div class="inbox" id="cajaBusqueda">
          <div class="titulo">Preguntas Frecuentes</div> <br><br>
    <div class="tituloFAQ"><a href="#" onclick='$("#info1").slideToggle();'>+</a>¿Cómo busco un tratado?</div>
    <div class="infoFAQ" id="info1">
       Para buscar un tratado en la Base de Datos, es necesario presionar el 
       botón de "Búsqueda" en el Menú superior. La página ofrece dos
       alternativas para la búsqueda de tratados. 
       La primera consiste en escribir en el campo de búsqueda palabras claves 
       que se deseen encontrar en el título de los tratados y luego debe 
       presionar "Buscar". 
       La segunda alternativa consiste en presionar "Ver Todos", lo cual listará
       todos los tratados existentes en la Base de Datos.
       Ambas opciones darán una lista de tratados la cual podrá ser filtrada
       con nuevas palabras claves en un campo que se encuentra en la esquina
       superior derecha de la página de Resultados.
    </div>
    <div class="tituloFAQ"><a href="#" onclick='$("#info2").slideToggle();'>+</a>¿Puedo agregar tratados al Sistema?</div>
    <div class="infoFAQ" id="info2">
       Únicamente los administradores del Sistemas agregarán tratados para
       asegurar la veracidad de la información. 
       La información se obtiene del Libro Amarillo de la Cancillería de 
       Venezuela y es agregada manualmente al Sistema.
    </div>
    <div class="tituloFAQ"><a href="#" onclick='$("#info3").slideToggle();'>+</a>¿Cómo guardo información de un tratado que busqué?</div>
    <div class="infoFAQ" id="info3">
       Luego de realizar una búsqueda, seleccione el tratado que desee guardar
       para ver la Planilla de este. En la esquina superior de la planilla 
       presione el botón "Descargar" para que comience la descarga.
       Al finalizar la descarga podrá guardar la planilla del tratado en formato
       PDF.
    </div>
<%--     <div class="tituloFAQ"><a href="#" onclick='$("#info4").slideToggle();'>+</a>Pregunta 4</div>
    <div class="infoFAQ" id="info4">
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
    </div>
    <div class="tituloFAQ"><a href="#" onclick='$("#info5").slideToggle();'>+</a>Pregunta 5</div>
    <div class="infoFAQ" id="info5">
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
       Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla
    </div> --%>
    <div onload="carga();"></div>
    </div>
  </div>
</div>	