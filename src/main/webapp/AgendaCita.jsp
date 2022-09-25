<%-- 
    Document   : AgendaCita
    Created on : 17/03/2022, 3:24:01 p. m.
    Author     : Randy Trejos
--%>

<%@page import="config.Conexion"%>
<%@page import="com.crewclean.proyecto.Citas" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crew Car Wash Agenda tu cita</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" href="Estilos/Estilos.css" type="text/css"> 
        <link rel="stylesheet" href="Estilos/EStilosDispositivos.css" type="text/css"> 
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

        %>

        <section>
            <nav class="navbar navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="cell navbar-brand">CREWCARWASH</a>
                    <form class="d-flex">
                        <button class="btn btn-outline-warning" type="submit"><a class="cell" style="text-decoration: none;"  href="index.jsp" >REGRESAR</a></button>
                    </form>
                </div>
            </nav>
        </section>
        <div class="container-fluid">
            <div class="container mt-4 col-lg-4">
                <div class="card col-sm-10">
                    <div class="card-body">
                        <form class="form-sign" action="Citas" method="post"> 
                            <div class="form-group text-center">
                                <img src="Imagenes/Logo1.jpg"/> <br>
                                <h1>Agendar cita</h1>
                            </div>
                            <div class="form-group">
                                <label>Nombre :</label>
                                <input autofocus="" type="text" name="nombre" class="form-control" onkeyup="javascript:this.value = this.value.toUpperCase();"
                                       required="" autocomplete="off" style="text-transform: uppercase" placeholder="PRIMER NOMBRE Y APELLIDO"  title="Ej : PEPITO PEREZ" >
                                <label>Cedula :</label>
                                <input autofocus="" type="text" name="cedula" class="form-control" required="" autocomplete="off"
                                       placeholder="CEDULA" pattern="[0-9]{8,10}" title="Maximo 10 digitos ">
                                <label>Celular :</label>
                                <input autofocus="" type="text" name="telefono" class="form-control" required="" autocomplete="off"
                                       placeholder="NUMERO DE CELULAR" pattern="[0-9]{10}" title="Maximo 10 digitos">
                                <label>Placa :</label>
                                <input autofocus="" autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();" 
                                       style="text-transform: uppercase" maxlength="6" required="" type="text" name="placa" class="form-control" 
                                       placeholder="PLACA" pattern="[A-Z]{3}[0-9]{3}" title="Formato tipo placa. Ej: ABC123">
                                <label>Sede :</label>
                                <select name="sede" id="disabledSelect4" class="form-select" required="">
                                    <option disabled="" selected=""></option>
                                    <option>Lavadero_3</option>
                                    <option>Lavadero_6</option>
                                </select>
                                <label>Fecha :</label>
                                <label>Fecha :</label>
                                <input type="date" name="fecha" class="form-control" required="">
                                <label>Hora :</label>
                                <input type="time" name="hora" class="form-control" required="">
                            </div><br>
                            <input type="submit" name="cita" value="Registrar cita" class="btn btn-warning btn-b btn-outline-dark " required="">                             
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
