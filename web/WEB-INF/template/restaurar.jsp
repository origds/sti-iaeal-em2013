<%-- 
    Document   : restaurar
    Created on : 18-mar-2013, 16:54:14
    Author     : isaj
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>

<script>
    $(document).ready(function() {
        $("#periodos1").hide();
        $("#periodos2").hide();
        $("#periodos3").hide();
    
        $("#botonPeriodo").click(function(){
      
            $("#ini").val("");
            $("#fin").val("");
      
            $("#botonPaises").show();
            $("#botonPeriodo").show();
            $("#periodos1").show();
            $("#periodos2").show();
            $("#periodos3").show();
        });
    
        $("#botonPaises").click(function(){
     
            $("#periodos1").hide();
            $("#periodos2").hide();
            $("#periodos3").hide();
            $("#botonPeriodo").show();
            $("#botonPaises").show();
        });
    });
</script>

<style>
    .error{font-size: 10px;color: #cc0000; float:left; padding:0}
    .error ul{list-style: none;}
</style>

<div id="body">
    <div id="barraBusqueda">
        <div class="box"> 
            <div class="inbox" id="cajaBusqueda">
                <div class="titulo">Restaurar Contraseña.</div>
                <html:form action="/iniciarSesion" acceptCharset="UTF-8">
                    <fieldset style="border:none; text-align: left;">
                      Introduzca su correo electrónico
                      <div class="error">
                        <html:errors property="usuarioLogin"/>
                      </div>
                      <html:text property="usuarioLogin"  value=""/>         
                    </fieldset>
                    <fieldset style="border:none; text-align: left; ">

                        <html:password property="contrasenaLogin" value=""/>
                    </fieldse >
                <html:submit value="Envíar Contraseña" style="font-size: 13px"/>	
                </fieldset>
              </html:form>	
            </div>
        </div>
    </div>	
</div> 