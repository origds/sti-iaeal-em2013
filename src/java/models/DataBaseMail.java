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
                    "jdbc:postgresql://localhost:5432/postgres",
                    "postgres",
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
        String resul = "";
        try {
            if (c.getCorreo().compareTo("")==0){
                    throw new Exception("Debe ingresar un correo");
            }            
            
         
            if (c.getCorreo().compareTo("")!=0) {
              
                
                sqlmail = "SELECT * FROM \"STI\".usuario WHERE correo LIKE '"+ c.getCorreo() +"';";
                
                System.out.println(sqlmail);
                Statement stmt = conexion.createStatement();
                ResultSet rs = stmt.executeQuery(sqlmail);
                int p =0;
                while(rs.next()) {
                    resul = rs.getString("contrasena");
                    p++;
                 }
                Double nr = Math.random()*890000+100000;
                
                System.out.println("Random " + nr);
               // System.out.println("hayyyyyyyyyy " + p);
                rs.close();
            }
            
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        
        return resul;        
    }    
}
