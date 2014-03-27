<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Gestion</title>
          <link href="../css/stylep.css" rel="stylesheet" type="text/css"> </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Gestion</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="IdGestion:"/>
                <h:outputText value="#{gestion.gestion.idGestion}" title="IdGestion" />
                <h:outputText value="FechaIngreso:"/>
                <h:outputText value="#{gestion.gestion.fechaIngreso}" title="FechaIngreso" >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:outputText>
                <h:outputText value="Horario:"/>
                <h:outputText value="#{gestion.gestion.horario}" title="Horario" />
                <h:outputText value="Contacto:"/>
                <h:outputText value="#{gestion.gestion.contacto}" title="contacto" />
                <h:outputText value="Zona:"/>
                <h:outputText value="#{gestion.gestion.zona}" title="Zona" />
                <h:outputText value="Prioridad:"/>
                <h:outputText value="#{gestion.gestion.prioridad}" title="Prioridad" />
                <h:outputText value="ObservacionesGestion:"/>
                <h:outputText value="#{gestion.gestion.observacionesGestion}" title="ObservacionesGestion" />
                <h:outputText value="Usuario:"/>
                <h:panelGroup>
                    <h:outputText value="#{gestion.gestion.usuario}"/>
                    <h:panelGroup rendered="#{gestion.gestion.usuario != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{login.detailSetup}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="gestion"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.GestionController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                          <%--
                        <h:commandLink value="Editar" action="#{login.editSetup}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="gestion"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.GestionController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                     
                        <h:commandLink value="Destroy" action="#{login.destroy}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="gestion"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.GestionController"/>
                        </h:commandLink>
                        --%>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>
                <h:outputText value="CodigoCliente:"/>
                <h:panelGroup>
                    <h:outputText value="#{gestion.gestion.codigoCliente}"/>
                    <h:panelGroup rendered="#{gestion.gestion.codigoCliente != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{clientes.detailSetup}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="gestion"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.GestionController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{clientes.editSetup}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="gestion"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.GestionController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <%--
                        <h:commandLink value="Eliminar" action="#{clientes.destroy}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="gestion"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.GestionController"/>
                        </h:commandLink>
                        --%>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
            
            <h:commandLink action="#{gestion.remove}" value="Elimingooglar">
                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}" />
            </h:commandLink>
            
            <br />
            <br />
            <h:commandLink action="#{gestion.editSetup}" value="Editar">
                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{gestion.createSetup}" value="Nueva Gestion" />
            <br />
            <h:commandLink action="#{gestion.listSetup}" value="Ver Todos los Registros"/>
            <br />
            <br />
           <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
