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
            <title>Mensajeria</title>
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
            <%=Cliente%>
             </span>
                <span id="lblId">
             <%
try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdMensajeria+1)as Id FROM Mensajeria");
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
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">  <script type="text/javascript">
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
            <h1>Nueva Mensajer&iacute;a</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{mensajeria.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="IdMensajeria:"/>
                <h:inputText style="width: 205px" id="idMensajeria" styleClass="cboId" value="#{mensajeria.mensajeria.idMensajeria}" title="IdMensajeria" required="true" requiredMessage="The idMensajeria field is required." />
                <h:outputText value="FechaIngreso "/>
                <h:inputText id="fechaIngreso"  style="width: 205px" styleClass="cbofecha"  value="#{mensajeria.mensajeria.fechaIngreso}" title="FechaIngreso" required="true" requiredMessage="The fechaIngreso field is required." >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="OrdenPedido:"/>
                <h:inputText id="ordenPedido" style="width: 205px" value="#{mensajeria.mensajeria.ordenPedido}" title="OrdenPedido" required="true" requiredMessage="The ordenPedido field is required." />
                <h:outputText value="Contacto:"/>
                <h:inputText id="contacto"style="width: 205px" value="#{mensajeria.mensajeria.contacto}" title="Contacto" required="true" requiredMessage="The contacto field is required." />
                
                <h:outputText value="Prioridad:"/>
                 <h:selectOneMenu id="prioridad" style="width: 205px"
                                  value="#{mensajeria.mensajeria.prioridad}" title="Prioridad" >
                <f:selectItem id="item5" itemLabel="- - - - - - -" itemValue=" " />
                <f:selectItem id="item6" itemLabel="A" itemValue="A" />
                <f:selectItem id="item7" itemLabel="B" itemValue="B" />
                <f:selectItem id="item8" itemLabel="C" itemValue="C" />
                 </h:selectOneMenu>
                    <h:outputText value="Zona:"/>
                <h:selectOneMenu id="zona" style="width: 205px"
                                 value="#{mensajeria.mensajeria.zona}" title="Zona" >
                <f:selectItem id="item9" itemLabel="SUR" itemValue="SUR" />
                <f:selectItem id="item10" itemLabel="NORTE" itemValue="NORTE" />
                <f:selectItem id="item11" itemLabel="TCC" itemValue="TCC" />
                 </h:selectOneMenu>
                <h:outputText value="ObservacionesMensajeria:"/>
                <h:inputTextarea id="observacionesMensajeria" style="width: 205px" value="#{mensajeria.mensajeria.observacionesMensajeria}" title="ObservacionesMensajeria" />
                <h:outputText value="Usuario:"/>
                <h:inputText styleClass="cboUsuarios"style="width: 205px" id="usuario" value="#{mensajeria.mensajeria.usuario}" title="Usuario" required="true" requiredMessage="The usuario field is required." >
                    <f:selectItems value="#{login.loginItemsAvailableSelectOne}"/>
                </h:inputText>
                <h:outputText value="CodigoCliente:"/>
                <h:inputText styleClass="cboCliente"  style="width: 205px" id="codigoCliente" value="#{mensajeria.mensajeria.codigoCliente}" title="CodigoCliente" required="true" requiredMessage="The codigoCliente field is required." >
                    <f:selectItems value="#{clientes.clientesItemsAvailableSelectOne}"/>
                </h:inputText>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{mensajeria.create}" value="Crear"/>
            <br />
            <br />
            <h:commandLink action="#{mensajeria.listSetup}" value="Ver todos los Registros de  Mensajeria" immediate="true"/>
            <br />
            <br />
          <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
