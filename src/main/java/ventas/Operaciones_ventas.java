/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ventas;

import config.Conexion;
import java.sql.ResultSet;

/**
 *
 * @author Randy Trejos
 */
public class Operaciones_ventas {
    
   public static void ventas_mes(String mes) {
        Conexion cn = new Conexion();
        ResultSet rs1= cn.consultas("SELECT * FROM productos ORDER BY Nombre ASC");
                                            
    }
    
}
