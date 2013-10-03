<%-- 
    Document   : bodygestionar
    Created on : Oct 28, 2012, 5:21:24 PM
    Author     : carla
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javabeans.Tratado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>



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
    
    <style>
  th{text-decoration: underline;}
  th,td{padding: 5px 10px; text-align: center;}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.tablesorter.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.paginatetable.js"></script>
<script>
  $(document).ready(function(){
    
    
    $("#tablaTratados")
    .tablesorter({sortList: [[0,0]]})
    .paginateTable({ rowsPerPage: 25 });
  } 
);

function verTratado(div){
    forms = div.getElementsByTagName("form");
    $(forms[0]).submit()
}
</script>
    
<logic:notPresent name="tratados">  <%--Si no hay tratados que mostrar--%>
  <div id="noHayTratados" style="padding: 80px 0px 0px 120px;">
    </br>
    No hay tratados registrados en el sistema.
    </br>
  </div>
</logic:notPresent>

<logic:present name="tratados">
  <logic:empty name="tratados">
    <div id="noHayTratados" style="padding: 80px 0px 0px 120px;">
      </br>
      No hay tratados registrados en el sistema.
      </br>
    </div>
  </logic:empty>
  <logic:notEmpty name="tratados">
    <div id="listarTratados" style="padding: 50px 7px 0px 7px;">   
        <div id ="resultbusq" class="inbox" style="width: 800px; min-height: 600px;">
          <div class="titulo" style="width: 100%; text-align: left;"> Lista de Tratados</div>
          <br><br><br>
          <table class="display" id="example">
            <thead>
              <tr>
                <th> Título </th>
                <th> País </th>
                <th> Fecha Firma (MM/DD/AA)</th>
              </tr>
            </thead>
            <tbody>
              <logic:iterate name="tratados" id="tratado"> 
              <div class="cajaTratado">
                <tr>
                  <td valign="top">
                      <div class="cajaTitulo" onclick="verTratado(this)">
                        <html:form action="/tratado/consultar" styleClass="consultarForm">
                        <html:hidden name="tratado" property="id"/>
                        <bean:write name="tratado" property="titulo"></bean:write>
                      </html:form>
                    </div>
                  </td>
                  <td valign="top">
                    <bean:write name="tratado" property="paises[0]"></bean:write>
                  </td>
                  <td valign="top">
                    <bean:write name="tratado" property="firmaFecha"></bean:write>
                  </td>
              </div>
            </logic:iterate>
            </tbody>
          </table>
          <br>
          <br>
        </div>
    </div>
  </logic:notEmpty>
</logic:present>

      