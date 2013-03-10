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

  public DatabaseComparar(String driver, String databaseUrl) {
    this.database = Database.getInstance(driver, databaseUrl);
  }
  
  public Comparar compararTratados(Comparar c) {
    String sqlcomparar= "";
    
    try {
      if ((c.getPeriodoIni1() == 0) & (c.getPeriodoFin1() == 0)) {
        if ((c.getPeriodoIni2() == 0) & (c.getPeriodoFin2() == 0)) {
          throw new Exception("Debe ingresar un periodo valido");
        }
      } 
      
      if ((c.getPeriodoIni1()!=0) && (c.getPeriodoFin1()!=0)) {
        if (c.getPeriodoIni1() > c.getPeriodoFin1()) {
          throw new Exception("El inicio del periodo 1 debe ser mayor al final");
        }
        
        sqlcomparar = "SELECT COUNT (*) FROM \"STI\".tratado WHERE (" + c.getPeriodoIni1() 
                      + " <= (extract(year from firmaFecha)) " 
                      + "AND (extract(year from firmaFecha)) <= " 
                      + c.getPeriodoFin1() + ")";
        
        System.out.println(sqlcomparar);
        Statement stmt = conexion.createStatement();
        ResultSet rs = stmt.executeQuery(sqlcomparar);
        while (rs.next()) {
          c.setCantidad1("count");
        }
        System.out.println("CANTIDAAAD 1");
        System.out.println(c.getCantidad1());
      }
      
      if ((c.getPeriodoIni2()!=0) && (c.getPeriodoFin2()!=0)) {
        if (c.getPeriodoIni2() > c.getPeriodoFin2()) {
          throw new Exception("El inicio del periodo 2 debe ser mayor al final");
        }
        
        sqlcomparar = "SELECT COUNT (*) FROM \"STI\".tratado WHERE (" + c.getPeriodoIni2() 
                      + " <= (extract(year from firmaFecha)) " 
                      + "AND (extract(year from firmaFecha)) <= " 
                      + c.getPeriodoFin2() + ")";
        
        System.out.println(sqlcomparar);
        Statement stmt = conexion.createStatement();
        ResultSet rs = stmt.executeQuery(sqlcomparar);
        while (rs.next()) {
          c.setCantidad2("count");
        }
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