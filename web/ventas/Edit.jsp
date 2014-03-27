<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<f:view>
    <html>
        <head>
            <%  
               String nombre = (String) session.getAttribute("nombre");
                Date fechaActual = new Date();
                 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                 String Fecha = formato.format(fechaActual);
             %>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Ventas</title>
           <link href="../css/stylep.css" rel="stylesheet" type="text/css"> </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editar Ventas</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="IdVenta:"/>
                <h:outputText value="#{ventas.ventas.idVenta}"  title="IdVenta" />
                <h:outputText value="FechaIngreso :"/>
                <h:inputText id="fechaIngreso" style="width: 200px" readonly="true" value="#{ventas.ventas.fechaIngreso}" title="FechaIngreso" required="true" requiredMessage="The fechaIngreso field is required." >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="OrdenPedido:"/>
                <h:inputText id="ordenPedido" style="width: 200px" value="#{ventas.ventas.ordenPedido}" title="OrdenPedido" required="true" requiredMessage="The ordenPedido field is required." />
                <h:outputText value="Horario:"/>
                <h:inputText id="horario" style="width: 200px" value="#{ventas.ventas.horario}" title="Horario" required="true" requiredMessage="The horario field is required." />
                <h:outputText value="Contacto:"/>
                <h:inputText id="contacto" style="width: 200px" value="#{ventas.ventas.contacto}" title="Contacto" />
                <h:outputText value="Zona:"/>
                <h:inputText id="zona" style="width: 200px" value="#{ventas.ventas.zona}" title="Zona" required="true" requiredMessage="The zona field is required." />
                <h:outputText value="Prioridad:"/>
                <h:inputText id="prioridad" style="width: 200px" value="#{ventas.ventas.prioridad}" title="Prioridad" />
                <h:outputText value="ObservacionesVentas:"/>
                <h:inputTextarea id="observacionesVentas" style="width: 200px" value="#{ventas.ventas.observacionesVentas}" title="ObservacionesVentas" />
                <h:outputText value="FechaDespacho (dd/MM/yyyy HH:mm:ss):"/>
                <h:inputText id="fechaDespacho" style="width: 200px" value="#{ventas.ventas.fechaDespacho}" title="FechaDespacho" >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="Usuario:"/>
                <h:inputText id="usuario" style="width: 200px" value="#{ventas.ventas.usuario}" readonly="true" title="Usuario" required="true" requiredMessage="The usuario field is required." >
                    <f:selectItems value="#{login.loginItemsAvailableSelectOne}"/>
                </h:inputText>
                <h:outputText value="CodigoCliente:"/>
                <h:inputText id="codigoCliente" style="width: 200px" readonly="true" value="#{ventas.ventas.codigoCliente}" title="CodigoCliente" required="true" requiredMessage="The codigoCliente field is required." >
                    <f:selectItems value="#{clientes.clientesItemsAvailableSelectOne}"/>
                </h:inputText>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{ventas.edit}" value="Guardar">
                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{ventas.detailSetup}" value="Ver" immediate="true">
                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{ventas.listSetup}" value="Ver Todos los Registros" immediate="true"/>
            <br />
            <br />
                <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
