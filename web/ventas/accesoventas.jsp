<%-- 
    Document   : accesoventas
    Created on : 9/08/2013, 04:40:38 PM
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
            String usuario2="Med-dirventas";
            String usuario3="Med-gerencia";
            String usuario4="Med-recepcion";
            String usuario5="Med-ventas1";
            String usuario6="Med-ventas2";
            String usuario7="Med-ventas3";
            String usuario8="Med-almacen";
            String usuario9="Med-facturacion";
            String usuario10="Med-facturacionAux";
            String usuario11="Med-desarrollo";
            String usuario12="Med-auditoria";
                    
            
            if( usuario1.equals(nombre1) || usuario2.equals(nombre1) || usuario3.equals(nombre1) || usuario4.equals(nombre1) || usuario5.equals(nombre1) || usuario6.equals(nombre1)
            || usuario7.equals(nombre1)|| usuario8.equals(nombre1)|| usuario9.equals(nombre1)|| usuario10.equals(nombre1)|| usuario11.equals(nombre1)|| usuario12.equals(nombre1)) 
            {
                response.sendRedirect("/AplicativoZComunicaciones/faces/ventas/List.jsp");
            }
            else
            {
                response.sendRedirect("/AplicativoZComunicaciones/noacceso.jsp");           
            }
            
        %>
    </body>
</html>
