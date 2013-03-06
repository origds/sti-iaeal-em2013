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
    <div class="tituloFAQ"><a href="#" onclick='$("#info1").slideToggle();'>+</a>�C�mo busco un tratado?</div>
    <div class="infoFAQ" id="info1">
       Para buscar un tratado en la Base de Datos, es necesario presionar el 
       bot�n de "B�squeda" en el Men� superior. La p�gina ofrece dos
       alternativas para la b�squeda de tratados. 
       La primera consiste en escribir en el campo de b�squeda palabras claves 
       que se deseen encontrar en el t�tulo de los tratados y luego debe 
       presionar "Buscar". 
       La segunda alternativa consiste en presionar "Ver Todos", lo cual listar�
       todos los tratados existentes en la Base de Datos.
       Ambas opciones dar�n una lista de tratados la cual podr� ser filtrada
       con nuevas palabras claves en un campo que se encuentra en la esquina
       superior derecha de la p�gina de Resultados.
    </div>
    <div class="tituloFAQ"><a href="#" onclick='$("#info2").slideToggle();'>+</a>�Puedo agregar tratados al Sistema?</div>
    <div class="infoFAQ" id="info2">
       �nicamente los administradores del Sistemas agregar�n tratados para
       asegurar la veracidad de la informaci�n. 
       La informaci�n se obtiene del Libro Amarillo de la Canciller�a de 
       Venezuela y es agregada manualmente al Sistema.
    </div>
    <div class="tituloFAQ"><a href="#" onclick='$("#info3").slideToggle();'>+</a>�C�mo guardo informaci�n de un tratado que busqu�?</div>
    <div class="infoFAQ" id="info3">
       Luego de realizar una b�squeda, seleccione el tratado que desee guardar
       para ver la Planilla de este. En la esquina superior de la planilla 
       presione el bot�n "Descargar" para que comience la descarga.
       Al finalizar la descarga podr� guardar la planilla del tratado en formato
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