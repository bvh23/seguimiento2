<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ZComunicaciones</title>
        
          <%  
             String nombre1 = (String) session.getAttribute("nombre");
        
             %>  
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    #apDiv1
    {
	position: absolute;
	left: 808px;
	top: 10px;
	width: 234px;
	height: 930px;
	z-index: 1;
    } 
    </style>
    </head>
   
        
        <body onload="saludo()">

             
         
         <div id="container">
              <div id="header"> 
                <p>
                  <h:form>
                    
                  <%=nombre1%>
                  <p>
                      <a href="salir.jsp">Salir</a>
                  </p>
                  <h:commandLink action="busqueda.perfilusuario" value="perfil"/>
                  </h:form>      
                </p>
                  <div id="logo">
                  </div>
                  <h1>Te acompa&ntilde;a</h1>
                </div>
        <nav id="menu">
           <ul> 
              <li><a href="/AplicativoZComunicaciones/faces/ventas/accesoventas.jsp">Ventas</a>
               </li>
              <li><a href="/AplicativoZComunicaciones/faces/mensajeria/accesomensajeria.jsp">Mensajer&iacute;a</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/alquiler/accesoalquiler.jsp">Alquiler</a></li>      
              <li><a href="/AplicativoZComunicaciones/faces/laboratorio/accesolaboratorio.jsp">Laboratorio</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/gestion/accesogestion.jsp">Gesti&oacute;n</a></li>
              <li><a href="/AplicativoZComunicaciones/faces/proceso/List.jsp" >Proceso</a></li>
               
           </ul>
        </nav>
                 <div id="cuerpo">
                     </br></br>
                     <a style="font-size:25px"></a>
                         </br></br>
                         <a style="position: absolute; margin-left: 550px; margin-top:70px;font-size:20px">
                         </br>  
                         </br>
                         </br></a>
                         <%--
                     <img src="img/2.jpg" style="position: absolute;margin-left:150px;margin-top: -30px;width: 500px">
                     <a style="font-size:25px;margin-left:180px;position: absolute;margin-top: 220px" >Feliz Navidad para tod@s y Prospero 2014!!</a>
                     <h3 style=" padding-top: 25px; font-size: 25px; text-align: center;"> </h3>
                      <div id="imagenesgif"><img src="img/feliznavidad.gif" style="width:200px;margin-top:5%;margin-left:-18%;position:fixed;float:right"/>
                      </div>    
                     </div>
                         --%>
                
         </div>
              
     </body>
     <%--
     <div id="imagenes" style="width:30px; margin-left:5px;position: absolute;margin-top: -100px" >
     <script language="JavaScript1.1" >
var specifyimage=new Array();
specifyimage[0]=src="img/arbol.gif";
specifyimage[1]=src="img/pesebre.jpg";

var delay=3000 //3 seconds

//Counter for array 
var count =1;

var cubeimage=new Array()
for (i=0;i<specifyimage.length;i++){
cubeimage[i]=new Image()
cubeimage[i].src=specifyimage[i]
}

function movecube(){
if (window.createPopup)
cube.filters[0].apply()
document.images.cube.src=cubeimage[count].src;
if (window.createPopup)
cube.filters[0].play()
count++;
if (count==cubeimage.length)
count=0;
setTimeout("movecube()",delay)
}

window.onload=new Function("setTimeout('movecube()',delay)")
</script><img src="boy4.gif" name="cube" border="0" style="filter:progid:DXImageTransform.Microsoft.Stretch(stretchStyle=#39, PUSH=#39)" /> 
     </div>   
     --%>
</html>


