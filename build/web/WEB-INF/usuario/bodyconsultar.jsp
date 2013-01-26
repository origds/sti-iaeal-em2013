<%-- 
    Document   : bodyconsultar
    Created on : Nov 15, 2012, 9:43:16 PM
    Author     : origds
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

<div id="registroUsuario">
    <div class="box">
        <div class="inbox">
            <div class="titulo">Consultar Usuario</div>
                </br></br>
                <fieldset>
                  <legend>Usuario</legend>
                  <bean:write name="usuario" property="usuario"/>
                </fieldset>
                <fieldset>                    
                    <legend>Nombre</legend>
                    <bean:write name="usuario" property="nombre"/>
                </fieldset>
                <fieldset>                
                    <legend>Apellido</legend>
                    <bean:write name="usuario" property="apellido"/>
                </fieldset>              
                <fieldset>
                    <legend>Correo</legend>
                    <bean:write name="usuario" property="correo"/>
                </fieldset>
                 <fieldset>
                    <legend>Administrador</legend>
                    <bean:write name="usuario" property="administrador"/>
                </fieldset>
        </div>
    </div>
</div>