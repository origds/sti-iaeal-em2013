<%-- 
    Document   : busqueda
    Created on : Nov 27, 2012, 5:05:30 PM
    Author     : betocols
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
    
        $("#botonPeriodo").click(function(){
      
            $("#ini").val("");
            $("#fin").val("");
      
            $("#botonPaises").show();
            $("#botonPeriodo").show();
            $("#periodos1").show();
            $("#periodos2").show();
            $("#periodos3").show();
        });
    
        $("#botonPaises").click(function(){
     
            $("#periodos1").hide();
            $("#periodos2").hide();
            $("#periodos3").hide();
            $("#botonPeriodo").show();
            $("#botonPaises").show();
        });
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
                <div class="titulo">Generar estadística de la búsqueda realizada.</div>
                <br> <br> <br>

                <div style="float: center;">
                    <button id="botonPeriodo" class="botonBusqueda">Con Periodos</button>
                    <button id="botonPaises" class="botonBusqueda">Solo Paises</button>
                </div>

                <html:form method="POST" action="/BuscarEstadistica">                        
                    <p>           
                        <br> <br> <br>
                        1er Pais &nbsp;
                        <html:select name="ClaseEstadistica" property="codigo1">
                        <option>Paises...</option> 
                        <option>Afganistan</option> 
                        <option>Aland</option> 
                        <option>Albania</option> 
                        <option>Alemania</option> 
                        <option>Andorra</option> 
                        <option>Angola</option> 
                        <option>Anguila</option> 
                        <option>Antigua y Barbuda</option> 
                        <option>Antillas Neerlandesas</option> 
                        <option>Arabia Saudita</option> 
                        <option>Argelia</option> 
                        <option>Argentina</option> 
                        <option>Armenia</option> 
                        <option>Aruba</option> 
                        <option>Australia</option> 
                        <option>Austria</option> 
                        <option>Azerbaiyan</option> 
                        <option>Bahamas</option> 
                        <option>Barein</option> 
                        <option>Banglades</option> 
                        <option>Barbados</option> 
                        <option>Belgica</option> 
                        <option>Belice</option> 
                        <option>Benin</option> 
                        <option>Bermudas</option> 
                        <option>Bielorrusia</option> 
                        <option>Birmania</option> 
                        <option>Bolivia</option> 
                        <option>Bosnia y Herzegovina</option> 
                        <option>Botsuana</option> 
                        <option>Isla Bouvet</option> 
                        <option>Brasil</option> 
                        <option>Brunei</option> 
                        <option>Bulgaria</option> 
                        <option>Burkina Faso</option> 
                        <option>Burundi</option> 
                        <option>Butan</option> 
                        <option>Cabo Verde</option> 
                        <option>Islas Caiman</option> 
                        <option>Camboya</option> 
                        <option>Camerun</option> 
                        <option>Canada</option> 
                        <option>Republica Centroafricana</option> 
                        <option>Chad</option> 
                        <option>Republica Checa</option> 
                        <option>Chile</option> 
                        <option>China</option> 
                        <option>Chipre</option> 
                        <option>Islas Cocos</option> 
                        <option>Colombia</option> 
                        <option>Comoras</option> 
                        <option>Republica del Congo</option> 
                        <option>Rep. Dem. del Congo</option> 
                        <option>Islas Cook</option> 
                        <option>Corea del Norte</option> 
                        <option>Corea del Sur</option> 
                        <option>Costa de Marfil</option> 
                        <option>Costa Rica</option> 
                        <option>Croacia</option> 
                        <option>Curazao</option> 
                        <option>Cuba</option> 
                        <option>Dinamarca</option> 
                        <option>Dominica</option> 
                        <option>Republica Dominicana</option> 
                        <option>Ecuador</option> 
                        <option>Egipto</option> 
                        <option>El Salvador</option> 
                        <option>Emiratos Árabes Unidos</option> 
                        <option>Eritrea</option> 
                        <option>Eslovaquia</option> 
                        <option>Eslovenia</option> 
                        <option>Espana</option> 
                        <option>Estados Unidos</option> 
                        <option>Estonia</option> 
                        <option>Etiopia</option> 
                        <option>Islas Feroe</option> 
                        <option>Filipinas</option> 
                        <option>Finlandia</option> 
                        <option>Fiyi</option> 
                        <option>Francia</option> 
                        <option>Gabon</option> 
                        <option>Gambia</option> 
                        <option>Georgia</option> 
                        <option>Islas Georgias del Sur y Sandwich del Sur</option> 
                        <option>Ghana</option> 
                        <option>Gibraltar</option> 
                        <option>Granada</option> 
                        <option>Grecia</option> 
                        <option>Groenlandia</option> 
                        <option>Guadalupe</option> 
                        <option>Guam</option> 
                        <option>Guatemala</option> 
                        <option>Guayana Francesa</option> 
                        <option>Guernsey</option> 
                        <option>Guinea</option> 
                        <option>Guinea Ecuatorial</option> 
                        <option>Guinea-Bisau</option> 
                        <option>Guyana</option> 
                        <option>Haiti</option> 
                        <option>Islas Heard y McDonald</option> 
                        <option>Honduras</option> 
                        <option>Hong Kong</option> 
                        <option>Hungria</option> 
                        <option>India</option> 
                        <option>Indonesia</option> 
                        <option>Iran</option> 
                        <option>Irak</option> 
                        <option>Irlanda</option> 
                        <option>Islandia</option> 
                        <option>Israel</option> 
                        <option>Italia</option> 
                        <option>Jamaica</option> 
                        <option>Japon</option> 
                        <option>Jersey</option> 
                        <option>Jordania</option> 
                        <option>Kazajistan</option> 
                        <option>Kenia</option> 
                        <option>Kirguistan</option> 
                        <option>Kiribati</option> 
                        <option>Kuwait</option> 
                        <option>Laos</option> 
                        <option>Lesoto</option> 
                        <option>Letonia</option> 
                        <option>Libano</option> 
                        <option>Liberia</option> 
                        <option>Libia</option> 
                        <option>Liechtenstein</option> 
                        <option>Lituania</option> 
                        <option>Luxemburgo</option> 
                        <option>Macao</option> 
                        <option>Republica de Macedonia</option> 
                        <option>Madagascar</option> 
                        <option>Malasia</option> 
                        <option>Malaui</option> 
                        <option>Maldivas</option> 
                        <option>Mali</option> 
                        <option>Malta</option> 
                        <option>Islas Malvinas</option> 
                        <option>Isla de Man</option> 
                        <option>Islas Marianas del Norte</option> 
                        <option>Marruecos</option> 
                        <option>Islas Marshall</option> 
                        <option>Martinica</option> 
                        <option>Mauricio</option> 
                        <option>Mauritania</option> 
                        <option>Mayotte</option> 
                        <option>Mexico</option> 
                        <option>Micronesia</option> 
                        <option>Moldavia</option> 
                        <option>Monaco</option> 
                        <option>Mongolia</option> 
                        <option>Montenegro</option> 
                        <option>Montserrat</option> 
                        <option>Mozambique</option> 
                        <option>Namibia</option> 
                        <option>Nauru</option> 
                        <option>Isla de Navidad</option> 
                        <option>Nepal</option> 
                        <option>Nicaragua</option> 
                        <option>Niger</option> 
                        <option>Nigeria</option> 
                        <option>Niue</option> 
                        <option>Norfolk</option> 
                        <option>Noruega</option> 
                        <option>Nueva Caledonia</option> 
                        <option>Nueva Zelanda</option> 
                        <option>Oman</option> 
                        <option>Paises Bajos</option> 
                        <option>Pakistan</option> 
                        <option>Palaos</option> 
                        <option>Autoridad Nacional Palestina</option> 
                        <option>Panama</option> 
                        <option>Papua Nueva Guinea</option> 
                        <option>Paraguay</option> 
                        <option>Peru</option> 
                        <option>Islas Pitcairn</option> 
                        <option>Polinesia Francesa</option> 
                        <option>Polonia</option> 
                        <option>Portugal</option> 
                        <option>Puerto Rico</option> 
                        <option>Catar</option> 
                        <option>Reino Unido</option> 
                        <option>Reunion</option> 
                        <option>Ruanda</option> 
                        <option>Rumania</option> 
                        <option>Rusia</option> 
                        <option>Republica Arabe Saharaui Democratica</option> 
                        <option>Islas Salomon</option> 
                        <option>Samoa</option> 
                        <option>Samoa Americana</option> 
                        <option>San Bartolome</option> 
                        <option>San Cristobal y Nieves</option> 
                        <option>San Marino</option> 
                        <option>San Martin</option> 
                        <option>San Pedro y Miquelon</option> 
                        <option>San Vicente y las Granadinas</option> 
                        <option>Santa Helena, A. y T.</option> 
                        <option>Santa Luca</option> 
                        <option>Santo Tome y Principe</option> 
                        <option>Senegal</option> 
                        <option>Serbia</option> 
                        <option>Seychelles</option> 
                        <option>Sierra Leona</option> 
                        <option>Singapur</option> 
                        <option>Siria</option> 
                        <option>Somalia</option> 
                        <option>Sri Lanka</option> 
                        <option>Suazilandia</option> 
                        <option>Sudafrica</option> 
                        <option>Sudan</option> 
                        <option>Sudan del Sur</option> 
                        <option>Suecia</option> 
                        <option>Suiza</option> 
                        <option>Surinam</option> 
                        <option>Svalbard y Jan Mayen</option> 
                        <option>Tailandia</option> 
                        <option>Taiwan</option> 
                        <option>Tanzania</option> 
                        <option>Tayikistan</option> 
                        <option>Territorio Britanico del Oceano Indico</option> 
                        <option>Territorios Australes Franceses</option> 
                        <option>Timor Oriental</option> 
                        <option>Togo</option> 
                        <option>Tokelau</option> 
                        <option>Tonga</option> 
                        <option>Trinidad y Tobago</option> 
                        <option>Tunez</option> 
                        <option>Islas Turcas y Caicos</option> 
                        <option>Turkmenistan</option> 
                        <option>Turquia</option> 
                        <option>Tuvalu</option> 
                        <option>Ucrania</option> 
                        <option>Uganda</option> 
                        <option>Uruguay</option> 
                        <option>Uzbekistan</option> 
                        <option>Vanuatu</option> 
                        <option>Ciudad del Vaticano</option> 
                        <option>Vietnam</option> 
                        <option>Islas Virgenes Britanicas</option> 
                        <option>Islas Virgenes de los Estados Unidos</option> 
                        <option>Wallis y Futuna</option> 
                        <option>Yemen</option> 
                        <option>Yibuti</option> 
                        <option>Zambia</option> 
                        <option>Zimbabue</option>
                        <option>Varios Estados</option>
                        <option>Otros</option>
                    </html:select> 
                    <br> <br> <br>
                    2do Pais &nbsp;
                    <html:select name="ClaseEstadistica" property="codigo2">
                        <option>Paises...</option> 
                        <option>Afganistan</option> 
                        <option>Aland</option> 
                        <option>Albania</option> 
                        <option>Alemania</option> 
                        <option>Andorra</option> 
                        <option>Angola</option> 
                        <option>Anguila</option> 
                        <option>Antigua y Barbuda</option> 
                        <option>Antillas Neerlandesas</option> 
                        <option>Arabia Saudita</option> 
                        <option>Argelia</option> 
                        <option>Argentina</option> 
                        <option>Armenia</option> 
                        <option>Aruba</option> 
                        <option>Australia</option> 
                        <option>Austria</option> 
                        <option>Azerbaiyan</option> 
                        <option>Bahamas</option> 
                        <option>Barein</option> 
                        <option>Banglades</option> 
                        <option>Barbados</option> 
                        <option>Belgica</option> 
                        <option>Belice</option> 
                        <option>Benin</option> 
                        <option>Bermudas</option> 
                        <option>Bielorrusia</option> 
                        <option>Birmania</option> 
                        <option>Bolivia</option> 
                        <option>Bosnia y Herzegovina</option> 
                        <option>Botsuana</option> 
                        <option>Isla Bouvet</option> 
                        <option>Brasil</option> 
                        <option>Brunei</option> 
                        <option>Bulgaria</option> 
                        <option>Burkina Faso</option> 
                        <option>Burundi</option> 
                        <option>Butan</option> 
                        <option>Cabo Verde</option> 
                        <option>Islas Caiman</option> 
                        <option>Camboya</option> 
                        <option>Camerun</option> 
                        <option>Canada</option> 
                        <option>Republica Centroafricana</option> 
                        <option>Chad</option> 
                        <option>Republica Checa</option> 
                        <option>Chile</option> 
                        <option>China</option> 
                        <option>Chipre</option> 
                        <option>Islas Cocos</option> 
                        <option>Colombia</option> 
                        <option>Comoras</option> 
                        <option>Republica del Congo</option> 
                        <option>Rep. Dem. del Congo</option> 
                        <option>Islas Cook</option> 
                        <option>Corea del Norte</option> 
                        <option>Corea del Sur</option> 
                        <option>Costa de Marfil</option> 
                        <option>Costa Rica</option> 
                        <option>Croacia</option> 
                        <option>Curazao</option> 
                        <option>Cuba</option> 
                        <option>Dinamarca</option> 
                        <option>Dominica</option> 
                        <option>Republica Dominicana</option> 
                        <option>Ecuador</option> 
                        <option>Egipto</option> 
                        <option>El Salvador</option> 
                        <option>Emiratos Árabes Unidos</option> 
                        <option>Eritrea</option> 
                        <option>Eslovaquia</option> 
                        <option>Eslovenia</option> 
                        <option>Espana</option> 
                        <option>Estados Unidos</option> 
                        <option>Estonia</option> 
                        <option>Etiopia</option> 
                        <option>Islas Feroe</option> 
                        <option>Filipinas</option> 
                        <option>Finlandia</option> 
                        <option>Fiyi</option> 
                        <option>Francia</option> 
                        <option>Gabon</option> 
                        <option>Gambia</option> 
                        <option>Georgia</option> 
                        <option>Islas Georgias del Sur y Sandwich del Sur</option> 
                        <option>Ghana</option> 
                        <option>Gibraltar</option> 
                        <option>Granada</option> 
                        <option>Grecia</option> 
                        <option>Groenlandia</option> 
                        <option>Guadalupe</option> 
                        <option>Guam</option> 
                        <option>Guatemala</option> 
                        <option>Guayana Francesa</option> 
                        <option>Guernsey</option> 
                        <option>Guinea</option> 
                        <option>Guinea Ecuatorial</option> 
                        <option>Guinea-Bisau</option> 
                        <option>Guyana</option> 
                        <option>Haiti</option> 
                        <option>Islas Heard y McDonald</option> 
                        <option>Honduras</option> 
                        <option>Hong Kong</option> 
                        <option>Hungria</option> 
                        <option>India</option> 
                        <option>Indonesia</option> 
                        <option>Iran</option> 
                        <option>Irak</option> 
                        <option>Irlanda</option> 
                        <option>Islandia</option> 
                        <option>Israel</option> 
                        <option>Italia</option> 
                        <option>Jamaica</option> 
                        <option>Japon</option> 
                        <option>Jersey</option> 
                        <option>Jordania</option> 
                        <option>Kazajistan</option> 
                        <option>Kenia</option> 
                        <option>Kirguistan</option> 
                        <option>Kiribati</option> 
                        <option>Kuwait</option> 
                        <option>Laos</option> 
                        <option>Lesoto</option> 
                        <option>Letonia</option> 
                        <option>Libano</option> 
                        <option>Liberia</option> 
                        <option>Libia</option> 
                        <option>Liechtenstein</option> 
                        <option>Lituania</option> 
                        <option>Luxemburgo</option> 
                        <option>Macao</option> 
                        <option>Republica de Macedonia</option> 
                        <option>Madagascar</option> 
                        <option>Malasia</option> 
                        <option>Malaui</option> 
                        <option>Maldivas</option> 
                        <option>Mali</option> 
                        <option>Malta</option> 
                        <option>Islas Malvinas</option> 
                        <option>Isla de Man</option> 
                        <option>Islas Marianas del Norte</option> 
                        <option>Marruecos</option> 
                        <option>Islas Marshall</option> 
                        <option>Martinica</option> 
                        <option>Mauricio</option> 
                        <option>Mauritania</option> 
                        <option>Mayotte</option> 
                        <option>Mexico</option> 
                        <option>Micronesia</option> 
                        <option>Moldavia</option> 
                        <option>Monaco</option> 
                        <option>Mongolia</option> 
                        <option>Montenegro</option> 
                        <option>Montserrat</option> 
                        <option>Mozambique</option> 
                        <option>Namibia</option> 
                        <option>Nauru</option> 
                        <option>Isla de Navidad</option> 
                        <option>Nepal</option> 
                        <option>Nicaragua</option> 
                        <option>Niger</option> 
                        <option>Nigeria</option> 
                        <option>Niue</option> 
                        <option>Norfolk</option> 
                        <option>Noruega</option> 
                        <option>Nueva Caledonia</option> 
                        <option>Nueva Zelanda</option> 
                        <option>Oman</option> 
                        <option>Paises Bajos</option> 
                        <option>Pakistan</option> 
                        <option>Palaos</option> 
                        <option>Autoridad Nacional Palestina</option> 
                        <option>Panama</option> 
                        <option>Papua Nueva Guinea</option> 
                        <option>Paraguay</option> 
                        <option>Peru</option> 
                        <option>Islas Pitcairn</option> 
                        <option>Polinesia Francesa</option> 
                        <option>Polonia</option> 
                        <option>Portugal</option> 
                        <option>Puerto Rico</option> 
                        <option>Catar</option> 
                        <option>Reino Unido</option> 
                        <option>Reunion</option> 
                        <option>Ruanda</option> 
                        <option>Rumania</option> 
                        <option>Rusia</option> 
                        <option>Republica Arabe Saharaui Democratica</option> 
                        <option>Islas Salomon</option> 
                        <option>Samoa</option> 
                        <option>Samoa Americana</option> 
                        <option>San Bartolome</option> 
                        <option>San Cristobal y Nieves</option> 
                        <option>San Marino</option> 
                        <option>San Martin</option> 
                        <option>San Pedro y Miquelon</option> 
                        <option>San Vicente y las Granadinas</option> 
                        <option>Santa Helena, A. y T.</option> 
                        <option>Santa Luca</option> 
                        <option>Santo Tome y Principe</option> 
                        <option>Senegal</option> 
                        <option>Serbia</option> 
                        <option>Seychelles</option> 
                        <option>Sierra Leona</option> 
                        <option>Singapur</option> 
                        <option>Siria</option> 
                        <option>Somalia</option> 
                        <option>Sri Lanka</option> 
                        <option>Suazilandia</option> 
                        <option>Sudafrica</option> 
                        <option>Sudan</option> 
                        <option>Sudan del Sur</option> 
                        <option>Suecia</option> 
                        <option>Suiza</option> 
                        <option>Surinam</option> 
                        <option>Svalbard y Jan Mayen</option> 
                        <option>Tailandia</option> 
                        <option>Taiwan</option> 
                        <option>Tanzania</option> 
                        <option>Tayikistan</option> 
                        <option>Territorio Britanico del Oceano Indico</option> 
                        <option>Territorios Australes Franceses</option> 
                        <option>Timor Oriental</option> 
                        <option>Togo</option> 
                        <option>Tokelau</option> 
                        <option>Tonga</option> 
                        <option>Trinidad y Tobago</option> 
                        <option>Tunez</option> 
                        <option>Islas Turcas y Caicos</option> 
                        <option>Turkmenistan</option> 
                        <option>Turquia</option> 
                        <option>Tuvalu</option> 
                        <option>Ucrania</option> 
                        <option>Uganda</option> 
                        <option>Uruguay</option> 
                        <option>Uzbekistan</option> 
                        <option>Vanuatu</option> 
                        <option>Ciudad del Vaticano</option> 
                        <option>Vietnam</option> 
                        <option>Islas Virgenes Britanicas</option> 
                        <option>Islas Virgenes de los Estados Unidos</option> 
                        <option>Wallis y Futuna</option> 
                        <option>Yemen</option> 
                        <option>Yibuti</option> 
                        <option>Zambia</option> 
                        <option>Zimbabue</option>
                        <option>Varios Estados</option>
                        <option>Otros</option>
                    </html:select> 
                    <br> <br> <br>
                    3er Pais &nbsp;
                    <html:select name="ClaseEstadistica" property="codigo3">
                        <option>Paises...</option> 
                        <option>Afganistan</option> 
                        <option>Aland</option> 
                        <option>Albania</option> 
                        <option>Alemania</option> 
                        <option>Andorra</option> 
                        <option>Angola</option> 
                        <option>Anguila</option> 
                        <option>Antigua y Barbuda</option> 
                        <option>Antillas Neerlandesas</option> 
                        <option>Arabia Saudita</option> 
                        <option>Argelia</option> 
                        <option>Argentina</option> 
                        <option>Armenia</option> 
                        <option>Aruba</option> 
                        <option>Australia</option> 
                        <option>Austria</option> 
                        <option>Azerbaiyan</option> 
                        <option>Bahamas</option> 
                        <option>Barein</option> 
                        <option>Banglades</option> 
                        <option>Barbados</option> 
                        <option>Belgica</option> 
                        <option>Belice</option> 
                        <option>Benin</option> 
                        <option>Bermudas</option> 
                        <option>Bielorrusia</option> 
                        <option>Birmania</option> 
                        <option>Bolivia</option> 
                        <option>Bosnia y Herzegovina</option> 
                        <option>Botsuana</option> 
                        <option>Isla Bouvet</option> 
                        <option>Brasil</option> 
                        <option>Brunei</option> 
                        <option>Bulgaria</option> 
                        <option>Burkina Faso</option> 
                        <option>Burundi</option> 
                        <option>Butan</option> 
                        <option>Cabo Verde</option> 
                        <option>Islas Caiman</option> 
                        <option>Camboya</option> 
                        <option>Camerun</option> 
                        <option>Canada</option> 
                        <option>Republica Centroafricana</option> 
                        <option>Chad</option> 
                        <option>Republica Checa</option> 
                        <option>Chile</option> 
                        <option>China</option> 
                        <option>Chipre</option> 
                        <option>Islas Cocos</option> 
                        <option>Colombia</option> 
                        <option>Comoras</option> 
                        <option>Republica del Congo</option> 
                        <option>Rep. Dem. del Congo</option> 
                        <option>Islas Cook</option> 
                        <option>Corea del Norte</option> 
                        <option>Corea del Sur</option> 
                        <option>Costa de Marfil</option> 
                        <option>Costa Rica</option> 
                        <option>Croacia</option> 
                        <option>Curazao</option> 
                        <option>Cuba</option> 
                        <option>Dinamarca</option> 
                        <option>Dominica</option> 
                        <option>Republica Dominicana</option> 
                        <option>Ecuador</option> 
                        <option>Egipto</option> 
                        <option>El Salvador</option> 
                        <option>Emiratos Árabes Unidos</option> 
                        <option>Eritrea</option> 
                        <option>Eslovaquia</option> 
                        <option>Eslovenia</option> 
                        <option>Espana</option> 
                        <option>Estados Unidos</option> 
                        <option>Estonia</option> 
                        <option>Etiopia</option> 
                        <option>Islas Feroe</option> 
                        <option>Filipinas</option> 
                        <option>Finlandia</option> 
                        <option>Fiyi</option> 
                        <option>Francia</option> 
                        <option>Gabon</option> 
                        <option>Gambia</option> 
                        <option>Georgia</option> 
                        <option>Islas Georgias del Sur y Sandwich del Sur</option> 
                        <option>Ghana</option> 
                        <option>Gibraltar</option> 
                        <option>Granada</option> 
                        <option>Grecia</option> 
                        <option>Groenlandia</option> 
                        <option>Guadalupe</option> 
                        <option>Guam</option> 
                        <option>Guatemala</option> 
                        <option>Guayana Francesa</option> 
                        <option>Guernsey</option> 
                        <option>Guinea</option> 
                        <option>Guinea Ecuatorial</option> 
                        <option>Guinea-Bisau</option> 
                        <option>Guyana</option> 
                        <option>Haiti</option> 
                        <option>Islas Heard y McDonald</option> 
                        <option>Honduras</option> 
                        <option>Hong Kong</option> 
                        <option>Hungria</option> 
                        <option>India</option> 
                        <option>Indonesia</option> 
                        <option>Iran</option> 
                        <option>Irak</option> 
                        <option>Irlanda</option> 
                        <option>Islandia</option> 
                        <option>Israel</option> 
                        <option>Italia</option> 
                        <option>Jamaica</option> 
                        <option>Japon</option> 
                        <option>Jersey</option> 
                        <option>Jordania</option> 
                        <option>Kazajistan</option> 
                        <option>Kenia</option> 
                        <option>Kirguistan</option> 
                        <option>Kiribati</option> 
                        <option>Kuwait</option> 
                        <option>Laos</option> 
                        <option>Lesoto</option> 
                        <option>Letonia</option> 
                        <option>Libano</option> 
                        <option>Liberia</option> 
                        <option>Libia</option> 
                        <option>Liechtenstein</option> 
                        <option>Lituania</option> 
                        <option>Luxemburgo</option> 
                        <option>Macao</option> 
                        <option>Republica de Macedonia</option> 
                        <option>Madagascar</option> 
                        <option>Malasia</option> 
                        <option>Malaui</option> 
                        <option>Maldivas</option> 
                        <option>Mali</option> 
                        <option>Malta</option> 
                        <option>Islas Malvinas</option> 
                        <option>Isla de Man</option> 
                        <option>Islas Marianas del Norte</option> 
                        <option>Marruecos</option> 
                        <option>Islas Marshall</option> 
                        <option>Martinica</option> 
                        <option>Mauricio</option> 
                        <option>Mauritania</option> 
                        <option>Mayotte</option> 
                        <option>Mexico</option> 
                        <option>Micronesia</option> 
                        <option>Moldavia</option> 
                        <option>Monaco</option> 
                        <option>Mongolia</option> 
                        <option>Montenegro</option> 
                        <option>Montserrat</option> 
                        <option>Mozambique</option> 
                        <option>Namibia</option> 
                        <option>Nauru</option> 
                        <option>Isla de Navidad</option> 
                        <option>Nepal</option> 
                        <option>Nicaragua</option> 
                        <option>Niger</option> 
                        <option>Nigeria</option> 
                        <option>Niue</option> 
                        <option>Norfolk</option> 
                        <option>Noruega</option> 
                        <option>Nueva Caledonia</option> 
                        <option>Nueva Zelanda</option> 
                        <option>Oman</option> 
                        <option>Paises Bajos</option> 
                        <option>Pakistan</option> 
                        <option>Palaos</option> 
                        <option>Autoridad Nacional Palestina</option> 
                        <option>Panama</option> 
                        <option>Papua Nueva Guinea</option> 
                        <option>Paraguay</option> 
                        <option>Peru</option> 
                        <option>Islas Pitcairn</option> 
                        <option>Polinesia Francesa</option> 
                        <option>Polonia</option> 
                        <option>Portugal</option> 
                        <option>Puerto Rico</option> 
                        <option>Catar</option> 
                        <option>Reino Unido</option> 
                        <option>Reunion</option> 
                        <option>Ruanda</option> 
                        <option>Rumania</option> 
                        <option>Rusia</option> 
                        <option>Republica Arabe Saharaui Democratica</option> 
                        <option>Islas Salomon</option> 
                        <option>Samoa</option> 
                        <option>Samoa Americana</option> 
                        <option>San Bartolome</option> 
                        <option>San Cristobal y Nieves</option> 
                        <option>San Marino</option> 
                        <option>San Martin</option> 
                        <option>San Pedro y Miquelon</option> 
                        <option>San Vicente y las Granadinas</option> 
                        <option>Santa Helena, A. y T.</option> 
                        <option>Santa Luca</option> 
                        <option>Santo Tome y Principe</option> 
                        <option>Senegal</option> 
                        <option>Serbia</option> 
                        <option>Seychelles</option> 
                        <option>Sierra Leona</option> 
                        <option>Singapur</option> 
                        <option>Siria</option> 
                        <option>Somalia</option> 
                        <option>Sri Lanka</option> 
                        <option>Suazilandia</option> 
                        <option>Sudafrica</option> 
                        <option>Sudan</option> 
                        <option>Sudan del Sur</option> 
                        <option>Suecia</option> 
                        <option>Suiza</option> 
                        <option>Surinam</option> 
                        <option>Svalbard y Jan Mayen</option> 
                        <option>Tailandia</option> 
                        <option>Taiwan</option> 
                        <option>Tanzania</option> 
                        <option>Tayikistan</option> 
                        <option>Territorio Britanico del Oceano Indico</option> 
                        <option>Territorios Australes Franceses</option> 
                        <option>Timor Oriental</option> 
                        <option>Togo</option> 
                        <option>Tokelau</option> 
                        <option>Tonga</option> 
                        <option>Trinidad y Tobago</option> 
                        <option>Tunez</option> 
                        <option>Islas Turcas y Caicos</option> 
                        <option>Turkmenistan</option> 
                        <option>Turquia</option> 
                        <option>Tuvalu</option> 
                        <option>Ucrania</option> 
                        <option>Uganda</option> 
                        <option>Uruguay</option> 
                        <option>Uzbekistan</option> 
                        <option>Vanuatu</option> 
                        <option>Ciudad del Vaticano</option> 
                        <option>Vietnam</option> 
                        <option>Islas Virgenes Britanicas</option> 
                        <option>Islas Virgenes de los Estados Unidos</option> 
                        <option>Wallis y Futuna</option> 
                        <option>Yemen</option> 
                        <option>Yibuti</option> 
                        <option>Zambia</option> 
                        <option>Zimbabue</option>
                        <option>Varios Estados</option>
                        <option>Otros</option>
                    </html:select>
                    <br> <br> <br>

                    <div id ="periodos1">
                        <fieldset>
                            <legend>Período 1</legend>                  
                            <legend>Inicio de período</legend>   
                            
                            <html:text property="periodoIni1" value=""/>

                            <legend>Finalización de período</legend>
                            <html:text property="periodoFin1" value = "" />               
                        </fieldset>   
                    </div>

                    <div id ="periodos2">
                        <fieldset>
                            <legend>Período 2</legend>                  
                            <legend>Inicio de período</legend>                  
                            <html:text property="periodoIni2" value="" />

                            <legend>Finalización de período</legend>
                            <html:text property="periodoFin2" value = "" />               
                        </fieldset>
                    </div>  

                    <div id="Generar" style="float: center;">
                        <html:submit> Generar </html:submit>
                        </div>

                        <br><br>
                </html:form> 
            </div>
        </div>
    </div>	
</div> 