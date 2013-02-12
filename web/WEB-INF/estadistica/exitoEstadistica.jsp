<%-- 
    Document   : busqueda
    Created on : Nov 15, 2012, 5:05:30 PM
    Author     : mary
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

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<!--------------------------------->
<!-- Genera el Grafico de Torta  -->
<!--------------------------------->
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([$tablaDatos1]);
        var options = { 
            title: 'Grafico de Torta'
        };

        var chart = new google.visualization.PieChart(document.getElementById('Torta'));
        chart.draw(data, options);
    }
</script>

<!--------------------------------->
<!-- Genera el Grafico de Barras  -->
<!--------------------------------->
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Periodos', 'Pais1', 'Pais2', 'Pais3'],
            ['2004',      1000,     400,     365  ],
            ['2005',      1170,     460,     845  ],
            ['2006',       660,    1120,     942  ],
            ['2007',      1030,     540,     1520 ]
        ]);

        var options = {
            title: 'Tratados Peridos Paises',
            hAxis: {title: 'Periodos', titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('Barra'));
        chart.draw(data, options);
    }
</script>

<!--------------------------------->
<!-- Genera el Grafico de Area -->
<!--------------------------------->
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Periodos', 'Pais1', 'Pais2', 'Pais3'],
            ['2004',      1000,     400,      500 ],
            ['2005',      1170,     460,      700 ],
            ['2006',       660,    1120,     1120 ],
            ['2007',      1030,     540,      320 ]
        ]);

        var options = {
            title: 'Grafico de Area',
            hAxis: {title: 'Periodos',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('Area'));
        chart.draw(data, options);
    }
</script>

<!--------------------------------->
<!-- Muestra las graficas y los botones para generarlas  -->
<!--------------------------------->
<script>
    $(document).ready(function() {
        $("#Barra").hide();
        $("#Area").hide();
        $("#botonTorta").hide();
        
    
        $("#botonBarra").click(function(){
      
            if ($("#Barra").is(":visible"))
                return true;
      
            $("#Barra").show();
            $("#botonArea").show();
            $("#botonTorta").show();
            $("#botonBarra").hide();
            $("#Torta").hide();
            $("#Area").hide();
        });
    
        $("#botonTorta").click(function(){
      
            if ($("#Torta").is(":visible"))
                return true;
     
            $("#Torta").show();
            $("#botonArea").show();
            $("#botonBarra").show();
            $("#Area").hide();
            $("#Barra").hide();
            $("#botonTorta").hide();
        });
    
        $("#botonArea").click(function(){
      
            if ($("#Area").is(":visible"))
                return true;
       
            $("#Area").show();
            $("#botonBarra").show();
            $("#botonTorta").show();
            $("#botonArea").hide();
            $("#Barra").hide();
            $("#Torta").hide();
        });
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
                <br><br>
                <logic:present name="est">
                    <div>

                        <table id="tablaDatos1" style="float:left ;width:300px;heigth:101px;margin:12px -11px 0 0">
                            <caption></caption>
                            <thead>
                                <tr>
                                    <th scope="col" style="color:red">PAISES</th>
                                    <th scope="col" style="color:red">NUMERO DE TRATADOS</th>

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

                        <br><br><br>
                        <th  style="float: right;" >
                            <button id="botonArea" style="color:#003333;font-size: 12pt">Area</button>
                        </th>
                        <th style="float: right;" >
                            <button id="botonBarra" style="color:#003333;font-size: 12pt">Barra</button>
                        </th>
                        <th style="float: right;" >
                            <button id="botonTorta" style="color:#003333;font-size: 12pt">Torta</button>
                        </th>
                    </div>

                    <br><br><br><br><br>
                    <div id="Torta" style="width: 500px; height: 300px;"></div>
                    <div id="Barra" style="width: 500px; height: 300px;"></div>
                    <div id="Area" style="width: 500px; height: 300px;"></div>
                    </th>
                </logic:present>

            </div>
        </div>
    </div>
</div>	