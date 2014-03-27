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
            <title> Usuarios</title>
        <%  
               String nombre = (String) session.getAttribute("nombre");
                Date fechaActual = new Date();
                 SimpleDateFormat formato = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
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
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listas de Usuarios</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Login Items Found)<br />" rendered="#{login.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{login.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{login.pagingInfo.firstItem + 1}..#{login.pagingInfo.lastItem} of #{login.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{login.prev}" value="Previous #{login.pagingInfo.batchSize}" rendered="#{login.pagingInfo.firstItem >= login.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{login.next}" value="Next #{login.pagingInfo.batchSize}" rendered="#{login.pagingInfo.lastItem + login.pagingInfo.batchSize <= login.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{login.next}" value="Remaining #{login.pagingInfo.itemCount - login.pagingInfo.lastItem}"
                               rendered="#{login.pagingInfo.lastItem < login.pagingInfo.itemCount && login.pagingInfo.lastItem + login.pagingInfo.batchSize > login.pagingInfo.itemCount}"/>
                <h:dataTable value="#{login.loginItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Usuario"/>
                        </f:facet>
                        <h:outputText value="#{item.usuario}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Nombre"/>
                        </f:facet>
                        <h:outputText value="#{item.nombre}"/>
                    </h:column>
                    <%--<h:column>
                        <f:facet name="header">
                            <h:outputText value="Contrasena"/>
                        </f:facet>
                        <h:outputText value="#{item.contrasena}"/>
                    </h:column> --%>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Ciudad"/>
                        </f:facet>
                        <h:outputText value="#{item.ciudad}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="AreaTrabajo"/>
                        </f:facet>
                        <h:outputText value="#{item.areaTrabajo}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{login.detailSetup}">
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][login.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{login.editSetup}">
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][login.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Eliminar" action="#{login.remove}">
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][login.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{login.createSetup}" value="Nuevo usuario"/>
            <br />
            <br />
             <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
