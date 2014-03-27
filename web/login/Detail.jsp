<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Usuario</title>
            <br/>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">  </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Login</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Usuario:"/>
                <h:outputText value="#{login.login.usuario}" title="Usuario" />
                <h:outputText value="Nombre:"/>
                <h:outputText value="#{login.login.nombre}" title="Nombre" />
                
                <h:outputText value="Ciudad:"/>
                <h:outputText value="#{login.login.ciudad}" title="Ciudad" />
                <h:outputText value="AreaTrabajo:"/>
                <h:outputText value="#{login.login.areaTrabajo}" title="AreaTrabajo" />

                <h:outputText value="Ventas Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty login.login.ventasCollection}" value="(No Tiene Registros)"/>
                      <h:dataTable value="#{login.login.ventasCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty login.login.ventasCollection}">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdVenta"/>
                            </f:facet>
                            <h:outputText value="#{item.idVenta}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FechaIngreso"/>
                            </f:facet>
                            <h:outputText value="#{item.fechaIngreso}">
                                <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="OrdenPedido"/>
                            </f:facet>
                            <h:outputText value="#{item.ordenPedido}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Horario"/>
                            </f:facet>
                            <h:outputText value="#{item.horario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Contacto"/>
                            </f:facet>
                            <h:outputText value="#{item.contacto}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Zona"/>
                            </f:facet>
                            <h:outputText value="#{item.zona}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Prioridad"/>
                            </f:facet>
                            <h:outputText value="#{item.prioridad}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ObservacionesVentas"/>
                            </f:facet>
                            <h:outputText value="#{item.observacionesVentas}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FechaDespacho"/>
                            </f:facet>
                            <h:outputText value="#{item.fechaDespacho}">
                                <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Usuario"/>
                            </f:facet>
                            <h:outputText value="#{item.usuario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="CodigoCliente"/>
                            </f:facet>
                            <h:outputText value="#{item.codigoCliente}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Ver" action="#{ventas.detailSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Editar" action="#{ventas.editSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <%--
                            <h:commandLink value="Eliminar" action="#{ventas.destroy}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            --%>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="Gestion Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty login.login.gestionCollection}" value="(No Tiene Registros)"/>
                    <h:dataTable value="#{login.login.gestionCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty login.login.gestionCollection}">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdGestion"/>
                            </f:facet>
                            <h:outputText value="#{item.idGestion}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FechaIngreso"/>
                            </f:facet>
                            <h:outputText value="#{item.fechaIngreso}">
                                <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Usuario"/>
                            </f:facet>
                            <h:outputText value="#{item.usuario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="CodigoCliente"/>
                            </f:facet>
                            <h:outputText value="#{item.codigoCliente}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Ver" action="#{gestion.detailSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Editar" action="#{gestion.editSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <%--
                            <h:commandLink value="Eliminar" action="#{gestion.destroy}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            --%>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="Laboratorio Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty login.login.laboratorioCollection}" value="(No Tiene Registros)"/>
                    <h:dataTable value="#{login.login.laboratorioCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty login.login.laboratorioCollection}">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdLaboratorio"/>
                            </f:facet>
                            <h:outputText value="#{item.idLaboratorio}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="OrdenTecnica"/>
                            </f:facet>
                            <h:outputText value="#{item.ordenTecnica}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FechaIngreso"/>
                            </f:facet>
                            <h:outputText value="#{item.fechaIngreso}">
                                <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="contacto"/>
                            </f:facet>
                            <h:outputText value="#{item.contacto}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Horario"/>
                            </f:facet>
                            <h:outputText value="#{item.horario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Zona"/>
                            </f:facet>
                            <h:outputText value="#{item.zona}"/>
                        </h:column>
                          <h:column>
                            <f:facet name="header">
                                <h:outputText value="Prioridad"/>
                            </f:facet>
                            <h:outputText value="#{item.prioridad}"/>
                        </h:column>
                         <h:column>
                            <f:facet name="header">
                                <h:outputText value="Observaciones"/>
                            </f:facet>
                            <h:outputText value="#{item.observacionesLaboratorio}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Usuario"/>
                            </f:facet>
                            <h:outputText value="#{item.usuario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="CodigoCliente"/>
                            </f:facet>
                            <h:outputText value="#{item.codigoCliente}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Ver" action="#{laboratorio.detailSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Editar" action="#{laboratorio.editSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <%--
                            <h:commandLink value="Destroy" action="#{laboratorio.destroy}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            --%>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="ProcesoCollection:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty login.login.procesoCollection}" value="(No Tiene Registros)"/>
                    <h:dataTable value="#{login.login.procesoCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty login.login.procesoCollection}">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdProceso"/>
                            </f:facet>
                            <h:outputText value="#{item.idProceso}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Id"/>
                            </f:facet>
                            <h:outputText value="#{item.id}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Ventas1"/>
                            </f:facet>
                            <h:outputText value="#{item.ventas1}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Ventas2"/>
                            </f:facet>
                            <h:outputText value="#{item.ventas2}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Ventas3"/>
                            </f:facet>
                            <h:outputText value="#{item.ventas3}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="GerenteVentas"/>
                            </f:facet>
                            <h:outputText value="#{item.gerenteVentas}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="STIngreso"/>
                            </f:facet>
                            <h:outputText value="#{item.STIngreso}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="STReparacion"/>
                            </f:facet>
                            <h:outputText value="#{item.STReparacion}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="STLiberacion"/>
                            </f:facet>
                            <h:outputText value="#{item.STLiberacion}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="STPendAutorizado"/>
                            </f:facet>
                            <h:outputText value="#{item.STPendAutorizado}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ObservacionST"/>
                            </f:facet>
                            <h:outputText value="#{item.observacionST}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Almacen"/>
                            </f:facet>
                            <h:outputText value="#{item.almacen}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ObservacionAlmacen"/>
                            </f:facet>
                            <h:outputText value="#{item.observacionAlmacen}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Alquiler"/>
                            </f:facet>
                            <h:outputText value="#{item.alquiler}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Facturacion"/>
                            </f:facet>
                            <h:outputText value="#{item.facturacion}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="AuxContable"/>
                            </f:facet>
                            <h:outputText value="#{item.auxContable}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Cartera"/>
                            </f:facet>
                            <h:outputText value="#{item.cartera}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Calidad"/>
                            </f:facet>
                            <h:outputText value="#{item.calidad}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Gerencia"/>
                            </f:facet>
                            <h:outputText value="#{item.gerencia}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ServicioCliente"/>
                            </f:facet>
                            <h:outputText value="#{item.servicioCliente}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Recepcion"/>
                            </f:facet>
                            <h:outputText value="#{item.recepcion}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Fechadespacho"/>
                            </f:facet>
                            <h:outputText value="#{item.fechadespacho}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Usuario"/>
                            </f:facet>
                            <h:outputText value="#{item.usuario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="CodigoCliente"/>
                            </f:facet>
                            <h:outputText value="#{item.codigoCliente}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Ver" action="#{proceso.detailSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Editar" action="#{proceso.editSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <%--
                            <h:commandLink value="Destroy" action="#{proceso.destroy}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            --%>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="AlquilerCollection:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty login.login.alquilerCollection}" value="(No Tiene Registros)"/>
                    <h:dataTable value="#{login.login.alquilerCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty login.login.alquilerCollection}">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdAlquiler"/>
                            </f:facet>
                            <h:outputText value="#{item.idAlquiler}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="OrdenPedido"/>
                            </f:facet>
                            <h:outputText value="#{item.ordenPedido}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FechaIngreso"/>
                            </f:facet>
                            <h:outputText value="#{item.fechaIngreso}">
                                <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Horario"/>
                            </f:facet>
                            <h:outputText value="#{item.horario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Contacto"/>
                            </f:facet>
                            <h:outputText value="#{item.contacto}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Zona"/>
                            </f:facet>
                            <h:outputText value="#{item.zona}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Prioridad"/>
                            </f:facet>
                            <h:outputText value="#{item.prioridad}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ObservacionesAlquiler"/>
                            </f:facet>
                            <h:outputText value="#{item.observacionesAlquiler}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FechaDespacho"/>
                            </f:facet>
                            <h:outputText value="#{item.fechaDespacho}">
                                <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Usuario"/>
                            </f:facet>
                            <h:outputText value="#{item.usuario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="CodigoCliente"/>
                            </f:facet>
                            <h:outputText value="#{item.codigoCliente}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Ver" action="#{alquiler.detailSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Editar" action="#{alquiler.editSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <%--
                            <h:commandLink value="Destroy" action="#{alquiler.destroy}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            --%>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="MensajeriaCollection:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty login.login.mensajeriaCollection}" value="(No Tiene Registros)"/>
                    <h:dataTable value="#{login.login.mensajeriaCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty login.login.mensajeriaCollection}">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdMensajeria"/>
                            </f:facet>
                            <h:outputText value="#{item.idMensajeria}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FechaIngreso"/>
                            </f:facet>
                            <h:outputText value="#{item.fechaIngreso}">
                                <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="OrdenPedido"/>
                            </f:facet>
                            <h:outputText value="#{item.ordenPedido}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Contacto"/>
                            </f:facet>
                            <h:outputText value="#{item.contacto}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Prioridad"/>
                            </f:facet>
                            <h:outputText value="#{item.prioridad}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ObservacionesMensajeria"/>
                            </f:facet>
                            <h:outputText value="#{item.observacionesMensajeria}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Usuario"/>
                            </f:facet>
                            <h:outputText value="#{item.usuario}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="CodigoCliente"/>
                            </f:facet>
                            <h:outputText value="#{item.codigoCliente}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Ver" action="#{mensajeria.detailSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Editar" action="#{mensajeria.editSetup}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <%--
                            <h:commandLink value="Destroy" action="#{mensajeria.destroy}">
                                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="login" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.LoginController" />
                            </h:commandLink>
                            --%>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>

            </h:panelGrid>
            <br />
            <%--
            <h:commandLink action="#{login.remove}" value="Destroy">
                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            --%>
            <br />
            <h:commandLink action="#{login.editSetup}" value="Editar">
                <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][login.login][login.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{login.createSetup}" value="Nuevo Usuario" />
            <br />
            <h:commandLink action="#{login.listSetup}" value="Ver todos los Registros"/>
            <br />
            <br />
       <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
