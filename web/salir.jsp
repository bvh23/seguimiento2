<%-- 
    Document   : salir
    Created on : 14/08/2013, 04:18:27 PM
    Author     : z ventas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saliendo</title>
    </head>
    <body>
        <h1>Sesión Cerrada</h1>
        <br />
        <br />
        <%
        session.setAttribute("nombre", null);
        %> 
        <a  href="faces/welcomeJSF.jsp">Volver a Ingresar</a>
    </body>
</html>
