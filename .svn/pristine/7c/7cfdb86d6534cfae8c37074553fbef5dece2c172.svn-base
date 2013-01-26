<%-- 
    Document   : busqueda
    Created on : Nov 15, 2012, 5:05:30 PM
    Author     : matteo
--%>

<%@page import="javabeans.Tratado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<div id="body">
  <div id="barraBusqueda">
    <div class="box"> 
      <div class="inbox" style="height: 450px;" id="cajaBusqueda">
        <div class="titulo">Resultado Estadistica</div></br>
        <table style="width:400px; padding-top: 20px; padding-bottom: 30px; font-size: 15px;">
          <%
            int i = 0;
            String dato[] = (String[]) request.getSession().getAttribute("elemento");
            int cont[] = (int[]) request.getSession().getAttribute("conteo");
            double porc[] = (double[]) request.getSession().getAttribute("porcentaje");
%>
          <thead style="font-weight: 900;">
            <tr>
              <td>Datos</td>
              <td>Tratados</td>
              <td>Porcentaje</td>
            </tr>
            <tr></tr>
            <tr></tr>
          </thead>
          <tbody>
            <%
              for (i = 0; i < dato.length; i++) {
            %>
            <tr>
              <td valign="top">
                <div id="cajaTitulo">
                  <%= dato[i]%>
                </div>
              </td>
              <td valign="top">
                <%= cont[i]%>
              </td>
              <td valign="top">
                <%= porc[i]%>%
              </td>
            </tr>
            <% }%>
          </tbody>
        </table>
        <fieldset style="border:none; border-top: 2px solid #00627A; width: 550px;">
          <div class="titulo" style="margin-top: 20px;">Grafica</div>
          <table style="width: 400px; padding-top: 20px;">
          </table>
        </fieldset>
      </div>
    </div>
  </div>
</div>	
