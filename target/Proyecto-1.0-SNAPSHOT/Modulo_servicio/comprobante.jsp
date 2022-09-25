<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexion" %>

<html>
    <head>
        <title>Crew Car Wash Servicios</title>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("../login.jsp");
            }
            if (request.getParameter("vapor") != null) {
                sesion.setAttribute("vapor", " + VAPOR ");
            } else {
                sesion.setAttribute("vapor", "");
            }
            if (request.getParameter("grafito") != null) {
                sesion.setAttribute("grafito", " + GRAFITO ");
            } else {
                sesion.setAttribute("grafito", "");
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
                    <a class="nav-link" href="ventasServicios1.jsp">Servicios</a>
                    <a class="nav-link" href="adicionales.jsp">Adicionales</a>
                    <a class="nav-link active" href="comprobante.jsp">Orden</a>
                    <a class="nav-link" href="../index.jsp">Salir</a>
                </div>
            </div>
        </div>
    </nav>
        <div style="font-size:14px; " class="container mt-4">
            <div class="card col-sm-10">
                <div class="card-body">
                    <img src="../Imagenes/Logo1.jpg" /> 
                    <h3 class=" text-center">Comprobante</h3><br>
                    <div class="container">
                        <div style="  border:solid 1px black;border-radius: 5px;  " class="card" >
                            <div class="card-body bg-light">
                                <form action="Forma_pago.jsp">
                                    <h5 class="card-title">DETALLE</h5><br><br>
                                    <p class="card-text"><%="Placa    : " + sesion.getAttribute("placa")%></p>
                                    <p class="card-text"><%="Tipo     : " + sesion.getAttribute("tipo")%></p>
                                    <p class="card-text"><%="Servicio : " + sesion.getAttribute("servis")%></p>
                                    <p class="card-text"><%="Adicionales : " + sesion.getAttribute("vapor") + sesion.getAttribute("grafito")%></p>
                                    <div  class="row mb-3">
                                        <label for="colFormLabelLg" class="col-sm-2 col-form-label">Empleado :</label>
                                        <div class="col-sm-10">
                                            <select  style="font-size:14px; " class="form-select" aria-label="Default select example" required="required" name="empleado" title="Asigne la empleado que realizará el servicio">
                                                <option title="Asigne la empleado que realizará el servicio" value=""  selected>Asigne el lavacoches</option>
                                                <%
                                                    String LAVACOCHES = "LAVACOCHES";
                                                    Conexion cn2 = new Conexion();
                                                    ResultSet rs2 = cn2.consultas(" SELECT * FROM `empleados` where Clase='" + LAVACOCHES + "' ; ");

                                                    while (rs2.next()) {

                                                %>
                                                <option  value="<%=rs2.getString(3)%>"><%=rs2.getString(3)%></option>
                                                <%}%>
                                            </select>

                                        </div>

                                    </div>

                                    <table class="table table-striped table-hover ">
                                        <thead>
                                            <tr>
                                                <th scope="col">Servicio</th>
                                                <th scope="col">Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><%=sesion.getAttribute("servis")%></td>
                                                <td><%="$ " + sesion.getAttribute("valor")%></td>
                                                
                                            </tr>
                                            <%

                                                if (request.getParameter(
                                                        "vapor") != null) {
                                                    sesion.setAttribute("vapor", " + VAPOR ");
                                            %>
                                            <tr>
                                                <td><%="Adicional " + sesion.getAttribute("vapor")%></td>
                                                <td><%="$ " + cn2.precios("35")%></td>
                                                
                                            </tr>
                                            <%
                                                }

                                                if (request.getParameter(
                                                        "grafito") != null) {
                                                    sesion.setAttribute("grafito", " + GRAFITO ");
                                            %>
                                            <tr>
                                                <td><%="Adicional " + sesion.getAttribute("grafito")%></td>
                                                <td><%="$ " + cn2.precios("34")%></td>
                                                
                                            </tr>
                                            <% } %>
                                            <tr>
                                                <th style="border-top: 2px solid black;"><strong>TOTAL</strong></th>
                                                <th style="border-top: 2px solid black;">
                                                    <%
                                                        int valServicio = 0;
                                                        int valVapor = 0;
                                                        int valGrafito = 0;
                                                        Conexion cn = new Conexion();
                                                        ResultSet valor = cn.consultas(" SELECT * FROM `servicios` where IdServicios='" + sesion.getAttribute("idservivio") + "' ; ");

                                                        while (valor.next()) {
                                                            valServicio = Integer.parseInt(valor.getString(4));
                                                        }

                                                        if (request.getParameter("vapor") != null) {
                                                            valVapor = cn.precios("35");
                                                        }

                                                        if (request.getParameter("grafito") != null) {
                                                            valGrafito = cn.precios("34");
                                                        }
                                                        int total = valServicio + valVapor + valGrafito;
                                                        out.print("$ " + total);
                                                        sesion.setAttribute("total", total);
                                                    %>
                                                </th>
                                            </tr>
                                        </tbody>
                                    </table><br><br>
                                    <a class="btn btn-warning btn-b btn-outline-dark text-center" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                                        Historial
                                    </a>

                                    <input  type="submit" name="terminar" value="Siguiente" style="position: absolute; right: 10px;" class="btn btn-warning btn-outline-dark ">
                                    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                                        <div class="offcanvas-header">
                                            <h5 class="offcanvas-title" id="offcanvasExampleLabel"><%=sesion.getAttribute("placa")%></h5>
                                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                        </div>
                                        <div class="offcanvas-body">
                                            </table><br><br>
                                            <h2>Historial de servicios</h2><br>
                                            <table style="font-size:10px; " class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Servicio</th>
                                                        <th scope="col">Adicionales</th>
                                                        <th scope="col">Fecha</th>
                                                        <th scope="col">Empleado</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        HttpSession sesion1 = request.getSession();
                                                        Conexion cn1 = new Conexion();
                                                        ResultSet rs1 = cn1.consultas(" SELECT * FROM `ventas` where Placa='" + sesion1.getAttribute("placa") + "' ORDER BY IdVentas DESC limit 10; ");

                                                        while (rs1.next()) {
                                                    %>
                                                    <tr>
                                                        <td><%= rs1.getString(5)%></td>
                                                        <td><%= rs1.getString(6)%></td>
                                                        <td><%= rs1.getString(8)%></td>
                                                        <td><%= rs1.getString(4)%></td>
                                                    </tr>
                                                    <% }%>
                                                </tbody>
                                            </table><br> <br> 
                                        </div>
                                    </div> 
                                                
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
