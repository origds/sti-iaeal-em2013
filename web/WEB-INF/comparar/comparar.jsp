<%-- 
    Document   : comparar
    Created on : 09-mar-2013, 15:03:56
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
  
            $("#ini").val("");
            $("#fin").val("");
      
            $("#botonPaises").show();
            $("#botonPeriodo").show();
            $("#periodos1").show();
            $("#periodos2").show();
            $("#periodos3").show();
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
                <div class="titulo">Comparar Tratados.</div>
                <br> <br> <br>
                
                <html:form method="POST" action="/comparar">                        
                    <p>           
                    <div id ="periodos1">
                        <fieldset>
                            <legend>Período 1</legend>                  
                            <legend>Inicio de período</legend>   
                            
                            <html:text property="periodoIni1" value=""/>

                            <legend>Finalización de período</legend>
                            <html:text property="periodoFin1" value = "" />               
                        </fieldset>   
                    </div>

                    <div id ="periodos2">
                        <fieldset>
                            <br> <br> <br>
                            <legend>Período 2</legend>                  
                            <legend>Inicio de período</legend>                  
                            <html:text property="periodoIni2" value="" />

                            <legend>Finalización de período</legend>
                            <html:text property="periodoFin2" value = "" />               
                        </fieldset>
                    </div>  
                    <br> <br> <br>
                    <div id="Comparar" style="float: center;">
                        <html:submit> Comparar </html:submit>
                    </div>
                </html:form> 
            </div>
        </div>
    </div>	
</div> 