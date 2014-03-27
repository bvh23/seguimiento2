<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
Connection con=null;
 try{            
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
       con=DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
       JOptionPane.showMessageDialog(null, "Conexion Correcta");
        }
        catch (Exception e){
        
        e.printStackTrace();
        }ResultSet r;
CallableStatement cst;
     try{            
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
       con=DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
       JOptionPane.showMessageDialog(null, "Conexion Correcta");
        }
        catch (Exception e){
        
        e.printStackTrace();
        }
%>

<html>
   
    <head>
        <%!      
        String s_usuario;
        String s_clave;
        %>
    </head>
    
    <body>
       
        <% 
        s_usuario=request.getParameter("T_usuario");
        s_clave=request.getParameter("T_clave");
      
        String usu=this.s_usuario;
        String cont=this.s_clave;
        
        try{
            cst=con.prepareCall("{call buscarUsuario(?,?)}");
            cst.setString(1, usu);
            cst.setString(2, cont);
            r=cst.executeQuery();
            if(r.next())
            {
             response.sendRedirect("Inicio.jsp");
             //String login = request.getParameter(s_usuario);
             session.setAttribute("nombre", usu);
            }
            else
            {
           response.sendRedirect("invalido.jsp");           
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        %>
    </body>
</html>