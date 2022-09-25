<%-- 
    Document   : mensajeCita
    Created on : 22/03/2022, 12:18:52 p. m.
    Author     : Randy Trejos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        HttpSession sesion = request.getSession();
    %>
    <body>
       
        <div class="container mt-4 col-lg-4">
        <div class="card col-sm-10">
        <div class="card-body">
        <form class="form-sign" action="index.jsp" method="post">
        <div class="form-group text-center">
        <img style="display: block;margin: auto;margin-top:200px;" src="Imagenes/Logo1.jpg" /><br>
        <h3 style="text-align: center;">CITA AGENDADA CON EXITO</h3><br>
        <h4 style="text-align: center;">Placa : <%=sesion.getAttribute("placa")%></h4>
        <h4 style="text-align: center;">Fecha : <%=sesion.getAttribute("fecha")%></h4>
        <h4 style="text-align: center;">Hora : <%=sesion.getAttribute("hora")%></h4>
        <h4 style="text-align: center;">Sede : <%=sesion.getAttribute("sede")%></h4>
        <input style="display: block;margin: auto;"  type="submit" name="regresar" value="REGRESAR" >
        </form>
        </div>
        </div>
        </div>
        

    </body>
</html>
