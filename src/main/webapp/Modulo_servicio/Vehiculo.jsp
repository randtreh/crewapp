<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Crew Car Wash Vehiculos</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" href="../Estilos/Estilos.css" type="text/css"> 
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
            border-radius: 20px;
            padding: 10px;
            margin-bottom: 20px;
        }
        @media screen and (max-width:450px)  {
            .texto{
                font-size: 10px;
            }
        }
        @media screen and (min-width:450px) and (max-width:1200px)  {
            .texto{
                font-size: 15px;
            }
        }
    </style>
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
            response.sendRedirect("../login.jsp");
        }
    %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a style="font-size: 13px" class="navbar-brand text-warning" href="#"><%="Sede : " + sesion.getAttribute("Sede") + "  |"%></a><br>
            <a style="font-size: 13px" class="navbar-brand text-warning" href="#"><%="Usuario : " + sesion.getAttribute("user") + "  |"%></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link" aria-current="page" href="../Modulos.jsp">Inicio</a>
                    <a class="nav-link" href="inicio3.jsp">Nueva placa</a>
                    <a class="nav-link active" href="Vehiculo.jsp">Historial</a>
                    <a class="nav-link" href="../index.jsp">Salir</a>
                </div>
            </div>
        </div>
    </nav>
    <body >
        <div >
            <div   class="container mt-2 contenedor texto" style="margin-top: 100px " >
                <img src="../Imagenes/Logo1.jpg" width="100px"/>
                <h4>Vehiculo</h4>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Placa</th>
                            <th scope="col">Modelo</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Color</th>
                            <th scope="col">Tipo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            Conexion cn = new Conexion();
                            ResultSet rs = cn.consultas(" SELECT * FROM `vehiculos` where Placa='" + sesion.getAttribute("placa") + "' ; ");
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString(2)%></td>
                            <td><%= rs.getString(3)%></td>
                            <td><%= rs.getString(4)%></td>
                            <td><%= rs.getString(5)%></td>
                            <td><%= rs.getString(6)%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table><br>
                <h4>Historial de servicios</h4>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Servicio</th>
                            <th scope="col">Adicionales</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Empleado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            HttpSession sesion1 = request.getSession();
                            Conexion cn1 = new Conexion();
                            ResultSet rs1 = cn1.consultas(" SELECT * FROM `ventas` where Placa='" + sesion1.getAttribute("placa") + "' ORDER BY IdVentas DESC limit 10; ");
                            while (rs1.next()) {
                        %>
                        <tr>
                            <td><%= rs1.getString(5)%></td>
                            <td><%= rs1.getString(6)%></td>
                            <td><%= rs1.getString(8)%></td>
                            <td><%= rs1.getString(4)%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table><br>
                <form class="form-sign" action="ventasServicios1.jsp" method="post" > 
                    <input autofocus="" type="submit" name="accion" value="Continuar" class="btn btn-warning btn-b text-center btn-outline-dark">                             
                </form>
            </div> 
        </div>
    </body>
</html>
