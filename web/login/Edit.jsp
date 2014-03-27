<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editar Usuario</title>
         <link href="../css/stylep.css" rel="stylesheet" type="text/css">  </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editar Usuario</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Usuario:"/>
                <h:outputText value="#{login.login.usuario}" title="Usuario" />
                <h:outputText value="Nombre:"/>
                <h:inputText id="nombre" value="#{login.login.nombre}" title="Nombre" required="true" requiredMessage="The nombre field is required." />
                <h:outputText value="Contrasena:"/>
                <h:inputText id="contrasena" value="#{login.login.contrasena}" title="Contrasena" required="true" requiredMessage="The contrasena field is required." />
                <h:outputText value="Ciudad:"/>
                <h:inputText id="ciudad" value="#{login.login.ciudad}" title="Ciudad" required="true" requiredMessage="The ciudad field is required." />
                <h:outputText value="AreaTrabajo:"/>
                <h:inputText id="areaTrabajo" value="#{login.login.areaTrabajo}" title="AreaTrabajo" required="true" requiredMessage="The areaTrabajo field is required." />
                <h:outputText value="VentasCollection:"/>
                <h:selectManyListbox id="ventasCollection" value="#{login.login.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].ventasCollection}" title="VentasCollection" size="6" converter="#{ventas.converter}" >
                    <f:selectItems value="#{ventas.ventasItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="GestionCollection:"/>
                <h:selectManyListbox id="gestionCollection" value="#{login.login.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].gestionCollection}" title="GestionCollection" size="6" converter="#{gestion.converter}" >
                    <f:selectItems value="#{gestion.gestionItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="LaboratorioCollection:"/>
                <h:selectManyListbox id="laboratorioCollection" value="#{login.login.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].laboratorioCollection}" title="LaboratorioCollection" size="6" converter="#{laboratorio.converter}" >
                    <f:selectItems value="#{laboratorio.laboratorioItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="ProcesoCollection:"/>
                <h:selectManyListbox id="procesoCollection" value="#{login.login.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].procesoCollection}" title="ProcesoCollection" size="6" converter="#{proceso.converter}" >
                    <f:selectItems value="#{proceso.procesoItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="AlquilerCollection:"/>
                <h:selectManyListbox id="alquilerCollection" value="#{login.login.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].alquilerCollection}" title="AlquilerCollection" size="6" converter="#{alquiler.converter}" >
                    <f:selectItems value="#{alquiler.alquilerItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="MensajeriaCollection:"/>
                <h:selectManyListbox id="mensajeriaCollection" value="#{login.login.jsfcrud_transform[jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method.arrayToList].mensajeriaCollection}" title="MensajeriaCollection" size="6" converter="#{mensajeria.converter}" >
                    <f:selectItems value="#{mensajeria.mensajeriaItemsAvailableSelectMany}"/>
                </h:selectManyListbox>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{login.edit}" value="Guardar">
                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{login.detailSetup}" value="Ver" immediate="true">
                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{login.listSetup}" value="Ver todos los Usuarios" immediate="true"/>
            <br />
            <br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
