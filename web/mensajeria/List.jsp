<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<f:view>
    <html>
        <div id="menuleft" style="left: 18%">
               
           <ul> 
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/Cliente.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Proceso</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/ultimosmensajeria.jsp">&uacute;ltimos</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/imprimir.jsp">Imprimir</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/Pendientes.jsp">Pendientes</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/Filtro/FiltroM.jsp">Filtro</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/Inicio.jsp">Inicio</a></li>
           </ul>
               
            </div>
        <%--
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
		<script type="text/javascript">
			var doc = $(document);
			doc.on("ready", inicializar);

			function inicializar()
			{
				$(".popup").css("visibility", "visible");
				$(".popup").css("opacity", "0");

				$("#btnEliminar").on("click", click);
				$("#btnCerrar").on("click", click2);
			}

			function click(){
				$(".popup").animate({left: '48%', opacity: 1}, 250, function(){
					$(".popup").animate({top: '45%'}, 250);
				});
			}
			function click2(){
				$(".popup").animate({top: '50%'}, 250, function(){
					$(".popup").animate({left: '52%', opacity: 0}, 250, function(){
						
						
						
					});
				});
			}
		</script>
                <div class="popup">
		<div style="padding: 40px;">
			<div>Desea eliminar el contenido?</div>
			<input id="btnCerrar" type="button" value="Cerrar" />
		</div>
	</div>
                <input id="btnEliminar" type="button" value="Eliminar"/>
        --%>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Mensajer&iacute;a</title>
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
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
            <h1>Listas de Mensajer&iacute;a</h1>
               
               
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Mensajeria Items Found)<br />" rendered="#{mensajeria.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{mensajeria.pagingInfo.itemCount > 0}">
                <h:outputText value="Registro #{mensajeria.pagingInfo.firstItem + 1}..#{mensajeria.pagingInfo.lastItem} De #{mensajeria.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{mensajeria.prev}" value="Anterior #{mensajeria.pagingInfo.batchSize}" rendered="#{mensajeria.pagingInfo.firstItem >= mensajeria.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{mensajeria.next}" value="Siguiente #{mensajeria.pagingInfo.batchSize}" rendered="#{mensajeria.pagingInfo.lastItem + mensajeria.pagingInfo.batchSize <= mensajeria.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{mensajeria.next}" value="Ultimo #{mensajeria.pagingInfo.itemCount - mensajeria.pagingInfo.lastItem}"
                               rendered="#{mensajeria.pagingInfo.lastItem < mensajeria.pagingInfo.itemCount && mensajeria.pagingInfo.lastItem + mensajeria.pagingInfo.batchSize > mensajeria.pagingInfo.itemCount}"/>
                <h:dataTable value="#{mensajeria.mensajeriaItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                      
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="ID" />
                        </f:facet>
                        <h:outputText value="#{item.idMensajeria}"/>
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
                            <h:outputText value="O.Pedido"/>
                        </f:facet>
                        <h:outputText value="#{item.ordenPedido}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Contacto"/>
                        </f:facet>
                        <h:outputText value="#{item.contacto}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Priori"/>
                        </f:facet>
                        <h:outputText value="#{item.prioridad}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Zona"/>
                        </f:facet>
                        <h:outputText value="#{item.zona}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Obs.Mensajeria"/>
                        </f:facet>
                        <h:outputText value="#{item.observacionesMensajeria}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Usuario"/>
                        </f:facet>
                        <h:outputText value="#{item.usuario}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Cod.Cliente"/>
                        </f:facet>
                        <h:outputText value="#{item.codigoCliente}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{mensajeria.detailSetup}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Editar" action="#{mensajeria.editSetup}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                               <%
            String nombre1 = (String) session.getAttribute("nombre");
           
         
            String usuario2="Med-calidad";
            String usuario3="Med-gerencia";
                         
            if(  usuario2.equals(nombre1) || usuario3.equals(nombre1)) 
            {
                %>  
                     <h:commandLink value="Eliminar" action="#{mensajeria.remove}">
                            <f:param name="jsfcrud.currentMensajeria" value="#{jsfcrud_class['formularios.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][mensajeria.converter].jsfcrud_invoke}"/>
</h:commandLink>
                         <% } 
                    %>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <a href="/AplicativoZComunicaciones/faces/mensajeria/Cliente.jsp">Nueva Mensajer&iacute;a</a>
             <a href="/AplicativoZComunicaciones/faces/proceso/Cliente.jsp">Nuevo Proceso</a>
            <a href="/AplicativoZComunicaciones/faces/mensajeria/imprimir.jsp">Imprimir</a>      
              
            <br />
            <a href="/AplicativoZComunicaciones/faces/Inicio.jsp">INICIO</a>
            <br />
        </h:form>
        </body>
    </html>
</f:view>
