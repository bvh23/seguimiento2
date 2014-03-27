

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
	<script src="../js/jquery.autocomplete.js"></script>	
	<title>Cliente</title>
	<script>
	$(function(){
		$("#Cliente").autocomplete("../BusquedaCliente.jsp");
	});
         </script>
	  <%!      
        String nombreCliente;
        %>
</head>
<body style="background-image: url(../img/espiral-azul.jpg); background-repeat: no-repeat">
<br><br>
<font face="verdana" size="2">
</font>
 <div id="BuscarCliente">
        <table style="padding: 5%">  
             <form action="/AplicativoZComunicaciones/faces/ventas/New.jsp">
                  <tbody>
                <tr>
                    <td width="62" height="27" id="titulocli" ><a style="color:#fff"> NOMBRE CLIENTE</a></td>
                </tr>
                <tr>
                    <td width="193" ><input  maxlength="11" type="Text" id="Cliente" name="Cliente" class="Cliente" onclick="" style="width: 520px ; height: 25px" />
                  </td>
                </tr>
                <tr>
                     <td height="30"><input type="submit" value="Siquiente"  class="boton"/></td>
                </tr>
                </tbody>
            </form>
        </table>
               </div>
 
<% 
    
      String  nombreC=request.getParameter("Cliente");
      
      session.setAttribute("codigo", nombreC);
      
%>


    
</body>
</html>
