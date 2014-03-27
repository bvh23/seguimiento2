<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Alquiler</title>
               <link href="../css/stylep.css" rel="stylesheet" type="text/css"></head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Detalle de Alquiler</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="IdAlquiler:"/>
                <h:outputText value="#{alquiler.alquiler.idAlquiler}" title="IdAlquiler" />
                <h:outputText value="OrdenPedido:"/>
                <h:outputText value="#{alquiler.alquiler.ordenPedido}" title="OrdenPedido" />
                <h:outputText value="FechaIngreso:"/>
                <h:outputText value="#{alquiler.alquiler.fechaIngreso}" title="FechaIngreso" >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:outputText>
                <h:outputText value="Horario:"/>
                <h:outputText value="#{alquiler.alquiler.horario}" title="Horario" />
                <h:outputText value="Contacto:"/>
                <h:outputText value="#{alquiler.alquiler.contacto}" title="Contacto" />
                <h:outputText value="Zona:"/>
                <h:outputText value="#{alquiler.alquiler.zona}" title="Zona" />
                <h:outputText value="Prioridad:"/>
                <h:outputText value="#{alquiler.alquiler.prioridad}" title="Prioridad" />
                <h:outputText value="ObservacionesAlquiler:"/>
                <h:outputText value="#{alquiler.alquiler.observacionesAlquiler}" title="ObservacionesAlquiler" />
                <h:outputText value="FechaDespacho:"/>
                <h:outputText value="#{alquiler.alquiler.fechaDespacho}" title="FechaDespacho" >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:outputText>
                <h:outputText value="Usuario:"/>
                <h:panelGroup>
                    <h:outputText value="#{alquiler.alquiler.usuario}"/>
                    <h:panelGroup rendered="#{alquiler.alquiler.usuario != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{login.detailSetup}">
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="alquiler"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.AlquilerController"/>
                        </h:commandLink>
                        <h:outputText value=""/>
                        <%--
                        <h:commandLink value="Editar" action="#{login.editSetup}">
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="alquiler"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.AlquilerController"/>
                        </h:commandLink>
                        <h:outputText value=""/>
                        
                        <h:commandLink value="Elimiar" action="#{login.destroy}">
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="alquiler"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.AlquilerController"/>
                        </h:commandLink>
                        --%>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>
                <h:outputText value="CodigoCliente:"/>
                <h:panelGroup>
                    <h:outputText value="#{alquiler.alquiler.codigoCliente}"/>
                    <h:panelGroup rendered="#{alquiler.alquiler.codigoCliente != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{clientes.detailSetup}">
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="alquiler"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.AlquilerController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{clientes.editSetup}">
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="alquiler"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.AlquilerController"/>
                        </h:commandLink>
                        <h:outputText value=""/>
                        <%--
                        <h:commandLink value="Destroy" action="#{clientes.destroy}">
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="alquiler"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.AlquilerController"/>
                        </h:commandLink>
                        --%>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
            <%--
            <h:commandLink action="#{alquiler.remove}" value="Eliminar">
                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}" />
            </h:commandLink>
            --%>
            <br />
            <br />
            <h:commandLink action="#{alquiler.editSetup}" value="Editar">
                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][alquiler.alquiler][alquiler.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{alquiler.createSetup}" value="Nuevo Alquiler" />
            <br />
            <h:commandLink action="#{alquiler.listSetup}" value="Ver Todos los Registros"/>
            <br />
            <br />
             <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
