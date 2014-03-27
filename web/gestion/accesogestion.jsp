<%-- 
    Document   : accesoalquiler
    Created on : 9/08/2013, 04:42:21 PM
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
           
         
            String usuario2="Med-calidad";
            String usuario3="Med-gerencia";
            String usuario4="Med-recepcion";            
            String usuario6="Med-auxc";
            String usuario7="Med-coorlab";
            String usuario8="Med-almacen";
            String usuario5="Med-facturacion";
            String usuario1="Med-facturacionAux";
            String usuario9="Med-desarrollo";
            String usuario10="Med-auditoria";
             
            if(  usuario1.equals(nombre1) ||usuario2.equals(nombre1) || usuario3.equals(nombre1)|| usuario4.equals(nombre1)||usuario5.equals(nombre1)||usuario6.equals(nombre1)|| usuario7.equals(nombre1)|| usuario8.equals(nombre1)|| usuario9.equals(nombre1)|| usuario10.equals(nombre1) ) 
            {
                response.sendRedirect("/AplicativoZComunicaciones/faces/gestion/List.jsp");
            }
            else
            {
                response.sendRedirect("/AplicativoZComunicaciones/noacceso.jsp");           
            }
        %>
    </body>
</html>
