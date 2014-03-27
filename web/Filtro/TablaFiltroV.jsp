<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<f:view>
    <html>
        <head>
             <link href="../css/stylep.css" rel="stylesheet" type="text/css">
             <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <title>Resultados</title>
             
             <div id="menuleft">
               
            <ul style="margin-top:-19px ; margin-left:-150px"> 
              <li><a href="/AplicativoZComunicaciones/faces/ventas/accesoventas.jsp">Ventas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/accesomensajeria.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>      
              <li><a href="/AplicativoZComunicaciones/faces/laboratorio/accesolaboratorio.jsp">Laboratorio</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/accesogestion.jsp">Gesti&oacute;n</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/List.jsp">Proceso</a></li>
              <li> <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
           </ul>
               
            </div>
                 <h1>Resultados</h1>
        </head>
      <body>
        <div id="container" >
            <div id="cuerpo" >
                <div id="Resultado" >
         <% 
    try{
        String Nombre=(String)request.getParameter("Nombre");
        String Codigo=(String)request.getParameter("Codigo");
        String OrdenPedido=(String)request.getParameter("OrdenPedido");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
        Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
        Statement st=con.createStatement(); 
               
        out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("IdVenta");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("IdProceso");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Nombre Cliente");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Codigo Cliente");
                                    out.println("</th>");                                    
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println("Orden Pedido");
                                    out.println("</th>"); 
                                     out.println("<th style=margin:auto>");
                                         out.println("Observaciones Ventas");
                                    out.println("</th>");
                                     out.println("<th>");
                                         out.println("Recepcion");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Fecha Ingreso");
                                    out.println("</th>");
                                     out.println("<th>");
                                         out.println("Fecha Despacho");
                                    out.println("</th>");
                                out.println("</tr>");
                            out.println("</thead>");
                            
                            if(Nombre!="" ) 
                            {
                        ResultSet rs = st.executeQuery("Select V.IdVenta,p.IdProceso,cl.NombreCliente,V.CodigoCliente,v.Usuario,V.OrdenPedido,v.ObservacionesVentas,p.Recepcion,v.FechaIngreso,p.Fechadespacho from   Ventas V, Clientes cl,Proceso p WHERE cl.NombreCliente LIkE '%"+Nombre+"%' and cl.Codigo=V.CodigoCliente and p.CodigoCliente = cl.Codigo and V.IdVenta=p.Id");
                            while (rs.next ()){
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs.getString("IdVenta"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("IdProceso"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("NombreCliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("CodigoCliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("OrdenPedido"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("ObservacionesVentas"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("Recepcion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("FechaIngreso"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Fechadespacho"));
                                    out.println("</th>");
                            }
                            rs.close();
                           }
                        ResultSet rs1 = st.executeQuery("Select V.IdVenta,p.IdProceso,cl.NombreCliente,V.CodigoCliente,v.Usuario,V.OrdenPedido,v.ObservacionesVentas,p.Recepcion,v.FechaIngreso,p.Fechadespacho from   Ventas V, Clientes cl,Proceso p WHERE V.CodigoCliente LIKE '"+Codigo+"' and cl.Codigo=V.CodigoCliente and p.CodigoCliente = cl.Codigo and V.IdVenta=p.Id");
         
                            while (rs1.next ()){
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs1.getString("IdVenta"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("IdProceso"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("NombreCliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("CodigoCliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs1.getString("Usuario"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs1.getString("OrdenPedido"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs1.getString("ObservacionesVentas"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs1.getString("Recepcion"));
                                    out.println("</th>");
                                     out.println("<th>");
                                         out.println(rs1.getString("FechaIngreso"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs1.getString("Fechadespacho"));
                                    out.println("</th>");
                            }
                             
                        ResultSet rs2 = st.executeQuery("Select V.IdVenta,p.IdProceso,cl.NombreCliente,V.CodigoCliente,v.Usuario,V.OrdenPedido,v.ObservacionesVentas,p.Recepcion,v.FechaIngreso,p.Fechadespacho from   Ventas V, Clientes cl,Proceso p WHERE V.OrdenPedido LIKE '"+OrdenPedido+"' and cl.Codigo=V.CodigoCliente and p.CodigoCliente = cl.Codigo and V.IdVenta=p.Id");

                              while (rs2.next ()){
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs2.getString("IdVenta"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("IdProceso"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("NombreCliente"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("CodigoCliente"));
                                    out.println("</th>");
                                                                 
                                    out.println("<th>");
                                         out.println(rs2.getString("Usuario"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("OrdenPedido"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("ObservacionesVentas"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("Recepcion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("FechaIngreso"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs2.getString("Fechadespacho"));
                                    out.println("</th>");
                            }
                out.println("</tbody>");
                out.println("</table>");
                            

rs1.close();
rs2.close();
st.close();
con.close();
}
catch(Exception e){
e.printStackTrace();
} 
 %>
               </div>
             </div>       
           </div>          
        </body>
    </html>
</f:view>

