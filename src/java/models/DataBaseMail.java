/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javabeans.Comparar;
import javabeans.Tratado;
import javabeans.Usuario;
import javabeans.SHAHashing;
/**
 *
 * @author Jhosbert
 */
public class DataBaseMail {
    private Database database;
    static private Connection conexion;
 
    
    protected DataBaseMail() {
    }
    static private DataBaseMail instance = null;
    
    static public DataBaseMail getInstance() {
        if (null == DataBaseMail.instance) {
            DataBaseMail.instance = new DataBaseMail();
        }
        conectar();
        return DataBaseMail.instance;
    }
    
    public static boolean conectar() {
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/stidb",
                    "stiuser",
                    "postgres");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    
    public DataBaseMail(String driver, String databaseUrl) {
        this.database = Database.getInstance(driver, databaseUrl);
    }
    
    public String enviarMail(Usuario c) {
        String sqlmail = "";
        String sqlmail2 = "";
        String resul = "";
        int updated = 0;
        try {
            if (c.getCorreo().compareTo("")==0){
                    throw new Exception("Debe ingresar un correo");
            }            
            
         
            if (c.getCorreo().compareTo("")!=0) {
              
                Double nr = Math.random()*890000+100000;
                int i = nr.intValue();
                System.out.println("Este es el numero Entero " + i);
                String cadena = String.valueOf(i); 
                
                
                System.out.println("Este es el numero Random " + cadena);
                sqlmail = "UPDATE \"STI\".usuario SET " 
                + "contrasena = '" + SHAHashing.cifrar(cadena) + "'";
                
       
                
                sqlmail += " WHERE correo = '" + c.getCorreo() + "'";
                System.out.println(sqlmail);
                Statement stmt = conexion.createStatement();
                //ResultSet rs1 = stmt.executeUpdate(sqlmail);
                updated = stmt.executeUpdate(sqlmail);
                System.out.println("UPDATEEEEEE " + updated);
                
                sqlmail2 = "SELECT * FROM \"STI\".usuario WHERE correo LIKE '"+ c.getCorreo() +"';";
                System.out.println(sqlmail2);
                Statement stmt2 = conexion.createStatement();
                ResultSet rs = stmt2.executeQuery(sqlmail2);
                
                int p =0;
                while(rs.next()) {
                    resul = cadena;
                     System.out.println("Esta es la Contrasena nueva"+ cadena);
                    p++;
                 }
                
               // System.out.println("hayyyyyyyyyy " + p);
                rs.close();
            }
            
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
          if (updated == 0){
              resul = "no";
          }
        return resul;
               
    }    
}
