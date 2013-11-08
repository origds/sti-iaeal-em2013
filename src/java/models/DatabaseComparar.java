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

/**
 *
 * @author Isa
 */
public class DatabaseComparar {
    
    private Database database;
    static private Connection conexion;
    
    protected DatabaseComparar() {
    }
    static private DatabaseComparar instance = null;
    
    static public DatabaseComparar getInstance() {
        if (null == DatabaseComparar.instance) {
            DatabaseComparar.instance = new DatabaseComparar();
        }
        conectar();
        return DatabaseComparar.instance;
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
    
    public DatabaseComparar(String driver, String databaseUrl) {
        this.database = Database.getInstance(driver, databaseUrl);
    }
    
    public Comparar compararTratados(Comparar c) {
        String sqlcomparar = "";
        
        try {
            if ((c.getDiaIni1() == 0) && (c.getMesIni1() == 0) && (c.getAnoIni1() == 0) 
             && (c.getDiaFin1() == 0) && (c.getMesFin1() == 0) && (c.getAnoFin1() == 0)) {
                if ((c.getDiaIni2() == 0) && (c.getMesIni2() == 0) & (c.getAnoIni2() == 0) 
                 && (c.getDiaFin2() == 0) && (c.getMesFin2() == 0) && (c.getAnoFin2() == 0)) {
                    throw new Exception("Debe ingresar un periodo valido");
                }
            }            
            
            if ((c.getDiaIni1() != 0) && (c.getMesIni1() != 0) && (c.getAnoIni1() != 0) 
             && (c.getDiaFin1() != 0) && (c.getMesFin1() != 0) && (c.getAnoFin1() != 0)) {
                if (c.getAnoIni1() > c.getAnoFin1()) {
                    throw new Exception("El inicio del periodo 1 debe ser mayor al final");
                }
                
                sqlcomparar = "SELECT COUNT (*) AS contador FROM \"STI\".tratado WHERE "
                        + "firmaFecha in (SELECT firmaFecha FROM \"STI\".tratado WHERE "
                        + c.getAnoIni1() + " <= extract(year from firmaFecha) "
                        + "AND extract(year from firmaFecha) <= " + c.getAnoFin1() 
                        + " EXCEPT SELECT firmaFecha FROM \"STI\".tratado WHERE "
                        + "((extract(year from firmaFecha)= " + c.getAnoIni1()
                        + " AND extract(month from firmaFecha) < " + c.getMesIni1()
                        + ") OR (extract(year from firmaFecha)= " + c.getAnoIni1() 
                        + " AND extract(day from firmaFecha) < " + c.getDiaIni1()
                        + ")) OR ((extract(year from firmaFecha)= " + c.getAnoFin1()
                        + " AND extract(month from firmaFecha) > " + c.getMesFin1()
                        + ") OR (extract(year from firmaFecha)= " + c.getAnoFin1()
                        + " AND extract(day from firmaFecha) > " + c.getDiaFin1()
                        + ")))";
                
                System.out.println(sqlcomparar);
                Statement stmt = conexion.createStatement();
                ResultSet rs = stmt.executeQuery(sqlcomparar);
                rs.next();
                int count = rs.getInt("contador");
                rs.close();
 
                c.setCantidad1(count);
                System.out.println("CANTIDAAAD 1");
                System.out.println(c.getCantidad1()); 
            }
            
             if ((c.getDiaIni2() != 0) && (c.getMesIni2() != 0) && (c.getAnoIni2() != 0) 
             && (c.getDiaFin2() != 0) && (c.getMesFin2() != 0) && (c.getAnoFin2() != 0)) {
                if (c.getAnoIni2() > c.getAnoFin2()) {
                    throw new Exception("El inicio del periodo 2 debe ser mayor al final");
                }
                
                sqlcomparar = "SELECT COUNT (*) AS contador FROM \"STI\".tratado WHERE "
                        + "firmaFecha in (SELECT firmaFecha FROM \"STI\".tratado WHERE "
                        + c.getAnoIni1() + " <= extract(year from firmaFecha) "
                        + "AND extract(year from firmaFecha) <= " + c.getAnoFin1() 
                        + " EXCEPT SELECT firmaFecha FROM \"STI\".tratado WHERE "
                        + "((extract(year from firmaFecha)= " + c.getAnoIni2()
                        + " AND extract(month from firmaFecha) < " + c.getMesIni2()
                        + ") OR (extract(year from firmaFecha)= " + c.getAnoIni2() 
                        + " AND extract(day from firmaFecha) < " + c.getDiaIni2()
                        + ")) OR ((extract(year from firmaFecha)= " + c.getAnoFin2()
                        + " AND extract(month from firmaFecha) > " + c.getMesFin2()
                        + ") OR (extract(year from firmaFecha)= " + c.getAnoFin2()
                        + " AND extract(day from firmaFecha) > " + c.getDiaFin2()
                        + ")))";
                
                System.out.println(sqlcomparar);
                Statement stmt = conexion.createStatement();
                ResultSet rs = stmt.executeQuery(sqlcomparar);
                rs.next();
                int count = rs.getInt("contador");
                rs.close();
 
                c.setCantidad2(count);
                System.out.println("CANTIDAAAD 2");
                System.out.println(c.getCantidad2());
            }
            
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        
        return c;        
    }    
}