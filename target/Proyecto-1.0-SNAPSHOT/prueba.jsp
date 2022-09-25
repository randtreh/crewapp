<%-- 
    Document   : prueba
    Created on : 29 jul. 2022, 23:16:55
    Author     : user
--%>

<%@page import="config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    Conexion cn = new Conexion();
    cn.ejecutarSentenciasSql("INSERT INTO venta (Placa,Cliente,Fecha,Hora) VALUES ('ttt111','Randy',CURRENT_DATE,CURRENT_TIME)");
    
    %>
    <body>
        <form action="prueba.jsp" method="get">
            <input class="btn btn-warning btn-b btn-outline-dark" type="submit" value="TERMINAR" name="aceptar" >
        </form>
    </body>
</html>
