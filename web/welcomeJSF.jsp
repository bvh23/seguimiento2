<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Login</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Buscador</title>
        </head>
      <body onload="saludo()" onunload="despedida()">

<script type="text/javascript">
function saludo() {alert('Bienvenido a la página de Gestión Interna')}
</script>

        <div id="container">
        <nav id="menu">
             <ul> 
                 <h1 style="margin-top:-65px" >Gesti&oacute;n Interna</h1>
                 <li></li>
                 <%--
                           <li> 
            
                <h:form>
                    <h:commandLink action="{ventas.listSetup}" value="Ventas"/>
                </h:form>
                           
                <h:form>
                    <h:commandLink action="{mensajeria.listSetup}" value="Mensajeria"/>
                </h:form>
                           </li>
                           <li>
                <h:form>
                    <h:commandLink action="{laboratorio.listSetup}" value="Laboratorio"/>
                </h:form>
                           </li>
                           <li>
                <h:form>
                    <h:commandLink action="{gestion.listSetup}" value="Gestion"/>
                </h:form>
                           </li>
                           <li>
                <h:form>
                    <h:commandLink action="{alquiler.listSetup}" value="Alquiler"/>
                </h:form>
                           </li> 
                           <li>
                <h:form>
                    <h:commandLink action="{proceso.listSetup}" value="Proceso"/>
                </h:form>
                           </li>
                           
                           <li>
                <h:form>
                    <h:commandLink action="{clientes.listSetup}" value="Clientes"/>
                </h:form>
                           </li>
                           <li>
                <h:form>
                    <h:commandLink action="{login.listSetup}" value="Login"/>
                </h:form>
                           </li>
                           --%>
                           
              </ul>
        </nav>
          <div id="cuerpo">
              <div id="imagen-izq"> <img src="img/2.jpg"/>
            </div>
              <div id="login">
        <table>  
             <form action="validar.jsp">
                 <tbody>
                <tr>
                <td width="62" height="27" >Usuario</td>
                </tr>
                <tr>
                <td width="193"><input type="text" name="T_usuario" value="" /></td>
                </tr>
                <tr>
                    <td height="27" >Clave</td>
                </tr>
                <tr>
                  <td><input type="password" name="T_clave" value="" /></td>
                </tr>
                <tr>
                     <td height="29"><input type="submit" value="Ingresar"  class="boton"/></td>
                </tr>
                </tbody>
            </form>
        </table>
               </div>
             </div>
                           
           </div>
                            
                                  
                           
        </body>
    </html>
</f:view>
