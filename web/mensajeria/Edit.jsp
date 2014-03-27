<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Mensajer&iacute;a</title>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">   </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
            <h1>Editar Mensajer&iacute;a</h1>
        <h:form>
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
            <h:commandLink action="#{mensajeria.edit}" value="Guardar">
                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{mensajeria.detailSetup}" value="Ver" immediate="true">
                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{mensajeria.listSetup}" value="Ver todo los Registros de  Mensajería" immediate="true"/>
            <br />
            <br />
                <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
