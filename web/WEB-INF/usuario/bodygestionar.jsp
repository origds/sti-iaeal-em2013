<%-- 
    Document   : bodylistar
    Created on : Oct 23, 2012, 1:48:35 AM
    Author     : vicente
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javabeans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<style>
    th{text-decoration: underline;}
    th,td{padding: 5px 10px; text-align: center;}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.tablesorter.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.paginatetable.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $(".cajaTitulo").click(function() {
            for (var i = 0; i < this.childNodes.length; ++i) {
                if (this.childNodes[i].nodeName == "FORM") {
                    this.childNodes[i].submit();
                }
            }
        });
        $("#tablaUsuario")
                .tablesorter({sortList: [[0, 0]]})
                .paginateTable({rowsPerPage: 10});
    }
    );

</script>

<logic:notPresent name="usuarios">
    <div class="box" id="VacioUsuario">
        <div class="list">
            No hay usuarios registrados en el sistema.
        </div>
    </div>
</logic:notPresent>

<logic:present name="usuarios">
    <logic:empty name="usuarios">
        <div class="box" id="VacioU">
            <div class="list">
                No hay usuarios registrados en el sistema.
            </div>
        </div>
    </logic:empty>
    <logic:notEmpty name="usuarios">

        <div id="listarUsuario" style="padding:80px 0px 0px 15px">
            <div class="box" id="listaUsuario">
                <div class="inbox">
                    <div id="listaU">
                        <div class="titulo">Lista de Usuarios</div>
                    </div>
                    <table id="tablaUsuario" class="tablesorter">
                        <thead>
                            <tr>
                                <th> Usuario </th>
                                <th> Nombre </th>
                                <th> Apellido </th>
                                <th> Correo </th>
                                <th> Administrador </th>
                            </tr>
                        </thead> 
                    </logic:notEmpty>
                    <tbody>
                        <% ArrayList<Usuario> au = (ArrayList<Usuario>) request.getAttribute("usuarios");
                            int i = 0;
                            for (i = 0; i < au.size(); i++) {
                                if (au.get(i).getUsuario().equals("admin")) {
                                    au.remove(i);
                                }
                            }
                            int index = 0;%>  
                        <logic:iterate name="usuarios" id="usuario">
                            <% Usuario u = au.get(index);
                                index++;%>
                            <logic:notEqual name="login" property="usuario" value="<%=u.getUsuario()%>">
                                <tr>
                                    <td valign="top">
                                        <div class="cajaTitulo">
                                            <html:form action="/usuario/consultar">
                                                <html:hidden name="usuario" property="usuario"/>
                                                <bean:write name="usuario" property="usuario"></bean:write>
                                            </html:form>
                                        </div>
                                    </td>

                                    <td><bean:write name="usuario" property="nombre"></bean:write></td>
                                    <td><bean:write name="usuario" property="apellido"></bean:write></td>
                                    <td><bean:write name="usuario" property="correo"></bean:write></td>
                                    <td>
                                        <logic:equal name="usuario" property="administrador" value="false">    
                                            No
                                        </logic:equal>
                                        <logic:notEqual name="usuario" property="administrador" value="false">    
                                            Si
                                        </logic:notEqual>
                                    </td>
                                            <%-- <td><bean:write name="usuario" property="administrador"></bean:write></td> --%>


                                            <td>
                                                <html:form action="/usuario/actualizarForm" method="POST" enctype="multipart/form-data" >
                                                    <html:hidden name="usuario" property="usuario"/>  

                                                    <html:submit> Actualizar </html:submit>
                                                </html:form>
                                            </td>
                                            <td>
                                                <html:form action="/usuario/eliminar" method="POST" enctype="multipart/form-data" onsubmit= "if(!confirm('Seguro desea eliminar este Usuario?')) return false">
                                                    <html:hidden name="usuario" property="usuario"/>
                                                    <html:submit> Eliminar </html:submit>
                                                </html:form>
                                            </td>
                                        </tr> 
                                        </logic:notEqual>
                                        </logic:iterate>
                                    </tbody>
                                </table>
                                <div class='pager'>
                                    <a href='#' alt='First' class='firstPage'>Primero</a>
                                    <a href='#' alt='Previous' class='prevPage'>Anterior</a>

                                    <span class='currentPage'></span> de <span class='totalPages'></span>
                                    <a href='#' alt='Next' class='nextPage'>Siguiente</a>
                                    <a href='#' alt='Last' class='lastPage'>Ultimo</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </logic:present>
