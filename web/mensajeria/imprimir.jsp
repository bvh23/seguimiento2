
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<!DOCTYPE html>
<html >
    <head>
        <title>Imprimir</title>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
	<script src="../js/jquery.autocomplete.js"></script>
        </br></br>
    <h1 style="margin-left: 40%">Mensajer&iacute;a</h1>
    </br></br>
    <%--
    <div id="menuleft" style="top: -5px; left:5% ">
               
            <ul style="margin-top:5px"> 
              <li><a href="/AplicativoZComunicaciones/faces/ventas/accesoventas.jsp">Ventas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/accesomensajeria.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>      
              <li><a href="/AplicativoZComunicaciones/faces/laboratorio/accesolaboratorio.jsp">Laboratorio</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/accesogestion.jsp">Gesti&oacute;n</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/List.jsp">Proceso</a></li>
              <li> <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
           </ul>
               
</div>
    --%>
</head>
<body style="font-size: 8px">
    
<% 
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT  v.Usuario,v.ObservacionesVentas as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,V.Prioridad as p,V.Zona,v.Contacto ,p.IdProceso as id FROM Proceso p,Ventas v,Clientes Cl where Recepcion='ok'   and v.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and v.IdVenta=p.Id and v.Zona='sur'");
                  
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
                                    out.println("<th style=width:1px>");
                                         out.println("P");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Zona");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Contacto");
                                    out.println("</th>");
                                   
                                    out.println("<th style=width:75px>");
                                         out.println("Firma Recibe");
                                    out.println("</th>");
                                    out.println("<th style=width:10px>");
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
                                         out.println(rs.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("id"));
                                    out.println("</th>");
                                    
                               
                            
			 
                                           
                    }
                ResultSet rs1 = st.executeQuery("SELECT Al.Usuario,Al.ObservacionesAlquiler as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,Al.Prioridad as p,Al.Zona,Al.Contacto,p.IdProceso as id FROM Proceso p,Clientes Cl,Alquiler Al where p.Recepcion='ok'   and Al.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and Al.IdAlquiler=p.Id and Al.Zona='sur'");
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
                                         out.println(rs1.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs1.getString("id"));
                                    out.println("</th>");
                                    
                                   
                                       
                    }
                ResultSet rs2 = st.executeQuery("SELECT p.IdProceso,l.Usuario,l.ObservacionesLaboratorio as Observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,l.Prioridad as p, l.Zona,l.Contacto FROM Proceso p,Laboratorio l,Clientes Cl where p.Recepcion='ok'   and l.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and l.IdLaboratorio=P.Id and l.Zona='sur'");
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
                                         out.println(rs2.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                   
                                       
                    }
                ResultSet rs3 = st.executeQuery("SELECT M.Usuario,M.ObservacionesMensajeria as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,M.Prioridad as p,M.Zona,M.Contacto,p.IdProceso as id FROM Proceso p,Clientes Cl, Mensajeria M where Recepcion='ok'   and M.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and M.IdMensajeria=p.Id and M.Zona='sur'");
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
                                         out.println(rs3.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                   
                                    out.println("<th>");
                                         out.println(rs3.getString("id"));
                                    out.println("</th>"); 
                    }
                 ResultSet rs4 = st.executeQuery("SELECT G.Usuario,G.IdGestion,G.ObservacionesGestion as Observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,G.Prioridad as p, G.Zona,G.Contacto,G.CodigoCliente,p.IdProceso as id FROM Proceso p,Clientes Cl,Gestion G where p.Recepcion='ok'   and G.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and G.IdGestion=P.Id and G.Zona='sur'");
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
                                         out.println(rs4.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                   out.println("<th>");
                                         out.println(rs4.getString("id"));
                                    out.println("</th>"); 
                                       
                    }
                
		ResultSet rs5 = st.executeQuery("SELECT v.Usuario,v.ObservacionesVentas as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,V.Prioridad as p,V.Zona,v.Contacto,p.IdProceso as id FROM Proceso p,Ventas v,Clientes Cl where Recepcion='ok'   and v.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and v.IdVenta=p.Id and v.Zona='norte'");
                          
		while (rs5.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs5.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs5.getString("observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs5.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs5.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs5.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs5.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs5.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs5.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs5.getString("id"));
                                    out.println("</th>");
                                    
                               
                            
			 
                                           
                    }
                ResultSet rs6 = st.executeQuery("SELECT Al.Usuario,Al.ObservacionesAlquiler as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,Al.Prioridad as p,Al.Zona,Al.Contacto,p.IdProceso as id FROM Proceso p,Clientes Cl,Alquiler Al where p.Recepcion='ok'   and Al.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and Al.IdAlquiler=p.Id and Al.Zona='norte'");
                while (rs6.next ())
                    {
                      
                       
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs6.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs6.getString("observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs6.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs6.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs6.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs6.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs6.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs6.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs6.getString("id"));
                                    out.println("</th>");
                                   
                                       
                    }
                ResultSet rs7 = st.executeQuery("SELECT l.Usuario,l.ObservacionesLaboratorio as Observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,l.Prioridad as p, l.Zona,l.Contacto,p.IdProceso as id FROM Proceso p,Laboratorio l,Clientes Cl where p.Recepcion='ok'   and l.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and l.IdLaboratorio=P.Id and l.Zona='norte'");
                while (rs7.next ())
                    {
                      
                       
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs7.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs7.getString("observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs7.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs7.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs7.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs7.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs7.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs7.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs7.getString("id"));
                                    out.println("</th>");
                                       
                    }
                ResultSet rs8 = st.executeQuery("SELECT M.Usuario,M.ObservacionesMensajeria as observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,M.Prioridad as p,M.Zona,M.Contacto,p.IdProceso as id FROM Proceso p,Clientes Cl, Mensajeria M where Recepcion='ok'   and M.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and M.IdMensajeria=p.Id and M.Zona='norte'");
                while (rs8.next ())
                    {
                      
                       
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs8.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs8.getString("observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs8.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs8.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs8.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs8.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs8.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs8.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                   out.println("<th>");
                                         out.println(rs8.getString("id"));
                                    out.println("</th>");
                                       
                    }
                 ResultSet rs9 = st.executeQuery("SELECT G.Usuario,G.IdGestion,G.ObservacionesGestion as Observaciones,Cl.Direccion,Cl.NombreCliente as cliente,Cl.Telefono as tel,G.Prioridad as p, G.Zona,G.Contacto,G.CodigoCliente,p.IdProceso as id FROM Proceso p,Clientes Cl,Gestion G where p.Recepcion='ok'   and G.CodigoCliente=p.CodigoCliente and Cl.Codigo=p.CodigoCliente and G.IdGestion=P.Id and G.Zona='norte'");
                while (rs9.next ())
                    {
                      
                       
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs9.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs9.getString("Observaciones"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs9.getString("Direccion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs9.getString("cliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs9.getString("tel"));
                                    out.println("</th>");                               
                                    out.println("<th>");
                                         out.println(rs9.getString("p"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs9.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs9.getString("Contacto"));
                                    out.println("</th>");                               
                                    
                                    out.println("<th>");
                                         
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs9.getString("id"));
                                    out.println("</th>");
                                       
                    }
                out.println("</tbody>");
                            
                        out.println("</table>");
          }
        catch(Exception e)
           {
            out.println("El Error es;"+e);
           }
%>
</br></br>

<a href="/AplicativoZComunicaciones/faces/Inicio.jsp" style="color: #000">INICIO</a>

        </body>
</html>










