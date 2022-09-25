/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * String url =
 * "jdbc:mysql://node109293-env-1871975.jelastic.saveincloud.net:3306/crew";
 * String user = "root"; String pass = "9QUWR6uOPj";9DbvXeQ8e8
 *
 * String url = "jdbc:mysql://localhost:3306/crew"; String user = "crewcar";
 * String pass = "123456789";
 */
public class Conexion {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/crew";
    String user = "crewcar";
    String pass = "123456789";
    Statement st = null;
    ResultSet rs = null;
    Statement st1 = null;
    ResultSet rs1 = null;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException | SQLException e) {

        }
    }

    public int ejecutarSentenciasSql(String sql) {
        try {
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.execute();
            return 1;
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        }
    }

    public ResultSet consultas(String sql) {
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            return rs;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public int precios(String servicio) {
        try {
            int valor = 0;
            PreparedStatement pstm = con.prepareStatement("SELECT * FROM `servicios` where IdServicios='" + servicio + "' ; ");
            ResultSet respuesta = pstm.executeQuery();
            while (respuesta.next()) {
                valor = Integer.parseInt(respuesta.getString(4));
            }
            return valor;
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        }
    }

    public String validacion(String user, String pass) {
        try {
            this.user = user;
            this.pass = pass;
            String resultado = null;
            st = con.createStatement();
            rs = st.executeQuery(" SELECT * FROM `empleados` where Usuario='" + user + "' and Cedula='" + pass + "' ; ");
            while (rs.next()) {
                resultado = rs.getString(8);
            }
            return resultado;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

    }

    public String empleadosNombre(String user, int col) {
        try {
            this.user = user;
            String resultado = null;
            st1 = con.createStatement();
            rs1 = st1.executeQuery(" SELECT * FROM `empleados` where User='" + user + "' ; ");
            while (rs1.next()) {
                resultado = rs1.getString(col);
            }
            return resultado;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

    }

    public static void mensaje(String mensaje, String numero1) {
        String ACCOUNT_SID = "AC3e9c7e106f781a3dbca6354eb18b3f12";
        String AUTH_TOKEN = "f5848c6cddf69826a4c4c14003505d88";
        String numero = numero1;
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message.creator(new PhoneNumber(numero),
                new PhoneNumber("+19377350545"),
                mensaje).create();

        System.out.println(message.getSid());
    }

    public String dia(String inicio) {
        int cont = inicio.length();
        String dias = (inicio.substring(cont - 2, cont));
        int dia = Integer.parseInt(dias) + 1;
        String fecha = (inicio.substring(0, cont - 2)) + dia;
        return fecha;
    }

    public String mes(String inicio) {
        String mes = "";
        int cont = inicio.length();
        String meses = (inicio.substring(cont - 2, cont));
        int valor = Integer.parseInt(meses);
        switch (valor) {

            case 1:
                mes = "Enero";
                break;
            case 2:
                mes = "Febrero";
                break;
            case 3:
                mes = "Marzo";
                break;
            case 4:
                mes = "Abril";
                break;
            case 5:
                mes = "Mayo";
                break;
            case 6:
                mes = "Junio";
                break;
            case 7:
                mes = "Julio";
                break;
            case 8:
                mes = "Agosto";
                break;
            case 9:
                mes = "Septiembre";
                break;
            case 10:
                mes = "Octubre";
                break;
            case 11:
                mes = "Noviembre";
                break;
            case 12:
                mes = "Diciembre";
                break;

            default:
                throw new AssertionError();
        }
        return mes;
    }
    
    public String mes_print(int inicio) {
        String mes = "";
        int valor=inicio;
        switch (valor) {

            case 1:
                mes = "Enero";
                break;
            case 2:
                mes = "Febrero";
                break;
            case 3:
                mes = "Marzo";
                break;
            case 4:
                mes = "Abril";
                break;
            case 5:
                mes = "Mayo";
                break;
            case 6:
                mes = "Junio";
                break;
            case 7:
                mes = "Julio";
                break;
            case 8:
                mes = "Agosto";
                break;
            case 9:
                mes = "Septiembre";
                break;
            case 10:
                mes = "Octubre";
                break;
            case 11:
                mes = "Noviembre";
                break;
            case 12:
                mes = "Diciembre";
                break;

            default:
                throw new AssertionError();
        }
        return mes;
    }
}
