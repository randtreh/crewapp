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
                font-size: 10px;
            }
            .imagen{
                width: 80px;
            }
        }
        @media screen and (min-width:450px) and (max-width:1200px)  {
            .texto{
                font-size: 15px;
            }
            .imagen{
                width: 150px;
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
                        <a class="nav-link active" aria-current="page" href="ventas_dia.jsp">Ventas hoy</a>
                        <a class="nav-link" aria-current="page" href="../Modulo_registros/Ventas.jsp">Eliminar reg</a>
                        <a class="nav-link" href="../login.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
        <%
            if (request.getParameter("placa") != null) {

                String placa = request.getParameter("placa");

                ResultSet rs2 = cn1.consultas("SELECT * FROM vehiculos WHERE Placa='" + placa + "';");
                while (rs2.next()) {
        %>

        <div  class="container mt-5 contenedor" style="font-size:14px; " >
            <div class="container mt-2">
                <h4>Placa : <%= rs2.getString(2)%></h4>
                <table class="table table-warning">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Modelo</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Color</th>
                            <th scope="col">Tipo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td><%= rs2.getString(3)%></td>
                            <td><%= rs2.getString(4)%></td>
                            <td><%= rs2.getString(5)%></td>
                            <td><%= rs2.getString(6)%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <%
                }
            }
        %>        
        <div  class="container mt-5 contenedor" style="font-size:14px; " >
            <div class="container mt-2">
                <div class="row">
                    <div class="col order-last">
                    </div>
                    <div class="col text-center texto"><h4 class="texto"><%="Ventas de hoy : " + inicio%></h4></div>
                    <div class="col order-first "><img class="imagen" src="../Imagenes/Logo1.jpg"/></div>
                </div>
            </div><br>
            <table class="table table-sm table-striped table-hover texto">
                <thead>
                    <tr>
                        <th scope="col">Item</th>
                        <th scope="col">Placa</th>
                        <th scope="col">Servicio</th>
                        <th scope="col">Adicionales</th>
                        <th scope="col">Sede</th>
                        <th scope="col">Hora</th>
                        <th scope="col">Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <%

                        ResultSet rs1 = cn1.consultas(" SELECT * FROM ventas WHERE Fecha BETWEEN '" + inicio + "'  AND '" + fin + "'  ORDER BY Hora desc;");
                        while (rs1.next()) {
                    %>
                    <tr>
                        <td><a href="Control_ventas.jsp?placa=<%= rs1.getString(2)%>" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                </svg>
                            </a>
                        </td>
                <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Backdrop with scrolling</h5>
                        <button type="button" class="btn-close text-reset boton" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <p>
                            <script type="text/javascript">

                            </script>
                        </p>
                    </div>
                </div>
                <td><%= rs1.getString(2)%></td>
                <td><%= rs1.getString(5)%></td>
                <td><%= rs1.getString(6)%></td>
                <td><%= rs1.getString(12)%></td>
                <td><%= rs1.getString(9)%></td>
                <%
                    if (rs1.getString(15).equals("PENDIENTE")) {
                %>
                <td>
                    <form action="../control" method="get">
                        <input type="text" class="form-control"   name="id" value="<%= rs1.getString(1)%>" hidden="">
                        <input  class="" type="submit" name="ActualizarEstado" value="pendiente" id="" >
                    </form>
                </td>
                <%
                } else {
                %>        
                <td><input  class="form-check-input me-1" type="checkbox" name="chequeo" value="ok" id="idchkProyecto" checked="" disabled="" ></td>
                    <%
                        }
                    %>

                </tr>
                <%
                    }
                %>

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

    window.onload = function () {

        // creamos los eventos para cada elemento con la clase "boton"
        let elementos = document.getElementsByClassName("boton");
        for (let i = 0; i < elementos.length; i++)
        {

            // cada vez que se haga clic sobre cualquier de los elementos,
            // ejecutamos la funci??n obtenerValores()
            elementos[i].addEventListener("click", obtenerValores);
        }
    }

    // funcion que se ejecuta cada vez que se hace clic
    function obtenerValores(e) {
        var valores = "";

        // vamos al elemento padre (<tr>) y buscamos todos los elementos <td>
        // que contenga el elemento padre
        var elementosTD = e.srcElement.parentElement.getElementsByTagName("td");

        // recorremos cada uno de los elementos del array de elementos <td>
        for (let i = 0; i < elementosTD.length; i++)
        {

            // obtenemos cada uno de los valores y los ponemos en la variable "valores"
            valores += elementosTD[i].innerHTML + "\n";
        }


    }

</script>
</html>
