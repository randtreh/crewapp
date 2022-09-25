<%-- 
    Document   : NuevoInsumo
    Created on : 18/04/2022, 10:37:41 a. m.
    Author     : Randy Trejos
--%>

<%@page import="com.mysql.cj.Session"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Crew Car Wash Proveedor Nuevo</title>
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
        <style>
            .contenedor{
                border: solid 2px gainsboro;
                border-radius: 20px;
                padding: 10px;
                margin-bottom: 20px;
            }
        </style>
        <%
            HttpSession sesion = request.getSession();
            Conexion cn1 = new Conexion();
            Conexion cn2 = new Conexion();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
            }
            if (request.getParameter("respuesta") != null) {
                sesion.setAttribute("regresar", 1);
            }

        %>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a style="font-size: 13px" class="navbar-brand text-warning" href="#"><%="Sede : " + sesion.getAttribute("Sede") + "  |"%></a><br>
                <a style="font-size: 13px" class="navbar-brand text-warning" href="#"><%="Usuario : " + sesion.getAttribute("user") + "  |"%></a>

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link" aria-current="page" href="../Modulos.jsp">Inicio</a>
                        <a class="nav-link" aria-current="page" href="../Modulo_insumos/Pedidos.jsp">Pedido</a>
                        <a class="nav-link active" aria-current="page" href="../Modulo_insumos/Pedidos.jsp">Nuevo insumo</a>
                        <a class="nav-link" href="../login.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container">
            <div  id="abonos" style=";border: 1px solid orange;background-color: whitesmoke;" class="container card col-sm-5 mt-5 " onload="inicio()">
                <div class="card-body">
                    <div class="">
                        <img  style="width: 100px;" src="../Imagenes/Modulo/firma_crew_blanca.png"/>
                        <h4 class="mt-4 text-center">Nuevo Insumo</h4>
                    </div>
                    <form class="form-sign" action="../insumos" method="get">

                        <p><p><label>Nombre :</label>
                            <input autocomplete="off"  type="text" class="form-control"  name="insumo" pattern="[a-zA-Z ]{2,254}"
                                   required="required" autofocus="" onkeyup="javascript:this.value = this.value.toUpperCase();"
                                   style="text-transform: uppercase" placeholder="Nombre insumo"  title="Ej : CREWCLEAN" ><p>
                            <input type="submit" name="NuevoInsumo" value="Ingresar" class="btn btn-warning btn-b btn-outline-dark " required="">  
                    </form>
                    <%
                        if (sesion.getAttribute("respuestaProveedor") != null) {
                            if (sesion.getAttribute("respuestaProveedor").equals(0)) {
                                out.print(" <div class=\"alert alert-danger\" role=\"alert\">No se hizo el Ingreso del proveedor </div>");
                            }
                            if (sesion.getAttribute("respuestaProveedor").equals(1)) {
                                out.print(" <div class=\"alert alert-danger\" role=\"alert\">Se ingreso el proveedor </div>");
                            }
                        }

                        sesion.setAttribute("respuestaProveedor", null);
                    %>
                </div>
            </div>
        </div>
    </body>
</html>


