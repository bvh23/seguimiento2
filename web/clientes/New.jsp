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
            <title>Nuevo Clientes</title>
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
                 <%=Cliente%>
             </span>
             <span id="lblId" style="color: #fff">
             <%
try{      
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
                Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("SELECT MAX(IdAlquiler+1)as Id FROM Alquiler");
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
          <%-- <li><a href="/AplicativoZComunicaciones/faces/ventas/accesoventas.jsp">Ventas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/accesomensajeria.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>      
              <li><a href="/AplicativoZComunicaciones/faces/laboratorio/accesolaboratorio.jsp">Laboratorio</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/accesogestion.jsp">Gesti&oacute;n</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/List.jsp" >Proceso</a></li>
          --%>
          <li><h2 style="text-decoration: none; color:#000;margin-left: 250px;"> NuevaCliente</li> 
      </ul>
        </nav>
          <div id="cuerpo" style="height: auto">
                <div id="tabla">
            
      <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
       <h1>Nuevo Cliente</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{clientes.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="Codigo:"/>
                <h:inputText id="codigo" style="width:180px" value="#{clientes.clientes.codigo}" title="Codigo" required="true" requiredMessage="The codigo field is required." />
                <h:outputText value="NombreCliente:"/>
                <h:inputText id="nombreCliente"  style="width:180px" value="#{clientes.clientes.nombreCliente}" title="NombreCliente" />
                <h:outputText value="RazonSocial:"/>
                <h:inputText id="razonSocial"  style="width:180px" value="#{clientes.clientes.razonSocial}" title="RazonSocial" />
                <h:outputText value="Direccion:"/>
                <h:inputText id="direccion"  style="width:180px" value="#{clientes.clientes.direccion}" title="Direccion" />
                <h:outputText value="Telefono:"/>
                <h:inputText id="telefono"  style="width:180px" value="#{clientes.clientes.telefono}" title="Telefono" />
                <h:outputText value="Ciudad:"/>
                <h:selectOneMenu id="ciudad"  style="width:180px" value="#{clientes.clientes.ciudad}" title="Cuidad" >
                <f:selectItem id="item1" itemLabel="Medellin" itemValue="Medellin" />
                <f:selectItem id="item2" itemLabel="Bogota" itemValue="Bogota" />
                <f:selectItem id="item3" itemLabel="Cali" itemValue="Cali" />
                <f:selectItem id="item4" itemLabel="Barranquilla" itemValue="Barranquilla" />
                <f:selectItem id="item5" itemLabel="Cartagena" itemValue="Cartagena" />
                <f:selectItem id="item6" itemLabel="Cucuta" itemValue="Cucuta" />
                <f:selectItem id="item7" itemLabel="Ibague" itemValue="Ibague" />
                <f:selectItem id="item8" itemLabel="San Andres" itemValue="San Andres" />
                <f:selectItem id="item9" itemLabel="Bucaramanga" itemValue="Bucaramanga" />
                <f:selectItem id="item10" itemLabel="Soacha" itemValue="Soacha" />
                <f:selectItem id="item11" itemLabel="Santa Marta" itemValue="Santa Marta" />
                <f:selectItem id="item12" itemLabel="Pereira" itemValue="Pereira" />
                <f:selectItem id="item13" itemLabel="Villavicencio" itemValue="Villavicencio" />
                <f:selectItem id="item14" itemLabel="Manizales" itemValue="Manizales" />
                <f:selectItem id="item15" itemLabel="Valledupar" itemValue="Valledupar" />
                <f:selectItem id="item16" itemLabel="Monteria" itemValue="Monteria" />
                <f:selectItem id="item17" itemLabel="Pasto" itemValue="Pasto" />
                <f:selectItem id="item18" itemLabel="Buenaventura" itemValue="Buenaventura" />
                <f:selectItem id="item19" itemLabel="Neiva" itemValue="Neiva" />
                <f:selectItem id="item20" itemLabel="Armenia" itemValue="Armenia" />
                <f:selectItem id="item21" itemLabel="Tunja" itemValue="Tunja" />
                </h:selectOneMenu>
                <h:outputText value="Zona:"/>
                <h:selectOneMenu id="zona"  style="width:180px" 
                                 value="#{clientes.clientes.zona}" title="Zona" >
                <f:selectItem id="item22" itemLabel="SUR" itemValue="SUR" />
                <f:selectItem id="item23" itemLabel="NORTE" itemValue="NORTE" />
                </h:selectOneMenu>
                <h:outputText value="Contacto1:"/>
                <h:inputText id="contacto1"  style="width:180px" value="#{clientes.clientes.contacto1}" title="Contacto1" />
                <h:outputText value="Contacto2:"/>
                <h:inputText id="contacto2"  style="width:180px" value="#{clientes.clientes.contacto2}" title="Contacto2" />
                <h:outputText value="Contacto3:"/>
                <h:inputText id="contacto3"  style="width:180px" value="#{clientes.clientes.contacto3}" title="Contacto3" />
                <h:outputText value="Observaciones:"/>
                <h:inputTextarea id="observaciones"  style="width:180px" value="#{clientes.clientes.observaciones}" title="Observaciones" />
                <%--    <h:outputText value="VentasCollection:"/>
                <h:selectManyListbox id="ventasCollection" value="#{clientes.clientes.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].ventasCollection}" title="VentasCollection" size="6" converter="#{ventas.converter}" >
                    <f:selectItems value="#{ventas.ventasItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="GestionCollection:"/>
                <h:selectManyListbox id="gestionCollection" value="#{clientes.clientes.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].gestionCollection}" title="GestionCollection" size="6" converter="#{gestion.converter}" >
                    <f:selectItems value="#{gestion.gestionItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="LaboratorioCollection:"/>
                <h:selectManyListbox id="laboratorioCollection" value="#{clientes.clientes.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].laboratorioCollection}" title="LaboratorioCollection" size="6" converter="#{laboratorio.converter}" >
                    <f:selectItems value="#{laboratorio.laboratorioItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="ProcesoCollection:"/>
                <h:selectManyListbox id="procesoCollection" value="#{clientes.clientes.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].procesoCollection}" title="ProcesoCollection" size="6" converter="#{proceso.converter}" >
                    <f:selectItems value="#{proceso.procesoItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="AlquilerCollection:"/>
                <h:selectManyListbox id="alquilerCollection" value="#{clientes.clientes.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].alquilerCollection}" title="AlquilerCollection" size="6" converter="#{alquiler.converter}" >
                    <f:selectItems value="#{alquiler.alquilerItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="MensajeriaCollection:"/>
                <h:selectManyListbox id="mensajeriaCollection" value="#{clientes.clientes.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].mensajeriaCollection}" title="MensajeriaCollection" size="6" converter="#{mensajeria.converter}" >
                    <f:selectItems value="#{mensajeria.mensajeriaItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                --%>
            </h:panelGrid>
            <br />
            <h:commandLink action="#{clientes.create}" value="Crear" style="text-decoration: none; color:#000;margin-left:-100px;"/>
            <br />
            <br />
            <h:commandLink action="#{clientes.listSetup}" value="Ver Todos los Clientes" immediate="true" style="text-decoration: none; color:#000;margin-left:-100px;"/>
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
