<%@page import="javax.swing.JOptionPane"%>
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

        <title>Crew Car Wash Clientes Nuevos</title>
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
            @media screen and (max-width:500px)  {
                .texto{
                    font-size: 7px;
                }
                .imagen{
                    width: 80px;
                }

                .imagenCrud{
                    width:13px;
                    height:13px;
                }
            }
            @media screen and (min-width:510px) and (max-width:2000px)  {
                .texto{
                    font-size: 15px;
                }
                .imagen{
                    width: 100px;
                }

                .imagenCrud{
                    width:20px;
                    height:20px;
                }
            }
        </style>
        <%
            HttpSession sesion = request.getSession();
            Conexion cn1 = new Conexion();
            Conexion cede = new Conexion();

            String activo1 = "hidden='hidden'";
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("../login.jsp");
            }
            if (request.getParameter("respuesta") != null) {
                activo1 = "hidden='hidden'";
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
                        <a class="nav-link active" href="../Modulo_registros/Vehiculos.jsp">Crear/Modificar/Eliminar</a>
                        <a class="nav-link" href="../Modulo_registros/inicio_registros.jsp">Regresar</a>
                        <a class="nav-link" href="../login.jsp">Salir</a>
                    </div>
                </div>
            </div>
        </nav>
        <div  class="container" >
            <div  class="container mt-5 contenedor texto" >
                <div class="col order-first "><img class="imagen" src="../Imagenes/Logo1.jpg"/></div>
                <div class="container mt-2">
                    <div class="row">
                        <div class="col text-center texto"><h4>Vehiculos</h4></div>
                    </div>
                </div><br>
                <table class="table table-sm table-striped table-hover texto">
                    <thead>
                        <tr>
                            <th scope="col">Editar</th>
                            <th scope="col">Placa</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Color</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Modelo</th>
                            <th scope="col">Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            ResultSet rs1 = cn1.consultas(" SELECT * FROM vehiculos WHERE 1 ORDER BY Placa  ;");
                            while (rs1.next()) {
                        %>
                        <tr>
                            <td><a  href="Vehiculos.jsp?Actualizar=<%= rs1.getString(1)%>">
                                    <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-pencil-square imagenCrud" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>
                                </a>
                            </td>
                            <td><%= rs1.getString(2)%></td>
                            <td><%= rs1.getString(4)%></td>
                            <td><%= rs1.getString(5)%></td>
                            <td><%= rs1.getString(6)%></td>
                            <td><%= rs1.getString(3)%></td>
                            <td><a  href="../Vehiculos?Borrar=<%= rs1.getString(1)%>">
                                    <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-trash-fill imagenCrud" viewBox="0 0 16 16">
                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr class="text-center">
                            <th></th>
                            <th style="border-top: 2px solid black;"></th>
                            <th style="border-top: 2px solid black;"></th>
                            <th style="border-top: 2px solid black;"></th>
                            <th style="border-top: 2px solid black;"></th>
                            <th style="border-top: 2px solid black;"></th>
                            <th></th>
                        </tr>
                    </tbody>
                </table><br>


            </div> 


            <%
                if (request.getParameter("Actualizar") != null) {
                    int id = Integer.parseInt(request.getParameter("Actualizar"));
                    activo1 = " ";
                    ResultSet rs2 = cn1.consultas(" SELECT * FROM vehiculos WHERE IdVehiculo ='" + id + "' ;");
                    while (rs2.next()) {
                        String placa = rs2.getString(2);
                        String modelo = rs2.getString(3);
                        String marca = rs2.getString(4);
                        String color = rs2.getString(5);
                        String tipo = rs2.getString(6);
            %>



            <div   id="abonos" style=";border: 1px solid orange;background-color: whitesmoke;" class="container mt-5 contenedor" onload="inicio()" <%= activo1%> >
                <div class="card-body">
                    <div class="">
                        <h4 class="mt-1 text-center">Actualizar datos</h4>
                    </div><p><p><p>
                    <form class="form-sign" action="../Vehiculos?id=<%= id%>" method="get">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="colFormLabelSm" class="col-sm-2 col-form-label">Placa:</label>
                                <input type="text" class="form-control" id="colFormLabelSm" placeholder="Ingresar placa" value="<%=placa%>" name="placa" onkeyup="javascript:this.value = this.value.toUpperCase()" style="text-transform: uppercase" minlength="6" maxlength="6" required="">

                            </div>
                            <div class="col-md-4">
                                <label for="colFormLabel" class="col-sm-2 col-form-label">Modelo:</label>
                                <input autocomplete="off" autofocus="" type="text" class="form-control" id="colFormLabel" placeholder="Ingresar modelo" value="<%=modelo%>" name="modelo" required="required">

                            </div>
                            <div class="col-md-4">
                                <label for="colFormLabel" class="col-sm-2 col-form-label">Marca:</label>
                                <input autocomplete="off" type="text" class="form-control" id="colFormLabel" placeholder="Ingresar marca" value="<%=marca%>" name="marca" required="required">
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-md-4">
                                <label for="colFormLabelLg" class="col-sm-2 col-form-label">Color:</label>
                                <input autocomplete="off" type="text" class="form-control" id="colFormLabelLg" placeholder="Ingresar color" value="<%=color%>" name="color" required="required">

                            </div>
                            <div class="col-md-4">
                                <label for="colFormLabelLg" class="col-sm-2 col-form-label">Tipo: </label>
                                <select class="form-select" name="tipo">
                                    <option value="<%= tipo%>" disabled="" selected=""><%= tipo%></option>
                                    <option value="Moto">Moto</option>
                                    <option value="Automovil">Automovil</option>
                                    <option value="Camioneta">Camioneta</option>
                                    <option value="Camion">Camion</option>
                                </select>
                            </div>   
                        </div> 
                        <div class="row">
                            <div class="col-md-4 mt-5">
                                <input type="text" class="form-control"   name="usuario" value="<%= sesion.getAttribute("user")%>" hidden="">
                                <input type="text" class="form-control"   name="id" value="<%= id%>" hidden="">
                                <input type="submit" name="ActualizarVehiculo" value="Guardar" class="btn btn-warning btn-b btn-outline-dark " required="">
                            </div>
                        </div>
                    </form>

                </div>
            </div>
            <%
                    }
                }
            %> 

        </div>
    </body>
</html>

