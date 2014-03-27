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
            <div id="menuleft" >
               
            <ul style="margin-top:0px"> 
              <li> <a href="/AplicativoZComunicaciones/faces/alquiler/Cliente.jsp">Alquiler</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Proceso</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/clientes/New.jsp">Cliente</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/Filtro/FiltroAl.jsp">Filtro</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/Pendientes.jsp">Pendientes</a></li>
              <li> <a href="/AplicativoZComunicaciones/faces/alquiler/ultimosalquiler.jsp">&Uacute;ltimos</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
                         
            </div>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Alquiler</title>
             <%  
               String nombre = (String) session.getAttribute("nombre");
                Date fechaActual = new Date();
                 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                 String Fecha = formato.format(fechaActual);
             %>
             <%= nombre%>
                <br />
            <%//= Fecha%>
              <link href="../css/stylep.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/AplicativoZComunicaciones/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Alquiler</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Alquiler Items Found)<br />" rendered="#{alquiler.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{alquiler.pagingInfo.itemCount > 0}">
                <h:outputText value="Registro #{alquiler.pagingInfo.firstItem + 1}..#{alquiler.pagingInfo.lastItem} De #{alquiler.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{alquiler.prev}" value="Anterion #{alquiler.pagingInfo.batchSize}" rendered="#{alquiler.pagingInfo.firstItem >= alquiler.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{alquiler.next}" value="Siguiente #{alquiler.pagingInfo.batchSize}" rendered="#{alquiler.pagingInfo.lastItem + alquiler.pagingInfo.batchSize <= alquiler.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{alquiler.next}" value="Ultimo #{alquiler.pagingInfo.itemCount - alquiler.pagingInfo.lastItem}"
                               rendered="#{alquiler.pagingInfo.lastItem < alquiler.pagingInfo.itemCount && alquiler.pagingInfo.lastItem + alquiler.pagingInfo.batchSize > alquiler.pagingInfo.itemCount}"/>
                <h:dataTable value="#{alquiler.alquilerItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{alquiler.editSetup}">
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                          <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
                        <h:commandLink value="Eliminar" action="#{alquiler.remove}">
                            <f:param name="jsfcrud.currentAlquiler" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][alquiler.converter].jsfcrud_invoke}"/>
                        </h:commandLink> 
                        <%
}
                  %> 
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
                <%--
            <br />
            <a href="/AplicativoZComunicaciones/faces/alquiler/Cliente.jsp">Nuevo Alquiler</a>
            <br /><br />          
            <a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Nuevo Proceso</a>
            <br /><br />
            <a href="/AplicativoZComunicaciones/faces/clientes/New.jsp">Nuevo Cliente</a>
            <br /><br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
                --%>
        </h:form>
        </body>
    </html>
</f:view>
