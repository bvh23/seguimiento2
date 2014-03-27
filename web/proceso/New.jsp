<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
            <title>Proceso</title>
             <%  
                 String Cliente = (String) request.getParameter("Cliente");
                 String nombre = (String) session.getAttribute("nombre");
                 Date fechaActual = new Date();
                 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                 String Fecha = formato.format(fechaActual);
             %>
             <span id="lblNombreUsuario" style="color: #706e6f">
                 <%=nombre%>
             </span>
             <br />
             <span id="lblFecha" style="color: #706e6f">
                 <%=Fecha%>
             </span>
             <span id="lblCliente" style="color: #706e6f">
                <%
try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT cl.Codigo  from   Clientes cl where cl.NombreCliente='"+Cliente+"'");
                while (rs.next())
                    {
                        out.println(rs.getString("Codigo"));                                                             
                    }
   }
catch(Exception e)
           {
            out.println("El Error es;"+e);
           }                
            %>
             </span>
               <span id="lblId" style="color: #706e6f">
             <%
try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdProceso+1)as Id FROM Proceso");
                while (rs.next())
                    {
                     out.println(rs.getString("Id"));
}
   }
catch(Exception e)
           {
            out.println("El Error es;"+e);
           }                
            %>
             </span>
             <span id="lblIdR" style="color: #706e6f">
           <%
            String nombre1 = (String) session.getAttribute("nombre");
            
            String usuario1="Med-calidad";
            String usuario2="Med-dirventas";
            String usuario3="Med-recepcion";
            String usuario4="Med-ventas1";
            String usuario5="Med-ventas2";
            String usuario6="Med-ventas3";
            String usuario7="Med-gerencia";
            String usuario8="Med-facturacion";
            String usuario9="Med-auxc";
            String usuario10="Med-admin";
            String usuario11="Med-almacen";
            String usuario12="Med-alquiler";
            String usuario13="Med-lab1";
            String usuario14="Med-lab2";
            String usuario15="Med-lab3";
            String usuario16="Med-lab4";
            String usuario17="Med-facturacionAux";

            if( usuario3.equals(nombre1)) 
            {
                try
               {      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdMensajeria)as IdR FROM Mensajeria");
                while (rs.next())
                    {
                        out.println(rs.getString("IdR")); 
}
                }
                catch(Exception e)
                    {
                        out.println("El Error es;"+e);
                    } 
            }
if( usuario1.equals(nombre1)||usuario7.equals(nombre1)||usuario8.equals(nombre1)||usuario9.equals(nombre1)||usuario10.equals(nombre1)||usuario11.equals(nombre1)||usuario17.equals(nombre1)) 
            {
                try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdGestion)as IdR FROM Gestion");
                while (rs.next())
                    {
                     out.println(rs.getString("IdR")); 
}

   }
catch(Exception e)
           {
            out.println("El Error es;"+e);
           } 
            }   
if( usuario4.equals(nombre1)||usuario5.equals(nombre1)||usuario6.equals(nombre1)||usuario2.equals(nombre1)) 
            {
                try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdVenta)as IdR FROM Ventas");
                while (rs.next())
                    {
                     out.println(rs.getString("IdR"));
}
   }
catch(Exception e)
           {
            out.println("El Error es;"+e);
           } 
            }   
if( usuario12.equals(nombre1)) 
            {
                try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdAlquiler)as IdR FROM Alquiler");
                while (rs.next())
                    {
                     out.println(rs.getString("IdR"));
}
   }
catch(Exception e)
           {
            out.println("El Error es;"+e);
           } 
            }  
if( usuario14.equals(nombre1)||usuario15.equals(nombre1)||usuario16.equals(nombre1)||usuario13.equals(nombre1)) 
            {
                try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdLaboratorio)as IdR FROM Laboratorio");
                while (rs.next())
                    {
                     out.println(rs.getString("IdR"));
}
   }
catch(Exception e)
           {
            out.println("El Error es;"+e);
           } 
            } 
           
        %>

             </span>
             
            <link href="../css/stylep.css" rel="stylesheet" type="text/css">  
            <script type="text/javascript">
             function inicializar(){
                           var usuario = document.getElementById('lblNombreUsuario').innerHTML;
                           $(".cboUsuarios").val(usuario.trim());
                           var fechaingreso = document.getElementById('lblFecha').innerHTML;
                           $(".cboFecha").val(fechaingreso.trim());
                           var fechaingreso = document.getElementById('lblCliente').innerHTML;
                           $(".cboCliente").val(fechaingreso.trim());
                           var fechaingreso = document.getElementById('lblId').innerHTML;
                           $(".cboId").val(fechaingreso.trim());
                           var fechaingreso = document.getElementById('lblIdR').innerHTML;
                           $(".cboIdR").val(fechaingreso.trim());
                                              }
            </script>
        </head>
        <body onload="inicializar();">
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Nuevo Proceso</h1>
            <h:form>
              <h:inputHidden id="validateCreateField" validator="#{proceso.validateCreate}" value="value"/>
              <h:panelGrid columns="2">
                <h:outputText value="IdProceso:"/>
                    <h:inputText id="idProceso"   styleClass="cboId" style="width: 180px" value="#{proceso.proceso.idProceso}" title="IdProceso" required="true" requiredMessage="The idProceso field is required." />
               
                <h:outputText value="Id:"/>
                <h:inputText id="id"  styleClass="cboIdR" style="width: 180px" value="#{proceso.proceso.id}" title="IdProceso" />

                <h:outputText value="Usuario:"/>
                    <h:inputText id="usuario"  style="width: 180px" styleClass="cboUsuarios" value="#{proceso.proceso.usuario}" title="Usuario" required="true" requiredMessage="The usuario field is required." >
                        <f:selectItems value="#{login.loginItemsAvailableSelectOne}"/>
                    </h:inputText>

                <h:outputText value="CodigoCliente:"/>
                    <h:inputText styleClass="cboCliente"  id="codigoCliente" style="width: 180px" value="#{proceso.proceso.codigoCliente}" title="CodigoCliente" required="true" requiredMessage="The codigoCliente field is required." >
                        <f:selectItems value="#{clientes.clientesItemsAvailableSelectOne}"/>
                    </h:inputText>
           <h:outputText value="Ventas1:"/>
                    <h:selectOneMenu  id="ventas1" style="width: 180px"
                             value="#{proceso.proceso.ventas1}" title="Ventas1" >
                        <f:selectItem id="item1" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item2" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item3" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="Ventas2:"/>
                    <h:selectOneMenu  id="ventas2" style="width: 180px"
                            value="#{proceso.proceso.ventas2}" title="Ventas2" >
                        <f:selectItem id="item4" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item5" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item6" itemLabel="X" itemValue="X" />  
                    </h:selectOneMenu>

                <h:outputText value="Ventas3:"/>
                    <h:selectOneMenu  id="ventas3"style="width: 180px"  value="#{proceso.proceso.ventas3}" title="Ventas3"  >
                        <f:selectItem id="item7" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item8" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item9" itemLabel="X" itemValue="X" />  
                    </h:selectOneMenu>

                <h:outputText value="GerenteVentas:"/>
                    <h:selectOneMenu  id="gerenteVentas" style="width: 180px" value="#{proceso.proceso.gerenteVentas}" title="GerenteVentas"  >
                        <f:selectItem id="item10" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item11" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item12" itemLabel="X" itemValue="X" /> 
                    </h:selectOneMenu>

                <h:outputText value="STIngreso:"/>
                    <h:selectOneMenu  id="STIngreso" style="width: 180px" value="#{proceso.proceso.STIngreso}" title="STIngreso"  >
                        <f:selectItem id="item13" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item14" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item15" itemLabel="X" itemValue="X" /> 
                    </h:selectOneMenu>

                <h:outputText value="STReparacion:"/>
                    <h:selectOneMenu  id="STReparacion" style="width: 180px" value="#{proceso.proceso.STReparacion}" title="STReparacion">
                        <f:selectItem id="item16" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item17" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item18" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="STLiberacion:"/>
                    <h:selectOneMenu id="STLiberacion" style="width: 180px" value="#{proceso.proceso.STLiberacion}" title="STLiberacion">
                        <f:selectItem id="item19" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item20" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item21" itemLabel="X" itemValue="X" /> 
                    </h:selectOneMenu>

                <h:outputText value="STPendAutorizado:"/>
                    <h:selectOneMenu  id="STPendAutorizado" style="width: 180px" value="#{proceso.proceso.STPendAutorizado}" title="STPendAutorizado">
                        <f:selectItem id="item22" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item23" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item24" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="ObservacionST:"/>
                    <h:inputTextarea id="observacionST" style="width: 180px" value="#{proceso.proceso.observacionST}" title="ObservacionST" />

                <h:outputText value="Almacen:"/>
                    <h:selectOneMenu id="almacen" style="width: 180px" value="#{proceso.proceso.almacen}" title="Almacen">
                        <f:selectItem id="item25" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item26" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item27" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="ObservacionAlmacen:"/>
                    <h:inputTextarea id="observacionAlmacen" style="width: 180px" value="#{proceso.proceso.observacionAlmacen}" title="ObservacionAlmacen"/>


                <h:outputText value="Alquiler:"/>
                    <h:selectOneMenu id="alquiler" style="width: 180px" value="#{proceso.proceso.alquiler}" title="Alquiler">
                        <f:selectItem id="item28" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item29" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item30" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="Facturacion:"/>
                    <h:selectOneMenu id="facturacion" style="width: 180px" value="#{proceso.proceso.facturacion}" title="Facturacion">
                        <f:selectItem id="item31" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item32" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item33" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="AuxContable:"/>
                    <h:selectOneMenu id="auxContable" style="width: 180px" value="#{proceso.proceso.auxContable}" title="AuxContable">
                        <f:selectItem id="item34" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item35" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item36" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="Cartera:"/>
                    <h:selectOneMenu id="cartera" style="width: 180px" value="#{proceso.proceso.cartera}" title="Cartera">
                        <f:selectItem id="item37" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item38" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item39" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="Calidad:"/>
                    <h:selectOneMenu id="calidad" style="width: 180px" value="#{proceso.proceso.calidad}" title="Calidad">
                        <f:selectItem id="item40" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item41" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item42" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="Gerencia:"/>
                    <h:selectOneMenu  id="gerencia" style="width: 180px"  value="#{proceso.proceso.gerencia}" title="Gerencia">
                        <f:selectItem id="item43" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item44" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item45" itemLabel="X" itemValue="X" /> 
                    </h:selectOneMenu>

                <h:outputText value="ServicioCliente:"/>
                    <h:selectOneMenu  id="servicioCliente" style="width: 180px"  value="#{proceso.proceso.servicioCliente}" title="ServicioCliente" >
                        <f:selectItem id="item46" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item47" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item48" itemLabel="X" itemValue="X" />
                    </h:selectOneMenu>

                <h:outputText value="Recepcion:"/>
                    <h:selectOneMenu  id="recepcion"  style="width: 180px" value="#{proceso.proceso.recepcion}" title="Recepcion">
                        <f:selectItem id="item49" itemLabel="- - - - - - - - - - - - - -" itemValue=" " />
                        <f:selectItem id="item50" itemLabel="OK" itemValue="OK" />
                        <f:selectItem id="item51" itemLabel="X" itemValue="X" />
                        <f:selectItem id="item52" itemLabel="Listo" itemValue="Listo" />
                    </h:selectOneMenu>

               
                <h:outputText value="Fechadespacho "/>
                    <h:inputText id="fechaDespacho"style="width: 180px"   value="#{proceso.proceso.fechadespacho}" title="FechaIngreso"  >
                        <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                    </h:inputText>

                <h:outputText value="Observaciones:"/>
                    <h:inputTextarea id="observaciones" style="width: 180px" value="#{proceso.proceso.observaciones}" title="Observaciones" />

                </h:panelGrid>
                <br />
                <h:commandLink action="#{proceso.create}" value="Crear"/>
                <br /><br />
                <h:commandLink action="#{proceso.listSetup}" value="Ver todos los Registros" immediate="true"/>
                <br /><br />
                <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
            </h:form>
        </body>
    </html>
</f:view>
