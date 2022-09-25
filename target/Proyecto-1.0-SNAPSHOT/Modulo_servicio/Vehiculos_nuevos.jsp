<%-- 
    Document   : Vehiculos_nuevos
    Created on : 2/02/2022, 12:13:41 p. m.
    Author     : Randy Trejos
--%>

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

        <title>Crew Car Wash Vehiculos</title>
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
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
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
                        <a class="nav-link active" aria-current="page" href="../Modulos.jsp">Inicio</a>
                        <a class="nav-link active" aria-current="page" href="../Modulo_servicio/inicio3.jsp">Regresar</a>
                        <a class="nav-link" href="../index.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
        <section style="height:700px;margin-top: 20px;background-image: url('../Imagenes/burbujas-1.jpg') "><br>
            <div  class="container  col-lg-5">
                <div style="opacity: 0.9"  class="card bg-light  ">
                    <div class="card-body">
                        <form class="form-sign" action="../Modulo_servicio/Vehiculos_nuevos.jsp" method="post"> 
                            <img src="../Imagenes/Logo1.jpg"/> <br>
                            <h4 class="text-center" >Datos del vehiculo</h4>
                            <div class="card-body"><br>
                                <div class="row mb-3"><br>
                                    <label for="colFormLabelSm" class="col-sm-2 col-form-label">PLACA</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="colFormLabelSm" placeholder="Ingresar placa" value="<%=sesion.getAttribute("placa")%>" name="textPlaca" style="text-transform: uppercase" minlength="6" maxlength="6" required="">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="colFormLabel" class="col-sm-2 col-form-label">MODELO</label>
                                    <div class="col-sm-10">
                                        <input autocomplete="off" autofocus="" type="text" class="form-control" id="colFormLabel" placeholder="Ingresar modelo" name="textModelo" required="required">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="colFormLabel" class="col-sm-2 col-form-label">MARCA</label>
                                    <div class="col-sm-10">
                                        <input autocomplete="off" type="text" class="form-control" id="colFormLabel" placeholder="Ingresar marca" name="textMarca" required="required">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="colFormLabelLg" class="col-sm-2 col-form-label">COLOR</label>
                                    <div class="col-sm-10">
                                        <input autocomplete="off" type="text" class="form-control" id="colFormLabelLg" placeholder="Ingresar color" name="textColor" required="required">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="colFormLabelLg" class="col-sm-2 col-form-label">TIPO </label>
                                    <div class="col-sm-10">
                                        <select class="form-select" aria-label="Default select example" required="required" name="textTipo">
                                            <option  selected>Seleccione el tipo de vehiculo</option>
                                            <option value="Moto">Moto</option>
                                            <option value="Automovil">Automovil</option>
                                            <option value="Camioneta">Camioneta</option>
                                            <option value="Camion">Camion</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center;" >
                                <input  type="submit" name="enviar" value="Ingresar y continuar" class="btn btn-warning btn-b btn-outline-dark text-center"> 
                            </div><br>
                        </form>
                    </div>
                </div>
            </div>
        </section>                    
        <%
            if (request.getParameter("enviar") != null) {
                String placa = request.getParameter("placa");
                String modelo = request.getParameter("modelo");
                String marca = request.getParameter("marca");
                String color = request.getParameter("color");
                String tipo = request.getParameter("tipo");
                String usuario = request.getParameter("usuario");

                if (tipo.equals("0")) {
                    out.print(" <div class=\"alert alert-danger\" role=\"alert\">Seleccione el tipo de vehiculo </div>");
                } else {
                    Conexion cn = new Conexion();
                    cn.ejecutarSentenciasSql("INSERT INTO `vehiculos` ( `Placa`, `Modelo`, `Marca`, `Color`, `Tipo`) VALUES ('" + placa + "', '" + modelo + "', '" + marca + "', '" + color + "', '" + tipo + "',Modificado='" + usuario + "',Fecha= CURRENT_DATE);");
                    request.getRequestDispatcher("ventasServicios1.jsp").forward(request, response);
                    sesion.setAttribute("tipo", tipo);
                }

            }
        %>
    </body>
</html>
