<%-- 
    Document   : bodylog
    Created on : 30-ene-2013, 21:21:02
    Author     : isaj
--%>

<%@page import="javabeans.Log"%>
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
            $('#tablaResultados').dataTable();
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
</script>

<logic:notPresent name="log">  <%--Si no hay tratados que mostrar--%>
  <div id="noHayTratados" style="margin: auto; font-size: 30px; font-family: Helvetica; color: grey;">
    </br>
    El Log no tiene registros
    </br>
    </br>
  </div>
</logic:notPresent>

<logic:present name="log">
  <logic:empty name="log">
    <div id="noHayTratados" style="margin: auto; font-size: 30px; font-family: Helvetica; color: grey;">
      </br>
      El Log no tiene registros
      </br>
      </br>
    </div>

  </logic:empty>
  <logic:notEmpty name="log">
    <div id="listarTratados" style="padding: 50px 7px 0px 7px">
        <div id="resultbusq" class="inbox" style="width: 800px;">
          <div class="titulo" style="width: 100%; text-align: left;"> Historial</div>
          <br>
          <br>
          <br>
          <br>
          <br>
          <table id="tablaResultados" style="padding-top: 40px !important">
            <thead>
              <tr>
                <th>Fecha</th>  
                <th>Usuario</th>
                <th>Acción</th>
                <th>Búsqueda</th>
                <th>Tratado</th>
              </tr>
            </thead>
            <tbody>
              <logic:iterate name="log" id="tratado">
                <tr>
                  <td valign="top">
                    <bean:write name="tratado" property="fecha_hora"></bean:write>
                  </td>  
                  <td valign="top">
                    <div class="cajaTitulo">
                        <bean:write name="tratado" property="usuario"></bean:write> &nbsp; <bean:write name="tratado" property="tipoUser"></bean:write><!--styling es consultaTratado-->
                    </div>
                  </td>
                  <td valign="top"><bean:write name="tratado" property="accion"></bean:write></td>
                  <td valign="top"><bean:write name="tratado" property="campoBusqueda"></bean:write></td>
                  <td valign="top"><bean:write name="tratado" property="idTratado"></bean:write></td>
                  
                </tr>
              </logic:iterate>
            </tbody>
          </table>
          <br>
          <br>
          <br>
          <div class='pager'>
            <a href='#' alt='First' class='firstPage'>Primero</a>
            <a href='#' alt='Previous' class='prevPage'><html:img page="/interfaz/imagenes/anterior.png"/></a>
            <span class='currentPage'></span> de <span class='totalPages'></span>
            <a href='#' alt='Next' class='nextPage'> <html:img page="/interfaz/imagenes/siguiente.png"/></a>
            <a href='#' alt='Last' class='lastPage'>Ultimo</a>
          </div>
      </div>
    </div>
  </logic:notEmpty>
</logic:present>
