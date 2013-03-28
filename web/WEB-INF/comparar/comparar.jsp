<%-- 
    Document   : comparar
    Created on : 09-mar-2013, 15:03:56
    Author     : isaj
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>

<script>
    $(document).ready(function() {
        $("#periodos1").hide();
        $("#periodos2").hide();
        $("#periodos3").hide();
  
            $("#ini").val("");
            $("#fin").val("");
      
            $("#botonPaises").show();
            $("#botonPeriodo").show();
            $("#periodos1").show();
            $("#periodos2").show();
            $("#periodos3").show();
        });
   
</script>

<style>
    .error{font-size: 10px;color: #cc0000; float:left; padding:0}
    .error ul{list-style: none;}
</style>

<div id="body">
    <div id="barraBusqueda">
        <div class="box"> 
            <div class="inbox" id="cajaBusqueda">
                <div class="titulo">Comparar Tratados.</div>
                <br> <br> <br>
                
                <html:form method="POST" action="/comparar">                        
                    <p>           
                    <div id ="periodos1">
                      
                            Período 1               
                            Inicio de período  
y
                            <html:select name="Comparar" property="diaIni1">
                                <option>Día..</option> 
                                <option>01</option> 
                                <option>02</option> 
                                <option>03</option> 
                                <option>04</option> 
                                <option>05</option> 
                                <option>06</option> 
                                <option>07</option> 
                                <option>08</option> 
                                <option>09</option> 
                                <option>10</option> 
                                <option>11</option> 
                                <option>12</option> 
                                <option>13</option> 
                                <option>14</option> 
                                <option>15</option> 
                                <option>16</option> 
                                <option>17</option> 
                                <option>18</option> 
                                <option>19</option> 
                                <option>20</option> 
                                <option>21</option> 
                                <option>22</option> 
                                <option>23</option> 
                                <option>24</option> 
                                <option>25</option> 
                                <option>26</option> 
                                <option>27</option> 
                                <option>28</option> 
                                <option>29</option> 
                                <option>30</option> 
                                <option>31</option> 
                            </html:select> 
 
                            <html:select name="Comparar" property="mesIni1">
                                <option>Mes..</option> 
                                <option>01</option> 
                                <option>02</option> 
                                <option>03</option> 
                                <option>04</option> 
                                <option>05</option> 
                                <option>06</option> 
                                <option>07</option> 
                                <option>08</option> 
                                <option>09</option> 
                                <option>10</option> 
                                <option>11</option> 
                                <option>12</option> 
                            </html:select> 
                                
                            <html:select name="Comparar" property="anoIni1">
                                <option>Año..</option> 
                                <option>2002</option> 
                                <option>2003</option> 
                                <option>2004</option> 
                                <option>2005</option> 
                                <option>2006</option> 
                                <option>2007</option> 
                                <option>2008</option> 
                                <option>2009</option> 
                                <option>2010</option> 
                                <option>2011</option> 
                                <option>2012</option> 
                                <option>2013</option> 
                            </html:select> 
                                
                            Finalización de período
                            
                            <html:select name="Comparar" property="diaFin1">
                                <option>Día..</option> 
                                <option>01</option> 
                                <option>02</option> 
                                <option>03</option> 
                                <option>04</option> 
                                <option>05</option> 
                                <option>06</option> 
                                <option>07</option> 
                                <option>08</option> 
                                <option>09</option> 
                                <option>10</option> 
                                <option>11</option> 
                                <option>12</option> 
                                <option>13</option> 
                                <option>14</option> 
                                <option>15</option> 
                                <option>16</option> 
                                <option>17</option> 
                                <option>18</option> 
                                <option>19</option> 
                                <option>20</option> 
                                <option>21</option> 
                                <option>22</option> 
                                <option>23</option> 
                                <option>24</option> 
                                <option>25</option> 
                                <option>26</option> 
                                <option>27</option> 
                                <option>28</option> 
                                <option>29</option> 
                                <option>30</option> 
                                <option>31</option> 
                            </html:select> 
 
                            <html:select name="Comparar" property="mesFin1">
                                <option>Mes..</option> 
                                <option>01</option> 
                                <option>02</option> 
                                <option>03</option> 
                                <option>04</option> 
                                <option>05</option> 
                                <option>06</option> 
                                <option>07</option> 
                                <option>08</option> 
                                <option>09</option> 
                                <option>10</option> 
                                <option>11</option> 
                                <option>12</option> 
                            </html:select> 
                                
                            <html:select name="Comparar" property="anoFin1">
                                <option>Año..</option> 
                                <option>2002</option> 
                                <option>2003</option> 
                                <option>2004</option> 
                                <option>2005</option> 
                                <option>2006</option> 
                                <option>2007</option> 
                                <option>2008</option> 
                                <option>2009</option> 
                                <option>2010</option> 
                                <option>2011</option> 
                                <option>2012</option> 
                                <option>2013</option> 
                            </html:select>              
             
                    </div>

                    <div id ="periodos2">
                  
                            <br> <br> <br>
                            <legend>Período 2</legend>                  
                            <legend>Inicio de período</legend>                  
                   

                            <legend>Finalización de período</legend>
                               
                       
                    </div>  
                    <br> <br> <br>
                    <div id="Comparar" >
                        <html:submit> Comparar </html:submit>
                    </div>
                </html:form> 
            </div>
        </div>
    </div>	
</div> 