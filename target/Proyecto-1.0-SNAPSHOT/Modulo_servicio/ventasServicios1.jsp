<%-- 
    Document   : ventasServicios1
    Created on : 3/03/2022, 4:17:50 p. m.
    Author     : Randy Trejos
--%>

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

    <header >
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect(".../Login.jsp");
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
                        <a class="nav-link active" href="">Servicio</a>
                        <a class="nav-link" href="../index.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <body style="background-color: white">
        <form action="adicionales.jsp">
            <div class="container">
                <div class="container">
                    <img  style="width: 200px;" class="mt-5" src="../Imagenes/Modulo/Logo1.jpg"/>
                    <h4>Que servicio realizaremos hoy al vehículo<%=" " + sesion.getAttribute("placa")%>.</h4>
                    <div class="row mt-4">
                        <div class="col-sm-3  text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/4.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Enjuague</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="Enjuague" name="servicio" type="submit"
                                                class="btn btn-warning ml-2" >Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3  text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/WhatsApp Image 2022-01-25 at 1.08.41 PM.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW GENERAL</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW GENERAL" name="servicio" type="submit" class="btn btn-warning ml-2">Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3   text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/MOTOR1.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW MOTOR</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW MOTOR" name="servicio" type="submit"
                                                class="btn btn-warning ml-2">Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3   text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/MOTOR.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW GENERAL MOTOR</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW GENERAL MOTOR" name="servicio" type="submit" class="btn btn-warning ml-2">Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row mt-4">
                        <div class="col-sm-3  text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/COMBO.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW COMBO </h5>
                                    <p class="card-text">(GENERAL, MOTOR Y POLICHADO).</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW COMBO" name="servicio" type="submit" class="btn btn-warning ml-2">Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3  offset  text-center me-auto elementos btn mb-5 ">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/5.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW POLICHADO</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW POLICHADO" name="servicio" type="submit"
                                                class="btn btn-warning ml-2">Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3   text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/TAPICERIA.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW TAPICERIA</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW TAPICERIA" name="servicio" type="submit"
                                                class="btn btn-warning ml-2">Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3   text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/crew_alfonbra.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW ALFOMBRA</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW ALFOMBRA" name="servicio" type="submit"
                                                class="btn btn-warning ml-2">Elegir</button></div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row mt-4">
                        <div class="col-sm-3  text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/TAPICERIA.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW INTERIOR</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW INTERIOR" name="servicio" type="submit"
                                                class="btn btn-warning ml-2">Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3  offset  text-center me-auto elementos btn mb-5 ">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/5.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW CORRECCION DE PINTURA</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW CORRECCION DE P" name="servicio" type="submit"
                                                class="btn btn-warning ml-2">Elegir</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3   text-center me-auto elementos btn mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="../Imagenes/FULL.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">CREW FULL SERVICE</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                    <div class="col-8 col-sm-12  ">
                                        <button value="CREW FULL SERVICE" name="servicio" type="submit"
                                                class="btn btn-warning ml-2">Elegir</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3   text-center me-auto elementos btn mb-5">

                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

