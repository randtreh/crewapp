/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Registros;

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
@WebServlet(name = "Vehiculos", urlPatterns = {"/Vehiculos"})
public class Vehiculos extends HttpServlet {

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
        
        if (request.getParameter("Borrar") != null) {
            int resp = JOptionPane.showConfirmDialog(null, "¿Está seguro de eliminar el registro?", "Alerta", 0);
            if (resp == 0) {
                String id = request.getParameter("Borrar");
                Conexion borrar = new Conexion();
                borrar.ejecutarSentenciasSql(" DELETE FROM `vehiculos` WHERE `IdVehiculo`='" + id + "';");
                response.sendRedirect("../Proyecto/Modulo_registros/Vehiculos.jsp?respuesta=si");
            } else {
                response.sendRedirect("../Proyecto/Modulo_registros/Vehiculos.jsp");
            }

        }

        if (request.getParameter("ActualizarVehiculo") != null) {

            int resp = JOptionPane.showConfirmDialog(null, "¿Está seguro de actualizar el registro?", "Alerta", 0);
            if (resp == 0) {
                String placa = request.getParameter("placa");
                int modelo = Integer.parseInt(request.getParameter("modelo"));
                String marca = request.getParameter("marca");
                String color = request.getParameter("color");
                String tipo = request.getParameter("tipo");
                String usuario = request.getParameter("usuario");
                int id = Integer.parseInt(request.getParameter("id"));
                Conexion update = new Conexion();
                update.ejecutarSentenciasSql("UPDATE vehiculos SET Placa='" + placa + "',Modelo='" + modelo + "',Marca='" + marca + "',Color='" + color + "',Tipo='" + tipo + "',Modificado='" + usuario + "',Fecha= CURRENT_DATE WHERE IdVehiculo='" + id + "';");
                response.sendRedirect("../Proyecto/Modulo_registros/Vehiculos.jsp");
            } else {
                response.sendRedirect("../Proyecto/Modulo_registros/Vehiculos.jsp");
            }

        }

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Vehiculos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Vehiculos at " + request.getContextPath() + "</h1>");
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
