<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>&Uacute;ltimos Procesos</title>
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
     
           
                <h1>&Uacute;ltimos Procesos</h1>
                <%
         
    
	try{      
		 String s[]=null;		 
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT  top 25  P.IdProceso as idp,P.CodigoCliente as codigo, cl.NombreCliente as nombre,P.Id,P.Usuario,P.Ventas1 as v1,P.Ventas2 as v2,P.Ventas3 as v3,p.GerenteVentas as pgv,P.S_T_Ingreso as sti,P.S_T_Liberacion as stl,P.S_T_Pend_Autorizado as stp,P.S_T_Reparacion  as str, P.Observacion_S_T as ost,P.Almacen as al,p.ObservacionAlmacen as oal,P.Alquiler alq,p.Facturacion as f,P.Cartera as c,P.AuxContable auxc,P.Calidad ,P.Gerencia,P.ServicioCliente as sc,P.Recepcion,p.Observaciones  from  Proceso P, Clientes cl where p.CodigoCliente =cl.Codigo    ORDER BY P.IdProceso DESC");
                  
                out.println("<table border=1>");
                        
                            out.println("<thead>");
                                out.println("<tr>");
                                    out.println("<th>");
                                         out.println("IdProceso");
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println("CodigoCliente");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("NombreCliente");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Id");
                                    out.println("</th>");                                    
                                    out.println("<th>");
                                         out.println("Usuario");
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println("Ventas1");
                                    out.println("</th>"); 
                                     out.println("<th>");
                                         out.println("Ventas2");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("Ventas3");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("DirectorVentas");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("ST_I");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("ST_L");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("ST_PA");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("ST_R");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("ST_O");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("AL");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("OBS_AL");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("ALQ");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("FACT");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("CART");
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println("AUXCONT");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("CALID");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("GERENCIA");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("SER_CL");
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println("REC");
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
                                         out.println(rs.getString("idp"));
                                    out.println("</th>");
                                    out.println("<th style=alignment-adjust: left>");
                                         out.println(rs.getString("Codigo"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("nombre"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("id"));
                                    out.println("</th>");                                    
                                    out.println("<th>");
                                         out.println(rs.getString("Usuario"));
                                    out.println("</th>"); 
                                    out.println("<th>");
                                         out.println(rs.getString("v1"));
                                    out.println("</th>"); 
                                     out.println("<th>");
                                         out.println(rs.getString("v2"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("v3"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("pgv"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("sti"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("stl"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("stp"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("str"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("ost"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("al"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("oal"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("alq"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("f"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("c"));
                                    out.println("</th>");
                                      out.println("<th>");
                                         out.println(rs.getString("auxc"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Calidad"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Gerencia"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("sc"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Recepcion"));
                                    out.println("</th>");
                                    out.println("<th>");
                                         out.println(rs.getString("Observaciones"));
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
