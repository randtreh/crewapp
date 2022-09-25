<%-- 
    Document   : Forma_pago
    Created on : 15/02/2022, 12:04:41 p. m.
    Author     : Randy Trejos
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexion" %>
<%@page import="Controlador.Controlador" %>
<%@page import="com.crewclean.proyecto.mensajeria" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Crew Car Wash Login</title>
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
            padding: 20px;
            margin-bottom: 20px;
        }
    </style>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
            }
            String empleado1 = request.getParameter("empleado");
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
                        <a class="nav-link" href="comprobante.jsp">Orden</a>
                        <a class="nav-link active" href="Forma_pago.jsp">Pago</a>
                        <a class="nav-link" href="../index.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
        <section >
            <div  class="container contenedor  col-lg-4 mt-5">
                <div style="opacity: 0.9"  class="card bg-light  ">
                    <div class="card-body">
                        <form class="form-sign" action="../mensajeria"  > 
                            <div class="form-group text-center">
                                <h4 class="text-center mt-1">Selecciona el metodo de pago<img style="width: 40px;margin-left: 10px;" src="../Imagenes/Pesos.png"></h4>

                                <input type="text" name="placa" hidden="" value="<%=sesion.getAttribute("placa")%>" >                            
                                <input type="text" name="empleado" hidden=""   value="<%="" + empleado1 + ""%>" >
                                <input type="text" name="servicio" hidden=""   value="<%=sesion.getAttribute("servis")%>" >
                                <input type="text" name="adicional" hidden=""   value="<%="" + sesion.getAttribute("vapor") + sesion.getAttribute("grafito") + ""%>" >
                                <input type="text" name="total" hidden=""   value="<%="" + sesion.getAttribute("total")%>" >
                                <input type="text" name="Sede" hidden=""   value="<%="" + sesion.getAttribute("Sede")%>" >
                                <input type="text" name="user" hidden=""   value="<%="" + sesion.getAttribute("user")%>" >
                                <input type="text" name="tipo" hidden=""   value="<%="" + sesion.getAttribute("tipo")%>" >
                            </div>
                            <div class="row contenedor">
                                <div class="col-6 col-sm-1"><input class="form-check-input me-1" type="radio" name="pago" value="EFECTIVO" checked=""></div>
                                <div class="col-6 col-sm-5 fw-bold">Pago en efectivo</div>
                                <div class="col-6 col-sm-5"> <img style="width: 70px;" src="../Imagenes/efectivo.png"/></div>
                            </div>
                            <div class="row contenedor">
                                <div class="col-6 col-sm-1"><input class="form-check-input me-1" type="radio" name="pago" value="TARJETA" ></div>
                                <div class="col-6 col-sm-5 fw-bold">Tarjeta</div>
                                <div class="col-6 col-sm-5"><img style="height: 40px;width: 100px; margin-left:0px " src="../Imagenes/tarjeta.png"/></div>
                            </div>
                            <div class="row contenedor">
                                <div class="col-6 col-sm-1"><input class="form-check-input me-1" type="radio" name="pago" value="NEQUI" ></div>
                                <div class="col-6 col-sm-5 fw-bold">Nequi</div>
                                <div class="col-6 col-sm-5"><img style="height: 60px;width: 50px; margin-left: 0px " src="../Imagenes/nequi.jpg"/></div>
                            </div>
                            <input class="btn btn-warning btn-b btn-outline-dark" type="submit" value="TERMINAR" name="aceptar" >                             
                        </form>


                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
