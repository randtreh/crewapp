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
                border-radius: 20px;
                padding: 10px;
                margin-bottom: 20px;
            }
            @media screen and (max-width:500px)  {
                .texto{
                    font-size: 7px;
                }
                .imagen{
                    width: 80px;
                }

                .imagenCrud{
                    width:13px;
                    height:13px;
                }
            }
            @media screen and (min-width:510px) and (max-width:2000px)  {
                .texto{
                    font-size: 15px;
                }
                .imagen{
                    width: 100px;
                }

                .imagenCrud{
                    width:20px;
                    height:20px;
                }
            }
    </style>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("../index.jsp");
            }
            String clase = (String) sesion.getAttribute("clase");
            Conexion cn1 = new Conexion();
            String inicio = LocalDate.now().toString();
            String fin = cn1.dia(inicio);
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
                        <a class="nav-link" aria-current="page" href="Ventas.jsp">Registros hoy</a>
                        <a class="nav-link active" aria-current="page" href="reg_borrados.jsp">Registros borrados</a>
                        <a class="nav-link" aria-current="page" href="inicio_registros.jsp">Regresar</a>
                        <a class="nav-link" href="../login.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
        <div  class="container mt-5 contenedor" style="font-size:14px; " >
            <div class="container mt-2">
                <div class="row">
                    <div class="col order-last">
                    </div>
                    <div class="col text-center texto"><h4 class="texto"><%="Registros eliminados"%></h4></div>
                    <div class="col order-first "><img class="imagen" src="../Imagenes/Logo1.jpg"/></div>
                </div>
            </div><br>
            <table class="table table-sm table-striped table-hover texto">
                <thead>
                    <tr>
                        <th scope="col">Item</th>
                        <th scope="col">Placa</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Servicio</th>
                        <th scope="col">Adicionales</th>
                        <th scope="col">Valor</th>
                        <th scope="col">Fecha_eli</th>
                        <th scope="col">Hora_eli</th>
                    </tr>
                </thead>
                <tbody>
                    <%

                        ResultSet rs1 = cn1.consultas(" SELECT * FROM eventos_ventas WHERE 1  ORDER BY Hora_eliminado DESC ;");
                        while (rs1.next()) {
                    %>
                    <tr>
                        <td></td>
                        <td><%= rs1.getString(2)%></td>
                        <td><%= rs1.getString(11)%></td>
                        <td><%= rs1.getString(5)%></td>
                        <td><%= rs1.getString(6)%></td>
                        <td><%="$ " + rs1.getString(7)%></td>
                        <td><%= rs1.getString(15)%></td>
                        <td><%= rs1.getString(16)%></td>
                    </tr>
                    <%
                        }
                    %>
                    <tr class="text-center">
                        <th></th>
                        <th style="border-top: 2px solid black;"></th>
                        <th style="border-top: 2px solid black;"></th>
                        <th style="border-top: 2px solid black;"></th>
                        <th style="border-top: 2px solid black;"></th>
                        <th style="border-top: 2px solid black;"></th>
                        <th style="border-top: 2px solid black;"></th>
                        <th></th>
                    </tr>
                </tbody>
            </table><br>
        </div> 
    </div> 
</body>
<script type="text/javascript">
    function actualizar() {
        location.reload(true);
    }
//Funci??n para actualizar cada 4 segundos(4000 milisegundos)
    setInterval("actualizar()", 60000);
</script>
</html>
