<%-- 
    Document   : exito
    Created on : Nov 15, 2012, 11:36:02 PM
    Author     : mary
--%>

<%@page import="javabeans.Tratado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>

<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.js"></script> 
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.dataTables.js"></script>   

<style type="text/css" title="currentStyle"> 
    @import "<%=request.getContextPath()%>/interfaz/demo_page.css";
    @import "<%=request.getContextPath()%>/interfaz/demo_table.css";
</style> 

<script type="text/javascript" charset="utf-8"> 
    $(document).ready(function() {
        $('#example').dataTable();
    } );
</script>


<script type="text/javascript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.tablesorter.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.paginatetable.js"></script>
<script>
    $(document).ready(function(){
        $(".cajaTitulo").click(function(){
            for (var i=0; i<this.childNodes.length; ++i){
                if (this.childNodes[i].nodeName == "FORM"){
                    this.childNodes[i].submit();
                }
            }
        });
        $("#tablaResultados")
        .tablesorter({sortList: [[0,0]]})
        .paginateTable({ rowsPerPage: 10 });
    } 
);

function verTratado(div){
    forms = div.getElementsByTagName("form");
    $(forms[0]).submit()
}
</script>

<logic:notPresent name="tratados">  <%--Si no hay tratados que mostrar--%>
    <div id="noHayTratados" style="margin: auto; font-size: 30px; font-family: Helvetica; color: grey;">
        </br>
        No existen tratados coincidentes con la búsqueda.
        </br>
        </br>
        <table> 
            <tr>
                <td colspan="2">
                    <div class="botonBusqueda" style="float:left; ">
                        <html:link action="/buscarForm">
                            Ir a Busqueda Principal
                        </html:link>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</logic:notPresent>

<logic:present name="tratados">
    <logic:empty name="tratados">
        <div id="noHayTratados" style="margin: auto; font-size: 30px; font-family: Helvetica; color: grey;">
            </br>
            No existen tratados coincidentes con la búsqueda.
            </br>
            </br>
            <table> 
                <tr>
                    <td colspan="2">
                        <div class="botonBusqueda" style="float:left; ">
                            <html:link action="/buscarForm">
                                Ir a Búsqueda Principal
                            </html:link>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

    </logic:empty>
    <logic:notEmpty name="tratados">
        <div id="listarTratados" style="padding: 50px 7px 0px 7px">
            <div id="resultbusq" class="inbox" style="width: 800px;">
                <br>
                <div class="titulo" style="width: 100%; text-align: left;"> Resultados de la Búsqueda</div>
                <br><br><br>
                <div class="botonBusqueda" style="float:left; ">
                    <html:link action="/buscarForm">
                        Ir a Búsqueda Principal
                    </html:link>
                </div>
                <br><br><br><br>
                <table class="display" id="example">
                    <thead>
                        <tr>
                            <th> Título </th>
                            <th> Pais </th>
                            <th> Fecha Firma (MM/DD/AAAA) </th>
                        </tr>
                    </thead>
                    <tbody>
                        <logic:iterate name="tratados" id="tratado">
                            <tr>
                                <td valign="top">
                                    <div class="cajaTitulo" onclick="verTratado(this)">
                                        <html:form action="/tratado/consultar">
                                            <html:hidden name="tratado" property="id"/>
                                            <bean:write name="tratado" property="titulo"></bean:write><!--styling es consultaTratado-->
                                        </html:form>
                                    </div>
                                </td>
                                <td valign="top">
                                    <bean:write name="tratado" property="paises[0]"></bean:write>
                                </td>
                                <td valign="top">
                                    <bean:write name="tratado" property="firmaFecha"></bean:write>
                                </td>
                            </tr>
                        </logic:iterate>
                    </tbody>
                </table>
                <br><br>
                <table> 
                    <tr>
                        <td colspan="2">
                            <div class="botonBusqueda" style="float:left; ">
                                <html:link action="/buscarForm">
                                    Atras
                                </html:link>
                            </div>
                        </td>
                    </tr>
                </table>
                <br>
                <br>
            </div>
        </div>
    </logic:notEmpty>
</logic:present>
<logic:notPresent name="tratados">
    <h1>No hay resultados</h1>
    <table> 
        <tr>
            <td colspan="2">
                <div class="botonBusqueda" style="float:left; ">
                    <html:link action="/buscarForm">
                        Ir a Búsqueda Principal
                    </html:link>
                </div>
            </td>
        </tr>
    </table>
</logic:notPresent>
