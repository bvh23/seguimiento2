<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Laboratorio</title>
     <link href="../css/stylep.css" rel="stylesheet" type="text/css">     </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Laboratorio</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="IdLaboratorio:"/>
                <h:outputText value="#{laboratorio.laboratorio.idLaboratorio}" title="IdLaboratorio" />
                <h:outputText value="OrdenTecnica:"/>
                <h:outputText value="#{laboratorio.laboratorio.ordenTecnica}" title="OrdenTecnica" />
                <h:outputText value="FechaIngreso:"/>
                <h:outputText value="#{laboratorio.laboratorio.fechaIngreso}" title="FechaIngreso" >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:outputText>
                <h:outputText value="Horario:"/>
                <h:outputText value="#{laboratorio.laboratorio.horario}" title="Horario" />
                <h:outputText value="Contacto:"/>
                <h:outputText value="#{laboratorio.laboratorio.contacto}" title="Contacto" />
                  <h:outputText value="Zona:"/>
                  <h:outputText value="#{laboratorio.laboratorio.zona}" title="Zona" />
                    <h:outputText value="Prioridad:"/>
                    <h:outputText value="#{laboratorio.laboratorio.prioridad}" title="Prioridad" />
                 <h:outputText value="ObservacionesLaboratorio:"/>
                 <h:outputText value="#{laboratorio.laboratorio.observacionesLaboratorio}" title="ObservacionesLaboratorio" />
                <h:outputText value="Usuario:"/>
                <h:panelGroup>
                    <h:outputText value="#{laboratorio.laboratorio.usuario}"/>
                    <h:panelGroup rendered="#{laboratorio.laboratorio.usuario != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{login.detailSetup}">
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="laboratorio"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.LaboratorioController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        
                        <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
                        
                        <h:commandLink value="Editar" action="#{login.editSetup}">
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="laboratorio"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.LaboratorioController"/>
                        </h:commandLink>
                        
                        <h:outputText value=" "/>
                        <h:commandLink value="destroy" action="#{login.remove()}">
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="laboratorio"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.LaboratorioController"/>
                        </h:commandLink>
                       
                        <%
}
                  %>
                        <h:outputText value="   )"/>
                    </h:panelGroup>
                </h:panelGroup>
                <h:outputText value="CodigoCliente:"/>
                <h:panelGroup>
                    <h:outputText value="#{laboratorio.laboratorio.codigoCliente}"/>
                    <h:panelGroup rendered="#{laboratorio.laboratorio.codigoCliente != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{clientes.detailSetup}">
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="laboratorio"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.LaboratorioController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{clientes.editSetup}">
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="laboratorio"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.LaboratorioController"/>
                        </h:commandLink>
                        <%--
                        <h:outputText value=" "/>
                        <h:commandLink value="Eliminar" action="#{clientes.destroy}">
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="laboratorio"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.LaboratorioController"/>
                        </h:commandLink>
                        --%>
                        <h:outputText value="   )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
            <%--
            <h:commandLink action="#{laboratorio.remove}" value="Eliminar">
                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}" />
            </h:commandLink>
            --%>
            <br />
            <br />
            <h:commandLink action="#{laboratorio.editSetup}" value="Editar">
                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{laboratorio.createSetup}" value="Nuevo Laboratorio" />
            <br />
            <h:commandLink action="#{laboratorio.listSetup}" value="Ver todos los Registros de Laboratorio"/>
            <br />
            <br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>

        </h:form>
        </body>
    </html>
</f:view>
