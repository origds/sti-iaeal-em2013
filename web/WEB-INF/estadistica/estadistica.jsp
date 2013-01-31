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
<style>
  .error{font-size: 10px;color: #cc0000; float:left; padding:0}
  .error ul{list-style: none;}
</style>

<div id="body">
  <div id="barraBusqueda">
    <div class="box"> 
      <div class="inbox" id="cajaBusqueda">
        <div class="titulo">Generar estadística de la búsqueda realizada.</div>
<html:form method="POST" action="/BuscarEstadistica">                        
                        <p>           
                        
                      1er Pais &nbsp;
                        <html:select name="ClaseEstadistica" property="codigo1">
                            <option>Abjasia</option>
                            <option>Afganistán</option>
                            <option>Albania</option>
                            <option>Alemania</option>
                            <option>Andorra</option>
                            <option>Angola</option>
                            <option>Anguila</option>
                            <option>Anseaticas</option>
                            <option>Antigua República Yugoslava de Macedonia</option>
                            <option>Antigua y Barbuda</option>
                            <option>Arabe Saharaui Democratica</option>
                            <option>Arabia Saudí</option>
                            <option>Arabia Saudita Reino</option>
                            <option>Argelia</option>
                            <option>Argentina</option>
                            <option>Armenia</option>
                            <option>Australia</option>
                            <option>Austria</option>
                            <option>Azerbaiyán</option>
                            <option>Bahamas</option>
                            <option>Bahráin</option>
                            <option>Bangladesh</option>
                            <option>Barbados</option>
                            <option>Belarus</option>
                            <option>Bélgica</option>
                            <option>Belice</option>
                            <option>Benín</option>
                            <option>Bermudas</option>
                            <option>Bielorrusia</option>
                            <option>Birmania (actualmente Myanmar) </option>
                            <option>Bolivia</option>
                            <option>Bosnia y Herzegovina</option>
                            <option>Botsuana</option>
                            <option>Brasil</option>
                            <option>Brunei Darussalam</option>
                            <option>Bulgaria</option>
                            <option>Burkina Faso</option>
                            <option>Burundi</option>
                            <option>Bután</option>
                            <option>Cabo Verde</option>
                            <option>Camboya</option>
                            <option>Camerún</option>
                            <option>Canadá</option>
                            <option>Chad</option>
                            <option>Checa</option>
                            <option>Checoeslovakia</option>
                            <option>Chile</option>
                            <option>China</option>
                            <option>Chipre</option>
                            <option>Cisjordania y Franja de Gaza</option>
                            <option>Colombia</option>
                            <option>Comoras</option>
                            <option>Comunidad Europea</option>
                            <option>Congo</option>
                            <option>Corea del Norte</option>
                            <option>Corea del Sur</option>
                            <option>Costa de Marfil</option>
                            <option>Costa Rica</option>
                            <option>Croacia</option>
                            <option>Cuba</option>
                            <option>Dinamarca</option>
                            <option>Doha</option>
                            <option>Dominica</option>
                            <option>Ecuador</option>
                            <option>Egipto</option>
                            <option>El Salvador</option>
                            <option>Emiratos Arabes Unidos</option>
                            <option>Eritrea</option>
                            <option>Eslovaquia</option>
                            <option>Eslovenia</option>
                            <option>Espana</option>
                            <option>Estados Unidos</option>
                            <option>Estonia</option>
                            <option>Estonia</option>
                            <option>Etiopia</option>
                            <option>Federacion Rusa</option>
                            <option>Filipinas</option>
                            <option>Finlandia</option>
                            <option>Fiyi</option>
                            <option>Francia</option>
                            <option>Gabon</option>
                            <option>Gambia</option>
                            <option>Georgia</option>
                            <option>Ghana</option>
                            <option>Granada</option>
                            <option>Gran Bretana</option>
                            <option>Grecia</option>
                            <option>Guam</option>
                            <option>Guatemala</option>
                            <option>Guinea</option>
                            <option>Guinea Bissau</option>
                            <option>Guinea Ecuatorial</option>
                            <option>Guyana</option>
                            <option>Haiti</option>
                            <option>Holanda (Países Bajos)</option>
                            <option>Honduras</option>
                            <option>Hungria</option>
                            <option>India</option>
                            <option>Indonesia</option>
                            <option>Iran</option>
                            <option>Irak</option>
                            <option>Irlanda</option>
                            <option>Islandia</option>
                            <option>Islas Marshall</option>
                            <option>Islas Salomón</option>
                            <option>Israel</option>
                            <option>Italia</option>
                            <option>Jamaica</option>
                            <option>Japon</option>
                            <option>Jordania</option>
                            <option>Kazajistán</option>
                            <option>Kenia</option>
                            <option>Kirguizistán</option>
                            <option>Kiribati</option>
                            <option>Kuwait</option>
                            <option>Laos</option>
                            <option>Lesoto</option>
                            <option>Letonia</option>
                            <option>Libano</option>
                            <option>Liberia</option>
                            <option>Libia</option>
                            <option>Liechtenstein</option>
                            <option>Liga de Estados Arabes</option>
                            <option>Lituania</option>
                            <option>Luxemburgo</option>
                            <option>Macedonia</option>
                            <option>Madagascar</option>
                            <option>Malasia</option>
                            <option>Malaui</option>
                            <option>Maldivas</option>
                            <option>Mali</option>
                            <option>Malta</option>
                            <option>Marruecos</option>
                            <option>Mauritania</option>
                            <option>Mauricio</option>
                            <option>Mexico</option>
                            <option>Micronesia</option>
                            <option>Moldavia</option>
                            <option>Mónaco</option>
                            <option>Mongolia</option>
                            <option>Montenegro</option>
                            <option>Mozambique</option>
                            <option>Myanmar</option>
                            <option>Namibia</option>
                            <option>Nauru</option>
                            <option>Nepal</option>
                            <option>Nueva Zelanda</option>
                            <option>Nueva Granada</option>
                            <option>Nicaragua</option>
                            <option>Niger</option>
                            <option>Nigeria</option>
                            <option>Niue</option>
                            <option>Noruega</option>
                            <option>Oman</option>
                            <option>OEA</option>
                            <option>ONU</option>
                            <option>Osetia del Sur</option>
                            <option>Paises Bajos</option>
                            <option>Pakistán</option>
                            <option>Palau</option>
                            <option>Palestina</option>
                            <option>Panama</option>
                            <option>Papua-Nueva Guinea</option>
                            <option>Paraguay</option>
                            <option>Peru</option>
                            <option>Polonia</option>
                            <option>Portugal</option>
                            <option>Puerto Rico</option>
                            <option>Quatar</option>
                            <option>Reino Unido</option>
                            <option>Republica Centroafricana</option>
                            <option>Republica Democrática del Congo</option>
                            <option>Republica Dominicana</option>
                            <option>Republica Helenica</option>
                            <option>Rumania</option>
                            <option>Rusia</option>
                            <option>Ruanda</option>
                            <option>Sahara Occidental</option>
                            <option>Samoa</option>
                            <option>Saint Kitts y Nevis</option>
                            <option>San Cristobal y Nieves</option>
                            <option>San Marino</option>
                            <option>San Vicente y las Granadinas</option>
                            <option>Santa Lucia</option>
                            <option>Santa Sede</option>
                            <option>Santo Tome y Principe</option>
                            <option>Senegal</option>
                            <option>Serbia</option>
                            <option>Seychelles</option>
                            <option>Sierra Leona</option>
                            <option>Singapur</option>
                            <option>Siria</option>
                            <option>Somalia</option>
                            <option>Sri Lanka</option>
                            <option>Sudafrica</option>
                            <option>Sudan</option>
                            <option>Suecia</option>
                            <option>Suiza</option>
                            <option>Surinam</option>
                            <option>Suazilandia</option>
                            <option>Tailandia</option>
                            <option>Taiwán</option>
                            <option>Tanzania</option>
                            <option>Tayikistan</option>
                            <option>Timor Oriental</option>
                            <option>Togo</option>
                            <option>Tonga</option>
                            <option>Trinidad y Tobago</option>
                            <option>Tunez</option>
                            <option>Turkmenistán</option>
                            <option>Turquia</option>
                            <option>Tuvalu</option>
                            <option>Ucrania</option>
                            <option>Unasur</option>
                            <option>Uganda</option>
                            <option>Uruguay</option>
                            <option>Uzbekistán</option>
                            <option>Vanuatu</option>
                            <option>Vaticano</option>
                            <option>Vietnam</option>
                            <option>Varios Estados</option>
                            <option>Yemen</option>
                            <option>Yibuti</option>
                            <option>Yugoslavia</option>
                            <option>Zambia</option>
                            <option>Zimbabue</option>
                        </html:select> 
                        <br> <br> <br>
                        2do Pais &nbsp;
                        <html:select name="ClaseEstadistica" property="codigo2">
                            <option>Abjasia</option>
                            <option>Afganistán</option>
                            <option>Albania</option>
                            <option>Alemania</option>
                            <option>Andorra</option>
                            <option>Angola</option>
                            <option>Anguila</option>
                            <option>Anseaticas</option>
                            <option>Antigua República Yugoslava de Macedonia</option>
                            <option>Antigua y Barbuda</option>
                            <option>Arabe Saharaui Democratica</option>
                            <option>Arabia Saudí</option>
                            <option>Arabia Saudita Reino</option>
                            <option>Argelia</option>
                            <option>Argentina</option>
                            <option>Armenia</option>
                            <option>Australia</option>
                            <option>Austria</option>
                            <option>Azerbaiyán</option>
                            <option>Bahamas</option>
                            <option>Bahráin</option>
                            <option>Bangladesh</option>
                            <option>Barbados</option>
                            <option>Belarus</option>
                            <option>Bélgica</option>
                            <option>Belice</option>
                            <option>Benín</option>
                            <option>Bermudas</option>
                            <option>Bielorrusia</option>
                            <option>Birmania (actualmente Myanmar) </option>
                            <option>Bolivia</option>
                            <option>Bosnia y Herzegovina</option>
                            <option>Botsuana</option>
                            <option>Brasil</option>
                            <option>Brunei Darussalam</option>
                            <option>Bulgaria</option>
                            <option>Burkina Faso</option>
                            <option>Burundi</option>
                            <option>Bután</option>
                            <option>Cabo Verde</option>
                            <option>Camboya</option>
                            <option>Camerún</option>
                            <option>Canadá</option>
                            <option>Chad</option>
                            <option>Checa</option>
                            <option>Checoeslovakia</option>
                            <option>Chile</option>
                            <option>China</option>
                            <option>Chipre</option>
                            <option>Cisjordania y Franja de Gaza</option>
                            <option>Colombia</option>
                            <option>Comoras</option>
                            <option>Comunidad Europea</option>
                            <option>Congo</option>
                            <option>Corea del Norte</option>
                            <option>Corea del Sur</option>
                            <option>Costa de Marfil</option>
                            <option>Costa Rica</option>
                            <option>Croacia</option>
                            <option>Cuba</option>
                            <option>Dinamarca</option>
                            <option>Doha</option>
                            <option>Dominica</option>
                            <option>Ecuador</option>
                            <option>Egipto</option>
                            <option>El Salvador</option>
                            <option>Emiratos Arabes Unidos</option>
                            <option>Eritrea</option>
                            <option>Eslovaquia</option>
                            <option>Eslovenia</option>
                            <option>Espana</option>
                            <option>Estados Unidos</option>
                            <option>Estonia</option>
                            <option>Estonia</option>
                            <option>Etiopia</option>
                            <option>Federacion Rusa</option>
                            <option>Filipinas</option>
                            <option>Finlandia</option>
                            <option>Fiyi</option>
                            <option>Francia</option>
                            <option>Gabon</option>
                            <option>Gambia</option>
                            <option>Georgia</option>
                            <option>Ghana</option>
                            <option>Granada</option>
                            <option>Gran Bretana</option>
                            <option>Grecia</option>
                            <option>Guam</option>
                            <option>Guatemala</option>
                            <option>Guinea</option>
                            <option>Guinea Bissau</option>
                            <option>Guinea Ecuatorial</option>
                            <option>Guyana</option>
                            <option>Haiti</option>
                            <option>Holanda (Países Bajos)</option>
                            <option>Honduras</option>
                            <option>Hungria</option>
                            <option>India</option>
                            <option>Indonesia</option>
                            <option>Iran</option>
                            <option>Irak</option>
                            <option>Irlanda</option>
                            <option>Islandia</option>
                            <option>Islas Marshall</option>
                            <option>Islas Salomón</option>
                            <option>Israel</option>
                            <option>Italia</option>
                            <option>Jamaica</option>
                            <option>Japon</option>
                            <option>Jordania</option>
                            <option>Kazajistán</option>
                            <option>Kenia</option>
                            <option>Kirguizistán</option>
                            <option>Kiribati</option>
                            <option>Kuwait</option>
                            <option>Laos</option>
                            <option>Lesoto</option>
                            <option>Letonia</option>
                            <option>Libano</option>
                            <option>Liberia</option>
                            <option>Libia</option>
                            <option>Liechtenstein</option>
                            <option>Liga de Estados Arabes</option>
                            <option>Lituania</option>
                            <option>Luxemburgo</option>
                            <option>Macedonia</option>
                            <option>Madagascar</option>
                            <option>Malasia</option>
                            <option>Malaui</option>
                            <option>Maldivas</option>
                            <option>Mali</option>
                            <option>Malta</option>
                            <option>Marruecos</option>
                            <option>Mauritania</option>
                            <option>Mauricio</option>
                            <option>Mexico</option>
                            <option>Micronesia</option>
                            <option>Moldavia</option>
                            <option>Mónaco</option>
                            <option>Mongolia</option>
                            <option>Montenegro</option>
                            <option>Mozambique</option>
                            <option>Myanmar</option>
                            <option>Namibia</option>
                            <option>Nauru</option>
                            <option>Nepal</option>
                            <option>Nueva Zelanda</option>
                            <option>Nueva Granada</option>
                            <option>Nicaragua</option>
                            <option>Niger</option>
                            <option>Nigeria</option>
                            <option>Niue</option>
                            <option>Noruega</option>
                            <option>Oman</option>
                            <option>OEA</option>
                            <option>ONU</option>
                            <option>Osetia del Sur</option>
                            <option>Paises Bajos</option>
                            <option>Pakistán</option>
                            <option>Palau</option>
                            <option>Palestina</option>
                            <option>Panama</option>
                            <option>Papua-Nueva Guinea</option>
                            <option>Paraguay</option>
                            <option>Peru</option>
                            <option>Polonia</option>
                            <option>Portugal</option>
                            <option>Puerto Rico</option>
                            <option>Quatar</option>
                            <option>Reino Unido</option>
                            <option>Republica Centroafricana</option>
                            <option>Republica Democrática del Congo</option>
                            <option>Republica Dominicana</option>
                            <option>Republica Helenica</option>
                            <option>Rumania</option>
                            <option>Rusia</option>
                            <option>Ruanda</option>
                            <option>Sahara Occidental</option>
                            <option>Samoa</option>
                            <option>Saint Kitts y Nevis</option>
                            <option>San Cristobal y Nieves</option>
                            <option>San Marino</option>
                            <option>San Vicente y las Granadinas</option>
                            <option>Santa Lucia</option>
                            <option>Santa Sede</option>
                            <option>Santo Tome y Principe</option>
                            <option>Senegal</option>
                            <option>Serbia</option>
                            <option>Seychelles</option>
                            <option>Sierra Leona</option>
                            <option>Singapur</option>
                            <option>Siria</option>
                            <option>Somalia</option>
                            <option>Sri Lanka</option>
                            <option>Sudafrica</option>
                            <option>Sudan</option>
                            <option>Suecia</option>
                            <option>Suiza</option>
                            <option>Surinam</option>
                            <option>Suazilandia</option>
                            <option>Tailandia</option>
                            <option>Taiwán</option>
                            <option>Tanzania</option>
                            <option>Tayikistan</option>
                            <option>Timor Oriental</option>
                            <option>Togo</option>
                            <option>Tonga</option>
                            <option>Trinidad y Tobago</option>
                            <option>Tunez</option>
                            <option>Turkmenistán</option>
                            <option>Turquia</option>
                            <option>Tuvalu</option>
                            <option>Ucrania</option>
                            <option>Unasur</option>
                            <option>Uganda</option>
                            <option>Uruguay</option>
                            <option>Uzbekistán</option>
                            <option>Vanuatu</option>
                            <option>Vaticano</option>
                            <option>Vietnam</option>
                            <option>Varios Estados</option>
                            <option>Yemen</option>
                            <option>Yibuti</option>
                            <option>Yugoslavia</option>
                            <option>Zambia</option>
                            <option>Zimbabue</option>
                        </html:select> 
                        <br> <br> <br>
                        3er Pais &nbsp;
                        <html:select name="ClaseEstadistica" property="codigo3">
                            <option>Abjasia</option>
                            <option>Afganistán</option>
                            <option>Albania</option>
                            <option>Alemania</option>
                            <option>Andorra</option>
                            <option>Angola</option>
                            <option>Anguila</option>
                            <option>Anseaticas</option>
                            <option>Antigua República Yugoslava de Macedonia</option>
                            <option>Antigua y Barbuda</option>
                            <option>Arabe Saharaui Democratica</option>
                            <option>Arabia Saudí</option>
                            <option>Arabia Saudita Reino</option>
                            <option>Argelia</option>
                            <option>Argentina</option>
                            <option>Armenia</option>
                            <option>Australia</option>
                            <option>Austria</option>
                            <option>Azerbaiyán</option>
                            <option>Bahamas</option>
                            <option>Bahráin</option>
                            <option>Bangladesh</option>
                            <option>Barbados</option>
                            <option>Belarus</option>
                            <option>Bélgica</option>
                            <option>Belice</option>
                            <option>Benín</option>
                            <option>Bermudas</option>
                            <option>Bielorrusia</option>
                            <option>Birmania (actualmente Myanmar) </option>
                            <option>Bolivia</option>
                            <option>Bosnia y Herzegovina</option>
                            <option>Botsuana</option>
                            <option>Brasil</option>
                            <option>Brunei Darussalam</option>
                            <option>Bulgaria</option>
                            <option>Burkina Faso</option>
                            <option>Burundi</option>
                            <option>Bután</option>
                            <option>Cabo Verde</option>
                            <option>Camboya</option>
                            <option>Camerún</option>
                            <option>Canadá</option>
                            <option>Chad</option>
                            <option>Checa</option>
                            <option>Checoeslovakia</option>
                            <option>Chile</option>
                            <option>China</option>
                            <option>Chipre</option>
                            <option>Cisjordania y Franja de Gaza</option>
                            <option>Colombia</option>
                            <option>Comoras</option>
                            <option>Comunidad Europea</option>
                            <option>Congo</option>
                            <option>Corea del Norte</option>
                            <option>Corea del Sur</option>
                            <option>Costa de Marfil</option>
                            <option>Costa Rica</option>
                            <option>Croacia</option>
                            <option>Cuba</option>
                            <option>Dinamarca</option>
                            <option>Doha</option>
                            <option>Dominica</option>
                            <option>Ecuador</option>
                            <option>Egipto</option>
                            <option>El Salvador</option>
                            <option>Emiratos Arabes Unidos</option>
                            <option>Eritrea</option>
                            <option>Eslovaquia</option>
                            <option>Eslovenia</option>
                            <option>Espana</option>
                            <option>Estados Unidos</option>
                            <option>Estonia</option>
                            <option>Estonia</option>
                            <option>Etiopia</option>
                            <option>Federacion Rusa</option>
                            <option>Filipinas</option>
                            <option>Finlandia</option>
                            <option>Fiyi</option>
                            <option>Francia</option>
                            <option>Gabon</option>
                            <option>Gambia</option>
                            <option>Georgia</option>
                            <option>Ghana</option>
                            <option>Granada</option>
                            <option>Gran Bretana</option>
                            <option>Grecia</option>
                            <option>Guam</option>
                            <option>Guatemala</option>
                            <option>Guinea</option>
                            <option>Guinea Bissau</option>
                            <option>Guinea Ecuatorial</option>
                            <option>Guyana</option>
                            <option>Haiti</option>
                            <option>Holanda (Países Bajos)</option>
                            <option>Honduras</option>
                            <option>Hungria</option>
                            <option>India</option>
                            <option>Indonesia</option>
                            <option>Iran</option>
                            <option>Irak</option>
                            <option>Irlanda</option>
                            <option>Islandia</option>
                            <option>Islas Marshall</option>
                            <option>Islas Salomón</option>
                            <option>Israel</option>
                            <option>Italia</option>
                            <option>Jamaica</option>
                            <option>Japon</option>
                            <option>Jordania</option>
                            <option>Kazajistán</option>
                            <option>Kenia</option>
                            <option>Kirguizistán</option>
                            <option>Kiribati</option>
                            <option>Kuwait</option>
                            <option>Laos</option>
                            <option>Lesoto</option>
                            <option>Letonia</option>
                            <option>Libano</option>
                            <option>Liberia</option>
                            <option>Libia</option>
                            <option>Liechtenstein</option>
                            <option>Liga de Estados Arabes</option>
                            <option>Lituania</option>
                            <option>Luxemburgo</option>
                            <option>Macedonia</option>
                            <option>Madagascar</option>
                            <option>Malasia</option>
                            <option>Malaui</option>
                            <option>Maldivas</option>
                            <option>Mali</option>
                            <option>Malta</option>
                            <option>Marruecos</option>
                            <option>Mauritania</option>
                            <option>Mauricio</option>
                            <option>Mexico</option>
                            <option>Micronesia</option>
                            <option>Moldavia</option>
                            <option>Mónaco</option>
                            <option>Mongolia</option>
                            <option>Montenegro</option>
                            <option>Mozambique</option>
                            <option>Myanmar</option>
                            <option>Namibia</option>
                            <option>Nauru</option>
                            <option>Nepal</option>
                            <option>Nueva Zelanda</option>
                            <option>Nueva Granada</option>
                            <option>Nicaragua</option>
                            <option>Niger</option>
                            <option>Nigeria</option>
                            <option>Niue</option>
                            <option>Noruega</option>
                            <option>Oman</option>
                            <option>OEA</option>
                            <option>ONU</option>
                            <option>Osetia del Sur</option>
                            <option>Paises Bajos</option>
                            <option>Pakistán</option>
                            <option>Palau</option>
                            <option>Palestina</option>
                            <option>Panama</option>
                            <option>Papua-Nueva Guinea</option>
                            <option>Paraguay</option>
                            <option>Peru</option>
                            <option>Polonia</option>
                            <option>Portugal</option>
                            <option>Puerto Rico</option>
                            <option>Quatar</option>
                            <option>Reino Unido</option>
                            <option>Republica Centroafricana</option>
                            <option>Republica Democrática del Congo</option>
                            <option>Republica Dominicana</option>
                            <option>Republica Helenica</option>
                            <option>Rumania</option>
                            <option>Rusia</option>
                            <option>Ruanda</option>
                            <option>Sahara Occidental</option>
                            <option>Samoa</option>
                            <option>Saint Kitts y Nevis</option>
                            <option>San Cristobal y Nieves</option>
                            <option>San Marino</option>
                            <option>San Vicente y las Granadinas</option>
                            <option>Santa Lucia</option>
                            <option>Santa Sede</option>
                            <option>Santo Tome y Principe</option>
                            <option>Senegal</option>
                            <option>Serbia</option>
                            <option>Seychelles</option>
                            <option>Sierra Leona</option>
                            <option>Singapur</option>
                            <option>Siria</option>
                            <option>Somalia</option>
                            <option>Sri Lanka</option>
                            <option>Sudafrica</option>
                            <option>Sudan</option>
                            <option>Suecia</option>
                            <option>Suiza</option>
                            <option>Surinam</option>
                            <option>Suazilandia</option>
                            <option>Tailandia</option>
                            <option>Taiwán</option>
                            <option>Tanzania</option>
                            <option>Tayikistan</option>
                            <option>Timor Oriental</option>
                            <option>Togo</option>
                            <option>Tonga</option>
                            <option>Trinidad y Tobago</option>
                            <option>Tunez</option>
                            <option>Turkmenistán</option>
                            <option>Turquia</option>
                            <option>Tuvalu</option>
                            <option>Ucrania</option>
                            <option>Unasur</option>
                            <option>Uganda</option>
                            <option>Uruguay</option>
                            <option>Uzbekistán</option>
                            <option>Vanuatu</option>
                            <option>Vaticano</option>
                            <option>Vietnam</option>
                            <option>Varios Estados</option>
                            <option>Yemen</option>
                            <option>Yibuti</option>
                            <option>Yugoslavia</option>
                            <option>Zambia</option>
                            <option>Zimbabue</option>
                        </html:select>
                        <br> <br> <br>
                        <html:submit> Generar </html:submit>
                </html:form> 
      </div>
    </div>
  </div>	
</div> 