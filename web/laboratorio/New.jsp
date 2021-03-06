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
            <title>Laboratorio</title>
               <script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
	    <script src="../js/jquery.autocomplete.js"></script>	
	    <script src="../js/autocompletar.js"></script>
       
            <%  
               String Cliente = (String) request.getParameter("Cliente"); 
               String nombre = (String) session.getAttribute("nombre");
               Date fechaActual = new Date();
               SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
               String Fecha = formato.format(fechaActual);
             %>
             <span id="lblNombreUsuario">
                <%=nombre%>
             </span>
              <br />
               <span id="lblFecha">
                 <%=Fecha%>
                 </span>
                    <span id="lblCliente">
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
             <span id="lblId">
             <%
try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdLaboratorio+1)as Id FROM Laboratorio");
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
      <link href="../css/stylep.css" rel="stylesheet" type="text/css">    <script type="text/javascript">
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
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Nuevo Laboratorio</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{laboratorio.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="IdLaboratorio:"/>
                <h:inputText id="idLaboratorio"  style="width: 205px" styleClass="cboId" value="#{laboratorio.laboratorio.idLaboratorio}" title="IdLaboratorio" required="true" requiredMessage="The idLaboratorio field is required." />
                 <h:outputText value="Usuario:"/>
                <h:inputText id="usuario"  style="width: 205px" styleClass="cboUsuarios" value="#{laboratorio.laboratorio.usuario}" title="Usuario" required="true" requiredMessage="The usuario field is required." >
                    <f:selectItems value="#{login.loginItemsAvailableSelectOne}"/>
                </h:inputText>
                <h:outputText value="CodigoCliente:"/>
                <h:inputText styleClass="cboCliente" style="width: 205px"  id="codigoCliente" value="#{laboratorio.laboratorio.codigoCliente}" title="CodigoCliente" required="true" requiredMessage="The codigoCliente field is required." >
                    <f:selectItems value="#{clientes.clientesItemsAvailableSelectOne}"/>
                </h:inputText>
                <h:outputText value="OrdenTecnica:"/>
                <h:inputText id="ordenTecnica"  style="width: 205px" value="#{laboratorio.laboratorio.ordenTecnica}" title="OrdenTecnica" required="true" requiredMessage="The ordenTecnica field is required." />
                <h:outputText value="FechaIngreso "/>
                <h:inputText id="fechaIngreso"   style="width: 205px" styleClass="cbofecha"  value="#{laboratorio.laboratorio.fechaIngreso}" title="FechaIngreso" required="true" requiredMessage="The fechaIngreso field is required." >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="Contacto:"/>
                <h:inputText id="contacto" value="#{laboratorio.laboratorio.contacto}" style="width: 205px"     title="Contacto" required="true" requiredMessage="The Contacto field is required." />
                
                <h:outputText value="Horario:"/>
                <h:selectOneMenu id="horario" style="width: 205px" 
                     value="#{laboratorio.laboratorio.horario}" title="Horario" >
                <f:selectItem id="item1" itemLabel="TARDE" itemValue="TARDE" />
                <f:selectItem id="item2" itemLabel="MAÑANA" itemValue="MANANA" />                                                                                                                                                 
                </h:selectOneMenu>
               
                <h:outputText value="Zona:"/>
                <h:selectOneMenu id="zona" style="width: 205px"
                   value="#{laboratorio.laboratorio.zona}" title="Zona" >
                <f:selectItem id="item3" itemLabel="SUR" itemValue="SUR" />
                <f:selectItem id="item4" itemLabel="NORTE" itemValue="NORTE" />
                </h:selectOneMenu>
                <h:outputText value="Prioridad:"/>
                <h:selectOneMenu id="prioridad" style="width: 205px"
                                  value="#{laboratorio.laboratorio.prioridad}" title="Prioridad"  > 
                <f:selectItem id="item5" itemLabel="- - - - - - -" itemValue=" " />
                <f:selectItem id="item6" itemLabel="A" itemValue="A" />
                <f:selectItem id="item7" itemLabel="B" itemValue="B" />
                <f:selectItem id="item8" itemLabel="C" itemValue="C" />
                 </h:selectOneMenu>
                 <h:outputText value="Observaciones"/>
                 <h:inputTextarea style="width: 205px" id="observacionesGestion" value="#{laboratorio.laboratorio.observacionesLaboratorio}" title="FechaIngreso"/>
                
               

            </h:panelGrid>
            <br />
            <h:commandLink action="#{laboratorio.create}" value="Crear"/>
            <br />
            <br />
            <h:commandLink action="#{laboratorio.listSetup}" value="Ver todos los Registros de  Laboratorio" immediate="true"/>
            <br />
            <br />
                 <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
