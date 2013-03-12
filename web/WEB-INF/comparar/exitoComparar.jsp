<%-- 
    Document   : exitoComparar
    Created on : 09-mar-2013, 15:04:10
    Author     : isaj
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

<style type="text/css">
    table { float: left; margin: 140px 40px 0 0;  }
    td input { border: 1px solid orange; background: yellow; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; position: absolute; padding: 8px 0; text-align: center; width: 60px; margin: -17px 0 0 4px; font-size: 1.4em; }
    td.input { padding: 0; position: relative; }
    .visualize { float: left; }
</style>

<div id="body">
    <div id="barraBusqueda">
        <div class="box"> 
            <div class="inbox" style="height: 200px;" id="cajaBusqueda">
                <div class="titulo">Resultado de la Comparación</div>
                <br><br>

                <logic:present name="Comparar">
                    <div>

                        <table style="float:left ;width:500px;margin:12px -11px 0 0">
                            <caption></caption>
                            <thead>
                                <tr>
                                    <th id="anio1" scope="col" style="color:red"><bean:write name="Comparar" property="periodoIni1"/> - <bean:write name="Comparar" property="periodoFin1"/></th> 
                                    <th id="anio2" scope="col" style="color:red"><bean:write name="Comparar" property="periodoIni2"/> - <bean:write name="Comparar" property="periodoFin2"/></th> 
                            </thead>
                            <tbody>
                                <tr>                                    
                                    <th id ="num1" ><bean:write name="Comparar" property="cantidad1"/></th>
                                    <th id ="num2" ><bean:write name="Comparar" property="cantidad2"/></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </logic:present>

            </div>
        </div>
    </div>
</div>	
