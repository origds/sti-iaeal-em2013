<%-- 
    Document   : bodyconsultar
    Created on : Nov 16, 2012, 12:18:33 AM
    Author     : origds
--%>
<%@page import="javabeans.Tratado"%>
<%@page import="javabeans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery-ui-1.9.1.custom.js"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery-ui-1.9.1.custom.min.js"></script>
<script>
    $(document).tooltip();
</script>
<style>
    .error{font-size: 9px;color: #cc0000; float:left; padding:0}
    .error ul{list-style: none;}
    legend{font-size: 15px; font-weight: bold}    
</style>
<!-- Ventana para crear tratado -->
<div id="RegistroTratado">
    <div class="box">
        <div class="inbox">
            <div class="titulo">Consultar Tratado</div>
            <logic:present name="login">
                <!-- Si es administrador...-->
                <logic:equal name="login" property="administrador" value="true" scope="session">
                    <html:form action="/tratado/eliminar" method="POST" enctype="multipart/form-data" onsubmit= "if(!confirm('Seguro desea eliminar este Tratado?')) return false">
                        <html:hidden name="tratado" property="id"/>  
                        <input type="submit" value="" class="eliminar" title="Descartar Tratado"/>
                    </html:form>
                    <html:form action="/tratado/actualizarForm" method="POST" enctype="multipart/form-data">
                        <html:hidden name="tratado" property="id"/> 
                        <input type="submit" value="" class="actualizar" title="Modificar Tratado"/>
                    </html:form>
                    <!-- Si el tratado no esta aprobado y eres administrador, muestra las opciones -->
                    <logic:equal name="tratado" property="status" value="1">
                        <html:form action="/tratado/rechazar" method="POST" enctype="multipart/form-data" onsubmit= "if(!confirm('Seguro desea rechazar este Tratado?')) return false">
                            <html:hidden name="tratado" property="id"/>  
                            <input type="submit" value="" class="rechazado" title="Rechazar el tratado"/>
                        </html:form>
                        <html:form action="/tratado/aprobar" method="POST" enctype="multipart/form-data" onsubmit= "if(!confirm('Seguro desea aprobar este Tratado?')) return false">
                            <html:hidden name="tratado" property="id"/> 
                            <input type="submit" value="" class="aprobado" title="Aprobar el tratado"/>
                        </html:form>
                    </logic:equal>
                </logic:equal>
                <!-- Si no es administrador el usuario-->
                <logic:notEqual name="login" property="administrador" value="true" scope="session">
                    <!-- script para que aparezcan modicicables los tratados pertenecientes a ese usuario-->
                    <% Usuario u = (Usuario) request.getSession().getAttribute("login");
              Tratado t = (Tratado) request.getAttribute("tratado");
              if (t.getUsuario().getUsuario().compareTo(u.getUsuario()) == 0) {%>
                    <html:form action="/tratado/eliminar" method="POST" enctype="multipart/form-data" onsubmit= "if(!confirm('Seguro desea eliminar este Tratado?')) return false">
                        <html:hidden name="tratado" property="id"/>  
                        <input type="submit" value="" class="eliminar" title="Descartar Tratado"/>
                    </html:form>
                    <html:form action="/tratado/actualizarForm" method="POST" enctype="multipart/form-data">
                        <html:hidden name="tratado" property="id"/> 
                        <input type="submit" value="" class="actualizar" title="Modificar Tratado"/>
                    </html:form>
                    <html:form action="/tratado/marcarPendiente" method="POST" enctype="multipart/form-data" onsubmit= "if(!confirm('Seguro desea marca como pendiente este Tratado?')) return false">
                        <html:hidden name="tratado" property="id"/> 
                        <input type="submit" value="" class="pendiente" title="Marcar tratado como pendiente"/>
                    </html:form>

                    <%}%>
                </logic:notEqual>
            </logic:present>

            <html:form action="/pdf" method="POST" enctype="multipart/form-data">
                <html:hidden name="tratado" property="id"/> 
                <input type="submit" value="" class="descargar" title="Descargar Tratado"/>
            </html:form>
            </br>
            <fieldset style="border:none"></fieldset>
            <table class="camposRegistro">	
                <tr>
                    <td colspan="3">
                        <fieldset id="campoTitulo">
                            <legend style="font-size:20px !important;">Título</legend>
                            <bean:write name="tratado" property="titulo"/>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset id="divisionPais">
                            <legend>País(es)</legend>
                            <!--<input type="text" name="paises" -->
                            <!-- Dropdown con los paises-->
                            <logic:iterate id="element" name="tratado" property="paises" indexId="index">
                                ${element}</br>
                            </logic:iterate>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset id="divisionGrupo">
                            <legend>Grupo(s)</legend>
                            <logic:iterate id="element" name="tratado" property="grupos" indexId="index">
                                ${element}</br>
                            </logic:iterate>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset id="divisionClasificacion">
                            <legend>Clasificacion</legend>
                            <logic:equal name="tratado" property="clasificacion" value="true">
                                Multilateral 
                            </logic:equal>
                            <logic:equal name="tratado" property="clasificacion" value="false">
                                Bilateral 
                            </logic:equal>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend>Lugar de Firma</legend>
                            <bean:write name="tratado" property="firmaLugar"/>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>
                            <legend>Fecha de Firma</legend>
                            <span class="fecha"><bean:write name="tratado" property="firmaFecha"/></span>
                        </fieldset>
                    </td>
                    <td>
                        <logic:equal name="tratado" property="aprobado" value="true">
                            <span class="textoCheck" style="font-size: 15px; font-weight: bold">Aprobado</span>
                        </logic:equal>
                        <logic:notEqual name="tratado" property="aprobado" value="true">
                            <span class="textoCheck" style="font-size: 15px; font-weight: bold">No aprobado</span>
                        </logic:notEqual>

                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend>Número Gaceta</legend>
                            <bean:write name="tratado" property="numGaceta"/>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>
                            <legend>Fecha Gaceta</legend>
                            <span class="fecha"><bean:write name="tratado" property="fechaGaceta"/></span>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>                              
                            <legend>Canje Notificación</legend>
                            <span class="fecha"><bean:write name="tratado" property="canjeNotificacion"/></span>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset>                             
                            <legend>Fecha Depósito</legend>
                            <span class="fecha"><bean:write name="tratado" property="fechaDeposito"/></span>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>
                            <legend>Entrada en Vigor</legend>
                            <span class="fecha"><bean:write name="tratado" property="entradaVigor"/></span>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>                            
                            <legend>Duración</legend>
                            <bean:write name="tratado" property="duracion"/>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend>Período</legend>
                            <bean:write name="tratado" property="periodo"/>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>                              
                            <legend>Volumen</legend>
                            <bean:write name="tratado" property="volumen"/>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>
                            <div class="error">
                                <html:errors property="pagina"/>
                            </div>
                            <legend>Página</legend>
                            <bean:write name="tratado" property="pagina"/>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <fieldset class="contenido">
                            <legend>Tratado disponible en:</legend>                            
                            <A HREF= <bean:write name="tratado" property="observacion"/>><bean:write name="tratado" property="observacion"/></A>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <fieldset class="contenido">
                            Nota: Para ver el contenido debe descargar el tratado. El formato de las fechas es MM/DD/AA
                        </fieldset>
                    </td>
                </tr>
            </table>
            <table> 
                <tr>
                    <td colspan="2">
                        <div class="botonBusqueda" style="float:left; ">
                            <html:link action="/buscarForm">
                                Ir a la Búsqueda Principal
                            </html:link>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

