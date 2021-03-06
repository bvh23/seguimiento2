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
            <title>Nueva Gestion</title>
            <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
	    <script src="../js/jquery.autocomplete.js"></script>	
	    <script src="../js/autocompletar.js"></script>
       
    
             <%  
               String Cliente = (String) request.getParameter("Cliente");       
               String nombre = (String) session.getAttribute("nombre");              
               Date fechaActual = new Date();
               SimpleDateFormat formato = new SimpleDateFormat("dd/MM/YYYY HH:mm:ss");
               String Fecha = formato.format(fechaActual);
              
            %>
            <link href="css/style.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    #apDiv1
    {
	position: absolute;
	left: 808px;
	top: 10px;
	width: 234px;
	height: 930px;
	z-index: 1;
    } 
    </style>
    <div id="container">
              <div id="header"> 
             </br>
             <span id="lblNombreUsuario" style="color: #fff">
                 <%=nombre%>
             </span>
             <br />
             <span id="lblFecha" style="color: #fff">
                 <%=Fecha%>
             </span>
             <span id="lblCliente"   style="color: #fff">
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
             <span id="lblId" style="color: #fff">
             <%
try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdGestion+1)as Id FROM Gestion");
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
              <div id="logo">
                  </div>
              </div>
             <link href="../css/style.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/AplicativoZComunicaciones/faces/jsfcrud.css" />
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
                   }
                </script>
        </head>
       
        <body onload="inicializar();">
           
  <nav id="menu">
      <ul> 
          <%-- <li><a href="/AplicativoZComunicaciones/faces/ventas/accesoventas.jsp">Ventas</a>
               </li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/accesomensajeria.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>      
              <li><a href="/AplicativoZComunicaciones/faces/laboratorio/accesolaboratorio.jsp">Laboratorio</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/accesogestion.jsp">Gesti&oacute;n</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/List.jsp" >Proceso</a></li>
          --%>
          <li><h2 style="text-decoration: none; color:#000;margin-left: 250px;"> NuevaGestion </h2></li> 
      </ul>
        </nav>
          <div id="cuerpo" style="height: auto">
                <div id="tabla">
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Nueva Gestion</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{gestion.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                  <h:outputText value="IdGestion:"/>
                  <h:inputText id="idGestion" styleClass="cboId" style="width: 205px"  value="#{gestion.gestion.idGestion}" title="IdGestion" required="true" requiredMessage="The idGestion field is required." />
               
                <h:outputText value="Usuario:"/>
                <h:inputText id="usuario" styleClass="cboUsuarios" style="width: 205px"  value="#{gestion.gestion.usuario}" title="Usuario" required="true" requiredMessage="The usuario field is required." >
                    <f:selectItems value="#{login.loginItemsAvailableSelectOne}"/>
                </h:inputText>
                
                <h:outputText value="CodigoCliente:"/>
                <h:inputText id="codigoCliente" styleClass="cboCliente" style="width: 205px"  value="#{gestion.gestion.codigoCliente}" title="CodigoCliente" required="true" requiredMessage="The codigoCliente field is required." >
                <f:selectItems value="#{clientes.clientesItemsAvailableSelectOne}"/>
                </h:inputText>
                
                <h:outputText value="FechaIngreso "/>
                <h:inputText id="fechaIngreso"  styleClass="cbofecha"  style="width: 205px"  value="#{gestion.gestion.fechaIngreso}" title="FechaIngreso" required="true" requiredMessage="The fechaIngreso field is required." >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="Contacto:"/>
                <h:inputText id="contacto" value="#{gestion.gestion.contacto}" style="width: 205px"     title="Contacto" required="true" requiredMessage="The Contacto field is required." />
                
                <h:outputText value="Horario:"/>
                <h:selectOneMenu id="horario" style="width: 205px" 
                     value="#{gestion.gestion.horario}" title="Horario" >
                <f:selectItem id="item1" itemLabel="TARDE" itemValue="TARDE" />
                <f:selectItem id="item2" itemLabel="MAÑANA" itemValue="MANANA" />                                                                                                                                                 
                </h:selectOneMenu>
               
                <h:outputText value="Zona:"/>
                <h:selectOneMenu id="zona" style="width: 205px"
                   value="#{gestion.gestion.zona}" title="Zona" >
                <f:selectItem id="item3" itemLabel="SUR" itemValue="SUR" />
                <f:selectItem id="item4" itemLabel="NORTE" itemValue="NORTE" />
                </h:selectOneMenu>
                <h:outputText value="Prioridad:"/>
                <h:selectOneMenu id="prioridad" style="width: 205px"
                                  value="#{gestion.gestion.prioridad}" title="Prioridad"  > 
                <f:selectItem id="item5" itemLabel="- - - - - - -" itemValue=" " />
                <f:selectItem id="item6" itemLabel="A" itemValue="A" />
                <f:selectItem id="item7" itemLabel="B" itemValue="B" />
                <f:selectItem id="item8" itemLabel="C" itemValue="C" />
                 </h:selectOneMenu>
                 <h:outputText value="Observaciones"/>
                 <h:inputTextarea style="width: 205px" id="observacionesGestion" value="#{gestion.gestion.observacionesGestion}" title="FechaIngreso"/>
                
            </h:panelGrid>
            <br />
            <h:commandLink action="#{gestion.create}" value="Crear" style="text-decoration: none; color:#000;margin-left:-100px;"/>
            <br />
            <br />
            <h:commandLink action="#{gestion.listSetup}" value="Ver Todos Los Registros" immediate="true" style="text-decoration: none; color:#000;margin-left:-100px;"/>
            <br />
            <br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp" style="text-decoration: none; color:#000;margin-left:-100px;">INICIO</a>
        </h:form>
                </div>
            </div>
    </div>
        </body>
    </html>
</f:view>
