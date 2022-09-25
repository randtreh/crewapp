<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <title>CrewClean pedido</title>
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
            Conexion cn = new Conexion();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("../login.jsp");
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
                    font-size: 9px;
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
                            <a class="nav-link" aria-current="page" href="../Modulos.jsp">Inicio</a>
                            <a class="nav-link active" aria-current="page" href="Pedidos.jsp">Pedido</a>
                            <a class="nav-link" aria-current="page" href="NuevoInsumo.jsp">Nuevo insumo</a>
                            <a class="nav-link" href="../login.jsp">Salir</a>
                        </div>
                    </div>
                </div>
            </nav>
            <div style="border: solid 1px orange" class="container card mt-4 col-lg-10 ">
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2"><img style="width: 100px;" src="../Imagenes/Modulo/firma_crew_blanca.png"/></div>
                            <div class="col-md-4 "><h4>Nuevo pedido</h4></div>
                        </div>

                        <div style="border: solid 1px orange" class="container card mt-4">
                            <form class="form-sign" action="../insumos" method="get"> 
                                <div class="row mt-4 form-group">

                                    <div class="col-md-2">
                                        <label for="disabledSelect3" class="form-label">Cantidad :</label>
                                        <input autofocus="" min="1" type="number" name="cantidad" class="form-control" required="">
                                    </div>
                                    <div class="col-md-2">
                                        <label for="disabledSelect4" class="form-label">Unidad :</label>
                                        <select name="unidad" id="disabledSelect4" class="form-select" required="">
                                            <option disabled="" selected=""></option>
                                            <option>UNIDAD</option>
                                            <option>CUNETE DE 15 GALONES</option>
                                            <option>CUNETE DE 5 GALONES</option>
                                            <option>GALON</option>
                                            <option>LITRO</option>
                                            <option>KILO</option>
                                            <option>LIBRA</option>
                                            <option>500 ml</option>
                                            <option>320 ml</option>
                                            <option>120 ml</option>
                                            <option>250 gr</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="disabledSelect5" class="form-label">Insumo :</label>
                                        <select name="insumo" id="disabledSelect5" class="form-select" required="" onchange="prueba1()">
                                            <option disabled="" selected=""></option>
                                            <option >Nuevo insumo</option>
                                            <%
                                                ResultSet rs1 = cn.consultas("SELECT * FROM insumos  ORDER BY Nombre ASC");
                                                while (rs1.next()) {
                                            %> <option   value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option> <% }%>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="disabledSelect6" class="form-label">Valor unitario :</label>
                                        <input id="disabledSelect6"  type="text" name="valor" class="form-control" required="" autocomplete="off"
                                               pattern="[0-9]{0,100}">
                                    </div>
                                    <div class="col-md-2 mt-4">
                                        <input type="submit" name="NuevoPedidoInsertar" value="Agregar" class="btn  btn-b btn-warning  btn-outline-dark " required="">                             
                                    </div>

                                </div>
                            </form>
                        </div>

                        <form class="form-sign" action="../insumos" method="get"> 
                            <div style="border: solid 1px orange" class="container card mt-4">

                                <div class="row mt-4 form-group">
                                    <div class="col-md-3">
                                        <label for="factura" class="form-label">Pedido No. :</label>
                                        <%
                                            int cont = 0;
                                            ResultSet rs3 = cn.consultas("SELECT * FROM `pedido` WHERE 1");
                                            while (rs3.next()) {
                                                cont = Integer.parseInt(rs3.getString(2));
                                            }
                                        %> 
                                        <input autocomplete="off"  type="text" class="form-control"  name="pedido" value="<%= "000"+(cont + 1)%>"><p><p>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="disabledSelect1" class="form-label">Sede :</label>
                                        <input id="factura" autofocus="" type="text" name="sede" class="form-control" required="" autocomplete="off" value="<%= sesion.getAttribute("Sede")%>" >
                                    </div>
                                    <div class="col-md-3 ">
                                        <label for="disabledSelect2" class="form-label">Fecha :</label>
                                        <input type="date" name="fecha" class="form-control" required="">
                                    </div>
                                </div>

                            </div>


                            <div style="border: solid 1px orange" class="container card mt-4">
                                <table class="table table-sm table-striped table-hover texto">
                                    <thead>
                                        <tr class="text-center">
                                            <th scope="col">#</th>
                                            <th scope="col">Item</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Unidad</th>
                                            <th scope="col">Detalle</th>
                                            <th scope="col">Valor unit</th>
                                            <th scope="col">Valor total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%

                                            ResultSet rs = cn.consultas(" SELECT * FROM `tempora` WHERE 1 ");
                                            while (rs.next()) {
                                        %>
                                        <tr class="text-center">
                                            <td><a href="../insumos?id=<%=rs.getString(1)%>" class="fa fa-trash"></a></td>
                                            <td ><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%= rs.getString(3)%></td>
                                            <td><%= rs.getString(4)%></td>
                                            <td><%= rs.getString(5)%></td>
                                            <td><%= rs.getString(6)%></td>
                                        </tr>
                                        <%
                                            }%>
                                        <tr class="text-center">
                                            <th style="border-top: 2px solid black;"></th>
                                            <th style="border-top: 2px solid black;"></th>
                                            <th style="border-top: 2px solid black;"></th>
                                            <th style="border-top: 2px solid black;"></th>
                                            <th style="border-top: 2px solid black;"></th>
                                            <th style="border-top: 2px solid black;
                                                text-align: right;"><strong>TOTAL</strong></th>
                                                <%
                                                    ResultSet rs2 = cn.consultas(" SELECT SUM(Valor) AS total FROM `tempora`;");
                                                    while (rs2.next()) {
                                                %>
                                            <th style="border-top: 2px solid black;
                                                text-align: center;
                                                background-color: cadetblue"><%="$ " + rs2.getString(1)%>
                                            </th>
                                            <%
                                                }

                                            %>

                                        </tr>
                                    </tbody>
                                </table><br>
                            </div>
                            <div class="row mt-4">
                                <div class="col-auto me-auto"></div>
                                <div class="col-auto">
                                    <input type="submit" name="IngresarCompra" value="Ingresar" class="btn  btn-b btn-warning  btn-outline-dark " required="">    
                                </div>
                                <%                                if (sesion.getAttribute("respuestaCompra") != null) {
                                        if (sesion.getAttribute("respuestaCompra").equals(0)) {
                                            out.print(" <div class=\"alert alert-danger\" role=\"alert\">No se cargo la compra </div>");
                                        }
                                        if (sesion.getAttribute("respuestaCompra").equals(1)) {
                                            out.print(" <div class=\"alert alert-danger\" role=\"alert\">Se ingreso la compra </div>");
                                        }
                                    }

                                    sesion.setAttribute("respuestaCompra", null);
                                %>    
                            </div>
                        </form>
                    </div>
                </div>  
            </div>



            <script>
                function prueba() {
                    var respuesta = document.getElementById("disabledSelect1").value;
                    if (respuesta == "Nuevo proveedor") {
                        window.location.href = 'NuevoProveedor.jsp?respuesta=1';
                    }
                }

                function prueba1() {
                    var respuesta = document.getElementById("disabledSelect5").value;
                    if (respuesta === "Nuevo insumo") {
                        window.location.href = 'NuevoInsumo.jsp?respuesta=1';
                    }
                }
            </script>

        </body>
    </html>

