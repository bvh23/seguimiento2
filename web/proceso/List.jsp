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
               
            <ul style="margin-top: 0px"> 
              <li><a href="/AplicativoZComunicaciones/faces/ventas/accesoventas.jsp">Ventas</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/accesomensajeria.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>      
              <li><a href="/AplicativoZComunicaciones/faces/laboratorio/accesolaboratorio.jsp">Laboratorio</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/accesogestion.jsp">Gesti&oacute;n</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/ProcesosUltimos.jsp">&Uacute;ltimo</a></li>
              <li> <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
           </ul>
               
            </div>
      
     
        <head>
            <title>Procesos</title>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
        <h1>Listas Proceso</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Proceso Items Found)<br />" rendered="#{proceso.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{proceso.pagingInfo.itemCount > 0}">
                <h:outputText value="Registro #{proceso.pagingInfo.firstItem + 1}..#{proceso.pagingInfo.lastItem} de #{proceso.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{proceso.prev}" value="Anterior #{proceso.pagingInfo.batchSize}" rendered="#{proceso.pagingInfo.firstItem >= proceso.pagingInfo.batchSize}"/>&nbsp;
                <div style="margin-left:295px;margin-top:-20px ">
                <h:commandLink action="#{proceso.next}" value="Siguiente #{proceso.pagingInfo.batchSize}" rendered="#{proceso.pagingInfo.lastItem + proceso.pagingInfo.batchSize <= proceso.pagingInfo.itemCount}"/>&nbsp;
                </div>
                <h:commandLink action="#{proceso.next}" value="Ultimo #{proceso.pagingInfo.itemCount - proceso.pagingInfo.lastItem}"
                               rendered="#{proceso.pagingInfo.lastItem < proceso.pagingInfo.itemCount && proceso.pagingInfo.lastItem + proceso.pagingInfo.batchSize > proceso.pagingInfo.itemCount}"/>
                <h:dataTable value="#{proceso.procesoItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="ID"/>
                        </f:facet>
                        <h:outputText value="#{item.idProceso}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="V1"/>
                        </f:facet>
                        <h:outputText value="#{item.ventas1}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="V2"/>
                        </f:facet>
                        <h:outputText value="#{item.ventas2}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="V3"/>
                        </f:facet>
                        <h:outputText value="#{item.ventas3}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="GV"/>
                        </f:facet>
                        <h:outputText value="#{item.gerenteVentas}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="STIng"/>
                        </f:facet>
                        <h:outputText value="#{item.STIngreso}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="STRep"/>
                        </f:facet>
                        <h:outputText value="#{item.STReparacion}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="STLib"/>
                        </f:facet>
                        <h:outputText value="#{item.STLiberacion}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="STPend"/>
                        </f:facet>
                        <h:outputText value="#{item.STPendAutorizado}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="ObsST"/>
                        </f:facet>
                        <h:outputText value="#{item.observacionST}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Alm"/>
                        </f:facet>
                        <h:outputText value="#{item.almacen}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="ObsAlm"/>
                        </f:facet>
                        <h:outputText value="#{item.observacionAlmacen}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Alq"/>
                        </f:facet>
                        <h:outputText value="#{item.alquiler}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Fact"/>
                        </f:facet>
                        <h:outputText value="#{item.facturacion}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="AuxC"/>
                        </f:facet>
                        <h:outputText value="#{item.auxContable}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Cart"/>
                        </f:facet>
                        <h:outputText value="#{item.cartera}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Cal"/>
                        </f:facet>
                        <h:outputText value="#{item.calidad}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Ger"/>
                        </f:facet>
                        <h:outputText value="#{item.gerencia}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Serv.C"/>
                        </f:facet>
                        <h:outputText value="#{item.servicioCliente}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Rec"/>
                        </f:facet>
                        <h:outputText value="#{item.recepcion}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="F.desp"/>
                        </f:facet>
                        <h:outputText value="#{item.fechadespacho}"/>
                    </h:column>
                       <h:column>
                        <f:facet name="header">
                            <h:outputText value="Observaciones"/>
                        </f:facet>
                        <h:outputText value="#{item.observaciones}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Usuario"/>
                        </f:facet>
                        <h:outputText value="#{item.usuario}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Cod.Cli"/>
                        </f:facet>
                        <h:outputText value="#{item.codigoCliente}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{proceso.detailSetup}">
                        <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{proceso.editSetup}">
                        <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
</h:commandLink> 
                        <h:outputText value=" "/>
                        <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario2="Med-calidad";
            String usuario3="Med-gerencia";
                         
            if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)) 
            {
                %>
                        <h:commandLink value="Eliminar" action="#{proceso.remove}">
                        <f:param name="jsfcrud.currentProceso" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][proceso.converter].jsfcrud_invoke}"/>
                        </h:commandLink>  
                  <%
}
                  %>  
                    </h:column>

                </h:dataTable>
              
            <h:commandLink action="#{proceso.prev}" value="Anterior #{proceso.pagingInfo.batchSize}" rendered="#{proceso.pagingInfo.firstItem >= proceso.pagingInfo.batchSize}"/>&nbsp;
                     
            <h:commandLink action="#{proceso.next}" value="Siguiente #{proceso.pagingInfo.batchSize}" rendered="#{proceso.pagingInfo.lastItem + proceso.pagingInfo.batchSize <= proceso.pagingInfo.itemCount}"/>&nbsp;
                  
            <h:commandLink action="#{proceso.next}" value="Ultimo #{proceso.pagingInfo.itemCount - proceso.pagingInfo.lastItem}"
                               rendered="#{proceso.pagingInfo.lastItem < proceso.pagingInfo.itemCount && proceso.pagingInfo.lastItem + proceso.pagingInfo.batchSize > proceso.pagingInfo.itemCount}"/>
         
     
                </h:panelGroup>
            <br />
              <a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Nuevo Proceso</a>
            <br />
            <br />
                <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
        </h:form>
        </body>
    </html>
</f:view>
