<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Login</title>
       <link href="../css/stylep.css" rel="stylesheet" type="text/css">   </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>New Login</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{login.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="Usuario:"/>
                <h:inputText id="usuario" value="#{login.login.usuario}" title="Usuario" required="true" requiredMessage="The usuario field is required." />
                <h:outputText value="Nombre:"/>
                <h:inputText id="nombre" value="#{login.login.nombre}" title="Nombre" required="true" requiredMessage="The nombre field is required." />
                <h:outputText value="Contrasena:"/>
                <h:inputText id="contrasena" value="#{login.login.contrasena}" title="Contrasena" required="true" requiredMessage="The contrasena field is required." />
                <h:outputText value="Ciudad:"/>
                <h:inputText id="ciudad" value="#{login.login.ciudad}" title="Ciudad" required="true" requiredMessage="The ciudad field is required." />
                <h:outputText value="AreaTrabajo:"/>
                <h:inputText id="areaTrabajo" value="#{login.login.areaTrabajo}" title="AreaTrabajo" required="true" requiredMessage="The areaTrabajo field is required." />
       
            </h:panelGrid>
            <br />
            <h:commandLink action="#{login.create}" value="Crear"/>
            <br />
            <br />
            <h:commandLink action="#{login.listSetup}" value="Ver todos los Registros " immediate="true"/>
            <br />
            <br />
           <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>

        </h:form>
        </body>
    </html>
</f:view>
