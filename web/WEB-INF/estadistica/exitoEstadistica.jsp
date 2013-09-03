<%-- 
    Document   : busqueda
    Created on : Nov 15, 2012, 5:05:30 PM
    Author     : mary
--%>

<%@page import="javabeans.est"%>
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

<!------------------------------- -->
<!-------Funciones para guardar----->
<!-------el Chart como PNG --------->
<!---------------------------------->

<script>
    function getImgData(chartContainer) {
        var chartArea = chartContainer.getElementsByTagName('svg')[0].parentNode;
        var svg = chartArea.innerHTML;
        var doc = chartContainer.ownerDocument;
        var canvas = doc.createElement('canvas');
        canvas.setAttribute('width', chartArea.offsetWidth);
        canvas.setAttribute('height', chartArea.offsetHeight);


        canvas.setAttribute(
        'style',
        'position: absolute; ' +
            'top: ' + (-chartArea.offsetHeight * 2) + 'px;' +
            'left: ' + (-chartArea.offsetWidth * 2) + 'px;');
        doc.body.appendChild(canvas);
        canvg(canvas, svg);
        var imgData = canvas.toDataURL('image/png');
        alert(imgData);
        canvas.parentNode.removeChild(canvas);
        return imgData;
    }

    function saveAsImg(chartContainer) {
        var imgData = getImgData(chartContainer);

        // Replacing the mime-type will force the browser to trigger a download
        // rather than displaying the image in the browser window.
        window.location = imgData.replace('image/png', 'image/octet-stream');
    }
    
    
</script>



<!--------------------------------->
<!-- Genera el Grafico de Torta  -->
<!--------------------------------->
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var p1 = document.getElementById('pa1').lastChild.nodeValue
        var p2 = document.getElementById('pa2').lastChild.nodeValue
        var p3 = document.getElementById('pa3').lastChild.nodeValue
        var c1 = Number(document.getElementById('num01').lastChild.nodeValue)
        var c2 = Number(document.getElementById('num02').lastChild.nodeValue)
        var c3 = Number(document.getElementById('num03').lastChild.nodeValue)
        var data = google.visualization.arrayToDataTable([
            ['Paises', 'Cantidad de Tratados'],
            [p1, c1],
            [p2, c2],
            [p3, c3]
        ]);

        var options = {
            title: 'Cantidad de Tratados por paises'
        };

        var chart = new google.visualization.PieChart(document.getElementById('Torta'));
        chart.draw(data, options);
    }
</script>

<!--------------------------------->
<!-- Genera el Grafico de Torta para periodos -->
<!--------------------------------->
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var p1 = document.getElementById('periodo1').lastChild.nodeValue
        var p2 = document.getElementById('periodo2').lastChild.nodeValue
        var c1 = Number(document.getElementById('num11').lastChild.nodeValue)
        var c2 = Number(document.getElementById('num22').lastChild.nodeValue)
        var data = google.visualization.arrayToDataTable([
            ['Periodos', 'Cantidad de Tratados'],
            [p1, c1],
            [p2, c2]
        ]);

        var options = {
            title: 'Cantidad de Tratados por periodos'
        };

        var chart = new google.visualization.PieChart(document.getElementById('TortaPeriodos'));
        chart.draw(data, options);
    }
</script>


<!--------------------------------->
<!-- Genera el Grafico de Barras para periodos -->
<!--------------------------------->
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var p1 = document.getElementById('pa1').lastChild.nodeValue
        var p2 = document.getElementById('pa2').lastChild.nodeValue
        var p3 = document.getElementById('pa3').lastChild.nodeValue
        var b1 = (document.getElementById('periodo1').lastChild.nodeValue)
        var b2 = (document.getElementById('periodo2').lastChild.nodeValue)
        var c1 = Number(document.getElementById('num1').lastChild.nodeValue)
        var c2 = Number(document.getElementById('num2').lastChild.nodeValue)
        var c3 = Number(document.getElementById('num3').lastChild.nodeValue)      
        var c4 = Number(document.getElementById('num4').lastChild.nodeValue)
        var c5 = Number(document.getElementById('num5').lastChild.nodeValue)
        var c6 = Number(document.getElementById('num6').lastChild.nodeValue)
        var data = google.visualization.arrayToDataTable([
            ['Periodos',  p1, p2, p3  ],
            [ b1   ,  c1, c2, c3  ],    
            [ b2   ,  c4, c5, c6  ]
        ]);

        var options = {
            title: 'Grafico de Barras',
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
        var p1 = document.getElementById('pa1').lastChild.nodeValue
        var p2 = document.getElementById('pa2').lastChild.nodeValue
        var p3 = document.getElementById('pa3').lastChild.nodeValue
        var b1 = (document.getElementById('periodo1').lastChild.nodeValue)
        var b2 = (document.getElementById('periodo2').lastChild.nodeValue)
        var c1 = Number(document.getElementById('num1').lastChild.nodeValue)
        var c2 = Number(document.getElementById('num2').lastChild.nodeValue)
        var c3 = Number(document.getElementById('num3').lastChild.nodeValue)      
        var c4 = Number(document.getElementById('num4').lastChild.nodeValue)
        var c5 = Number(document.getElementById('num5').lastChild.nodeValue)
        var c6 = Number(document.getElementById('num6').lastChild.nodeValue)
        var data = google.visualization.arrayToDataTable([
            ['Periodos',  p1, p2, p3  ],
            [ b1   ,  c1, c2, c3  ],    
            [ b2   ,  c4, c5, c6  ]
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
        
    
        $("#botonBarra").click(function(){
      
            if ($("#Barra").is(":visible"))
                return true;
      
            $("#Barra").show();
            $("#botonArea").show();
            $("#botonTorta").show();
            $("#botonBarra").show();
            $("#Torta").hide();           
            $("#TortaPeriodos").hide();           
            $("#Area").hide();
        });
    
        $("#botonTorta").click(function(){
      
            if ($("#Torta").is(":visible"))
                return true;
     
            $("#Torta").show();
            $("#TortaPeriodos").show();
            $("#botonArea").show();
            $("#botonBarra").show();
            $("#Area").hide();
            $("#Barra").hide();
            $("#botonTorta").show();
        });
    
        $("#botonArea").click(function(){
      
            if ($("#Area").is(":visible"))
                return true;
       
            $("#Area").show();
            $("#botonBarra").show();
            $("#botonTorta").show();
            $("#botonArea").show();
            $("#Barra").hide();
            $("#Torta").hide();
            $("#TortaPeriodos").hide();
        });
    });
</script>

<style type="text/css">
    table { float: left; margin: 140px 40px 0 0;  }
    td input { border: 1px solid orange; background: yellow; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; position: absolute; padding: 8px 0; text-align: center; width: 60px; margin: -17px 0 0 4px; font-size: 1.4em; }
    td.input { padding: 0; position: relative; }
    .visualize { float: left; }
</style>

<%
    Integer ano1 = ((est) request.getAttribute("est")).getAno1();
    Integer ano2 = ((est) request.getAttribute("est")).getAno2();
    Integer ano3 = ((est) request.getAttribute("est")).getAno3();
    Integer ano4 = ((est) request.getAttribute("est")).getAno4();
    String pais1 = ((est) request.getAttribute("est")).getPais1();
    String pais2 = ((est) request.getAttribute("est")).getPais2();
    String pais3 = ((est) request.getAttribute("est")).getPais3();
%>

<div id="body">
    <div id="barraBusqueda">
        <div class="box"> 
            <div class="inbox" style="height: 560px;" id="cajaBusqueda">
                <div class="titulo">Resultado Estadistica</div></br>
                <br><br>

                <logic:present name="est">

                    <div>
                        <%
                            if ((ano1 == 0) && (ano2 == 0) && (ano3 == 0) && (ano4 == 0) && (!(pais1.equals("Paises..."))
                                    || !(pais2.equals("Paises...")) || !(pais3.equals("Paises...")))) {%>
                        <table style="float:left ;width:500px;margin:12px -11px 0 0">
                            <caption></caption>
                            <thead>
                                <tr>
                                    <th scope="col" style="color:red">PAISES</th>
                                    <th scope="col" style="color:red">TRATADOS POR PAISES</th>                                   
                            </thead>
                            <tbody>
                                <tr>
                                    <th id ="pa1" scope="row"><bean:write name="est" property="pais1"/></th>
                                    <th id ="num01" ><bean:write name="est" property="total1"/></th>
                                </tr>
                                <tr>
                                    <th id ="pa2" scope="row"><bean:write name="est" property="pais2"/></th>
                                    <th id ="num02" ><bean:write name="est" property="total2"/></th>
                                </tr>
                                <tr>
                                    <th id ="pa3" scope="row"><bean:write name="est" property="pais3"/></th>
                                    <th id ="num03" ><bean:write name="est" property="total3"/></th>
                                </tr>             
                            </tbody>
                        </table>    
                    </div>

                    <br><br><br><br><br>
                    <div>
                        <br><br><br>
                        <div id="Torta" style="width: 400px; height: 300px;"></div>                        
                    </div>


                    <html:form action="/reporte" method="POST" enctype="multipart/form-data"> 
                        <input type="submit" value="Gen. Reporte" class="botonEstadistica"/>
                    </html:form>

                    <div id="nuevo" class="botonBusqueda" style="float:left; ">
                        <html:link action="/estadisticaForm">
                            Nueva Estadistica
                        </html:link>
                    </div>

                    <%}%>

                    <%
                        if (pais1.equals("Paises...") && pais2.equals("Paises...") && pais3.equals("Paises...")
                                && (!(ano1 == 0) || !(ano2 == 0) || !(ano3 == 0) || !(ano4 == 0))) {%>

                    <table style="float:left ;width:500px;margin:12px -11px 0 0">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" style="color:red">PERIODOS</th>
                                <th scope="col" style="color:red">TRATADOS POR PERIODOS</th>                                   
                        </thead>
                        <tbody>
                            <tr>
                                <th id ="periodo1" scope="col"><bean:write name="est" property="ano1"/> - <bean:write name="est" property="ano2"/></th>                     
                                <th id ="num11" ><bean:write name="est" property="totalP1"/></th>
                            </tr>
                            <tr>
                                <th id ="periodo2" scope="col"><bean:write name="est" property="ano3"/> - <bean:write name="est" property="ano4"/></th>   
                                <th id ="num22" ><bean:write name="est" property="totalP2"/></th>
                            </tr>                             
                        </tbody>
                    </table>    

                    <br><br><br><br><br>
                    <div>
                        <br><br><br>
                        <div id="TortaPeriodos" style="width: 400px; height: 300px;"></div>                        
                    </div>
                    <html:form action="/reporte" method="POST" enctype="multipart/form-data"> 
                        <input type="submit" value="Gen. Reporte" class="botonEstadistica"/>
                    </html:form>
                    <div id="nuevo" class="botonBusqueda" style="float:left; ">
                        <html:link action="/estadisticaForm">
                            Nueva Estadistica
                        </html:link>
                    </div>

                    <%}%>

                    <%
                        if ((!(pais1.equals("Paises...")) || !(pais2.equals("Paises...")) || !(pais3.equals("Paises...")))
                                && ((ano1 != 0) || (ano2 != 0) || (ano3 != 0) || (ano4 != 0))) {%>

                    <table id="tablaTodo" style="float:left ;width:500px;margin:12px -11px 0 0">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" style="color:red">PAISES</th>
                                <th scope="col" style="color:red">TOTAL PAISES</th>
                                <th id="periodo1" scope="col" style="color:red"><bean:write name="est" property="ano1"/> - <bean:write name="est" property="ano2"/></th> 
                                <th id="periodo2" scope="col" style="color:red"><bean:write name="est" property="ano3"/> - <bean:write name="est" property="ano4"/></th>   
                        </thead>
                        <tbody>
                            <tr>
                                <th id ="pa1" scope="row"><bean:write name="est" property="pais1"/></th>
                                <th id ="num01" ><bean:write name="est" property="total1"/></th>
                                <th id ="num1" ><bean:write name="est" property="primero"/></th>
                                <th id ="num4" ><bean:write name="est" property="cuarto"/></th>
                            </tr>
                            <tr>
                                <th id ="pa2" scope="row"><bean:write name="est" property="pais2"/></th>
                                <th id ="num02" ><bean:write name="est" property="total2"/></th>
                                <th id ="num2" ><bean:write name="est" property="segundo"/></th>   
                                <th id ="num5" ><bean:write name="est" property="quinto"/></th>
                            </tr>
                            <tr>
                                <th id ="pa3" scope="row"><bean:write name="est" property="pais3"/></th>
                                <th id ="num03" ><bean:write name="est" property="total3"/></th>
                                <th id ="num3" ><bean:write name="est" property="tercero"/></th>
                                <th id ="num6" ><bean:write name="est" property="sexto"/></th>
                            </tr> 
                            <tr>
                                <th scope="col" style="color:red">TOTAL PERIODOS</th>
                                <th> </th>
                                <th id ="num11" ><bean:write name="est" property="totalPP1"/></th>
                                <th id ="num22" ><bean:write name="est" property="totalPP2"/></th>                                
                            </tr>                            
                        </tbody>
                    </table>       

                </div>

                <br><br><br><br><br><br><br>
                <div id="graficasTodo">
                    <br><br><br>
                    <div id="Torta" style="width: 300px; height: 150px;"></div>
                    <div id="TortaPeriodos" style="width: 300px; height: 150px;"></div>
                    <div id="Barra" style="width: 400px; height: 300px;"></div>
                    <div id="Area" style="width: 400px; height: 300px;"></div>
                </div>

                <br>


                <html:form action="/reporte" method="POST" enctype="multipart/form-data"> 
                    <input type="submit" value="Gen. Reporte" class="botonEstadistica"/>
                </html:form>


                <div id="botonesTodo">
                    <th  style="float: center;" >
                        <button id="botonArea" class="botonBusqueda">Area</button>
                    </th>
                    <th style="float: right;" >
                        <button id="botonBarra" class="botonBusqueda">Barra</button>
                    </th>
                    <th style="float: right;" >
                        <button id="botonTorta" class="botonBusqueda" onclick="saveAsImg(document.getElementById('Torta'))">Torta</button>                        
                    </th>
                    <div class="botonBusqueda" style="float:left; ">
                        <html:link action="/estadisticaForm">
                            Nueva Estadistica
                        </html:link>
                    </div>
                </div>

                <%}%> 
            </logic:present>
        </div>
    </div>
</div>
