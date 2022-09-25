<%-- 
    Document   : Galeria
    Created on : 1/02/2022, 3:04:31 p. m.
    Author     : Randy Trejos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Crew Car Wash Galeria</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" href="../Estilos/Estilos.css" type="text/css">
        <link rel="stylesheet" href="../Estilos/EStilosDispositivos.css" type="text/css">
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
            sesion.invalidate();
        %>  
        <section >
            <nav class="navbar navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="cell navbar-brand text-white">CREWCARWASH</a>
                    <form class="d-flex">
                        <button class="btn btn-outline-warning" type="submit"><a class="cell"  style="text-decoration: none;"  href="../AgendaCita.jsp" >AGENDA TU CITA</a></button>
                    </form>
                </div>
            </nav>
        </section>
        <div id="navegacion">
            <img id="logo1" src="../Imagenes/Logo1.jpg">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="cell container-fluid">
                    <a href="../index.jsp">INICIO</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="Servicios.jsp">SERVICIOS</a></li><br>
                            <li class="nav-item"><a href="Promociones.jsp">PROMOCIONES</a></li><br>
                            <li class="nav-item"><a href="Nosotros.jsp">NOSOTROS</a></li><br>
                            <li class="nav-item"><a id="seleccion" href="Galeria.jsp">GALERIA</a></li><br>
                            <li class="nav-item"><a href="Contacto.jsp">CONTACTO</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <section id="seccionGaleria"><br><br><br>
            <h2 style="text-align:center ">GALERIA DE FOTOS</h2>  
            <br>

            <div class="container">
                <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img  src="../Imagenes/belleza.jpeg" title="Belleza para tu auto" class="card-img-top" alt="Belleza para tu auto">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/bienestar.jpeg" title="Bienestar para tu auto" class="card-img-top" alt="Bienestar para tu auto">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/enjabonado.jpeg" title="Enjabonado profesional" class="card-img-top" alt="Enjabonado profesional">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/lavado profesional.jpeg" class="card-img-top" title="Lavado profesional" alt="Lavado profesional">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/1.jpeg" title="Galeria" class="card-img-top" alt="Belleza para tu auto">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/2.jpeg" title="Galeria" class="card-img-top" alt="Bienestar para tu auto">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/3.jpeg" title="Galeria" class="card-img-top" alt="Enjabonado profesional">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/4.jpeg" class="card-img-top" title="Galeria" alt="Lavado profesional">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/5.jpeg" title="Belleza para tu auto" class="card-img-top" alt="Belleza para tu auto">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/6.jpeg" title="Bienestar para tu auto" class="card-img-top" alt="Bienestar para tu auto">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/7.jpeg" title="Enjabonado profesional" class="card-img-top" alt="Enjabonado profesional">
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <a href="/Servicios.jsp">
                                <img src="../Imagenes/8.jpeg" class="card-img-top" title="Lavado profesional" alt="Lavado profesional">
                            </a>
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
                                <a class="resaltar" href="Servicios.jsp">aqui....</a>
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
                                <a class="resaltar" href="Nosotros.jsp">sobre nosotros....</a>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
            </div>
            <div  class="col-md-4 offset">
                <h6>SOPORTE</h6>
                <br>
                <a class="resaltar" href="Contacto.jsp">Contáctenos</a><br><hr>
                <h6>GRUPO CREW</h6>
                Dirección: CALLE 6 31 B 17, BOGOTA, BOGOTA<br>         
                Copyright © 2021  Crewxxxx.com . Todos los derechos reservados.
                <hr>
            </div>
            <div  class="col-md-4 offset">
                <h6>NUESTRAS REDES</h6><br>
                <img class="pie_imagen" src="../Imagenes/face.png" title="FaceBook" >
                <img class="pie_imagen" src="../Imagenes/instagran.jpg" title="instagram" ><br>
                Creado por randtrehcode<br><br>
                <a class="resaltar" href="../login.jsp">Colaboradores</a>
                <hr>
            </div>
        </div>
    </div>
</html>
