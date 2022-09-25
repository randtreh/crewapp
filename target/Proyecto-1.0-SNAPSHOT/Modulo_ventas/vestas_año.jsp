<%-- 
    Document   : vestas_año
    Created on : 26/07/2022, 12:23:37 p. m.
    Author     : Randy Trejos
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Crew Car Wash Login</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" href="Estilos/Estilos.css" type="text/css"> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=PT+Serif&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <style>
        .contenedor{
            border: solid 2px gainsboro;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px;
        }
        @media screen and (max-width:450px)  {
            .texto{
                font-size: 8px;
            }
        }
        @media screen and (min-width:450px) and (max-width:1200px)  {
            .texto{
                font-size: 15px;
            }
        }
    </style>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("../index.jsp");
            }
            Conexion cn1 = new Conexion();
            String inicio = request.getParameter("inicio");
            String clase = (String) sesion.getAttribute("clase");
        %>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button><br><br>
                <a style="font-size: 13px" class="navbar-brand text-warning" href="#"><%="Sede : " + sesion.getAttribute("Sede") + "  |"%></a><br>
                <a style="font-size: 13px" class="navbar-brand text-warning" href="#"><%="Usuario : " + sesion.getAttribute("user") + "  |"%></a>

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link" aria-current="page" href="../Modulos.jsp">Inicio</a>
                        <a class="nav-link" aria-current="page" href="ventas_dia.jsp">hoy</a>
                        <a class="nav-link" aria-current="page" href="ventas_consulta.jsp">Consulta por fecha</a>
                        <a class="nav-link" aria-current="page" href="ventas_mes.jsp">Consulta Mes</a>
                        <a class="nav-link active" aria-current="page" href="vestas_año.jsp">Consulta Año</a>
                        <a class="nav-link" href="../login.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
        <div  class="container mt-5 contenedor" style="font-size:15px; " >
            <form class="form-sign" action="vestas_año.jsp" method="get" > 
                <div class="container">
                    <div class="row">

                        <div class="col order-last mt-2"><input autofocus="" type="submit" name="accion" value="Buscar" class="btn btn-warning btn-b text-center btn-outline-dark"> </div>
                        <div class="col-md-2">
                            <label for="disabledSelect4" class="form-label">Año :</label>
                            <select name="inicio" id="disabledSelect4" class="form-select" required="">
                                <option disabled="" selected=""></option>
                                <option>2020</option>
                                <option>2021</option>
                                <option>2022</option>
                            </select>
                        </div>
                        <div class="col order-first"></div>
                    </div>
                </div>
            </form>
        </div>
        <div  class="container mt-5 contenedor" style="font-size:14px; " >
            <div class="container mt-2">
                <div class="row">
                    <div class="col order-last">
                    </div>
                    <div class="col text-center"><h4><%="Ventas " + inicio%></h4></div>
                    <div class="col order-first"><img style="width: 150px;" src="../Imagenes/Logo1.jpg"/></div>
                </div>
            </div>
            <table class="table table-sm table-striped table-hover texto mt-4">
                <thead>
                    <tr>
                        <th scope="col">Item</th>
                        <th scope="col">Mes</th>
                        <th scope="col">Cantidad de vehiculos por mes</th>
                        <th scope="col">Total mes</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (request.getParameter("accion") != null) {

                            for (int i = 1; i <= 12; i = i + 1) {
                                String inicio1 = inicio + "-0" + i;
                                String mes = cn1.mes_print(i);
                                if (i >= 10) {
                                    inicio1 = inicio + "-" + i;
                                }
                                ResultSet rs1 = cn1.consultas(" SELECT Fecha, COUNT(Fecha), SUM(Valor) FROM ventas WHERE Fecha like '%" + inicio1 + "%' AND Sede = '" + sesion.getAttribute("Sede")+ "';");
                                while (rs1.next()) {
                    %>

                    <tr>
                        <td><input type="button" name="item" style="width: 18px;height: 20px;"></td>
                        <td><%= mes %>
                        </td>
                        <td><%= rs1.getString(2)%></td>
                        <td><%="$ " + rs1.getString(3)%></td>

                    </tr>
                    <%
                                }
                                inicio1 = inicio;
                            }
                        
                    %>
                    
                    <tr class="text-center">

                        <th style="border-top: 2px solid black;"></th>
                        <th style="border-top: 2px solid black;"></th>
                            <%                                ResultSet rs2 = cn1.consultas(" SELECT Fecha, COUNT(Fecha), SUM(Valor) FROM ventas WHERE Fecha like '%" + inicio + "%' AND Sede = '" + sesion.getAttribute("Sede")+ "';");
                                while (rs2.next()) {
                            %>
                        </th>
                        <th style="border-top: 2px solid black;text-align: right;"><strong><%="TOTAL AÑO " + inicio%></strong></th>
                        <th style="border-top: 2px solid black;text-align: left;background-color: cadetblue">
                            <%="$ " + rs2.getString(3)%>
                        </th>
                        <%
                                }
                            }
                        %>
                    </tr>
                </tbody>
            </table><br>
        </div>     </div> 
</body>
</html>
