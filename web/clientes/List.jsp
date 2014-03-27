<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
  <%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Clientes Items</title>
       <%  
               String nombre = (String) session.getAttribute("nombre");
                Date fechaActual = new Date();
                 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                 String Fecha = formato.format(fechaActual);
             %>
             <%=nombre%>
        <br/> 
        <%=Fecha%>
              <link href="../css/stylep.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/AplicativoZComunicaciones/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listas De Clientes</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Tiene Ningun Registro De Cliente)<br />" rendered="#{clientes.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{clientes.pagingInfo.itemCount > 0}">
                <h:outputText value="Registro #{clientes.pagingInfo.firstItem + 1}..#{clientes.pagingInfo.lastItem} De #{clientes.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{clientes.prev}" value="Anterios #{clientes.pagingInfo.batchSize}" rendered="#{clientes.pagingInfo.firstItem >= clientes.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{clientes.next}" value="Siguiente #{clientes.pagingInfo.batchSize}" rendered="#{clientes.pagingInfo.lastItem + clientes.pagingInfo.batchSize <= clientes.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{clientes.next}" value="Ultimo #{clientes.pagingInfo.itemCount - clientes.pagingInfo.lastItem}"
                               rendered="#{clientes.pagingInfo.lastItem < clientes.pagingInfo.itemCount && clientes.pagingInfo.lastItem + clientes.pagingInfo.batchSize > clientes.pagingInfo.itemCount}"/>
                <h:dataTable value="#{clientes.clientesItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Codigo"/>
                        </f:facet>
                        <h:outputText value="#{item.codigo}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="NombreCliente"/>
                        </f:facet>
                        <h:outputText value="#{item.nombreCliente}"/>
                    </h:column>
                        <h:column>
                        <f:facet name="header">
                            <h:outputText value="RazonSocial"/>
                        </f:facet>
                        <h:outputText value="#{item.razonSocial}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Direccion"/>
                        </f:facet>
                        <h:outputText value="#{item.direccion}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Telefono"/>
                        </f:facet>
                        <h:outputText value="#{item.telefono}"/>
                    </h:column>
                      <h:column>
                        <f:facet name="header">
                            <h:outputText value="Ciudad"/>
                        </f:facet>
                        <h:outputText value="#{item.ciudad}"/>
                    </h:column>
                      <h:column>
                        <f:facet name="header">
                            <h:outputText value="Zona"/>
                        </f:facet>
                        <h:outputText value="#{item.zona}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Contacto1"/>
                        </f:facet>
                        <h:outputText value="#{item.contacto1}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Contacto2"/>
                        </f:facet>
                        <h:outputText value="#{item.contacto2}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Contacto3"/>
                        </f:facet>
                        <h:outputText value="#{item.contacto3}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Observaciones"/>
                        </f:facet>
                        <h:outputText value="#{item.observaciones}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{clientes.detailSetup}">
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][clientes.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{clientes.editSetup}">
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][clientes.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <%--
                        <h:commandLink value="Eliminar" action="#{clientes.remove}">
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][clientes.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        --%>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{clientes.createSetup}" value="Nuevo Cliente"/>
            <br />
            <br />
             <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
