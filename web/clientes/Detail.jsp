<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Clientes</title>
          <link href="../css/stylep.css" rel="stylesheet" type="text/css"> </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Detalles Del Cliente </h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Codigo:"/>
                <h:outputText value="#{clientes.clientes.codigo}" title="Codigo" />
                <h:outputText value="NombreCliente:"/>
                <h:outputText value="#{clientes.clientes.nombreCliente}" title="NombreCliente" />
                <h:outputText value="RazonSocial:"/>
                <h:outputText value="#{clientes.clientes.razonSocial}" title="Razonsocial" />
                <h:outputText value="Direccion:"/>
                <h:outputText value="#{clientes.clientes.direccion}" title="Direccion" />
                <h:outputText value="Telefono:"/>
                 <h:outputText value="#{clientes.clientes.telefono}" title="Telefono" />
                <h:outputText value="Ciudad:"/>
                <h:outputText value="#{clientes.clientes.ciudad}" title="Ciudad" />
                <h:outputText value="Zona:"/>
                <h:outputText value="#{clientes.clientes.zona}" title="Zona" />
               
                <h:outputText value="Contacto1:"/>
                <h:outputText value="#{clientes.clientes.contacto1}" title="Contacto1" />
                <h:outputText value="Contacto2:"/>
                <h:outputText value="#{clientes.clientes.contacto2}" title="Contacto2" />
                <h:outputText value="Contacto3:"/>
                <h:outputText value="#{clientes.clientes.contacto3}" title="Contacto3" />
                <h:outputText value="Observaciones:"/>
                <h:outputText value="#{clientes.clientes.observaciones}" title="Observaciones" />

                <h:outputText value="Ventas Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty clientes.clientes.ventasCollection}" value="(No tiene Registros)"/>
                    <h:dataTable value="#{clientes.clientes.ventasCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty clientes.clientes.ventasCollection}">
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
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                              <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-ventas1";
            String usuario4="Med-ventas2";
            String usuario5="Med-ventas3";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
                            <h:commandLink value="Editar" action="#{ventas.editSetup}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            
                            <h:commandLink value="Eliminar" action="#{ventas.destroy}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            
                            <%
}
                  %>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="Gestion Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty clientes.clientes.gestionCollection}" value="(No tiene Registros)"/>
                    <h:dataTable value="#{clientes.clientes.gestionCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty clientes.clientes.gestionCollection}">
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
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-ventas1";
            String usuario4="Med-ventas2";
            String usuario5="Med-ventas3";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
                            <h:commandLink value="Editar" action="#{gestion.editSetup}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                         
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{gestion.destroy}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                           <%
}
                  %> 
                            
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="Laboratorio Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty clientes.clientes.laboratorioCollection}" value="(No tiene Registros)"/>
                    <h:dataTable value="#{clientes.clientes.laboratorioCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty clientes.clientes.laboratorioCollection}">
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
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                               <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-ventas1";
            String usuario4="Med-ventas2";
            String usuario5="Med-ventas3";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
                            <h:commandLink value="Editar" action="#{laboratorio.editSetup}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                          
                            <h:commandLink value="Destroy" action="#{laboratorio.destroy}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            
                               <%
}
                  %>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="Proceso Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty clientes.clientes.procesoCollection}" value="(No tiene Registros)"/>
                    <h:dataTable value="#{clientes.clientes.procesoCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty clientes.clientes.procesoCollection}">
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
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                               <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-ventas1";
            String usuario4="Med-ventas2";
            String usuario5="Med-ventas3";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
                            <h:commandLink value="Editar" action="#{proceso.editSetup}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                       
                            <h:commandLink value="Destroy" action="#{proceso.destroy}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                              <%
}
                  %>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="Alquiler Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty clientes.clientes.alquilerCollection}" value="(No tiene Registros)"/>
                    <h:dataTable value="#{clientes.clientes.alquilerCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty clientes.clientes.alquilerCollection}">
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
                            <h:commandLink value="Ver" action="#{alquiler.detailSetup}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                               <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-ventas1";
            String usuario4="Med-ventas2";
            String usuario5="Med-ventas3";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
                            <h:commandLink value="Editar" action="#{alquiler.editSetup}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                       
                            <h:commandLink value="Destroy" action="#{alquiler.destroy}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                          <%
}
                  %>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="Mensajeria Coleccion:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty clientes.clientes.mensajeriaCollection}" value="(No tiene Registros)"/>
                    <h:dataTable value="#{clientes.clientes.mensajeriaCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty clientes.clientes.mensajeriaCollection}">
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
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                               <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-ventas1";
            String usuario4="Med-ventas2";
            String usuario5="Med-ventas3";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
                            <h:commandLink value="Editar" action="#{mensajeria.editSetup}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                          
                            <h:commandLink value="Destroy" action="#{mensajeria.destroy}">
                                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="clientes" />
                                <f:param name="jsfcrud.relatedControllerType" value="formularios.ClientesController" />
                            </h:commandLink>
                               <%
}
                  %>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
            </h:panelGrid>
            <br />
               <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-desarrollo";
            String usuario4="Med-ventas2";
            String usuario5="Med-ventas3";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)|| usuario3.equals(nombre1)) 
            {
                %>
         
            <h:commandLink action="#{clientes.remove}" value="Eliminar">
                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}" />
            </h:commandLink>
         
            
            <br />
            <br />
            <h:commandLink action="#{clientes.editSetup}" value="Editar">
                <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][clientes.clientes][clientes.converter].jsfcrud_invoke}" />
            </h:commandLink>
               <%
}
                  %>
            <br />
            <h:commandLink action="#{clientes.createSetup}" value="Nuevo Cliente" />
            <br />
            <h:commandLink action="#{clientes.listSetup}" value="Ver Todos los Registros "/>
            <br />
            <br />
          <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
