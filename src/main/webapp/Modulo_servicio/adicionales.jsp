<%-- 
    Document   : adicionales
    Created on : 10/02/2022, 10:37:17 a. m.
    Author     : Randy Trejos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Crew Car Wash Servicios</title>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>

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
                        <a class="nav-link" href="Vehiculo.jsp">Historial</a>
                        <a class="nav-link" href="ventasServicios1.jsp">Servicio</a>
                        <a class="nav-link active" href="">Adicionales</a>
                        <a class="nav-link" href="../index.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">

                <%
                    if (request.getParameter("servicio") != null) {
                        String servicio = request.getParameter("servicio");

                        Conexion cn = new Conexion();
                        ResultSet consulta = cn.consultas(" SELECT * FROM `servicios` where Nombre='" + servicio + "' and Tipo='" + sesion.getAttribute("tipo") + "' ; ");
                        while (consulta.next()) {
                            sesion.setAttribute("siguiente", "SIGUIENTE");
                            sesion.setAttribute("valor", consulta.getString(4));
                            sesion.setAttribute("servis", consulta.getString(2));
                            sesion.setAttribute("idservivio", consulta.getString(1));
                            sesion.setAttribute("carrito", 1);
                        }
                %>

                <button style="margin-right: 10px;background-color: black;border:#ffc107 solid 2px;border-radius: 10px;margin-bottom: 10px;" type="button" class="btn-outline-warning position-relative" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                    <img src="../Imagenes/carrito1.png" style="width: 30px; margin: 10px;" class="card-img-top" alt="...">
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        1+
                        <span class="visually-hidden">unread messages</span>
                    </span>
                </button>
                <%
                } else {
                %>
                <button style="margin-right: 10px;background-color: black;border:#ffc107 solid 2px;border-radius: 10px;margin-bottom: 10px;  " type="button" class="btn-outline-warning position-relative" >
                    <img src="../Imagenes/carrito1.png" style="width: 30px; margin: 10px;" class="card-img-top" title="No hay servicios agregados">
                </button>
                <%                    }
                %>
                <div style="font-size: 12px" class="col-sm-3  offset card text-center me-auto elementos btn mb-1 bg-dark text-white ">
                    <%="Placa : " + sesion.getAttribute("placa")%>
                </div>
                <div style="font-size: 12px" class="col-sm-3  offset card text-center me-auto elementos btn mb-1 bg-dark text-white ">
                    <%="Tipo : " + sesion.getAttribute("tipo")%>
                </div>
                <div style="font-size: 12px" class="col-sm-3  card text-center me-auto elementos btn mb-1 bg-dark text-white">
                    <%="Servicio : " + sesion.getAttribute("servis")%>
                </div>
                <div style="font-size: 12px" class="col-sm-3  card text-center me-auto elementos btn mb-1 bg-dark text-white">
                    <%="Valor : $ " + sesion.getAttribute("valor")%>
                </div>
            </div>
        </nav>
    <body style="background-color: white">
        <form class="form-sign" action="comprobante.jsp" method="get">
            <div class="container">

                <div class="container">

                    <img  style="width: 200px;" class="mt-5" src="../Imagenes/Modulo/Logo1.jpg"/>
                    <h4>Servicios extra CREW.</h4><br>
                    <div class="card mb-3" style="max-width: 840px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="../Imagenes/4.jpeg" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">SERVICIO DE VAPOR</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                    <ul class="list-group">
                                        <li class="list-group-item  text-dark">
                                            <input  class="form-check-input me-1" type="checkbox" name="vapor" value="1"  >
                                            Seleccionar
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3" style="max-width: 840px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="../Imagenes/WhatsApp Image 2022-01-25 at 1.08.41 PM.jpeg" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">GRAFITO</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                    <ul class="list-group">
                                        <li class="list-group-item  text-dark">
                                            <input  class="form-check-input me-1" type="checkbox" name="grafito" value="2"  >
                                            Seleccionar
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="margin: 10px;position: static;">
                    <input type="submit" name="agregar" value="AGREGAR" class="btn btn-warning ml-2 btn-outline-dark ">
                </div>
            </div>
        </form>
    </body>
</html>
