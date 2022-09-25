<%@page import="config.Conexion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crew Car Wash inicio</title>
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
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <button style="margin-right: 10px;background-color: black;border:#ffc107 solid 2px;border-radius: 10px;margin-bottom: 10px;  " type="button" class="btn-outline-warning position-relative" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                    <img src="../Imagenes/carrito1.png" style="width: 40px; margin: 10px;" class="card-img-top" title="No hay servicios">
                </button>
                <a class="navbar-brand text-warning fs-6" href="../Modulos.jsp"><%=sesion.getAttribute("clase")%></a>
                <div class="dropdown">
                    <button style="border: none;margin-right: 60px;" class="btn btn-outline-warning dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <a><%=sesion.getAttribute("user")%><a/>
                    </button>
                    <div class="dropdown-menu text-center" aria-labelledby="dropdownMenuButton1">
                        <a class = "dropdown-item" ><img src="../Imagenes/LOGIN_USER.jpg" alt="50" width="60"/></a>
                        </li>
                        <a style="font-size: 12px"><%=sesion.getAttribute("nombre")%><a/>
                            <a style="font-size: 12px" class="dropdown-item"><%=sesion.getAttribute("clase")%></a>
                            <div class="dropdown-divider"></div>
                            <a style="font-size: 12px" class="dropdown-item" href="index.jsp">Salir</a>
                    </div>

                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none;margin-bottom: 10px; "  class="btn btn-outline-warning" aria-current="page" href="javascript: history.go(-1)">Cedula</a>
                    </li>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none"  class="btn btn-outline-warning" aria-current="page" href="" >Nuevo usuario</a>
                        </li>

                    </ul>

                </div>
            </div>
        </nav>
        <div class="container mt-4 col-lg-4"><br><br><br>
            <div class="card col-sm-20">
                <div class="card-body">
                    <form class="form-sign" action="../Modulo_servicio/inicio2.jsp"  method="post" > 
                        <div class="form-group text-center">
                            <img src="../Imagenes/Logo1.jpg"/> <br>
                            <br><br><br>
                            <label>Información</label>
                        </div>

                        <div class="form-group">
                            <input  required="" type="text" name="cedula" class="form-control" value="<%=session.getAttribute("cedula")%>" disabled="" >
                        </div>  
                        <div class="form-group">
                            <input autofocus="" autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();" style="text-transform: uppercase"  
                                   required="" type="text" name="nombre" class="form-control" placeholder="NOMBRE" >
                        </div>
                        <div class="form-group">
                            <input autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();" style="text-transform: uppercase"  
                                   required="" type="text" name="apellido" class="form-control" placeholder="APELLIDO" >
                        </div> 
                        <div class="form-group">
                            <input autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();" 
                                   required="" type="text" name="telefono" class="form-control" placeholder="TELEFONO" 
                                   pattern="[0-9]{10}" title="Solo se aceptan numeros, mimimo 10 caracteres">
                        </div>  
                        <input type="submit" name="guardar" value="Continuar" class="btn btn-warning btn-b btn-outline-dark text-center">                             
                    </form>
                    <%
                        String nombre = request.getParameter("nombre");
                        String apellido = request.getParameter("apellido");
                        String telefono = request.getParameter("telefono");

                        if (request.getParameter("guardar") != null) {

                            try {
                                Conexion cn = new Conexion();
                                cn.ejecutarSentenciasSql("INSERT INTO `clientes` ( `Nombre`, `Apellido`, `Cedula`, `Telefono`) VALUES ('" + nombre + "', '" + apellido + "', '" + sesion.getAttribute("cedula") + "', '" + telefono + "');");
                                sesion.setAttribute("cliente", nombre);
                                sesion.setAttribute("telefono", telefono);
                                response.sendRedirect("inicio3.jsp");
                            } catch (Exception e) {
                            }
                        }
                    %>

                </div>
            </div>
        </div>               
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>

