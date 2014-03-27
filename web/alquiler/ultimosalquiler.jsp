<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>&Uacute;ltimos Alquileres</title>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/AplicativoZComunicaciones/faces/jsfcrud.css" />
    <div id="menuleft">
               
            <ul style="margin-top:0px"> 
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/List.jsp">Proceso</a></li>
              <li> <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
           </ul>
               
            </div>
    </head>
    <body>
       <br />
     
           
                <h1>&Uacute;ltimos Alquiler</h1>
                <%
         
    
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT  top 20   al.IdAlquiler as idal,al.CodigoCliente as codigo, cl.NombreCliente as nombre,al.Usuario,al.FechaIngreso,al.OrdenPedido,al.Horario,al.Contacto,al.Zona,al.Prioridad,al.ObservacionesAlquiler as oal  from  Alquiler al, Clientes cl where al.CodigoCliente =cl.Codigo    ORDER BY al.IdAlquiler DESC");
                  
                out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("IdVenta");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("CodigoCliente");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("NombreCliente");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println("FechaIngreso");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Orden Pedido");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Horario");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Contacto");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Zona");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Prioridad");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("OBSERVACIONES");
                                    out.println("</th>");
                                out.println("</tr>");
                            out.println("</thead>");
                            
		while (rs.next ())
                    {
                            out.println("<tbody>");
                                out.println("<tr>");
                                   out.println("<th>");
                                         out.println(rs.getString("idal"));
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println(rs.getString("Codigo"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("nombre"));
                                    out.println("</th>");                                                                        
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("FechaIngreso"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("OrdenPedido"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Horario"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Contacto"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Zona"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Prioridad"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("oal"));
                                    out.println("</th>");
                                out.println("</tr>");
                                   
                                           
                    }  
                out.println("</tbody>");
                out.println("</table>");
          }
        catch(Exception e)
           {
            out.println("El Error es;"+e);
           }
    
            
            
       
%>
            </div>
 <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
    </body>
</html>
