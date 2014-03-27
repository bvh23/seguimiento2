<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editar Alquiler</title>
          <link href="../css/stylep.css" rel="stylesheet" type="text/css">
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editing Alquiler</h1>
        <h:form>
            <h:panelGrid columns="2">
                  <h:outputText value="IdAlquiler:"/>
                <h:inputText id="idAlquiler" style="width: 205px" styleClass="cboId" value="#{alquiler.alquiler.idAlquiler}" title="IdAlquiler" required="true" requiredMessage="The idAlquiler field is required." />
                <h:outputText value="OrdenPedido:"/>
                <h:inputText id="ordenPedido" style="width: 205px" value="#{alquiler.alquiler.ordenPedido}" title="OrdenPedido" required="true" requiredMessage="The ordenPedido field is required." />
                <h:outputText value="FechaIngreso "/>
                <h:inputText id="fechaIngreso" style="width: 205px" styleClass="cbofecha"  value="#{alquiler.alquiler.fechaIngreso}" title="FechaIngreso" required="true" requiredMessage="The fechaIngreso field is required." >
                    <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="Horario:"/>
                <h:selectOneMenu id="horario" style="width: 205px"
                                 value="#{alquiler.alquiler.horario}"title="Horario" >
                <f:selectItem id="item1" itemLabel="TARDE" itemValue="TARDE" />
                <f:selectItem id="item2" itemLabel="MAÑANA" itemValue="MANANA" />                                                                                                                                                 
                 </h:selectOneMenu>
                
                <h:outputText value="Contacto:"/>
                <h:inputText id="contacto" style="width: 205px" value="#{alquiler.alquiler.contacto}" title="Contacto" required="true" requiredMessage="The contacto field is required." />
                <h:outputText value="Zona:"/>
                 <h:selectOneMenu id="zona" style="width: 205px"
                                  value="#{alquiler.alquiler.zona}" title="Zona" >
                <f:selectItem id="item3" itemLabel="SUR" itemValue="SUR" />
                <f:selectItem id="item4" itemLabel="NORTE" itemValue="NORTE" />
                 </h:selectOneMenu><h:outputText value="Prioridad:"/>
                 <h:selectOneMenu id="prioridad" style="width: 205px"
                                  value="#{alquiler.alquiler.prioridad}" title="Prioridad"  > 
                <f:selectItem id="item5" itemLabel="- - - - - - -" itemValue=" " />
                <f:selectItem id="item6" itemLabel="A" itemValue="A" />
                <f:selectItem id="item7" itemLabel="B" itemValue="B" />
                <f:selectItem id="item8" itemLabel="C" itemValue="C" />
                 </h:selectOneMenu>
                <h:outputText value="ObservacionesAlquiler:"/>
                <h:inputTextarea id="observacionesAlquiler" style="width: 205px ; height:50px" value="#{alquiler.alquiler.observacionesAlquiler}" title="ObservacionesAlquiler" />
                <h:outputText value="FechaDespacho "/>
                <h:inputText id="fechaDespacho" style="width: 205px" value="#{alquiler.alquiler.fechaDespacho}" title="FechaDespacho" >
                    <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="Usuario:"/>
                <h:inputText id="usuario" style="width: 205px" styleClass="cboUsuarios" value="#{alquiler.alquiler.usuario}" title="Usuario" required="true" requiredMessage="The usuario field is required." >
                    <f:selectItems value="#{login.loginItemsAvailableSelectOne}"/>
                </h:inputText>
                <h:outputText value="CodigoCliente:"/>
                <h:inputText styleClass="cboCliente" style="width: 205px" id="codigoCliente" value="#{alquiler.alquiler.codigoCliente}" title="CodigoCliente" required="true" requiredMessage="The codigoCliente field is required." >
                    <f:selectItems value="#{clientes.clientesItemsAvailableSelectOne}"/>
                </h:inputText>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{alquiler.edit}" value="Guardar">
                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{alquiler.detailSetup}" value="Ver" immediate="true">
                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{alquiler.listSetup}" value="Ver Todos los registros" immediate="true"/>
            <br />
            <br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
