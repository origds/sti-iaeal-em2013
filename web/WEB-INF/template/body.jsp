<%-- 
    Document   : body
    Created on : Oct 22, 2012, 9:41:08 AM
    Author     : vicente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/base.js"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery-1.8.2.min.js"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery-ui-1.9.1.custom.js"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery.nivo.slider.js"></script>

<style>
  .error{font-size: 11px;color: #cc0000; text-align: left; margin-right: 20px;}
  .error ul{list-style: none;}
</style> 

<logic:present name="exito">
  <logic:equal name="exito" value="tratadoCrear">
    <script>
      $(document).ready(function(){
        alert("Tratado creado exitosamente");
      });
    </script>
  </logic:equal>
  <logic:equal name="exito" value="usuarioCrear">
    <script>
      $(document).ready(function(){
        alert("Usuario creado exitosamente");
      });
    </script>
  </logic:equal>  
  <logic:equal name="exito" value="tratadoModificar">
    <script>
      $(document).ready(function(){
        alert("Tratado modificado exitosamente");
      });
    </script>
  </logic:equal>  
  <logic:equal name="exito" value="usuarioModificar">
    <script>
      $(document).ready(function(){
        alert("Usuario modificado exitosamente");
      });
    </script>
  </logic:equal>   
  <logic:equal name="exito" value="olvidoContrasena">
    <script>
      $(document).ready(function(){
        alert("Contrasena reestablecida exitosamente");
      });
    </script>
  </logic:equal>     
    
</logic:present>
<script>
  $(window).load(function() {
    $('#slider').nivoSlider();
  });
</script>

<div id="body">
<logic:notPresent name="login">
  <div id="login">
    <div class="box" id="borderLogin">
      <div class="inbox" id="cajaLogin">
        Iniciar Sesion
        <html:form action="/iniciarSesion" acceptCharset="UTF-8">
          <fieldset style="border:none; text-align: left;">
            Usuario
            <div class="error">
              <html:errors property="usuarioLogin"/>
            </div>
            <html:text property="usuarioLogin"  value=""/>         
          </fieldset>
          <fieldset style="border:none; text-align: left; ">
            Contraseña
            <div class="error">
              <html:errors property="contrasenaLogin"/>
            </div>

              <html:password property="contrasenaLogin" value=""/>
          </fieldse >
          <fieldset style="border:none;">
          <html:submit value="Entrar" style="font-size: 13px"/>	
          <br><br><br>
            <html:link action="/recordar" style="color:#FF0000;">¿Olvidaste tu contraseña?</html:link>
          </fieldset>
        </html:form>			
      </div>
    </div>		
  </div>
</logic:notPresent>

  <div class="slider-wrapper theme-default" style="width: 550px; margin-left: 50px; float: left;">
    <div id="slider" class="nivoSlider">
      <html:img page="/interfaz/imagenes/venezuela-bandera11.png"/>
      <html:img page="/interfaz/imagenes/cancilleria.png"/>
      <html:img page="/interfaz/imagenes/usb.png"/>
      <html:img page="/interfaz/imagenes/can.png"/>
      <html:img page="/interfaz/imagenes/caf.png"/>
      <html:img page="/interfaz/imagenes/unasur.png"/>
    </div>
    <div id="htmlcaption" class="nivo-html-caption">
      <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>. 
    </div>
  </div>

  <div id="descripcionPagina">
    <h3>Tratados y Acuerdos Internacionales de Venezuela</h3>
    <p>Desde que Venezuela se formó como República se han firmado una gran cantidad de tratados que pueden ser de gran interés para muchas personas en el país y el mundo, es por ello que surge la necesidad de crear un sistema automatizado que permitiera tener los tratados en línea para volverlos accesibles a cualquier usuario. Es entonces que nace el presente proyecto, una aplicación destinada a incorporar los tratados a la web y administrarlos de manera rápida y sencilla.</p>
  </div>
  <div id="twitters">
      <a class="twitter-timeline" href="https://twitter.com/campusb" data-widget-id="385503387808055296">
          Tweets de @campusb
      </a>
    <script>!
        function(d,s,id){
            var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
            if(!d.getElementById(id)){
                js=d.createElement(s);
                  js.id=id;js.src=p+"://platform.twitter.com/widgets.js";
                  fjs.parentNode.insertBefore(js,fjs);
              }
          }
            (document,"script","twitter-wjs");</script>
<!--
      
    <a class="twitter-timeline" href="https://twitter.com/vecancilleria" data-widget-id="269327514583826433">
      Tweets por @vecancilleria   
    </a>
     
    <script>!
        function(d,s,id){
        var js,fjs=d.getElementsByTagName(s)[0];
        if(!d.getElementById(id)){
          js=d.createElement(s);
          js.id=id;js.src="//platform.twitter.com/widgets.js";
          fjs.parentNode.insertBefore(js,fjs);
        }
      }
      (document,"script","twitter-wjs");
    </script>-->
  </div>

  <div id="stickers">
    <a href="http://www.usb.ve/">
      <html:img page="/interfaz/imagenes/Sticker USB.png"/>
    </a>
    <a href="http://www.iaeal.usb.ve/">
      <html:img page="/interfaz/imagenes/Sticker IAEAL.png"/>
    </a>
    <a href="http://www.mre.gov.ve/">
      <html:img page="/interfaz/imagenes/Sticker CANCILLERIA.png"/>
    </a>
    <a href="http://www.aladi.org/">
      <html:img page="/interfaz/imagenes/Sticker ALADI.png"/>
    </a>
    <a href="http://www.caf.com/view/index.asp?ms=19">
      <html:img page="/interfaz/imagenes/Sticker CAF.png"/>
    </a>
    <a href="http://www.comunidadandina.org/">
      <html:img page="/interfaz/imagenes/Sticker CAN.png"/>
    </a>
    <a href="http://www.caricom.org/">
      <html:img page="/interfaz/imagenes/Sticker CARICOM.png"/>
    </a>
    <a href="http://www.mercosur.int/">
      <html:img page="/interfaz/imagenes/Sticker MERCOSUR.png"/>
    </a>
    <a href="http://www.onu.org.ve/">
      <html:img page="/interfaz/imagenes/Sticker ONU.png"/>
    </a>
    <a href="http://www.opec.org/opec_web/en/">
      <html:img page="/interfaz/imagenes/Sticker OPEP.png"/>
    </a>
    <a href="http://www.unasursg.org/">
      <html:img page="/interfaz/imagenes/Sticker UNASUR.png"/>
    </a>
  </div>
</div>