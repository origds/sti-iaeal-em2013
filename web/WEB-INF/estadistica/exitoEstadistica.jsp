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

        
	<link href="../../interfaz/CSS/basic.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="http://filamentgroup.github.com/EnhanceJS/enhance.js"></script>	
	<script type="text/javascript">
		// Run capabilities test
		enhance({
			loadScripts: [
				{src: '../../interfaz/javaScript/excanvas.js', iecondition: 'all'},
				'../../interfaz/javaScript/jquery.js',
				'../../interfaz/javaScript/visualize.jQuery.js',
				'../../interfaz/javaScript/example-editable.js'
			],
			loadStyles: [
				'../../interfaz/CSS/visualize.css',
				'../../interfaz/CSS/visualize-dark.css'
			]	
		});   
    </script>
    <style type="text/css">
    	table { float: left; margin: 140px 40px 0 0;  }
    	td input { border: 1px solid orange; background: yellow; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; position: absolute; padding: 8px 0; text-align: center; width: 60px; margin: -17px 0 0 4px; font-size: 1.4em; }
    	td.input { padding: 0; position: relative; }
    	.visualize { float: left; }
    </style>



<div id="body">
  <div id="barraBusqueda">
    <div class="box"> 
      <div class="inbox" style="height: 450px;" id="cajaBusqueda">
        <div class="titulo">Resultado Estadistica</div></br>
        
         <logic:present name="est">
                    
                  
              
             <table style="width:600px;heigth:101px;margin:12px -11px 0 0">
	<caption></caption>
	<thead>
		<tr>
			<th scope="col" style="color:red">PAISES</th>
			<th scope="col" style="color:red">NUMERO DE TRATADOS</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row"><bean:write name="est" property="pais1"/></th>
			<th><bean:write name="est" property="primero"/></th>
		</tr>
		<tr>
			<th scope="row"><bean:write name="est" property="pais2"/></th>
			<th><bean:write name="est" property="segundo"/></th>
		</tr>
		<tr>
			<th scope="row"><bean:write name="est" property="pais3"/></th>
			<th><bean:write name="est" property="tercero"/></th>
		</tr>		
	</tbody>
</table>       
</logic:present> 
        
      </div>
    </div>
  </div>
</div>	