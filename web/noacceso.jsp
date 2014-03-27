<%-- 
    Document   : noacceso
    Created on : 9/08/2013, 03:58:45 PM
    Author     : z ventas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
          String nombre1 = (String) session.getAttribute("nombre");
            
        %>
        <%=nombre1%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>No acceso</title>
      <link href="../css/stylep.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <h1>Usted No Tiene Acceso!</h1>
        <br />
        <br />
        <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        <%-- <div id="chat">
<embed wmode="transparent" src="http://www.xatech.com/web_gear/chat/chat.swf" quality="high" width="365" height="400" name="chat" FlashVars="id=201969636&rl=Spanish" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://xat.com/update_flash.php" /><br><small><a target="_BLANK" href="http://xat.com/web_gear/?cb">Get your own Chat Box!</a> <a target="_BLANK" href="http://xat.com/web_gear/chat/go_large.php?id=201969636">Go Large!</a></small><br>
 </div> --%>
    </body>
</html>
