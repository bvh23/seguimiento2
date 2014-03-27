<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Mensajeria</title>
       <link href="../css/stylep.css" rel="stylesheet" type="text/css">   </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Mensajeria</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="IdMensajeria:"/>
                <h:outputText value="#{mensajeria.mensajeria.idMensajeria}" title="IdMensajeria" />
                <h:outputText value="FechaIngreso:"/>
                <h:outputText value="#{mensajeria.mensajeria.fechaIngreso}" title="FechaIngreso" >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:outputText>
                <h:outputText value="OrdenPedido:"/>
                <h:outputText value="#{mensajeria.mensajeria.ordenPedido}" title="OrdenPedido" />
                <h:outputText value="Contacto:"/>
                <h:outputText value="#{mensajeria.mensajeria.contacto}" title="Contacto" />
                <h:outputText value="Prioridad:"/>
                <h:outputText value="#{mensajeria.mensajeria.prioridad}" title="Prioridad" />
                <h:outputText value="Zona:"/>
                <h:outputText value="#{mensajeria.mensajeria.zona}" title="Zona" />
                <h:outputText value="ObservacionesMensajeria:"/>
                <h:outputText value="#{mensajeria.mensajeria.observacionesMensajeria}" title="ObservacionesMensajeria" />
                <h:outputText value="Usuario:"/>
                <h:panelGroup>
                    <h:outputText value="#{mensajeria.mensajeria.usuario}"/>
                    <h:panelGroup rendered="#{mensajeria.mensajeria.usuario != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{login.detailSetup}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="mensajeria"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.MensajeriaController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                          <%--
                        <h:commandLink value="Editar" action="#{login.editSetup}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="mensajeria"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.MensajeriaController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                      
                        <h:commandLink value="Eliminar" action="#{login.destroy}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="mensajeria"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.MensajeriaController"/>
                        </h:commandLink>
                        --%>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>
                <h:outputText value="CodigoCliente:"/>
                <h:panelGroup>
                    <h:outputText value="#{mensajeria.mensajeria.codigoCliente}"/>
                    <h:panelGroup rendered="#{mensajeria.mensajeria.codigoCliente != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="ver" action="#{clientes.detailSetup}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="mensajeria"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.MensajeriaController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{clientes.editSetup}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="mensajeria"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.MensajeriaController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <%--
                        <h:commandLink value="Eliminar" action="#{clientes.destroy}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="mensajeria"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.MensajeriaController"/>
                        </h:commandLink>
                        --%>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
            <%--
            <h:commandLink action="#{mensajeria.remove}" value="Eliminar">
                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            --%>
            <br />
            <h:commandLink action="#{mensajeria.editSetup}" value="Editar">
                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][mensajeria.mensajeria][mensajeria.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{mensajeria.createSetup}" value="Nuevo Registro de Mensajeria" />
            <br />
            <h:commandLink action="#{mensajeria.listSetup}" value="Ver Todos los Registros de Mensajeria"/>
            <br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
