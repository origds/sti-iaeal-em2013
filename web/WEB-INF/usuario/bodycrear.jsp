<%-- 
    Document   : bodycrear
    Created on : Oct 23, 2012, 12:10:54 AM
    Author     : vicente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<style>
    .inf{font-size: 10px;float:left;}
    .info{font-size: 10px;display: inline;}
    .ident{font-size: 15px;}
    .error{font-size: 10px;color: #cc0000; float:left; padding:0}
    .error ul{list-style: none;}
    legend{font-size: 15px; font-weight: bold}    
</style>

<logic:present name="revisar">
  <logic:equal name="revisar" value="usuarioRegistrado">
    <script>
      $(document).ready(function(){
           alert("Nombre de Usuario ya utilizado");
      });
    </script>
  </logic:equal>
</logic:present>


<div id="registroUsuario">
    <div class="box">
        <div class="inbox">
            <div class="titulo">Nuevo Usuario</div>
            <html:form action="/usuario/crear" styleId="styleUsuario" onsubmit="javascript:checkcontrasena();" acceptCharset="ISO-8859-1">
                </br></br>
                 <div style="color:red" >Todos los campos con (*) son requeridos</div>
                 <br>
                <fieldset>
                    <div class="error">
                        <html:errors property="usuario"/>
                    </div>
                    <legend>Usuario (*)</legend>

                    <html:text property="usuario" value=""/>

                </fieldset>

                <fieldset>
                    <div class="error">
                        <html:errors property="contrasena"/>
                    </div>
                    <legend>Contraseña (*)</legend>
                    <html:password property="contrasena" value=""/>
                </fieldset>
                
                <fieldset>
                    <div class="error">
                        <html:errors property="nombre"/>
                    </div>
                    <legend>Nombre (*)</legend>
                    <html:text property="nombre" value=""/>
                </fieldset>

                <fieldset>
                    <div class="error">
                        <html:errors property="apellido"/>
                    </div>
                    <legend>Apellido (*)</legend>
                    <html:text property="apellido" value=""/>
                </fieldset>

                <fieldset>
                    <div class="error">
                        <html:errors property="correo"/>
                    </div>
                    <legend>Correo (*)</legend>
                    <html:text property="correo" value=""/>
                </fieldset>

                Administrador<html:checkbox property="administrador"/>
                <html:submit property="submit" value="Registrar" style="font-size: 17px"/>
            </html:form>
        </div>  
    </div>
</div>

