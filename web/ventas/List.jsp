<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<f:view>
    <html>
        <div id="menuleft" style="left: 25%">
               
            <ul style="margin-top: 0px;margin-left: -80px"> 
              <li><a href="/AplicativoZComunicaciones/faces/ventas/Cliente.jsp">Ventas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Proceso</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/clientes/New.jsp">Cliente</a></li>  
              <li><a href="/AplicativoZComunicaciones/faces/Filtro/FiltroV.jsp" >Filtro</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/ventas/ultimasventas.jsp">&Uacute;ltimas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
           </ul>
               
            </div>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listas</title>
             <%  
               String nombre = (String) session.getAttribute("nombre");
                Date fechaActual = new Date();
                 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                 String Fecha = formato.format(fechaActual);
             %>
             <span id="lblNombreUsuario">
                 <%=nombre%>
             </span>
              <br/>
            <%//=Fecha%>
              <link href="../css/stylep.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/AplicativoZComunicaciones/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
            <h1>Listas de Ventas</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No hay ninguna Venta)<br />" rendered="#{ventas.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{ventas.pagingInfo.itemCount > 0}">
                <h:outputText value="Numero de Registros #{ventas.pagingInfo.firstItem + 1}..#{ventas.pagingInfo.lastItem} De #{ventas.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{ventas.prev}" value="Anteriores #{ventas.pagingInfo.batchSize}" rendered="#{ventas.pagingInfo.firstItem >= ventas.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{ventas.next}" value="Proximó #{ventas.pagingInfo.batchSize}" rendered="#{ventas.pagingInfo.lastItem + ventas.pagingInfo.batchSize <= ventas.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{ventas.next}" value="Ultimos #{ventas.pagingInfo.itemCount - ventas.pagingInfo.lastItem}"
                               rendered="#{ventas.pagingInfo.lastItem < ventas.pagingInfo.itemCount && ventas.pagingInfo.lastItem + ventas.pagingInfo.batchSize > ventas.pagingInfo.itemCount}"/>
                <h:dataTable value="#{ventas.ventasItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id Venta"/>
                        </f:facet>
                        <h:outputText value="#{item.idVenta}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Fecha de Ingreso"/>
                        </f:facet>
                        <h:outputText value="#{item.fechaIngreso}">
                            <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                        </h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Orden Pedido"/>
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
                            <h:outputText value="Observaciones de Ventas"/>
                        </f:facet>
                        <h:outputText value="#{item.observacionesVentas}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Fecha de Despacho"/>
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
                            <h:outputText value="Codigo de Cliente"/>
                        </f:facet>
                        <h:outputText value="#{item.codigoCliente}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{ventas.detailSetup}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{ventas.editSetup}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
               
                    <h:commandLink value="Eliminar" action="#{ventas.remove}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ventas.converter].jsfcrud_invoke}"/>
                        </h:commandLink> 
                  <%
}
                  %>  
                      
                    </h:column>
                </h:dataTable>
            </h:panelGroup>
            <br/><br/>            
            <a href="/AplicativoZComunicaciones/faces/ventas/Cliente.jsp">Nueva Ventas</a>
            <br/><br/>
            <a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Nuevo Proceso</a>
            <br/><br/>             
            <a href="/AplicativoZComunicaciones/faces/clientes/New.jsp">Nuevo Cliente</a>
            <br/><br/><br/><br/>
              <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
