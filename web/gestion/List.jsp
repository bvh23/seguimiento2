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
        <div id="menuleft" style="margin-left: -50px">
               
            <ul style="margin-top: 0px"> 
              <li><a href="/AplicativoZComunicaciones/faces/gestion/Cliente.jsp">Gestion</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Proceso</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/clientes/New.jsp">Cliente</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/Pendientes.jsp">Pendientes</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/Filtro/FiltroG.jsp">Filtro</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/ultimasgestiones.jsp">&Uacute;ltimas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
            
           </ul>
               
            </div>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listas de Gestion</title>
            <%  
               String nombre = (String) session.getAttribute("nombre");
                Date fechaActual = new Date();
                 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                 String Fecha = formato.format(fechaActual);
             %>
             <%=nombre%>
                <br />
            <%=Fecha%>
              <link href="../css/stylep.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/AplicativoZComunicaciones/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: yellow" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listas de Gestion</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Gestion Items Found)<br />" rendered="#{gestion.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{gestion.pagingInfo.itemCount > 0}">
                <h:outputText value="Numero de Registros #{gestion.pagingInfo.firstItem + 1}..#{gestion.pagingInfo.lastItem} De #{gestion.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{gestion.prev}" value="Anteriores #{gestion.pagingInfo.batchSize}" rendered="#{gestion.pagingInfo.firstItem >= gestion.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{gestion.next}" value="Proximó #{gestion.pagingInfo.batchSize}" rendered="#{gestion.pagingInfo.lastItem + gestion.pagingInfo.batchSize <= gestion.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{gestion.next}" value="Ultimos #{gestion.pagingInfo.itemCount - gestion.pagingInfo.lastItem}"
                               rendered="#{gestion.pagingInfo.lastItem < gestion.pagingInfo.itemCount && gestion.pagingInfo.lastItem + gestion.pagingInfo.batchSize > gestion.pagingInfo.itemCount}"/>
                <h:dataTable value="#{gestion.gestionItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                            <h:outputText value="Observaciones"/>
                        </f:facet>
                        <h:outputText value="#{item.observacionesGestion}"/>
                    </h:column>
                    
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{gestion.detailSetup}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{gestion.editSetup}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                                  <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-auditoria";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)|| usuario3.equals(nombre1)) 
            {
                %>
                            <h:commandLink value="Eliminar" action="#{gestion.remove}">
                            <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][gestion.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                       <%
}
                  %>
                    </h:column>
                </h:dataTable>
            </h:panelGroup>
                <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
            String usuario3="Med-facturacion";
            String usuario4="Med-auditoria";

                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)|| usuario3.equals(nombre1)|| usuario4.equals(nombre1)) 
            {
                %>
              
            <br/>
            <a href="/AplicativoZComunicaciones/faces/gestion/Cliente.jsp">Nuevo Registro de Gestion</a>
            <br/>
            <br/>
            <a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Nuevo Proceso</a>
            <br/>
            <br/>
            <a href="/AplicativoZComunicaciones/faces/clientes/New.jsp">Nuevo Cliente</a>
            <br/><br/><br/><br/>
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
           
                  <%
}
                  %>
        </h:form>
        </body>
    </html>
</f:view>
