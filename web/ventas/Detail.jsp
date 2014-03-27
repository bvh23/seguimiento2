<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Ventas</title>
         <link href="../css/stylep.css" rel="stylesheet" type="text/css">  </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Ventas</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="IdVenta:"/>
                <h:outputText value="#{ventas.ventas.idVenta}" title="IdVenta" />
                <h:outputText value="FechaIngreso:"/>
                <h:outputText value="#{ventas.ventas.fechaIngreso}" title="FechaIngreso" >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:outputText>
                <h:outputText value="OrdenPedido:"/>
                <h:outputText value="#{ventas.ventas.ordenPedido}" title="OrdenPedido" />
                <h:outputText value="Horario:"/>
                <h:outputText value="#{ventas.ventas.horario}" title="Horario" />
                <h:outputText value="Contacto:"/>
                <h:outputText value="#{ventas.ventas.contacto}" title="Contacto" />
                <h:outputText value="Zona:"/>
                <h:outputText value="#{ventas.ventas.zona}" title="Zona" />
                <h:outputText value="Prioridad:"/>
                <h:outputText value="#{ventas.ventas.prioridad}" title="Prioridad" />
                <h:outputText value="ObservacionesVentas:"/>
                <h:outputText value="#{ventas.ventas.observacionesVentas}" title="ObservacionesVentas" />
                <h:outputText value="FechaDespacho:"/>
                <h:outputText value="#{ventas.ventas.fechaDespacho}" title="FechaDespacho" >
                    <f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
                </h:outputText>
                <h:outputText value="Usuario:"/>
                <h:panelGroup>
                    <h:outputText value="#{ventas.ventas.usuario}"/>
                    <h:panelGroup rendered="#{ventas.ventas.usuario != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{login.detailSetup}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="ventas"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.VentasController"/>
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
                       
                        <h:commandLink value="Editar" action="#{login.editSetup}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="ventas"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.VentasController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        
                        <h:commandLink value="Eliminar" action="#{login.remove()}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentLogin" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas.usuario][login.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="ventas"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.VentasController"/>
                        </h:commandLink>
                      
                         <%
}
                  %>  
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>
                <h:outputText value="CodigoCliente:"/>
                <h:panelGroup>
                    <h:outputText value="#{ventas.ventas.codigoCliente}"/>
                    <h:panelGroup rendered="#{ventas.ventas.codigoCliente != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Ver" action="#{clientes.detailSetup}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="ventas"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.VentasController"/>
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
                        <h:commandLink value="Editar" action="#{clientes.editSetup}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="ventas"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.VentasController"/>
                        </h:commandLink>
                     
                        <h:outputText value=" "/>
                        <h:commandLink value="Eliminar" action="#{clientes.destroy}">
                            <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentClientes" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas.codigoCliente][clientes.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="ventas"/>
                            <f:param name="jsfcrud.relatedControllerType" value="formularios.VentasController"/>
                        </h:commandLink>
                        
                           <%
}
                  %>  
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
                                 <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario1="Med-calidad";
            String usuario2="Med-gerencia";
                         
            if(  usuario1.equals(nombre1) || usuario2.equals(nombre1)) 
            {
                %>
        
            <h:commandLink action="#{ventas.remove}" value="Eliminar">
                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}" />
            </h:commandLink>
          
            <br />
            <br />
            <h:commandLink action="#{ventas.editSetup}" value="Editar">
                <f:param name="jsfcrud.currentVentas" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ventas.ventas][ventas.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <%
}
                  %>  
            <br />
            <h:commandLink action="#{ventas.createSetup}" value="Nueva Venta" />
            <br />
            <h:commandLink action="#{ventas.listSetup}" value="Ver Todos los Registros"/>
            <br />
            <br />
                <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
