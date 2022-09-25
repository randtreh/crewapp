<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crew Clean Login</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" href="Estilos/Estilos_clean.css" type="text/css"> 
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

        .btn-clean:hover{
            background-color: rgb(206,76,30);
            color:white;
            text-decoration: none;
            border: none;
        }

        .text_pie{
            font-weight: bold;
            color:rgb(206,76,30);
        }
    </style>
    <nav  class="navbar " style="background-color: rgb(0,0,0)">
        <div class="container-fluid">
            <a  class="navbar-brand "><b class="text-white">CREWCLEAN</b></a>
            <form class="d-flex">
                <button   class="btn  btn-b btn-clean  btn-outline-light  " type="submit"><a>Regresar</a></button>
            </form>
        </div>
    </nav>
    <body>
        <section style="height: 700px;background-color: gainsboro"><br>
            <div border: solid black"  class="container mt-4 col-lg-4 ">
                <div style="background-color: #000000;margin-top: 50px;" class="card col-sm-10">
                    <div class="card-body">
                        <form class="form-sign" action="login.jsp" method="post"> 
                            <div class="form-group text-center">
                                <h3></h3>
                                <img style="width: 200px;" src="Imagenes/firma crew.png"/> <br><br>
                                <h4 class="text-white">Bienvenidos a CREWCLEAN</h4>
                            </div>
                            <div class="form-group">
                                <label class="text-white">Usuario :</label>
                                <input style="background-color: gainsboro" autofocus="" type="text" name="user" class="form-control" required="" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label class="text-white">Password :</label>
                                <input style="background-color: gainsboro"  type="password" name="password" class="form-control">
                            </div>
                            <input type="submit" name="accion" value="Ingresar" class="btn  btn-b btn-clean  btn-outline-light " required="">                             
                        </form>
                        <%
                            String var = null;
                            String usuario = request.getParameter("user");
                            String password = request.getParameter("password");
                            String nombre;
                            Conexion con1 = new Conexion();
                            if (request.getParameter("accion") != null) {

                                var = con1.validacion(usuario, password);
                                if (var != null) {
                                    HttpSession sesion = request.getSession();
                                    nombre = con1.empleadosNombre(usuario, 3);
                                    sesion.setAttribute("logueado", "1");
                                    sesion.setAttribute("user", usuario);
                                    sesion.setAttribute("nombre", nombre);
                                    sesion.setAttribute("clase", var);
                                    response.sendRedirect("Modulos.jsp");
                                } else {
                        %>
                        <div class="alert alert-warning" role="alert">
                            Usuario o clave incorrecto
                        </div>
                        <%
                                }
                            }
                        %>



                    </div>
                </div>
            </div>   
        </section>
    </body>
    <div  class="container-fluid pie text-white ">
        <div class="row p-3 ">
            <div  class="col-md-4 ">
                <h6>SOPORTE</h6>
                <br>
                <a class="resaltar" href="WEB-CREW/Contacto.jsp">Contáctenos</a><br>
                <hr>
            </div>
            <div  class="col-md-4 offset">
                <h6>GRUPO CREW</h6>
                Dirección: CALLE 6 31 B 17, BOGOTA, BOGOTA<br>         
                Copyright © 2021  Crewxxxx.com . Todos los derechos reservados.
                <hr>
            </div>
            <div  class="col-md-4 offset">
                <h6>NUESTRAS REDES</h6>
                <img class="pie_imagen" src="Imagenes/face.png" title="FaceBook" >
                <img class="pie_imagen" src="Imagenes/instagran.jpg" title="instagram" ><br>
                Creado por randtrehcode
                <hr>
            </div>
        </div>
    </div>

</html>