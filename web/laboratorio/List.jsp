<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<f:view>
    <html>
         <div id="menuleft">
               
            <ul> 
              <li><a href="/AplicativoZComunicaciones/faces/ventas/accesoventas.jsp">Ventas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/accesomensajeria.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>      
              <li><a href="/AplicativoZComunicaciones/faces/laboratorio/accesolaboratorio.jsp">Laboratorio</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/accesogestion.jsp">Gesti&oacute;n</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
             </ul>
               
          </div>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Laboratorio</title>
    <%  
               String nombre = (String) session.getAttribute("nombre");
                Date fechaActual = new Date();
                 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                 String Fecha = formato.format(fechaActual);
             %>
             <%=nombre%>
                <br />
            <%//=Fecha%>
              <link href="../css/stylep.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/AplicativoZComunicaciones/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listas de Laboratorio</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Laboratorio Items Found)<br />" rendered="#{laboratorio.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{laboratorio.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{laboratorio.pagingInfo.firstItem + 1}..#{laboratorio.pagingInfo.lastItem} of #{laboratorio.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{laboratorio.prev}" value="Previous #{laboratorio.pagingInfo.batchSize}" rendered="#{laboratorio.pagingInfo.firstItem >= laboratorio.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{laboratorio.next}" value="Next #{laboratorio.pagingInfo.batchSize}" rendered="#{laboratorio.pagingInfo.lastItem + laboratorio.pagingInfo.batchSize <= laboratorio.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{laboratorio.next}" value="Remaining #{laboratorio.pagingInfo.itemCount - laboratorio.pagingInfo.lastItem}"
                               rendered="#{laboratorio.pagingInfo.lastItem < laboratorio.pagingInfo.itemCount && laboratorio.pagingInfo.lastItem + laboratorio.pagingInfo.batchSize > laboratorio.pagingInfo.itemCount}"/>
                <h:dataTable value="#{laboratorio.laboratorioItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                            <h:outputText value="Contacto"/>
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
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{laboratorio.editSetup}">
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        
                      
                        <h:outputText value=" "/>
                         <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario2="Med-calidad";
            String usuario3="Med-gerencia";
                         
            if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)) 
            {
                %>
               
                        <h:commandLink value="Eliminar" action="#{laboratorio.remove}">
                            <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][laboratorio.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                                         
                    <% } 
                    %>
</h:column>
                </h:dataTable>
            </h:panelGroup>
            <br />
             <a href="/AplicativoZComunicaciones/faces/laboratorio/Cliente.jsp">Nuevo Registro de Laboratorio</a>
             <br />
            <br />
    <a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Nuevo Proceso</a>
            <br />
            <br /><br /><br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
