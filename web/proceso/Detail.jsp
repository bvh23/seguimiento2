<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Proceso</title>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">  </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Detalles del Proceso</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="IdProceso:"/>
                <h:outputText value="#{proceso.proceso.idProceso}" title="IdProceso" />
                <h:outputText value="Id:"/>
                <h:outputText value="#{proceso.proceso.id}" title="Id" />
                <h:outputText value="Ventas1:"/>
                <h:outputText value="#{proceso.proceso.ventas1}" title="Ventas1" />
                <h:outputText value="Ventas2:"/>
                <h:outputText value="#{proceso.proceso.ventas2}" title="Ventas2" />
                <h:outputText value="Ventas3:"/>
                <h:outputText value="#{proceso.proceso.ventas3}" title="Ventas3" />
                <h:outputText value="GerenteVentas:"/>
                <h:outputText value="#{proceso.proceso.gerenteVentas}" title="GerenteVentas" />
                <h:outputText value="STIngreso:"/>
                <h:outputText value="#{proceso.proceso.STIngreso}" title="STIngreso" />
                <h:outputText value="STReparacion:"/>
                <h:outputText value="#{proceso.proceso.STReparacion}" title="STReparacion" />
                <h:outputText value="STLiberacion:"/>
                <h:outputText value="#{proceso.proceso.STLiberacion}" title="STLiberacion" />
                <h:outputText value="STPendAutorizado:"/>
                <h:outputText value="#{proceso.proceso.STPendAutorizado}" title="STPendAutorizado" />
                <h:outputText value="ObservacionST:"/>
                <h:outputText value="#{proceso.proceso.observacionST}" title="ObservacionST" />
                <h:outputText value="Almacen:"/>
                <h:outputText value="#{proceso.proceso.almacen}" title="Almacen" />
                <h:outputText value="ObservacionAlmacen:"/>
                <h:outputText value="#{proceso.proceso.observacionAlmacen}" title="ObservacionAlmacen" />
                <h:outputText value="Alquiler:"/>
                <h:outputText value="#{proceso.proceso.alquiler}" title="Alquiler" />
                <h:outputText value="Facturacion:"/>
                <h:outputText value="#{proceso.proceso.facturacion}" title="Facturacion" />
                <h:outputText value="AuxContable:"/>
                <h:outputText value="#{proceso.proceso.auxContable}" title="AuxContable" />
                <h:outputText value="Cartera:"/>
                <h:outputText value="#{proceso.proceso.cartera}" title="Cartera" />
                <h:outputText value="Calidad:"/>
                <h:outputText value="#{proceso.proceso.calidad}" title="Calidad" />
                <h:outputText value="Gerencia:"/>
                <h:outputText value="#{proceso.proceso.gerencia}" title="Gerencia" />
                <h:outputText value="ServicioCliente:"/>
                <h:outputText value="#{proceso.proceso.servicioCliente}" title="ServicioCliente" />
                <h:outputText value="Recepcion:"/>
                <h:outputText value="#{proceso.proceso.recepcion}" title="Recepcion" />
                <h:outputText value="Fechadespacho:"/>
                <h:outputText value="#{proceso.proceso.fechadespacho}" title="Fechadespacho" />
                <h:outputText value="Usuario:"/>
                <h:panelGroup>
                    <h:outputText value="#{proceso.proceso.usuario}"/>
                    <h:panelGroup rendered="#{proceso.proceso.usuario != null}">
                        <h:outputText value=" "/>
                        <h:commandLink value="Ver" action="#{login.detailSetup}">
                            <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso][proceso.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="proceso"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.ProcesoController"/>
                        </h:commandLink>
                        <%--
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{login.editSetup}">
                            <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso][proceso.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="proceso"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.ProcesoController"/>
                        </h:commandLink>
                       
                        <h:outputText value=" "/>
                        <h:commandLink value="Eliminar" action="#{login.remove()}">
                            <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso][proceso.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="proceso"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.ProcesoController"/>
                        </h:commandLink> --%>
                        <h:outputText value=" "/>
                    </h:panelGroup>
                </h:panelGroup>
                <h:outputText value="CodigoCliente:"/>
                <h:panelGroup>
                    <h:outputText value="#{proceso.proceso.codigoCliente}"/>
                    <h:panelGroup rendered="#{proceso.proceso.codigoCliente != null}">
                        <h:outputText value="    ("/>
                        <h:commandLink value="Ver" action="#{clientes.detailSetup}">
                            <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso][proceso.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="proceso"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.ProcesoController"/>
                        </h:commandLink>
                         <%--
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{clientes.editSetup}">
                            <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso][proceso.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="proceso"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.ProcesoController"/>
                        </h:commandLink>
                      
                        <h:outputText value=" "/>
                        <h:commandLink value="Eliminar" action="#{clientes.destroy}">
                            <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso][proceso.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="proceso"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.ProcesoController"/>
                        </h:commandLink>
                        --%>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
            <%--
            <h:commandLink action="#{proceso.remove}" value="Destroy">
                <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso][proceso.converter].jsfcrud_invoke}" />
            </h:commandLink>
            --%>
            <br />
            <br />
            <h:commandLink action="#{proceso.editSetup}" value="Editar">
                <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][proceso.proceso][proceso.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{proceso.createSetup}" value="Nuevo Proceso" />
            <br />
            <h:commandLink action="#{proceso.listSetup}" value="Ver Todos los  Proceso"/>
            <br />
            <br />
                  <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
