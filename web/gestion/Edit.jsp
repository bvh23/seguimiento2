<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Gestion</title>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">   </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editar Gestion</h1>
        <h:form>
            <h:panelGrid columns="2">
                         <h:outputText value="IdGestion:"/>
                  <h:inputText id="idGestion" styleClass="cboId" style="width: 205px"  value="#{gestion.gestion.idGestion}" title="IdGestion" required="true" requiredMessage="The idGestion field is required." />
               
                <h:outputText value="Usuario:"/>
                <h:inputText id="usuario" styleClass="cboUsuarios" style="width: 205px"  value="#{gestion.gestion.usuario}" title="Usuario" required="true" requiredMessage="The usuario field is required." >
                    <f:selectItems value="#{login.loginItemsAvailableSelectOne}"/>
                </h:inputText>
                
                <h:outputText value="CodigoCliente:"/>
                <h:inputText id="codigoCliente" styleClass="cboCliente" style="width: 205px"  value="#{gestion.gestion.codigoCliente}" title="CodigoCliente" required="true" requiredMessage="The codigoCliente field is required." >
                <f:selectItems value="#{clientes.clientesItemsAvailableSelectOne}"/>
                </h:inputText>
                
                <h:outputText value="FechaIngreso "/>
                <h:inputText id="fechaIngreso"  styleClass="cbofecha"  style="width: 205px"  value="#{gestion.gestion.fechaIngreso}" title="FechaIngreso" required="true" requiredMessage="The fechaIngreso field is required." >
                    <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="Contacto:"/>
                <h:inputText id="contacto" value="#{gestion.gestion.contacto}" style="width: 205px"     title="Contacto" required="true" requiredMessage="The Contacto field is required." />
                
                <h:outputText value="Horario:"/>
                <h:selectOneMenu id="horario" style="width: 205px" 
                     value="#{gestion.gestion.horario}" title="Horario" >
                <f:selectItem id="item1" itemLabel="TARDE" itemValue="TARDE" />
                <f:selectItem id="item2" itemLabel="MAÑANA" itemValue="MANANA" />                                                                                                                                                 
                </h:selectOneMenu>
               
                <h:outputText value="Zona:"/>
                <h:selectOneMenu id="zona" style="width: 205px"
                   value="#{gestion.gestion.zona}" title="Zona" >
                <f:selectItem id="item3" itemLabel="SUR" itemValue="SUR" />
                <f:selectItem id="item4" itemLabel="NORTE" itemValue="NORTE" />
                </h:selectOneMenu>
                <h:outputText value="Prioridad:"/>
                <h:selectOneMenu id="prioridad" style="width: 205px"
                                  value="#{gestion.gestion.prioridad}" title="Prioridad"  > 
                <f:selectItem id="item5" itemLabel="- - - - - - -" itemValue=" " />
                <f:selectItem id="item6" itemLabel="A" itemValue="A" />
                <f:selectItem id="item7" itemLabel="B" itemValue="B" />
                <f:selectItem id="item8" itemLabel="C" itemValue="C" />
                 </h:selectOneMenu>
                 <h:outputText value="Observaciones"/>
                 <h:inputTextarea style="width: 205px" id="observacionesGestion" value="#{gestion.gestion.observacionesGestion}" title="FechaIngreso"/>
                

            </h:panelGrid>
            <br />
            <h:commandLink action="#{gestion.edit}" value="Guardar">
                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{gestion.detailSetup}" value="Ver" immediate="true">
                <f:param name="jsfcrud.currentGestion" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][gestion.gestion][gestion.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{gestion.listSetup}" value="Ver todos los registros" immediate="true"/>
            <br />
            <br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
