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

<logic:present name="failure">
    <logic:equal name="failure" value="gestionEstadistica">
        <script>
            $(document).ready(function() {
                alert("Debe introducir algun dato valido para generar su estadistica");
            });
        </script>
    </logic:equal>  
</logic:present>

<logic:present name="failure">
    <logic:equal name="failure" value="gestionEst">
        <script>
            $(document).ready(function() {
                alert("El periodo final debe ser mayor al periodo inicial");
            });
        </script>
    </logic:equal>  
</logic:present>        

<script>
    $(document).ready(function() {

        $("#botonPeriodo").click(function() {

            $("#botonPaises").show();
            $("#botonPeriodo").show();
            $("#botonAmbos").show();

            $("#periodos1").show();
            $("#periodos2").show();
            $("#periodos3").show();
            $("#barraPaises").hide();
            $("#raya").hide();
        });

        $("#botonPaises").click(function() {

            $("#periodos1").hide();
            $("#periodos2").hide();
            $("#periodos3").hide();
            $("#raya").hide();
            $("#botonPeriodo").show();
            $("#botonPaises").show();
            $("#botonAmbos").show();
            $("#barraPaises").show();
        });

        $("#botonAmbos").click(function() {

            $("#periodos1").show();
            $("#periodos2").show();
            $("#periodos3").show();
            $("#botonPeriodo").show();
            $("#botonPaises").show();
            $("#botonAmbos").show();
            $("#barraPaises").show();
            $("#raya").show();
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
                <div class="titulo">Generar estadística</div>
                <br> <br> <br>

                <div style="float: right;">
                    <button id="botonPeriodo" class="botonBusqueda">Solo Periodos</button>
                    <button id="botonPaises" class="botonBusqueda">Solo Paises</button>
                    <button id="botonAmbos" class="botonBusqueda">Paises y Periodos</button>
                </div>

                <html:form method="POST" action="/BuscarEstadistica" >                        
                    <p>       
                    <div id="barraPaises">
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
                            <option>San Pedro y Miquelon</option>colspan="2" 
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

                    </div>  
                    <br><br>
                    <fieldset id="raya" style="border:none; border-top: 2px solid #00627A; width: 520px;">
                    </fieldset>
                    <br>
                    <table id ="periodos1" style="width: 550px;">
                        
                        <tr>
                        <td colspan="2">
                        <center>
                            <legend style="color: #0099CC; font-size: 20px;">
                                <b> Período 1 </b></legend>   
                        </center>
                        </td>
                        <td colspan="2">
                        <center>
                            <legend style="color: #0099CC; font-size: 20px"><b> Período 2 </b></legend>   
                        </center>
                        </td>
                        </tr> 

                        
                            
                            <td>
                            <legend  style="margin-left:15px">
                                Inicio Período 1
                            </legend>
                        <html:select property="periodoIni1" style="margin-left:25px">
                            <option>  </option>
                            <option> 1820 </option>
                            <option> 1821 </option>
                            <option> 1822 </option>
                            <option> 1823 </option>
                            <option> 1824 </option>
                            <option> 1825 </option>
                            <option> 1826 </option>
                            <option> 1827 </option>
                            <option> 1828 </option>
                            <option> 1829 </option>
                            <option> 1830 </option>
                            <option> 1831 </option>
                            <option> 1832 </option>
                            <option> 1833 </option>
                            <option> 1834 </option>
                            <option> 1835 </option>
                            <option> 1836 </option>
                            <option> 1837 </option>
                            <option> 1838 </option>
                            <option> 1839 </option>
                            <option> 1840 </option>
                            <option> 1841 </option>
                            <option> 1842 </option>
                            <option> 1843 </option>
                            <option> 1844 </option>
                            <option> 1845 </option>
                            <option> 1846 </option>
                            <option> 1847 </option>
                            <option> 1848 </option>
                            <option> 1849 </option>
                            <option> 1850 </option>
                            <option> 1851 </option>
                            <option> 1852 </option>
                            <option> 1853 </option>
                            <option> 1854 </option>
                            <option> 1855 </option>
                            <option> 1856 </option>
                            <option> 1857 </option>
                            <option> 1858 </option>
                            <option> 1859 </option>
                            <option> 1860 </option>
                            <option> 1861 </option>
                            <option> 1862 </option>
                            <option> 1863 </option>
                            <option> 1864 </option>
                            <option> 1865 </option>
                            <option> 1866 </option>
                            <option> 1867 </option>
                            <option> 1868 </option>
                            <option> 1869 </option>
                            <option> 1870 </option>
                            <option> 1871 </option>
                            <option> 1872 </option>
                            <option> 1873 </option>
                            <option> 1874 </option>
                            <option> 1875 </option>
                            <option> 1876 </option>
                            <option> 1877 </option>
                            <option> 1878 </option>
                            <option> 1879 </option>
                            <option> 1880 </option>
                            <option> 1881 </option>
                            <option> 1882 </option>
                            <option> 1883 </option>
                            <option> 1884 </option>
                            <option> 1885 </option>
                            <option> 1886 </option>
                            <option> 1887 </option>
                            <option> 1888 </option>
                            <option> 1889 </option>
                            <option> 1890 </option>
                            <option> 1891 </option>
                            <option> 1892 </option>
                            <option> 1893 </option>
                            <option> 1894 </option>
                            <option> 1895 </option>
                            <option> 1896 </option>
                            <option> 1897 </option>
                            <option> 1898 </option>
                            <option> 1899 </option>
                            <option> 1900 </option>
                            <option> 1901 </option>
                            <option> 1902 </option>
                            <option> 1903 </option>
                            <option> 1904 </option>
                            <option> 1905 </option>
                            <option> 1906 </option>
                            <option> 1907 </option>
                            <option> 1908 </option>
                            <option> 1909 </option>
                            <option> 1910 </option>
                            <option> 1911 </option>
                            <option> 1913 </option>
                            <option> 1914 </option>
                            <option> 1915 </option>
                            <option> 1916 </option>
                            <option> 1917 </option>
                            <option> 1918 </option>
                            <option> 1919 </option>
                            <option> 1920 </option>
                            <option> 1921 </option>
                            <option> 1922 </option>
                            <option> 1923 </option>
                            <option> 1924 </option>
                            <option> 1925 </option>
                            <option> 1926 </option>
                            <option> 1927 </option>
                            <option> 1928 </option>
                            <option> 1929 </option>
                            <option> 1930 </option>
                            <option> 1931 </option>
                            <option> 1932 </option>
                            <option> 1933 </option>
                            <option> 1934 </option>
                            <option> 1935 </option>
                            <option> 1936 </option>
                            <option> 1937 </option>
                            <option> 1938 </option>
                            <option> 1939 </option>
                            <option> 1940 </option>
                            <option> 1941 </option>
                            <option> 1942 </option>
                            <option> 1943 </option>
                            <option> 1944 </option>
                            <option> 1945 </option>
                            <option> 1946 </option>
                            <option> 1947 </option>
                            <option> 1948 </option>
                            <option> 1949 </option>
                            <option> 1950 </option>
                            <option> 1951 </option>
                            <option> 1952 </option>
                            <option> 1953 </option>
                            <option> 1954 </option>
                            <option> 1955 </option>
                            <option> 1956 </option>
                            <option> 1957 </option>
                            <option> 1958 </option>
                            <option> 1959 </option>
                            <option> 1960 </option>
                            <option> 1961 </option>
                            <option> 1962 </option>
                            <option> 1963 </option>
                            <option> 1964 </option>
                            <option> 1965 </option>
                            <option> 1966 </option>
                            <option> 1967 </option>
                            <option> 1968 </option>
                            <option> 1969 </option>
                            <option> 1970 </option>
                            <option> 1971 </option>
                            <option> 1972 </option>
                            <option> 1973 </option>
                            <option> 1974 </option>
                            <option> 1975 </option>
                            <option> 1976 </option>
                            <option> 1977 </option>
                            <option> 1978 </option>
                            <option> 1979 </option>
                            <option> 1980 </option>
                            <option> 1981 </option>
                            <option> 1982 </option>
                            <option> 1983 </option>
                            <option> 1984 </option>
                            <option> 1985 </option>
                            <option> 1986 </option>
                            <option> 1987 </option>
                            <option> 1988 </option>
                            <option> 1989 </option>
                            <option> 1990 </option>
                            <option> 1991 </option>
                            <option> 1992 </option>
                            <option> 1993 </option>
                            <option> 1994 </option>
                            <option> 1995 </option>
                            <option> 1996 </option>
                            <option> 1997 </option>
                            <option> 1998 </option>
                            <option> 1999 </option>
                            <option> 2000 </option>
                            <option> 2001 </option>
                            <option> 2002 </option>
                            <option> 2003 </option>
                            <option> 2004</option>
                            <option> 2005 </option>
                            <option> 2006 </option>
                            <option> 2007 </option>
                            <option> 2008 </option>
                            <option> 2009 </option>
                            <option> 2010 </option>
                            <option> 2011 </option>
                            <option> 2012 </option>
                            <option> 2013 </option>
                        </html:select>   
                        <div class="error">
                            <html:errors property="periodoIni1"/>
                        </div>
                        </td>               
                        <td >
                        <legend  style="margin-left:-15px">Final Período 1</legend>
                        <html:select property="periodoFin1" style="margin-left:-5px">
                            <option>  </option>
                            <option> 1820 </option>
                            <option> 1821 </option>
                            <option> 1822 </option>
                            <option> 1823 </option>
                            <option> 1824 </option>
                            <option> 1825 </option>
                            <option> 1826 </option>
                            <option> 1827 </option>
                            <option> 1828 </option>
                            <option> 1829 </option>
                            <option> 1830 </option>
                            <option> 1831 </option>
                            <option> 1832 </option>
                            <option> 1833 </option>
                            <option> 1834 </option>
                            <option> 1835 </option>
                            <option> 1836 </option>
                            <option> 1837 </option>
                            <option> 1838 </option>
                            <option> 1839 </option>
                            <option> 1840 </option>
                            <option> 1841 </option>
                            <option> 1842 </option>
                            <option> 1843 </option>
                            <option> 1844 </option>
                            <option> 1845 </option>
                            <option> 1846 </option>
                            <option> 1847 </option>
                            <option> 1848 </option>
                            <option> 1849 </option>
                            <option> 1850 </option>
                            <option> 1851 </option>
                            <option> 1852 </option>
                            <option> 1853 </option>
                            <option> 1854 </option>
                            <option> 1855 </option>
                            <option> 1856 </option>
                            <option> 1857 </option>
                            <option> 1858 </option>
                            <option> 1859 </option>
                            <option> 1860 </option>
                            <option> 1861 </option>
                            <option> 1862 </option>
                            <option> 1863 </option>
                            <option> 1864 </option>
                            <option> 1865 </option>
                            <option> 1866 </option>
                            <option> 1867 </option>
                            <option> 1868 </option>
                            <option> 1869 </option>
                            <option> 1870 </option>
                            <option> 1871 </option>
                            <option> 1872 </option>
                            <option> 1873 </option>
                            <option> 1874 </option>
                            <option> 1875 </option>
                            <option> 1876 </option>
                            <option> 1877 </option>
                            <option> 1878 </option>
                            <option> 1879 </option>
                            <option> 1880 </option>
                            <option> 1881 </option>
                            <option> 1882 </option>
                            <option> 1883 </option>
                            <option> 1884 </option>
                            <option> 1885 </option>
                            <option> 1886 </option>
                            <option> 1887 </option>
                            <option> 1888 </option>
                            <option> 1889 </option>
                            <option> 1890 </option>
                            <option> 1891 </option>
                            <option> 1892 </option>
                            <option> 1893 </option>
                            <option> 1894 </option>
                            <option> 1895 </option>
                            <option> 1896 </option>
                            <option> 1897 </option>
                            <option> 1898 </option>
                            <option> 1899 </option>
                            <option> 1900 </option>
                            <option> 1901 </option>
                            <option> 1902 </option>
                            <option> 1903 </option>
                            <option> 1904 </option>
                            <option> 1905 </option>
                            <option> 1906 </option>
                            <option> 1907 </option>
                            <option> 1908 </option>
                            <option> 1909 </option>
                            <option> 1910 </option>
                            <option> 1911 </option>
                            <option> 1913 </option>
                            <option> 1914 </option>
                            <option> 1915 </option>
                            <option> 1916 </option>
                            <option> 1917 </option>
                            <option> 1918 </option>
                            <option> 1919 </option>
                            <option> 1920 </option>
                            <option> 1921 </option>
                            <option> 1922 </option>
                            <option> 1923 </option>
                            <option> 1924 </option>
                            <option> 1925 </option>
                            <option> 1926 </option>
                            <option> 1927 </option>
                            <option> 1928 </option>
                            <option> 1929 </option>
                            <option> 1930 </option>
                            <option> 1931 </option>
                            <option> 1932 </option>
                            <option> 1933 </option>
                            <option> 1934 </option>
                            <option> 1935 </option>
                            <option> 1936 </option>
                            <option> 1937 </option>
                            <option> 1938 </option>
                            <option> 1939 </option>
                            <option> 1940 </option>
                            <option> 1941 </option>
                            <option> 1942 </option>
                            <option> 1943 </option>
                            <option> 1944 </option>
                            <option> 1945 </option>
                            <option> 1946 </option>
                            <option> 1947 </option>
                            <option> 1948 </option>
                            <option> 1949 </option>
                            <option> 1950 </option>
                            <option> 1951 </option>
                            <option> 1952 </option>
                            <option> 1953 </option>
                            <option> 1954 </option>
                            <option> 1955 </option>
                            <option> 1956 </option>
                            <option> 1957 </option>
                            <option> 1958 </option>
                            <option> 1959 </option>
                            <option> 1960 </option>
                            <option> 1961 </option>
                            <option> 1962 </option>
                            <option> 1963 </option>
                            <option> 1964 </option>
                            <option> 1965 </option>
                            <option> 1966 </option>
                            <option> 1967 </option>
                            <option> 1968 </option>
                            <option> 1969 </option>
                            <option> 1970 </option>
                            <option> 1971 </option>
                            <option> 1972 </option>
                            <option> 1973 </option>
                            <option> 1974 </option>
                            <option> 1975 </option>
                            <option> 1976 </option>
                            <option> 1977 </option>
                            <option> 1978 </option>
                            <option> 1979 </option>
                            <option> 1980 </option>
                            <option> 1981 </option>
                            <option> 1982 </option>
                            <option> 1983 </option>
                            <option> 1984 </option>
                            <option> 1985 </option>
                            <option> 1986 </option>
                            <option> 1987 </option>
                            <option> 1988 </option>
                            <option> 1989 </option>
                            <option> 1990 </option>
                            <option> 1991 </option>
                            <option> 1992 </option>
                            <option> 1993 </option>
                            <option> 1994 </option>
                            <option> 1995 </option>
                            <option> 1996 </option>
                            <option> 1997 </option>
                            <option> 1998 </option>
                            <option> 1999 </option>
                            <option> 2000 </option>
                            <option> 2001 </option>
                            <option> 2002 </option>
                            <option> 2003 </option>
                            <option> 2004 </option>
                            <option> 2005 </option>
                            <option> 2006 </option>
                            <option> 2007 </option>
                            <option> 2008 </option>
                            <option> 2009 </option>
                            <option> 2010 </option>
                            <option> 2011 </option>
                            <option> 2012 </option>
                            <option> 2013 </option>
                        </html:select> 
                        <div class="error">
                            <html:errors property="periodoFin1"/>
                        </div>
                        </td>
                        
                    
                    <br><br><br>
                    
                                   
                        
                        
                        
                            <td>
                        <legend  style="margin-left:20px">Inicio Período 2</legend>
                        <html:select property="periodoIni2"  style="margin-left:28px">
                            <option>  </option>
                            <option> 1820 </option>
                            <option> 1821 </option>
                            <option> 1822 </option>
                            <option> 1823 </option>
                            <option> 1824 </option>
                            <option> 1825 </option>
                            <option> 1826 </option>
                            <option> 1827 </option>
                            <option> 1828 </option>
                            <option> 1829 </option>
                            <option> 1830 </option>
                            <option> 1831 </option>
                            <option> 1832 </option>
                            <option> 1833 </option>
                            <option> 1834 </option>
                            <option> 1835 </option>
                            <option> 1836 </option>
                            <option> 1837 </option>
                            <option> 1838 </option>
                            <option> 1839 </option>
                            <option> 1840 </option>
                            <option> 1841 </option>
                            <option> 1842 </option>
                            <option> 1843 </option>
                            <option> 1844 </option>
                            <option> 1845 </option>
                            <option> 1846 </option>
                            <option> 1847 </option>
                            <option> 1848 </option>
                            <option> 1849 </option>
                            <option> 1850 </option>
                            <option> 1851 </option>
                            <option> 1852 </option>
                            <option> 1853 </option>
                            <option> 1854 </option>
                            <option> 1855 </option>
                            <option> 1856 </option>
                            <option> 1857 </option>
                            <option> 1858 </option>
                            <option> 1859 </option>
                            <option> 1860 </option>
                            <option> 1861 </option>
                            <option> 1862 </option>
                            <option> 1863 </option>
                            <option> 1864 </option>
                            <option> 1865 </option>
                            <option> 1866 </option>
                            <option> 1867 </option>
                            <option> 1868 </option>
                            <option> 1869 </option>
                            <option> 1870 </option>
                            <option> 1871 </option>
                            <option> 1872 </option>
                            <option> 1873 </option>
                            <option> 1874 </option>
                            <option> 1875 </option>
                            <option> 1876 </option>
                            <option> 1877 </option>
                            <option> 1878 </option>
                            <option> 1879 </option>
                            <option> 1880 </option>
                            <option> 1881 </option>
                            <option> 1882 </option>
                            <option> 1883 </option>
                            <option> 1884 </option>
                            <option> 1885 </option>
                            <option> 1886 </option>
                            <option> 1887 </option>
                            <option> 1888 </option>
                            <option> 1889 </option>
                            <option> 1890 </option>
                            <option> 1891 </option>
                            <option> 1892 </option>
                            <option> 1893 </option>
                            <option> 1894 </option>
                            <option> 1895 </option>
                            <option> 1896 </option>
                            <option> 1897 </option>
                            <option> 1898 </option>
                            <option> 1899 </option>
                            <option> 1900 </option>
                            <option> 1901 </option>
                            <option> 1902 </option>
                            <option> 1903 </option>
                            <option> 1904 </option>
                            <option> 1905 </option>
                            <option> 1906 </option>
                            <option> 1907 </option>
                            <option> 1908 </option>
                            <option> 1909 </option>
                            <option> 1910 </option>
                            <option> 1911 </option>
                            <option> 1913 </option>
                            <option> 1914 </option>
                            <option> 1915 </option>
                            <option> 1916 </option>
                            <option> 1917 </option>
                            <option> 1918 </option>
                            <option> 1919 </option>
                            <option> 1920 </option>
                            <option> 1921 </option>
                            <option> 1922 </option>
                            <option> 1923 </option>
                            <option> 1924 </option>
                            <option> 1925 </option>
                            <option> 1926 </option>
                            <option> 1927 </option>
                            <option> 1928 </option>
                            <option> 1929 </option>
                            <option> 1930 </option>
                            <option> 1931 </option>
                            <option> 1932 </option>
                            <option> 1933 </option>
                            <option> 1934 </option>
                            <option> 1935 </option>
                            <option> 1936 </option>
                            <option> 1937 </option>
                            <option> 1938 </option>
                            <option> 1939 </option>
                            <option> 1940 </option>
                            <option> 1941 </option>
                            <option> 1942 </option>
                            <option> 1943 </option>
                            <option> 1944 </option>
                            <option> 1945 </option>
                            <option> 1946 </option>
                            <option> 1947 </option>
                            <option> 1948 </option>
                            <option> 1949 </option>
                            <option> 1950 </option>
                            <option> 1951 </option>
                            <option> 1952 </option>
                            <option> 1953 </option>
                            <option> 1954 </option>
                            <option> 1955 </option>
                            <option> 1956 </option>
                            <option> 1957 </option>
                            <option> 1958 </option>
                            <option> 1959 </option>
                            <option> 1960 </option>
                            <option> 1961 </option>
                            <option> 1962 </option>
                            <option> 1963 </option>
                            <option> 1964 </option>
                            <option> 1965 </option>
                            <option> 1966 </option>
                            <option> 1967 </option>
                            <option> 1968 </option>
                            <option> 1969 </option>
                            <option> 1970 </option>
                            <option> 1971 </option>
                            <option> 1972 </option>
                            <option> 1973 </option>
                            <option> 1974 </option>
                            <option> 1975 </option>
                            <option> 1976 </option>
                            <option> 1977 </option>
                            <option> 1978 </option>
                            <option> 1979 </option>
                            <option> 1980 </option>
                            <option> 1981 </option>
                            <option> 1982 </option>
                            <option> 1983 </option>
                            <option> 1984 </option>
                            <option> 1985 </option>
                            <option> 1986 </option>
                            <option> 1987 </option>
                            <option> 1988 </option>
                            <option> 1989 </option>
                            <option> 1990 </option>
                            <option> 1991 </option>
                            <option> 1992 </option>
                            <option> 1993 </option>
                            <option> 1994 </option>
                            <option> 1995 </option>
                            <option> 1996 </option>
                            <option> 1997 </option>
                            <option> 1998 </option>
                            <option> 1999 </option>
                            <option> 2000 </option>
                            <option> 2001 </option>
                            <option> 2002 </option>
                            <option> 2003 </option>
                            <option> 2004</option>
                            <option> 2005 </option>
                            <option> 2006 </option>
                            <option> 2007 </option>
                            <option> 2008 </option>
                            <option> 2009 </option>
                            <option> 2010 </option>
                            <option> 2011 </option>
                            <option> 2012 </option>
                            <option> 2013 </option>
                        </html:select>   
                        <div class="error">
                            <html:errors property="periodoIni2"/>
                        </div>
                        </td>
                        <td>
                        <legend>Final Período 2</legend>
                        <html:select property="periodoFin2"  style="margin-left:15px">
                            <option>  </option>
                            <option> 1820 </option>
                            <option> 1821 </option>
                            <option> 1822 </option>
                            <option> 1823 </option>
                            <option> 1824 </option>
                            <option> 1825 </option>
                            <option> 1826 </option>
                            <option> 1827 </option>
                            <option> 1828 </option>
                            <option> 1829 </option>
                            <option> 1830 </option>
                            <option> 1831 </option>
                            <option> 1832 </option>
                            <option> 1833 </option>
                            <option> 1834 </option>
                            <option> 1835 </option>
                            <option> 1836 </option>
                            <option> 1837 </option>
                            <option> 1838 </option>
                            <option> 1839 </option>
                            <option> 1840 </option>
                            <option> 1841 </option>
                            <option> 1842 </option>
                            <option> 1843 </option>
                            <option> 1844 </option>
                            <option> 1845 </option>
                            <option> 1846 </option>
                            <option> 1847 </option>
                            <option> 1848 </option>
                            <option> 1849 </option>
                            <option> 1850 </option>
                            <option> 1851 </option>
                            <option> 1852 </option>
                            <option> 1853 </option>
                            <option> 1854 </option>
                            <option> 1855 </option>
                            <option> 1856 </option>
                            <option> 1857 </option>
                            <option> 1858 </option>
                            <option> 1859 </option>
                            <option> 1860 </option>
                            <option> 1861 </option>
                            <option> 1862 </option>
                            <option> 1863 </option>
                            <option> 1864 </option>
                            <option> 1865 </option>
                            <option> 1866 </option>
                            <option> 1867 </option>
                            <option> 1868 </option>
                            <option> 1869 </option>
                            <option> 1870 </option>
                            <option> 1871 </option>
                            <option> 1872 </option>
                            <option> 1873 </option>
                            <option> 1874 </option>
                            <option> 1875 </option>
                            <option> 1876 </option>
                            <option> 1877 </option>
                            <option> 1878 </option>
                            <option> 1879 </option>
                            <option> 1880 </option>
                            <option> 1881 </option>
                            <option> 1882 </option>
                            <option> 1883 </option>
                            <option> 1884 </option>
                            <option> 1885 </option>
                            <option> 1886 </option>
                            <option> 1887 </option>
                            <option> 1888 </option>
                            <option> 1889 </option>
                            <option> 1890 </option>
                            <option> 1891 </option>
                            <option> 1892 </option>
                            <option> 1893 </option>
                            <option> 1894 </option>
                            <option> 1895 </option>
                            <option> 1896 </option>
                            <option> 1897 </option>
                            <option> 1898 </option>
                            <option> 1899 </option>
                            <option> 1900 </option>
                            <option> 1901 </option>
                            <option> 1902 </option>
                            <option> 1903 </option>
                            <option> 1904 </option>
                            <option> 1905 </option>
                            <option> 1906 </option>
                            <option> 1907 </option>
                            <option> 1908 </option>
                            <option> 1909 </option>
                            <option> 1910 </option>
                            <option> 1911 </option>
                            <option> 1913 </option>
                            <option> 1914 </option>
                            <option> 1915 </option>
                            <option> 1916 </option>
                            <option> 1917 </option>
                            <option> 1918 </option>
                            <option> 1919 </option>
                            <option> 1920 </option>
                            <option> 1921 </option>
                            <option> 1922 </option>
                            <option> 1923 </option>
                            <option> 1924 </option>
                            <option> 1925 </option>
                            <option> 1926 </option>
                            <option> 1927 </option>
                            <option> 1928 </option>
                            <option> 1929 </option>
                            <option> 1930 </option>
                            <option> 1931 </option>
                            <option> 1932 </option>
                            <option> 1933 </option>
                            <option> 1934 </option>
                            <option> 1935 </option>
                            <option> 1936 </option>
                            <option> 1937 </option>
                            <option> 1938 </option>
                            <option> 1939 </option>
                            <option> 1940 </option>
                            <option> 1941 </option>
                            <option> 1942 </option>
                            <option> 1943 </option>
                            <option> 1944 </option>
                            <option> 1945 </option>
                            <option> 1946 </option>
                            <option> 1947 </option>
                            <option> 1948 </option>
                            <option> 1949 </option>
                            <option> 1950 </option>
                            <option> 1951 </option>
                            <option> 1952 </option>
                            <option> 1953 </option>
                            <option> 1954 </option>
                            <option> 1955 </option>
                            <option> 1956 </option>
                            <option> 1957 </option>
                            <option> 1958 </option>
                            <option> 1959 </option>
                            <option> 1960 </option>
                            <option> 1961 </option>
                            <option> 1962 </option>
                            <option> 1963 </option>
                            <option> 1964 </option>
                            <option> 1965 </option>
                            <option> 1966 </option>
                            <option> 1967 </option>
                            <option> 1968 </option>
                            <option> 1969 </option>
                            <option> 1970 </option>
                            <option> 1971 </option>
                            <option> 1972 </option>
                            <option> 1973 </option>
                            <option> 1974 </option>
                            <option> 1975 </option>
                            <option> 1976 </option>
                            <option> 1977 </option>
                            <option> 1978 </option>
                            <option> 1979 </option>
                            <option> 1980 </option>
                            <option> 1981 </option>
                            <option> 1982 </option>
                            <option> 1983 </option>
                            <option> 1984 </option>
                            <option> 1985 </option>
                            <option> 1986 </option>
                            <option> 1987 </option>
                            <option> 1988 </option>
                            <option> 1989 </option>
                            <option> 1990 </option>
                            <option> 1991 </option>
                            <option> 1992 </option>
                            <option> 1993 </option>
                            <option> 1994 </option>
                            <option> 1995 </option>
                            <option> 1996 </option>
                            <option> 1997 </option>
                            <option> 1998 </option>
                            <option> 1999 </option>
                            <option> 2000 </option>
                            <option> 2001 </option>
                            <option> 2002 </option>
                            <option> 2003 </option>
                            <option> 2004 </option>
                            <option> 2005 </option>
                            <option> 2006 </option>
                            <option> 2007 </option>
                            <option> 2008 </option>
                            <option> 2009 </option>
                            <option> 2010 </option>
                            <option> 2011 </option>
                            <option> 2012 </option>
                            <option> 2013 </option>
                        </html:select> 


                        <div class="error">
                            <html:errors property="periodoFin2"/>
                        </div>
                        </td>
                        </table>
                        

                    
                    <br><br>
                    <div id="Generar" style="float: center;">
                        <html:submit> Generar </html:submit>
                        </div>
                        <br><br>

                </html:form> 
            </div>
        </div>
    </div>
</div> 