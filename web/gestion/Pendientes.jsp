<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pendientes</title>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/AplicativoZComunicaciones/faces/jsfcrud.css" />
    <div id="menuleft">
               
            <ul style="margin-top: 0px ; margin-left:-150px"> 
              <li><a href="/AplicativoZComunicaciones/faces/ventas/accesoventas.jsp">Ventas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/accesomensajeria.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>      
              <li><a href="/AplicativoZComunicaciones/faces/laboratorio/accesolaboratorio.jsp">Laboratorio</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/accesogestion.jsp">Gesti&oacute;n</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/List.jsp">Proceso</a></li>
              <li> <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
           </ul>
               
            </div>
    </head>
    <body>
       <br />
        <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario2="Med-calidad";
            String usuario3="Med-gerencia";
            String usuario4="Med-recepcion";            
            String usuario6="Med-auxc";
            String usuario7="Med-alquiler";
            String usuario8="Med-almacen";
            String usuario5="Med-facturacion";
             String usuario1="Med-facturacionAux";
            if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)|| usuario8.equals(nombre1) ) 
            {
                %>
                <h1>Pendientes Almacen</h1>
                <%
         
    
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT P.Usuario,v.ObservacionesVentas as observaciones,v.OrdenPedido as O, Cl.NombreCliente as cliente,g.Prioridad as p,p.IdProceso as Id,p.Almacen as Al FROM Proceso p,Gestion g,Clientes Cl,Ventas v where    p.Almacen='X'and Cl.Codigo=p.CodigoCliente and g.IdGestion=p.Id and  v.CodigoCliente=p.CodigoCliente and p.Id=v.IdVenta");
                  
                out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("Observaciones");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Orden Pedido");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Cliente");
                                    out.println("</th>");                                    
                                    out.println("<th>");
                                         out.println("P");
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println("Id proceso");
                                    out.println("</th>"); 
                                     out.println("<th>");
                                         out.println("Estado Actual");
                                    out.println("</th>");
                                out.println("</tr>");
                            out.println("</thead>");
                            
		while (rs.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("Al"));
                                    out.println("</th>");
                                   
                                           
                    }
                
                ResultSet rs2 = st.executeQuery("SELECT P.Usuario,al.ObservacionesAlquiler as observaciones,al.OrdenPedido as O, Cl.NombreCliente as cliente,g.Prioridad as p,p.IdProceso as Id,p.Facturacion as F FROM Proceso p,Gestion g,Clientes Cl,Alquiler al where    p.Almacen ='X'and Cl.Codigo=p.CodigoCliente and g.IdGestion=p.Id and  al.CodigoCliente=p.CodigoCliente and p.Id=al.IdAlquiler");
                 while (rs2.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs2.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs2.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("F"));
                                    out.println("</th>");
                                   
                                           
                    } 
                out.println("</tbody>");
                out.println("</table>");
          }
        catch(Exception e)
           {
            out.println("El Error es;"+e);
           }
    }
            
            if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)|| usuario7.equals(nombre1) ) 
            {
                %>
                <h1>Pendientes Alquiler</h1>
                <%
         
    
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT P.Usuario,v.ObservacionesVentas as observaciones,v.OrdenPedido as O, Cl.NombreCliente as cliente,v.Prioridad as p,p.IdProceso as Id,p.Alquiler as A FROM Proceso p,Clientes Cl,Ventas v where    p.Alquiler ='X' and Cl.Codigo=p.CodigoCliente  and  v.CodigoCliente=p.CodigoCliente and p.Id=v.IdVenta");
                  
                out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("Observaciones");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Orden Pedido");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Cliente");
                                    out.println("</th>");                                    
                                    out.println("<th>");
                                         out.println("P");
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println("Id proceso");
                                    out.println("</th>"); 
                                     out.println("<th>");
                                         out.println("Estado Actual");
                                    out.println("</th>");
                                out.println("</tr>");
                            out.println("</thead>");
                            
		while (rs.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("A"));
                                    out.println("</th>");
                                   
                                           
                    }  
                out.println("</tbody>");
                out.println("</table>");
          }
        catch(Exception e)
           {
            out.println("El Error es;"+e);
           }
    }
            if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)|| usuario5.equals(nombre1)|| usuario1.equals(nombre1) ) 
            {
        %>
                <h1>Pendientes Facturacion</h1>
                <%
    
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT P.Usuario,v.ObservacionesVentas as observaciones,v.OrdenPedido as O, Cl.NombreCliente as cliente,g.Prioridad as p,p.IdProceso as Id,p.Facturacion as F FROM Proceso p,Gestion g,Clientes Cl,Ventas v where    p.Facturacion ='X'and Cl.Codigo=p.CodigoCliente and g.IdGestion=p.Id and  v.CodigoCliente=p.CodigoCliente and p.Id=v.IdVenta");
                  
                out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("Observaciones");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Orden Pedido");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Cliente");
                                    out.println("</th>");                                    
                                    out.println("<th>");
                                         out.println("P");
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println("Id proceso");
                                    out.println("</th>"); 
                                     out.println("<th>");
                                         out.println("Estado Actual");
                                    out.println("</th>");
                                out.println("</tr>");
                            out.println("</thead>");
                            
		while (rs.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("F"));
                                    out.println("</th>");
                                    } 
                
                ResultSet rs2 = st.executeQuery("SELECT P.Usuario,al.ObservacionesAlquiler as observaciones,al.OrdenPedido as O, Cl.NombreCliente as cliente,g.Prioridad as p,p.IdProceso as Id,p.Facturacion as F FROM Proceso p,Gestion g,Clientes Cl,Alquiler al where    p.Facturacion ='X'and Cl.Codigo=p.CodigoCliente and g.IdGestion=p.Id and  al.CodigoCliente=p.CodigoCliente and p.Id=al.IdAlquiler");
                 while (rs2.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs2.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs2.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("F"));
                                    out.println("</th>");
                    } 
                out.println("</tbody>");
                out.println("</table>");
          }
        catch(Exception e)
           {
            out.println("El Error es;"+e);
           }
    }
            if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)|| usuario5.equals(nombre1) ) 
            {
        %>
                <h1>Pendientes Liberacion</h1>
                <%
    
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("select p.Usuario,l.ObservacionesLaboratorio as observaciones,l.OrdenTecnica as O,Cl.NombreCliente as Cliente,l.Prioridad as p,p.IdProceso as Id,p.S_T_Liberacion as L from  Proceso p,Clientes Cl, Laboratorio l, Mensajeria where P.S_T_Liberacion='X'  and p.Id=Mensajeria.IdMensajeria and p.CodigoCliente=l.CodigoCliente and p.CodigoCliente=Cl.Codigo");
                  
                out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("Observaciones");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Orden Pedido");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Cliente");
                                    out.println("</th>");                                    
                                    out.println("<th>");
                                         out.println("P");
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println("Id proceso");
                                    out.println("</th>"); 
                                     out.println("<th>");
                                         out.println("Estado Actual");
                                    out.println("</th>");
                                out.println("</tr>");
                            out.println("</thead>");
                            
		while (rs.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("L"));
                                    out.println("</th>");
                                   
                                           
                    }  
                ResultSet rs2 = st.executeQuery("SELECT P.Usuario,al.ObservacionesAlquiler as observaciones,al.OrdenPedido as O, Cl.NombreCliente as cliente,g.Prioridad as p,p.IdProceso as Id,p.Facturacion as F FROM Proceso p,Gestion g,Clientes Cl,Alquiler al where    P.S_T_Liberacion='X'and Cl.Codigo=p.CodigoCliente and g.IdGestion=p.Id and  al.CodigoCliente=p.CodigoCliente and p.Id=al.IdAlquiler");
                 while (rs2.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs2.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs2.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("F"));
                                    out.println("</th>");
                                   
                                           
                    } 
                out.println("</tbody>");
                out.println("</table>");
          }
        catch(Exception e)
           {
            out.println("El Error es;"+e);
           }
    }
            if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)|| usuario5.equals(nombre1) ) 
            {
        %>
                <h1>Pendientes Laboratorio</h1>
                <%
    
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("select p.Usuario,l.ObservacionesLaboratorio as observaciones,l.OrdenTecnica O,Cl.NombreCliente as Cliente,l.Prioridad as p,p.IdProceso Id,p.S_T_Ingreso  as I from  Proceso p,Clientes Cl, Laboratorio l where P.S_T_Ingreso='X'  and p.CodigoCliente=l.CodigoCliente and p.CodigoCliente=Cl.Codigo");
                  
                out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("Observaciones");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Orden Pedido");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Cliente");
                                    out.println("</th>");                                    
                                    out.println("<th>");
                                         out.println("P");
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println("Id proceso");
                                    out.println("</th>"); 
                                     out.println("<th>");
                                         out.println("Estado Actual");
                                    out.println("</th>");
                                out.println("</tr>");
                            out.println("</thead>");
                            
		while (rs.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("I"));
                                    out.println("</th>");
                    }
                ResultSet rs2 = st.executeQuery("SELECT P.Usuario,al.ObservacionesAlquiler as observaciones,al.OrdenPedido as O, Cl.NombreCliente as cliente,g.Prioridad as p,p.IdProceso as Id,p.Facturacion as F FROM Proceso p,Gestion g,Clientes Cl,Alquiler al where   P.S_T_Ingreso='X' and Cl.Codigo=p.CodigoCliente and g.IdGestion=p.Id and  al.CodigoCliente=p.CodigoCliente and p.Id=al.IdAlquiler");
                 while (rs2.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs2.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("observaciones"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("O"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("cliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs2.getString("p"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("Id"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("F"));
                                    out.println("</th>");
                                   
                                           
                    } 
                out.println("</tbody>");
                out.println("</table>");
          }
        catch(Exception e)
           {
            out.println("El Error es;"+e);
           }
    }
            %>
            <div id="mensajeria" style="font-size: 8px">
                <%
            
       if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)|| usuario4.equals(nombre1) ) 
            {
        %>
                <h1>Pendientes Mensajeria</h1>      
            

<% 
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT v.Usuario,v.ObservacionesVentas as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,V.Prioridad as p,V.Zona,p.Recepcion,p.IdProceso FROM Proceso p,Ventas v,Clientes Cl where Recepcion='X'   and v.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and v.IdVenta=p.Id");
                  
                out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("Observaciones");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("Dirección");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Cliente");
                                    out.println("</th>");
                                    out.println("<th style=width:75px>");
                                         out.println("Tel");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("P");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Zona");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Recepcion");
                                    out.println("</th>");
                                   
                                    out.println("<th style=width:75px>");
                                         out.println("Id");
                                    out.println("</th>");
                                    
                                out.println("</tr>");
                            out.println("</thead>");
                            
		while (rs.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Recepcion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("IdProceso"));
                                    out.println("</th>");
                                   
                                    
                               
                            
			 
                                           
                    }
                ResultSet rs1 = st.executeQuery("SELECT Al.Usuario,Al.ObservacionesAlquiler as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,Al.Prioridad as p,Al.Zona,p.Recepcion,p.IdProceso FROM Proceso p,Clientes Cl,Alquiler Al where p.Recepcion='X'   and Al.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and Al.IdAlquiler=p.Id");
                while (rs1.next ())
                    {
                      
                       
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs1.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs1.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs1.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("Recepcion"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs1.getString("IdProceso"));
                                    out.println("</th>");
                                   
                                       
                    }
                ResultSet rs2 = st.executeQuery("SELECT l.Usuario,l.ObservacionesLaboratorio as Observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,l.Prioridad as p, l.Zona,p.Recepcion,p.IdProceso FROM Proceso p,Laboratorio l,Clientes Cl where p.Recepcion='X'   and l.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and l.IdLaboratorio=P.Id");
                while (rs2.next ())
                    {
                      
                       
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs2.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs2.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs2.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("Recepcion"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("IdProceso"));
                                    out.println("</th>");
                                   
                                       
                    }
                ResultSet rs3 = st.executeQuery("SELECT M.Usuario,M.ObservacionesMensajeria as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,M.Prioridad as p,M.Zona,p.Recepcion,p.IdProceso FROM Proceso p,Clientes Cl, Mensajeria M where Recepcion='X'   and M.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and M.IdMensajeria=p.Id");
                while (rs3.next ())
                    {
                      
                       
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs3.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs3.getString("observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs3.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs3.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs3.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs3.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs3.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs3.getString("Recepcion"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs3.getString("IdProceso"));
                                    out.println("</th>");
                                   
                                       
                    }
                 ResultSet rs4 = st.executeQuery("SELECT G.Usuario,G.IdGestion,G.ObservacionesGestion as Observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,G.Prioridad as p, G.Zona,p.Recepcion,G.CodigoCliente,p.IdProceso FROM Proceso p,Clientes Cl,Gestion G where p.Recepcion='X'   and G.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and G.IdGestion=P.Id");
                while (rs4.next ())
                    {
                      
                       
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs4.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs4.getString("Observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs4.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs4.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs4.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs4.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs4.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs4.getString("Recepcion"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         out.println(rs4.getString("IdProceso"));
                                    out.println("</th>");
                                   
                                       
                    }
                out.println("</tbody>");
                            
                        out.println("</table>");
          }
        catch(Exception e)
           {
            out.println("El Error es;"+e);
           }
            }
       
%>
            </div>
 <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
    </body>
</html>
