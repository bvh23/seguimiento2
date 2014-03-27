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
        String Observaciones=(String)request.getParameter("Observaciones");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
        Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
        Statement st=con.createStatement(); 
               
        out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("IdGerencia");
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
                                         out.println("Contacto");
                                    out.println("</th>"); 
                                     out.println("<th style=margin:auto>");
                                         out.println("Observaciones Gerencia");
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
                        ResultSet rs = st.executeQuery("Select g.IdGestion,p.IdProceso,cl.NombreCliente,g.CodigoCliente,g.Usuario,g.Contacto,g.ObservacionesGestion,p.Recepcion,g.FechaIngreso,p.Fechadespacho from   Gestion g, Clientes cl,Proceso p WHERE cl.NombreCliente LIkE '%"+Nombre+"%' and cl.Codigo=g.CodigoCliente and p.CodigoCliente = cl.Codigo and g.IdGestion=p.Id");
                            while (rs.next ()){
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs.getString("IdGestion"));
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
                                         out.println(rs.getString("Contacto"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs.getString("ObservacionesGestion"));
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
                        
                              ResultSet rs1 = st.executeQuery("Select g.IdGestion,p.IdProceso,cl.NombreCliente,g.CodigoCliente,g.Usuario,g.Contacto,g.ObservacionesGestion,p.Recepcion,g.FechaIngreso,p.Fechadespacho from   Gestion g, Clientes cl,Proceso p WHERE cl.Codigo LIkE '"+Codigo+"' and cl.Codigo=g.CodigoCliente and p.CodigoCliente = cl.Codigo and g.IdGestion=p.Id");
                            while (rs1.next ()){
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs1.getString("IdGestion"));
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
                                         out.println(rs1.getString("Contacto"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs1.getString("ObservacionesGestion"));
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
                            if(Observaciones!=""){
                             ResultSet rs2 = st.executeQuery("Select g.IdGestion,p.IdProceso,cl.NombreCliente,g.CodigoCliente,g.Usuario,g.Contacto,g.ObservacionesGestion,p.Recepcion,g.FechaIngreso,p.Fechadespacho from   Gestion g, Clientes cl,Proceso p WHERE g.ObservacionesGestion LIkE '%"+Observaciones+"%' and cl.Codigo=g.CodigoCliente and p.CodigoCliente = cl.Codigo and g.IdGestion=p.Id");
                            while (rs2.next ())
                            {
                            out.println("<tbody>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println(rs2.getString("IdGestion"));
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
                                         out.println(rs2.getString("Contacto"));
                                    out.println("</th>");
                                    
                                    out.println("<th>");
                                         out.println(rs2.getString("ObservacionesGestion"));
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
                            rs2.close();
                            }
                out.println("</tbody>");
                out.println("</table>");
                            

rs1.close();

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

