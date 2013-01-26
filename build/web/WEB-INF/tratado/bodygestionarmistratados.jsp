<%-- 
    Document   : bodygestionarmistratados
    Created on : Nov 16, 2012, 1:54:11 AM
    Author     : vicente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<style>
  th{text-decoration: underline;}
  th,td{padding: 5px 10px; text-align: center;}
</style>

<script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery-ui-1.9.1.custom.js"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery-ui-1.9.1.custom.min.js"></script>
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
    $("#tablaTratados")
    .tablesorter({sortList: [[0,0]]})
    .paginateTable({ rowsPerPage: 10 });
  } 
);

  $(document).tooltip();
</script>

<logic:notPresent name="tratados">  <%--Si no hay tratados que mostrar--%>
  <div id="noHayTratados" style="margin: auto; font-size: 30px; font-family: Helvetica; color: grey;">
    </br>
    No se ha incorporado nuevos tratados.
    </br>
  </div>
</logic:notPresent>


<logic:present name="tratados">
  <logic:empty name="tratados">
    <div id="noHayTratados" style="margin: auto; font-size: 30px; font-family: Helvetica; color: grey;">
      </br>
      No se ha incorporado nuevos tratados.
      </br>
    </div>
  </logic:empty>
  <logic:notEmpty name="tratados">  
    <div id="listarTratados" style="padding: 50px 7px 0px 7px">
      <div class="box"id="listaTratado">
        <div class="inbox" style="width: 800px;">
          <div class="titulo" style="width: 100%; text-align: left;"> Mis Tratados </div>
          <table id="tablaTratados">
            <thead>
              <tr>
                <th> Título </th>
                <th> Fecha Firma </th>
              </tr>
            </thead>
            <tbody>
              <logic:iterate name="tratados" id="tratado">  
                <tr>
                  <td valign="top">
                    <div class="cajaTitulo">
                      <html:form action="/tratado/consultar">
                        <html:hidden name="tratado" property="id"/>
                        <bean:write name="tratado" property="titulo"></bean:write><!--styling es consultaTratado-->
                      </html:form>
                    </div>
                  </td>
                  <td valign="top">
                    <bean:write name="tratado" property="firmaFecha"></bean:write>
                    </td>
                  </tr>   
              </logic:iterate>
            </tbody>  
          </table>
          <div class='pager'>
            <a href='#' alt='First' class='firstPage'>Primero</a>
            <a href='#' alt='Previous' class='prevPage'><html:img page="/interfaz/imagenes/anterior.png"/></a>
            <span class='currentPage'></span> de <span class='totalPages'></span>
            <a href='#' alt='Next' class='nextPage'> <html:img page="/interfaz/imagenes/siguiente.png"/></a>
            <a href='#' alt='Last' class='lastPage'>Ultimo</a>
          </div>
        </div>
      </div>
    </div>
  </logic:notEmpty>
</logic:present>
