/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.crewclean.proyecto;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import config.Conexion;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Randy Trejos
 */
@WebServlet(name = "Citas", urlPatterns = {"/Citas"})
public class Citas extends HttpServlet {

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
         
        String nombre = request.getParameter("nombre");
            String cedula = request.getParameter("cedula");
            String placa = request.getParameter("placa");
            String telefono = request.getParameter("telefono");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String sede = request.getParameter("sede");
            if (request.getParameter("nombre") != null) {
                   Conexion cn = new Conexion();
                   cn.ejecutarSentenciasSql("INSERT INTO `agendamiento` ( Nombre,Cedula,Telefono,Placa,Fecha,Hora,Sede) VALUES ('" + nombre + "','" + cedula + "','" + telefono + "','" + placa + "','" + fecha + "','" + hora + "','" + sede + "');");
                   HttpSession sesion = request.getSession();
                   sesion.setAttribute("placa",placa);
                   sesion.setAttribute("fecha",fecha);
                   sesion.setAttribute("hora",hora);
                   sesion.setAttribute("sede",sede);
                   response.sendRedirect("mensajeCita.jsp");
            }
        
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