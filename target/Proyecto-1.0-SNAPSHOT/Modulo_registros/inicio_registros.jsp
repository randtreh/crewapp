<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Crew Registros</title>
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
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
            }
            String clase = (String) sesion.getAttribute("clase");

            String loked = "";

        %>

        <style>
            .elementos{
                background-color: rgb(218,218,218);
            }

            .elementos:hover{
                border: rgb(255,255,255) solid 1px;
            }

            .imagen{

            }
            @media screen and (max-width:450px)  {
                .texto{
                    font-size: 13px;
                }
                .imagen{
                    width: 80px;
                }

                .margen{
                    margin-left: 10px;
                }
            }
            @media screen and (min-width:450px) and (max-width:2000px)  {
                .texto{
                    font-size: 15px;
                }
                .imagen{
                    width: 150px;
                }
                .margen{
                    margin-left: 50px;
                }

            </style>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a style="font-size: 13px" class="navbar-brand text-warning" href="#"><%="Sede : " + sesion.getAttribute("Sede") + "  |"%></a><br>
                    <a style="font-size: 13px" class="navbar-brand text-warning" href="#"><%="Usuario : " + sesion.getAttribute("user") + "  |"%></a>

                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link active" aria-current="page" href="../Modulos.jsp">Inicio</a>
                            <a class="nav-link " aria-current="page" href="Empleados.jsp">Empleados</a>
                            <a class="nav-link " aria-current="page" href="Vehiculos.jsp">Vehiculos</a>
                            <a class="nav-link" aria-current="page" href="../Modulos.jsp">Insumos</a>
                            <a class="nav-link" aria-current="page" href="../Modulos.jsp">Ventas</a>
                            <a class="nav-link" href="login.jsp">Salir</a>
                        </div>
                    </div>
                </div>
            </nav>

            <div class="container-fluid margen ">
                <div class=" container-fluid">
                    <img  style="width: 200px;" class="mt-5" src="../Imagenes/Modulo/Logo1.jpg"/>
                    <div class="row mt-4 me-1">
                        <div class="col-sm-2 card text-center me-auto elementos btn mb-3">
                            <a href="../Modulo_registros/Empleados.jsp" style="text-decoration: none;color: #000000" class="mt-3">
                                <img class="img-fluid" style="width: 60px;" src="../Imagenes/Modulo/Empleado.png" alt="alt" />
                                <h6 class="texto" style="margin-top: 30px"><strong>EMPLEADOS</strong></h6>
                            </a>
                             
                        </div>
                        <div class="col-sm-2  offset card text-center me-auto elementos btn mb-3  ">
                            <a href="../Modulo_registros/Vehiculos.jsp" style="text-decoration: none;color: #000000" class="mt-3">
                                <img class="img-fluid" style="width: 80px;" src="../Imagenes/Modulo/Lavado.png" alt="alt" />
                                <h6 class="texto" style="margin-top: 30px"><strong>VEHICULOS</strong></h6>
                            </a>
                        </div>
                        <div class="col-sm-2 offset card text-center me-auto elementos btn mb-3 ">
                            <a href="../Modulo_registros/Ventas.jsp" style="text-decoration: none;color: #000000" class="mt-3">
                                <img class="img-fluid" style="width: 70px;"  src="../Imagenes/Modulo/Caja.png" alt="alt"/>
                                <h6 class="texto" style="margin-top: 20px"><strong>VENTAS</strong></h6>
                            </a>
                        </div>
                        <div class="col-sm-2 offset  card text-center me-auto elementos btn mb-3  ">
                            <a href="" style="text-decoration: none;color: #000000" class="mt-3">
                                
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>

