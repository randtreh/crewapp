
<%@page import="java.sql.ResultSet"%>
<%@page import="config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Crew Car Wash Gastos</title>
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
                font-size: 11px;
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
                font-size: 14px;
            }
            .imagen{
                width: 150px;
            }

            .imagenCrud{
                width:15px;
                height:15px;
            }
        }
    </style>
    <%
        HttpSession sesion = request.getSession();
        Conexion cn1 = new Conexion();
        String activo = "hidden='hidden'";
        String activo1 = "hidden='hidden'";
        if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
            response.sendRedirect("../login.jsp");
        }
        if (request.getParameter("Accion") != null) {
            activo = " ";
        }
        if (request.getParameter("respuesta") != null) {
            activo = "hidden='hidden'";
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
                    <a class="nav-link active" aria-current="page" href="../Modulos.jsp">Inicio</a>
                    <a class="nav-link" href="../login.jsp">Salir</a>
                </div>
            </div>
        </div>
    </nav>


    <!-- Formulario para ingresar datos -->
    <div  class="container" > 
        <div   id="abonos" style=";border: 1px solid orange;background-color: whitesmoke;" class="container mt-5 contenedor texto" onload="inicio()" <%= activo%> >
            <div class="card-body">
                <div class="">
                    <h4 class="mt-1 text-center">Datos</h4>
                </div><p><p><p>
                <form class="form-sign" action="../gastos" method="get">
                    <div class="row">
                        <div class="col-md-4">
                            <input autocomplete="off"  type="text" class="form-control"  name="nombre" pattern="[a-zA-Z ]{2,254}" required=""
                                   autofocus="" onkeyup="javascript:this.value = this.value.toUpperCase();"
                                   style="text-transform: uppercase" placeholder="Detalle: "  title="Ej : Arriendo" ><p>
                        </div>
                        <div class="col-md-4">
                            <input autocomplete="off"  type="text" class="form-control"  placeholder="Valor:" name="valor" required=""
                                   title="Valor del gasto"><p>
                        </div>
                        <div class="col-md-4">
                            <select class="form-select" name="sede" required="">
                                <option value="" disabled="" selected="" >Sede:</option>
                                <%
                                    ResultSet rs3 = cn1.consultas("SELECT Nombre FROM cedes WHERE Nombre <> 'ALL' ");
                                    while (rs3.next()) {
                                %>
                                <option value="<%=rs3.getString(1)%>"><%=rs3.getString(1)%></option>
                                <%
                                    }
                                %>
                            </select><p><p>
                        </div>
                    </div> 
                    <p>
                        <button class="btn btn-warning btn-b btn-outline-dark " type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">Ingresar</button>
                    <div class="offcanvas offcanvas-top text-center " tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">

                        <div class="offcanvas-header">
                            <div class="card-body">
                                <h5 id="offcanvasTopLabel " class="" >Esta seguro de ingresar el dato?</h5>
                            </div>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div> 
                        <div class="offcanvas-body">
                            <input type="submit" name="NuevoGasto" value="Aceptar" class="btn btn-warning btn-b btn-outline-dark " required="">  
                        </div>
                    </div>
                    <input type="text" class="form-control"   name="usuario" value="<%= sesion.getAttribute("user")%>" hidden="">

                </form>

            </div>
        </div>
    </div> 

    <%
        if (request.getParameter("Actualizar") != null) {
            int id = Integer.parseInt(request.getParameter("Actualizar"));
            activo1 = " ";
            ResultSet rs4 = cn1.consultas(" SELECT * FROM gastos WHERE IdGastos ='" + id + "' ;");
            while (rs4.next()) {
                String cedula = rs4.getString(2);
                String nombres = rs4.getString(3);


    %>
    <!-- Formulario para actualizar datos -->
    <div   id="abonos" style=";border: 1px solid orange;background-color: whitesmoke;" class="container mt-5 contenedor" > 
        <div class="card-body">
            <div class="">
                <h4 class="mt-1 text-center">Actualizar datos</h4>
            </div><p><p><p>
            <form class="form-sign" action="../gastos" method="get">
                <div class="row">
                    <div class="col-md-4">
                        <label for="colFormLabel" class="col-sm-2 col-form-label">Detalle:</label>
                        <input autocomplete="off"  type="text" class="form-control"  name="nombre" pattern="[a-zA-Z ]{2,254}" required="" value="<%= rs4.getString(2)%>"
                               autofocus="" onkeyup="javascript:this.value = this.value.toUpperCase();"
                               style="text-transform: uppercase" placeholder="Detalle: "  title="Ej : Arriendo" ><p>
                    </div>
                    <div class="col-md-4">
                        <label for="colFormLabel" class="col-sm-2 col-form-label">Valor:</label>
                        <input autocomplete="off"  type="text" class="form-control"  placeholder="Valor:" name="valor" required="" value="<%= rs4.getString(3)%>"
                               title="Valor del gasto"><p>
                    </div>
                    <div class="col-md-4">
                        <label for="colFormLabel" class="col-sm-2 col-form-label">Sede:</label>
                        <select class="form-select" name="sede" required="">
                            <option value="<%= rs4.getString(4)%>"  selected="" ><%= rs4.getString(4)%></option>
                            <%
                                ResultSet rs1 = cn1.consultas("SELECT Nombre FROM cedes WHERE Nombre <> 'ALL' ");
                                while (rs1.next()) {
                            %>
                            <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
                            <%
                                }
                            %>
                        </select><p><p>
                    </div>
                </div> 
                <p>
                    <button class="btn btn-warning btn-b btn-outline-dark " type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop1" aria-controls="offcanvasTop1">Actualizar</button>
                <div class="offcanvas offcanvas-top text-center " tabindex="-1" id="offcanvasTop1" aria-labelledby="offcanvasTopLabel">

                    <div class="offcanvas-header">
                        <div class="card-body">
                            <h5 id="offcanvasTopLabel " class="" >Esta seguro de actualizar los datos?</h5>
                        </div>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div> 
                    <div class="offcanvas-body">
                        <input type="submit" name="ActualizarGasto" value="Aceptar" class="btn btn-warning btn-b btn-outline-dark " required="">  
                    </div>
                </div>
                <input type="text" class="form-control"   name="usuario" value="<%= sesion.getAttribute("user")%>" hidden="">
                <input type="text" class="form-control"   name="id" value="<%= id%>" hidden="">
            </form>

        </div>
    </div>
    <%
            }
        }
    %> 

    <div class=" container">
        <div class="col order-first mt-5 "><img class="imagen" src="../Imagenes/Logo1.jpg"/></div>
        <div class="row">
            <%
                ResultSet rs2 = cn1.consultas(" SELECT Nombre FROM cedes WHERE 1");
                while (rs2.next()) {
            %>        
            <div class="col-sm-5 card  me-auto elementos btn mb-3 mt-3 bg-light  ">    
                <div  class="container" >

                    <caption>Gastos administrativos<%= " " + rs2.getString(1)%></caption>
                    <div class="container mt-2">
                        <div class="row">
                            <div class="col text-center texto"><h5></h5></div>
                        </div>
                    </div><br>

                    <form action="../Modulo_costos_gastos/gastos_adm.jsp?prueba=1" >
                        <div class="table-responsive-sm ">
                            <table class="table caption-top table-striped table-bordered texto">
                                <thead class="table-warning">
                                    <tr>
                                        <th scope="col">Editar</th>
                                        <th scope="col">Detalle</th>
                                        <th scope="col">Valor</th>
                                        <th scope="col">Borrar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String sede = "SELECT * FROM gastos WHERE Sede =  + '" + rs2.getString(1) + "'";
                                        if (rs2.getString(1).equals("ALL")) {
                                            sede = "SELECT * FROM gastos WHERE 1";
                                        }
                                        ResultSet rs1 = cn1.consultas(sede);
                                        while (rs1.next()) {


                                    %>
                                    <tr>
                                        <td><a  href="gastos_adm.jsp?Actualizar=<%= rs1.getString(1)%>">
                                                <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-pencil-square imagenCrud" viewBox="0 0 16 16">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                </svg>
                                            </a>
                                        </td>
                                        <td><%= rs1.getString(2)%></td>
                                        <td><%= rs1.getString(3)%></td>
                                        <td>
                                            <a  href="../gastos?id=<%= rs1.getString(1)%>">
                                                <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-trash-fill imagenCrud" viewBox="0 0 16 16">
                                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td></td>
                                        <td>Total</td>
                                        <%
                                            String total = "SELECT SUM(Valor) AS total FROM gastos WHERE Sede =  + '" + rs2.getString(1) + "'";
                                            if (rs2.getString(1).equals("ALL")) {
                                                total = "SELECT SUM(Valor) AS total FROM gastos WHERE 1";
                                            }
                                            ResultSet rs7 = cn1.consultas(total);
                                            while (rs7.next()) {
                                        %>
                                        <th style="border-top: 2px solid black;
                                            text-align: center;
                                            background-color: cadetblue"><%= "$ " + rs7.getString(1)%>
                                        </th>
                                        <%
                                            }

                                        %>

                                        <td></td>
                                    </tr>
                                </tfoot>
                            </table><br>

                            <input type="submit" name="Accion" value="Nuevo gasto" class="btn btn-warning btn-b btn-outline-dark texto" required=""> 
                        </div>
                    </form>
                </div> 
            </div>
            <%                }
            %>
        </div>

    </div>
</body>
</html>
