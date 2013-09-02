<%-- 
    Document   : topMenu
    Created on : Oct 22, 2012, 9:44:12 AM
    Author     : vicente
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<div class="barraGris" id="topMenu">
  <html:link action="/buscarForm">
    <div class="opcionesIzq">
      <div class="texto">
        Búsqueda
      </div>						
    </div>
  </html:link>

        
  <html:link action="/compararForm">
    <div class="opcionesIzq">
      <div class="texto"> Comparar </div>						
    </div>
  </html:link> 
    
    
  <html:link action="/estadisticaForm">
    <div class="opcionesIzq">
      <div class="texto">
        Estadística
      </div>						
    </div>
  </html:link>  

  <html:link action="/plantilla">
    <div class="opcionesIzq">
      <div class="texto">
        Plantilla Tratado
      </div>						
    </div>
  </html:link> 

    
  <html:link action="/faq">
    <div class="opcionesIzq">
      <div class="texto"> Ayuda </div>						
    </div>
  </html:link> 

  <html:link action="/home">
    <div class="opcionesDer">
      <div class="texto">Inicio</div>
    </div>
  </html:link>
  
  <logic:present name="login">

    <logic:equal name="login" property="administrador" value="true" scope="session">
  
     
    </logic:equal>
  </logic:present>


</div>

<logic:present name="revisar">
  <logic:equal name="revisar" value="usuarioInvalido">
    <script>
      $(document).ready(function(){
        alert("Combinacion Usuario-Contrasena incorrecta");
      });
    </script>
  </logic:equal>
</logic:present>

