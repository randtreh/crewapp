/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Insumos;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Randy Trejos
 */
@WebServlet(name = "insumos", urlPatterns = {"/insumos"})
public class insumos extends HttpServlet {

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
            throws ServletException, IOException, SQLException {

        HttpSession sesion = request.getSession();
        Conexion cn1 = new Conexion();

        if (request.getParameter("NuevoPedidoInsertar") != null) {
            String cantidad = request.getParameter("cantidad");
            String unidad = request.getParameter("unidad");
            String insumo = request.getParameter("insumo");
            String valor_unit = request.getParameter("valor");
            int valor_total = Integer.parseInt(request.getParameter("cantidad")) * Integer.parseInt(request.getParameter("valor"));
            cn1.ejecutarSentenciasSql("ALTER TABLE tempora AUTO_INCREMENT = 1");
            cn1.ejecutarSentenciasSql("INSERT INTO `tempora` (Cantidad, Unidad, Detalle,Valor_unidad, Valor) VALUES ('" + cantidad + "', '" + unidad + "', '" + insumo + "', '" + valor_unit + "', '" + valor_total + "');");

            response.sendRedirect("../Proyecto/Modulo_insumos/Pedidos.jsp");
        }
        if (request.getParameter("id") != null) {
            String id = request.getParameter("id");
            cn1.ejecutarSentenciasSql("DELETE FROM tempora WHERE Idtemporal ='" + id + "';");
            response.sendRedirect("../Proyecto/Modulo_insumos/Pedidos.jsp");
        }
        if (request.getParameter("IngresarCompra") != null) {
            String pedido = request.getParameter("pedido");
            String proveedor = request.getParameter("proveedor");
            String fecha = request.getParameter("fecha");
            ResultSet rs = cn1.consultas("SELECT * FROM tempora WHERE 1;");
            while (rs.next()) {
                String nombre = rs.getString(4);
                String unidad = rs.getString(3);
                double valor_unit = Double.parseDouble(rs.getString(5));
                int cantidad = Integer.parseInt(rs.getString(2));
                double valor = Double.parseDouble(rs.getString(6));
                cn1.ejecutarSentenciasSql("INSERT INTO `pedido`(No_Pedido,`Nombre`, `Unidad`, `Cantidad`, `Valor_unit`, `Valor_total`, `Sede`, `Creado`, `Fecha`) VALUES ('" + pedido + "','" + nombre + "','" + unidad + "','" + cantidad + "','" + valor_unit + "','" + valor + "','" + sesion.getAttribute("Sede") + "','" + sesion.getAttribute("user") + "',CURRENT_DATE);");

            }
            cn1.ejecutarSentenciasSql("TRUNCATE TABLE tempora;");
            response.sendRedirect("../Proyecto/Modulo_insumos/Pedidos.jsp");
        }
        
        if (request.getParameter("NuevoInsumo") != null) {
            String insumo = request.getParameter("insumo");
            cn1.ejecutarSentenciasSql("INSERT INTO insumos (Nombre,Creado,Fecha) VALUE ('"+insumo+"','" + sesion.getAttribute("user") + "',CURRENT_DATE);");
            response.sendRedirect("../Proyecto/Modulo_insumos/Pedidos.jsp");
        }
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insumos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insumos at " + request.getContextPath() + "</h1>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insumos.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insumos.class.getName()).log(Level.SEVERE, null, ex);
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
