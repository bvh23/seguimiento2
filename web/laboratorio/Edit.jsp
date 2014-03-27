<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Laboratorio</title>
        <link href="../css/stylep.css" rel="stylesheet" type="text/css">  </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editar Laboratorio</h1>
        <h:form>
            <h:panelGrid columns="2">
              <h:outputText value="IdLaboratorio:"/>
                <h:inputText id="idLaboratorio"  styleClass="cboId" style="width: 205px" value="#{laboratorio.laboratorio.idLaboratorio}" title="IdLaboratorio" required="true" requiredMessage="The idLaboratorio field is required." />
                <h:outputText value="OrdenTecnica:"/>
                <h:inputText id="ordenTecnica" style="width: 205px" value="#{laboratorio.laboratorio.ordenTecnica}" title="OrdenTecnica" required="true" requiredMessage="The ordenTecnica field is required." />
                <h:outputText value="FechaIngreso "/>
                <h:inputText id="fechaIngreso"  style="width: 205px" styleClass="cbofecha"  value="#{laboratorio.laboratorio.fechaIngreso}" title="FechaIngreso" required="true" requiredMessage="The fechaIngreso field is required." >
                    <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                </h:inputText>
                <h:outputText value="Contacto:"/>
                <h:inputText id="contacto" value="#{laboratorio.laboratorio.contacto}" style="width: 205px"     title="Contacto" required="true" requiredMessage="The Contacto field is required." />
                
                <h:outputText value="Horario:"/>
                <h:selectOneMenu id="horario" style="width: 205px" 
                     value="#{laboratorio.laboratorio.horario}" title="Horario" >
                <f:selectItem id="item1" itemLabel="TARDE" itemValue="TARDE" />
                <f:selectItem id="item2" itemLabel="MAÑANA" itemValue="MANANA" />                                                                                                                                                 
                </h:selectOneMenu>
               
                <h:outputText value="Zona:"/>
                <h:selectOneMenu id="zona" style="width: 205px"
                   value="#{laboratorio.laboratorio.zona}" title="Zona" >
                <f:selectItem id="item3" itemLabel="SUR" itemValue="SUR" />
                <f:selectItem id="item4" itemLabel="NORTE" itemValue="NORTE" />
                </h:selectOneMenu>
                <h:outputText value="Prioridad:"/>
                <h:selectOneMenu id="prioridad" style="width: 205px"
                                  value="#{laboratorio.laboratorio.prioridad}" title="Prioridad"  > 
                <f:selectItem id="item5" itemLabel="- - - - - - -" itemValue=" " />
                <f:selectItem id="item6" itemLabel="A" itemValue="A" />
                <f:selectItem id="item7" itemLabel="B" itemValue="B" />
                <f:selectItem id="item8" itemLabel="C" itemValue="C" />
                 </h:selectOneMenu>
                 <h:outputText value="Observaciones"/>
                 <h:inputTextarea style="width: 205px" id="observacionesGestion" value="#{laboratorio.laboratorio.observacionesLaboratorio}" title="FechaIngreso"/>
                
                <h:outputText value="Usuario:"/>
                <h:inputText id="usuario" style="width: 205px" styleClass="cboUsuarios" value="#{laboratorio.laboratorio.usuario}" title="Usuario" required="true" requiredMessage="The usuario field is required." >
                    <f:selectItems value="#{login.loginItemsAvailableSelectOne}"/>
                </h:inputText>
                <h:outputText value="CodigoCliente:"/>
                <h:inputText styleClass="cboCliente" style="width: 205px" id="codigoCliente" value="#{laboratorio.laboratorio.codigoCliente}" title="CodigoCliente" required="true" requiredMessage="The codigoCliente field is required." >
                    <f:selectItems value="#{clientes.clientesItemsAvailableSelectOne}"/>
                </h:inputText>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{laboratorio.edit}" value="Guardar">
                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{laboratorio.detailSetup}" value="Ver" immediate="true">
                <f:param name="jsfcrud.currentLaboratorio" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][laboratorio.laboratorio][laboratorio.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{laboratorio.listSetup}" value="Ver todos los Registros Laboratorio Items" immediate="true"/>
            <br />
            <br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>

        </h:form>
        </body>
    </html>
</f:view>
