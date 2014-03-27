<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editar Clientes</title>
         <link href="../css/stylep.css" rel="stylesheet" type="text/css"> </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editing Clientes</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Codigo:"/>
                <h:inputText  disabled="true"  value="#{clientes.clientes.codigo}" title="Codigo" />
                <h:outputText value="NombreCliente:"/>
                <h:inputText id="nombreCliente" value="#{clientes.clientes.nombreCliente}" title="NombreCliente" />
                <h:outputText value="Razon Social:"/>
                <h:inputText id="razonsocial" value="#{clientes.clientes.razonSocial}" title="RazonSocial" />
                <h:outputText value="Direccion:"/>
                <h:inputText id="direccion" value="#{clientes.clientes.direccion}" title="Direccion" />
                 <h:outputText value="Telefono:"/>
                <h:inputText id="telefono" value="#{clientes.clientes.telefono}" title="Telefono" />
                
                <h:outputText value="Ciudad:"/>
                <h:inputText id="ciudad" value="#{clientes.clientes.ciudad}" title="Ciudad" />
                <h:outputText value="Zona:"/>
                <h:inputText id="zona" value="#{clientes.clientes.zona}" title="Zona" />
               
                <h:outputText value="Contacto1:"/>
                <h:inputText id="contacto1" value="#{clientes.clientes.contacto1}" title="Contacto1" />
                <h:outputText value="Contacto2:"/>
                <h:inputText id="contacto2" value="#{clientes.clientes.contacto2}" title="Contacto2" />
                <h:outputText value="Contacto3:"/>
                <h:inputText id="contacto3" value="#{clientes.clientes.contacto3}" title="Contacto3" />
                <h:outputText value="Observaciones:"/>
                <h:inputText id="observaciones" value="#{clientes.clientes.observaciones}" title="Observaciones" />
               <%--
                <h:outputText value="VentasCollection:"/>
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
            <h:commandLink action="#{clientes.edit}" value="Guardar">
                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{clientes.detailSetup}" value="Ver" immediate="true">
                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{clientes.listSetup}" value="Ver Todos Los Registros" immediate="true"/>
            <br />
            <br />
            
        </h:form>
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </body>
    </html>
</f:view>
