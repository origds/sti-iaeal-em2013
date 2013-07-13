<%-- 
    Document   : menu
    Created on : Oct 22, 2012, 12:42:46 AM
    Author     : vicente
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<script type="text/javascript" src="interfaz/javaScript/base.js"></script>
<script type="text/javascript" src="interfaz/javaScript/jquery-1.8.2.min.js"></script>

<script>
  $(document).ready(function(){
    $("#opcionesUsuario").hide();
    $("#dropDownMenu").click(function(){
      $("#opcionesUsuario").toggle();
      $("#abajo").toggle();
      $("#arriba").toggle();
    })
  });
</script>

<div id="herramientas" >
  <logic:present name="login">
    <div id="dropDownMenu">
      <div class="opcionesVer">
        <div class="texto">
          <b><bean:write name="login" property="nombre"/></b>
          <html:img page="/interfaz/imagenes/dropdown.png" styleId="abajo" />
          <html:img page="/interfaz/imagenes/dropup.png" styleId="arriba" style="display: none;"/>
        </div>
      </div>
    </div> 
    <div id="opcionesUsuario">
      <logic:equal name="login" property="administrador" value="true" scope="session">
        <html:link action="/tratado/gestionarPendientes">
          <div class="opcionUsuario">Ver Pendientes</div>
        </html:link>
      </logic:equal>
      <html:form action="/usuario/actualizarPerfilForm" method="POST" enctype="multipart/form-data" >
        <html:hidden name="login" property="usuario"/>  
        <div class="opcionUsuario">
          <html:submit> Editar Perfil </html:submit>
          </div>
      </html:form>
      <logic:equal name="login" property="administrador" value="false" scope="session">
        <html:link action="/tratado/gestionarMisTratados">
          <div class="opcionUsuario">Mis Tratados</div>
        </html:link>
      </logic:equal>
       
       
            <html:link action="/tratado/crearForm">
                <div class="opcionUsuario">Incorporar Tratado</div>
            </html:link>  
           
       <logic:equal name="login" property="administrador" value="true" scope="session">  
            <html:link action="/ListarLog">
                <div class="opcionUsuario">Historial</div>
            </html:link>
       </logic:equal>     
       <logic:equal name="login" property="administrador" value="true" scope="session">    
            <html:link action="/usuario/crearForm">
                <div class="opcionUsuario">Crear Usuario</div>
            </html:link>   
       </logic:equal>       
       <logic:equal name="login" property="administrador" value="true" scope="session">  
            <html:link action="/usuario/gestionar">
               <div class="opcionUsuario">Listar Usuario</div>
            </html:link>  
        </logic:equal>       
            
      <html:link action="/cerrarSesion">
        <div class="opcionUsuario">Cerrar Sesion</div>
      </html:link>
    </div>
  </logic:present> 

</div>



