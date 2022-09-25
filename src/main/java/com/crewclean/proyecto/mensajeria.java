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
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import config.Conexion;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Randy Trejos
 */
@WebServlet(name = "mensajeria", urlPatterns = {"/mensajeria"})
public class mensajeria extends HttpServlet {

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
        String mensaje = null;
        HttpSession sesion = request.getSession();
        String user = request.getParameter("user"); 
        String sede = request.getParameter("Sede"); 
        String tipo = request.getParameter("tipo");  
        String cliente = request.getParameter("cliente");    
        String pago = request.getParameter("pago");
        String placa = request.getParameter("placa");
        String empleado = request.getParameter("empleado");
        String servicio = request.getParameter("servicio");
        String adicional = request.getParameter("adicional");
        String total = request.getParameter("total");
        int valor = Integer.parseInt(total);
        int comisiones = (valor*35)/100;
        String celular = "+57" + request.getParameter("celular");
        mensaje = "Hola " + sesion.getAttribute("cliente") + ", tu servicio de " + servicio + " " + adicional + " ya se encuentra en proceso por un valor de $" + total;
        try {
        Conexion cn = new Conexion();
        cn.ejecutarSentenciasSql("INSERT INTO ventas (Placa,Cliente,Empleado,Servicio,Adicionales,Valor,FormaPago,Tipo,Sede,Comisión,User,Estado,Fecha,Hora) VALUES ('"+placa+"','"+empleado+"','"+empleado+"','"+servicio+"','"+adicional+"','"+valor+"','"+pago+"','"+tipo+"','"+sede+"','"+comisiones+"','"+user+"','PENDIENTE',CURRENT_DATE,CURRENT_TIME)");
        response.sendRedirect("mensajeVenta.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }
        
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
