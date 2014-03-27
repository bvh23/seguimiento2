<%-- 
    Document   : accesomensajeria
    Created on : 9/08/2013, 04:41:08 PM
    Author     : z ventas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>acceso</title>
    </head>
    <body>
        <%
            String nombre1 = (String) session.getAttribute("nombre");
            
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-recepcion";
            String usuario4="Med-facturacion";
            String usuario5="Med-facturacionAux";
            String usuario6="Med-desarrollo";
            String usuario7="Med-auditoria";
            
           
             
            if( usuario1.equals(nombre1) || usuario2.equals(nombre1) || usuario3.equals(nombre1)|| usuario4.equals(nombre1)|| usuario5.equals(nombre1)|| usuario6.equals(nombre1)|| usuario7.equals(nombre1)) 
            {
                response.sendRedirect("/AplicativoZComunicaciones/faces/mensajeria/List.jsp");
            }
            else
            {
                response.sendRedirect("/AplicativoZComunicaciones/noacceso.jsp");           
            }
        %>
    </body>
</html>
