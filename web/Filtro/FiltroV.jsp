<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<f:view>
    <html>
        <head>
            <%String nombre = (String) session.getAttribute("nombre");
            %>
            <%=nombre%>
             <link href="../css/style.css" rel="stylesheet" type="text/css">
             <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <title>Buscador</title>
            
        </head>
      <body>
        <div id="container">
            <nav id="menu">
                 <ul> 
                     <li><a style="font-size: 35px;color: #000;margin-left:255px;margin-top:-10px;position: absolute">Filtro</a>
                     </li>                       
                 </ul>
            </nav>

              <div id="cuerpo">

                  <div id="Consulta" >
                     <%
            String nombre1 = (String) session.getAttribute("nombre");
           
            String usuario1="Med-ventas1";
            String usuario2="Med-ventas2";
            String usuario3="Med-ventas3";
            String usuario4="Med-dirventas";
            String usuario5="Med-desarrollo";
            String usuario6="Med-gerencia";
            String usuario7="Med-auditorio";
            String usuario8="Med-facturacion";
            String usuario9="Med-facturacionAux";
            String usuario10="Med-calidad";
            
              //if(1==2)           
             if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)||usuario3.equals(nombre1)||usuario4.equals(nombre1)||usuario5.equals(nombre1)||usuario6.equals(nombre1)||usuario7.equals(nombre1)||usuario8.equals(nombre1)||usuario9.equals(nombre1)||usuario10.equals(nombre1)) 
            {
                %>
                      
                     
                        <table style="padding-top: 45px">  
                             <form action="TablaFiltroV.jsp">
                                 <tbody>
                                <tr>
                                    <td style="width:400px; height:27px;font-size: 35px; margin-left:-65px;position: absolute;margin-top: -25px"  ><a style="">Busqueda para Ventas:</a></td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 50px">Nombre del Cliente</td>
                                </tr>
                                 <tr>
                                     <td><input type="text" name="Nombre" value="" /></td>
                                </tr>
                                <tr>
                                    <td width="193">Codigo del Cliente </td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="Codigo" value="" /></td>
                                </tr>
                                <tr>
                                    <td height="27" >Orden De Pedido</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="OrdenPedido" value="" /></td>
                                </tr>
                                <tr>
                                    <td height="29"><input type="submit" value="Filtrar"  class="boton" style="padding: 4px;margin-top:15px"/></td>
                                </tr>

                                </tbody>
                            </form>
                        </table>
                           <%
                          }
                      
                      %>
                      
                       
               </div>
             </div>        
           </div>          
        </body>
    </html>
</f:view>
