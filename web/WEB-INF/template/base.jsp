<%-- 
    Document   : base
    Created on : Oct 22, 2012, 12:28:33 AM
    Author     : vicente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<html:html>
    <link rel="stylesheet" href="<html:rewrite page='/interfaz/CSS/caja1.css'/>" type="text/css"></link>
    <link rel="stylesheet" href="<html:rewrite page='/interfaz/CSS/nivo-slider.css'/>" type="text/css"></link>
    <link rel="stylesheet" href="<html:rewrite page='/interfaz/CSS/default.css'/>" type="text/css"></link>
    <link rel="stylesheet" href="<html:rewrite page='/interfaz/CSS/jquery.tablesorter.pager.css'/>" type="text/css"></link>
    <script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/base.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery-1.8.2.min.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/jquery-ui-1.9.1.custom.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/interfaz/javaScript/propias.js"></script>
    
    <!-- Funcion para mostrar el box de login -->

 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><tiles:getAsString name="head"/></title>
    </head>
    <body onload="carga();"> 

    <center>
        <div id="borde">
            <tiles:insert attribute="header"/>
            <tiles:insert attribute="topMenu"/>
            <tiles:insert attribute="menu"/>
            <tiles:insert attribute="body"/>
        </div>
    </center>
</body>
</html:html>
