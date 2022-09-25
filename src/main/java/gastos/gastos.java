/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package gastos;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Randy Trejos
 */
@WebServlet(name = "gastos", urlPatterns = {"/gastos"})
public class gastos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("NuevoGasto") != null) {
            String nombre = request.getParameter("nombre");
            int valor = Integer.parseInt(request.getParameter("valor"));
            String sede = request.getParameter("sede");
            Conexion ingreso = new Conexion();
            ingreso.ejecutarSentenciasSql("INSERT INTO gastos (Nombre, Valor, Sede,Creado) VALUES ('" + nombre + "','" + valor + "','" + sede + "',CURRENT_DATE);");
            response.sendRedirect("../Proyecto/Modulo_costos_gastos/gastos_adm.jsp?respuesta=si");
        }

        if (request.getParameter("Borrar") != null) {

            String id = request.getParameter("Borrar");
            Conexion borrar = new Conexion();
            borrar.ejecutarSentenciasSql(" DELETE FROM `gastos` WHERE `IdGastos`='" + id + "';");
            response.sendRedirect("../Proyecto/Modulo_costos_gastos/gastos_adm.jsp?respuesta=si");

        }
        if (request.getParameter("ActualizarGasto") != null) {
            String valor = request.getParameter("valor");
            String nombre = request.getParameter("nombre");
            String sede = request.getParameter("sede");
            int id = Integer.parseInt(request.getParameter("id"));
            Conexion ingreso = new Conexion();
            ingreso.ejecutarSentenciasSql("UPDATE gastos SET Nombre='" + nombre + "',Valor='" + valor + "',Sede='" + sede + "' WHERE IdGastos='" + id + "';");
            response.sendRedirect("../Proyecto/Modulo_costos_gastos/gastos_adm.jsp");

        }
        
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String id = request.getParameter("id");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet gastos</title>");
            out.println("<link href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" integrity=\"sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN\" crossorigin=\"anonymous\">");
            out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"card text-center\">");
            out.println("<div class=\"card-body\">");
            out.println("<h5 class=\"card-title\">!Alerta¡</h5>");
            out.println("<p class=\"card-text\">Desea eliminar los datos</p>");
            out.println("<a href=\"gastos?Borrar="+id+"\" class=\"btn btn-primary\">Aceptar</a>");
            out.println("<a href=\"../Proyecto/Modulo_costos_gastos/gastos_adm.jsp\" class=\"btn btn-primary\">Cancelar</a>");
            out.println("</div>");
            out.println("</div>");
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
