package Registros;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet(name = "Empleados", urlPatterns = {"/Empleados"})
public class Empleados extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("NuevoEmpleado") != null) {
            String cedula = request.getParameter("cedula");
            String nombres = request.getParameter("nombre");
            String apellidos = request.getParameter("apellido");
            String telefono = request.getParameter("cel");
            String clase = request.getParameter("clase");
            String user = request.getParameter("user");
            String cede = request.getParameter("cede");
            String usuario = request.getParameter("usuario");
            Conexion ingreso = new Conexion();
            ingreso.ejecutarSentenciasSql("INSERT INTO empleados (Cedula, Nombres, Apellidos, Telefono, Clase, Usuario, Cede,Modificado,Fecha) VALUES ('" + cedula + "','" + nombres + "','" + apellidos + "','" + telefono + "','" + clase + "','" + user + "','" + cede + "','" + usuario + "',CURRENT_DATE);");
            response.sendRedirect("../Proyecto/Modulo_registros/Empleados.jsp?respuesta=si");
        }

        if (request.getParameter("Borrar") != null) {
            int resp = JOptionPane.showConfirmDialog(null, "¿Está seguro de eliminar el registro?", "Alerta", 0);
            if (resp == 0) {
                String id = request.getParameter("Borrar");
                Conexion borrar = new Conexion();
                borrar.ejecutarSentenciasSql(" DELETE FROM `empleados` WHERE `IdEmpleado`='" + id + "';");
                response.sendRedirect("../Proyecto/Modulo_registros/Empleados.jsp?respuesta=si");
            } else {
                response.sendRedirect("../Proyecto/Modulo_registros/Empleados.jsp");
            }

        }

        if (request.getParameter("ActualizarEmpleado") != null) {

            int resp = JOptionPane.showConfirmDialog(null, "¿Está seguro de actualizar el registro?", "Alerta", 0);
            if (resp == 0) {
                String cedula = request.getParameter("cedula");
                String nombres = request.getParameter("nombre");
                String apellidos = request.getParameter("apellido");
                String telefono = request.getParameter("cel");
                String clase = request.getParameter("clase");
                String user = request.getParameter("user");
                String cede = request.getParameter("cede");
                String usuario = request.getParameter("usuario");
                int id = Integer.parseInt(request.getParameter("id"));
                Conexion ingreso = new Conexion();
                ingreso.ejecutarSentenciasSql("UPDATE empleados SET Cedula='" + cedula + "',Nombres='" + nombres + "',Apellidos='" + apellidos + "',Telefono='" + telefono + "',Clase='" + clase + "',Usuario='" + user + "',Cede='" + cede + "',Modificado='" + usuario + "',Fecha= CURRENT_DATE WHERE IdEmpleado='" + id + "';");
                response.sendRedirect("../Proyecto/Modulo_registros/Empleados.jsp");
            } else {
                response.sendRedirect("../Proyecto/Modulo_registros/Empleados.jsp");
            }

        }

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Empleados</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Empleados at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
