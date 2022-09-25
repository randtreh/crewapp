<%-- 
    Document   : prueba
    Created on : 21/02/2022, 3:25:09 p. m.
    Author     : Randy Trejos
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Crew Car Wash inicio</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="keywords" content="carros,lavado,crewcarwash">
        <link rel="stylesheet" href="Estilos/Estilos.css" type="text/css"> 
        <link rel="stylesheet" href="Estilos/EStilosDispositivos.csss" type="text/css"> 
        <link rel="stylesheet" href="Estilos/EStilosDispositivos.css" type="text/css"> 
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
        .cell:hover{
            color: black;
            text-decoration: none;
        }

        .cuadro_img{
            border: 2px solid black;
           
        }
        .cuadro_img:hover{
            border: 2px solid orange;
        }

        

        #seccionIndex2{
            margin-top:20px;
            background-color:whitesmoke;
            width: 100%;
            height: 700px;
            margin: auto;
            margin-top:10px;
            margin-bottom: 10px;
            padding: 10px;

        }
        @media screen and (max-width:430px)  {
            .cell{
                font-size: 13px;
                font-weight: bold;
            }
            .cell-img{
                font-size: 12px;
                font-weight: bold;
            }
            .text-img1{
                width: 180px;
            }
            .boton{
                background-color: orangered;
                color: white;
                font-style: oblique;
                border: transparent;
                border-radius: 5px;
                height: 30px;
                width: 120px;
                text-decoration: none;
            }
            .cuadros{
                
            }
            .text_cuadros{
                font-size: 12px;
            }


        }
        @media screen and (min-width:430px) and (max-width:840px) {
            .cell{
                font-size: 15px;

            }
            .cell-img{
                font-size: 30px;
                font-weight: bold;
            }
            .text-img1{
                width: 320px;
            }
            .boton{
                background-color: orangered;
                color: white;
                font-style: oblique;
                border: transparent;
                border-radius: 5px;
                height: 30px;
                width: 200px;
                text-decoration: none;
            }
            .cuadros{
                margin-top: 5px;
            }
            .text_cuadros{
                font-size: 12px;
            }

        }
        @media screen and (min-width:840px) and (max-width:1300px)  {
            .cell{
                font-size: 15px;

            }
            .cell-img{
                font-size: 40px;
                font-weight: bold;
            }
            .text-img1{
                width: 500px;
            }
            .boton{
                background-color: orangered;
                color: white;
                font-style: oblique;
                border: transparent;
                border-radius: 5px;
                height: 30px;
                width: 200px;
                text-decoration: none;
            }
            .text_cuadros{
                font-size: 12px;
            }
        }


        @media screen and (min-width:1300px) and (max-width:2000px)  {
            .cell{
                font-size: 15px;
            }
            .cell-img{
                font-size: 60px;
                font-weight: bold;
            }
            .text-img1{
                width: 700px;
            }
            .boton{
                background-color: orangered;
                color: white;
                font-style: oblique;
                border: transparent;
                border-radius: 5px;
                height: 30px;
                width: 200px;
                text-decoration: none;
            }
        }


    </style>
    <body>
        <%
            HttpSession sesion = request.getSession();
            sesion.invalidate();
        %>            
        <section >
            <nav class="navbar navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="cell navbar-brand text-white">CREWCARWASH</a>
                    <form class="d-flex">
                        <button class="btn btn-outline-warning" type="submit"><a class="cell"  style="text-decoration: none;"  href="AgendaCita.jsp" >AGENDA TU CITA</a></button>
                    </form>
                </div>
            </nav>
        </section>
        <div id="navegacion">
            <img id="logo1" src="Imagenes/Logo1.jpg">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="cell container-fluid">
                    <a id="seleccion" href="index.jsp">INICIO</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item"><a class="menu" href="WEB-CREW/Servicios.jsp">SERVICIOS</a></li><br>
                            <li class="nav-item"><a class="menu" href="WEB-CREW/Promociones.jsp">PROMOCIONES</a></li><br>
                            <li class="nav-item"><a class="menu" href="WEB-CREW/Nosotros.jsp">NOSOTROS</a></li><br>
                            <li class="nav-item"><a class="menu" href="WEB-CREW/Galeria.jsp">GALERIA</a></li><br>
                            <li class="nav-item"><a class="menu" href="WEB-CREW/Contacto.jsp">CONTACTO</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

        </div>
        <div  class="card bg-dark text-white">
            <img src="Imagenes/Imagen1.jpg" class="card-img" alt="...">
        </div>
    </body>   
    <body>
        <section>
            <br>
            <h3 style="text-align: center">SERVICIOS ESPECIALIZADOS</h3>  
            <br>
            
            <div class="row">
                <div class="col-sm-5 col-md-6">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-5 col-md-6">
                                <div class="card cuadros " >
                                    <a href="WEB-CREW/Servicios.jsp"><img src="Imagenes/belleza.jpeg" title="Belleza para tu auto" class="card-img-top cuadro_img" alt="Belleza para tu auto"></a>
                                    <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <p class="card-text text_cuadros">
                                            Consentimos tu vehículo desde su exterior hacía su interior, brindándote la más alta calidad y rigurosidad en la finalización.
                                        </p>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5 col-md-6">
                                <div class="card cuadros" > 
                                    <a href="WEB-CREW/Servicios.jsp"><img src="Imagenes/bienestar.jpeg" title="Bienestar para tu auto" class="card-img-top cuadro_img" alt="Bienestar para tu auto"></a>
                                    <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <p class="card-text text_cuadros">
                                            Contamos con las mejores instalaciones. Puedes confiar en que tu vehículo se encuentra en las mejores manos. 
                                        </p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-md-6 offset">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-5 col-md-6">
                                <div class="card cuadros" >
                                    <a href="WEB-CREW/Servicios.jsp"><img src="Imagenes/enjabonado.jpeg" title="Enjabonado profesional" class="card-img-top cuadro_img" alt="Enjabonado profesional"></a>
                                    <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <p class="card-text text_cuadros">
                                            Utilizamos los mejores productos del mercado para tu vehículo, creados por nuestros propios proveedores.
                                        </p>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5 col-md-6">
                                <div class="card cuadros" >
                                    <a href="WEB-CREW/Servicios.jsp"><img src="Imagenes/lavado profesional.jpeg" class="card-img-top cuadro_img" title="Lavado profesional" alt="Lavado profesional"></a>
                                    <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <p class="card-text text_cuadros">
                                            Utilizamos productos exclusivos para tu vehículo de Alta Gama; champús de pH neutro que no dañarán la pintura de tu vehículo.
                                        </p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>    
    </body>
    <div  class="container-fluid pie ">
        <div class="row p-3 ">
            <div  class="col-md-4 ">
                <h6>NUESTRA EMPRESA</h6>
                <div  class="accordion" id="accordionFlushExample">
                    <div  class="accordion-item ">
                        <h2 class="accordion-header" id="flush-headingOne">
                            <button  class="accordion-button collapsed bg-black text-white resaltar" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                Grupo CREW
                            </button>
                        </h2>
                        <div  id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body bg-dark text-white">
                                <a href="" class="resaltar">CREWCARGARAGE</a><br>
                                <a href="" class="resaltar">CREWCARWASH</a><br>
                                <a href="" class="resaltar">CREWCLEAN</a>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingTwo">
                            <button class=" accordion-button collapsed bg-black text-white" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                <a href="" class="resaltar">Servicios</a>
                            </button>
                        </h2>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body bg-dark text-white">
                                Conozca todos los productos que tenemos para ofrecerle 
                                <a class="resaltar" href="WEB-CREW/Servicios.jsp">aqui....</a>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingThree">
                            <button class="accordion-button collapsed bg-black text-white " type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                <a href="" class="resaltar">Sobre nosotros</a>
                            </button>                      
                        </h2>
                        <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                            <div  class="accordion-body bg-dark ">
                                Crew Car Wash llega a Bogotá con una promesa: posicionarse inicialmente en la ciudad de Bogotá con un servicio que pocos lavaderos de autos en la ciudad lo pueden ofrece. Conoce mas 
                                <a class="resaltar" href="WEB-CREW/Nosotros.jsp">sobre nosotros....</a>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
            </div>
            <div  class="col-md-4 offset">
                <h6>SOPORTE</h6>
                <br>
                <a class="resaltar" href="WEB-CREW/Contacto.jsp">Contáctenos</a><br><hr>
                <h6>GRUPO CREW</h6>
                Dirección: CALLE 6 31 B 17, BOGOTA, BOGOTA<br>         
                Copyright © 2021  Crewxxxx.com . Todos los derechos reservados.
                <hr>
            </div>
            <div  class="col-md-4 offset">
                <h6>NUESTRAS REDES</h6><br>
                <img class="pie_imagen" src="Imagenes/face.png" title="FaceBook" >
                <img class="pie_imagen" src="Imagenes/instagran.jpg" title="instagram" ><br>
                Creado por randtrehcode<br><br>
                <a class="resaltar" href="login.jsp">Colaboradores</a>
                <hr>
            </div>
        </div>
    </div>
</html>