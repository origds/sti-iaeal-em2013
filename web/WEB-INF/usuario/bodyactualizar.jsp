<%-- 
    Document   : bodyactualizar
    Created on : Oct 23, 2012, 2:03:44 AM
    Author     : vicente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<style>
    .inf{font-size: 10px;float:left;}
    .info{font-size: 10px;display: inline;}
    .ident{font-size: 15px;}
    .error{font-size: 10px;color: #cc0000; float:left; padding:0}
    .error ul{list-style: none;}
    legend{font-size: 15px; font-weight: bold}
</style>

<html:javascript formName="Usuario"/>
<div id="registroUsuario">
    <div class="box">
        <div class="inbox">
            <div class="titulo">Actualizar Usuario</div>
            
            <html:form action="/usuario/actualizar" styleId="styleUsuario" onsubmit= "if(!confirm('Seguro desea actualizar su Perfil?')) return false" >           

                </br></br>
                <div style="color:red" >Todos los campos con (*) son requeridos</div>
                <br>
                <fieldset>
                    <legend>Usuario</legend>
                    <bean:write name="Usuario" property="usuario"/>
                    <html:hidden name="Usuario" property="usuario"/>   
                </fieldset>

                <fieldset>
                    <legend>Contraseña (*)</legend>
                    <div class="error">
                        <html:errors property="contrasena"/>
                    </div>
                    <html:password name="Usuario" property="contrasena" value="xxxxxx"/>
                </fieldset>

                <fieldset>                    
                    <legend>Nombre (*)</legend>
                    <div class="error">
                        <html:errors property="nombre"/>
                    </div>
                    <html:text name="Usuario" property="nombre"/>
                </fieldset>

                <fieldset>                
                    <legend>Apellido (*)</legend>
                    <div class="error">
                        <html:errors property="apellido"/>
                    </div>
                    <html:text name="Usuario" property="apellido"/>
                </fieldset>              

                <fieldset>
                    <legend>Correo (*)</legend>
                    <div class="error">
                        <html:errors property="correo"/>
                    </div>
                    <html:text name="Usuario" property="correo"/>
                </fieldset>


                Administrador<html:checkbox name="Usuario" property="administrador"/>


                <html:submit property="submit" value="Actualizar" style="font-size: 17px"/>
            </html:form>
        </div>
    </div>
</div>
