<%-- 
    Document   : busqueda
    Created on : Nov 15, 2012, 5:05:30 PM
    Author     : matteo
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<script>
  $(document).ready(function() {
    $("#periodo1").hide();
    $("#periodo2").hide();
    
    $("#botonAnio").click(function(){
      
      if ($("#anioFirma").is(":visible"))
        return true;
      
      $("#anio").val("");
      $("#ini").val("");
      $("#fin").val("");
      
      $("#anioFirma").show();
      $("#periodo1").hide();
      $("#periodo2").hide();
    });
    
    $("#botonPeriodo").click(function(){
      
      
      if ($("#periodo1").is(":visible"))
        return true;
      
      $("#anio").val("");
      $("#ini").val("");
      $("#fin").val("");
      
      $("#anioFirma").hide();
      $("#periodo1").show();
      $("#periodo2").show();
    });
  });
</script>

<style>
  .error{font-size: 10px;color: #cc0000; float:left; padding:0}
  .error ul{list-style: none;}
</style>

<logic:present name="fecha">
  <logic:equal name="fecha" value="fechaErrada">
    <script>
      $(document).ready(function(){
        alert("La fecha de inicio debe ser menor a la fecha de finalizacion");
      });
    </script>
  </logic:equal>
</logic:present>

<div id="body">
  <div id="barraBusqueda">
    <div class="box"> 
      <div class="inbox" style="height: 500px;" id="cajaBusqueda">
        <div class="titulo">Búsqueda</div>
        <html:form action="/buscar" acceptCharset="ISO-8859-1">
          <table style="width:400px; padding-top: 20px">
            <tr>
              <td colspan="2">
                <fieldset style="border:none;">
                  <div class="error">
                  <html:errors property="claves"/>
                  </div>
                  <legend>Palabras Claves</legend>
                  <html:text property="claves"/>
                </fieldset>
              </td>
            </tr>
          </table>
          <fieldset style="border:none; border-top: 2px solid #00627A; width: 520px;">
            <div class="titulo" style="margin-top: 20px;">Avanzada</div>
            <table style="width: 400px; padding-top: 20px;">
              <tr>
                <td colspan="2">
                  <center>
                    Tipo de Usuario:
                    <html:select property="tipoUsuario"> <!--hola oriana-->
                        <option>Estudiante</option>
                        <option>Profesor</option>
                        <option>Otro</option>
                    </html:select>
                  </center>
                  <br>
                  <br>
                  <fieldset style="border:none;">
                    
                    <legend>País (Se deben separar los paises por comas. Ejemplo: Venezuela, Colombia)</legend>
                    <div class="error">
                      <html:errors property="pais"/>
                    </div>
                    <html:text property="pais"/>
                  </fieldset>
                </td>
              </tr>
            </table>
            <div id="botonPeriodo" class="botonBusqueda">Incluir Periodo</div>
            <div id="botonAnio" class="botonBusqueda">Incluir Año de Firma</div>
            <table style="width: 400px;">
              <tr>
                <td>                      
                  <div id="anioFirma">
                    <fieldset style="border:none;">
                      <legend>Año de Firma</legend>
                      <input type ="text" class="anioBusqueda" name ="anio" id="anio"/>
                      <div class="error">
                        <html:errors property="anio"/>
                      </div>
                    </fieldset>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div id="periodo1">
                    <fieldset style="border:none;">
                      <legend>Inicio de período</legend>                  
                      <input type ="text" class="anioBusqueda" name="fechaini" id="ini"/>
                      <div class="error">
                        <html:errors property="fechaini"/>
                      </div>  
                    </fieldset>
                  </div>
                </td>
                <td>
                  <div id="periodo2">
                    <fieldset style="border:none;">
                      <legend>Finalización de período</legend>
                      <input type ="text" class="anioBusqueda" name="fechafin" id="fin"/>
                      <div class="error">
                        <html:errors property="fechafin"/>
                      </div>
                    </fieldset>
                  </div>
                </td>
              </tr>
            </table>
          </fieldset>
          <fieldset style="border:none">
            <div class="botonBusqueda" style="float:left; ">
              <html:link action="/tratado/gestionar">
                Ver Todos
              </html:link>
            </div>
            </td>
            <td>
              <div style="float: right;">
                <html:submit value= "Buscar"/>
              </div>
            </html:form> 
            </div>
        </fieldset>
      </div>
    </div>
  </div>
</div>	
