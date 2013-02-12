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
import java.util.ArrayList;
import java.util.Scanner;
import javabeans.Buscable;
import javabeans.Tratado;
import javabeans.est;
import javabeans.ClaseEstadistica;

/**
 *
 * @author betocols
 */
public class DatabaseEstadistica {

  private Database database;
  static private Connection conexion;
  
  protected DatabaseEstadistica() {
    }
    static private DatabaseEstadistica instance = null;

    static public DatabaseEstadistica getInstance() {
        if (null == DatabaseEstadistica.instance) {
            DatabaseEstadistica.instance = new DatabaseEstadistica();
        }
        conectar();
        return DatabaseEstadistica.instance;
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
  
  public DatabaseEstadistica(String driver, String databaseUrl) {
    this.database = Database.getInstance(driver, databaseUrl);
  }

  public est BuscarEstadistica(ClaseEstadistica b) {
        ArrayList<Tratado> trads1 = new ArrayList<Tratado>(0);
        ArrayList<Tratado> trads2 = new ArrayList<Tratado>(0);
        ArrayList<Tratado> trads3 = new ArrayList<Tratado>(0);
        est estad = new est();
        boolean cont;
        String sqlquery;
        
        try {
            if ((b.getPeriodoIni()!=0) && (b.getPeriodoFin()!=0)) {
              sqlquery = "SELECT DISTINCT * FROM \"STI\".tratado, \"STI\".pais WHERE ("+ b.getPeriodoIni() +" <= (extract(year from firmaFecha) <= " + b.getPeriodoFin() + ") AND (idTp = id)";
              cont = true;
            } else {
              sqlquery = "SELECT DISTINCT * FROM \"STI\".tratado, \"STI\".pais WHERE ";
              cont = false;
            }     
            
            if (b.getCodigo1() != ""){
                if (cont == true){
                    sqlquery += "AND pais like upper('%" + b.getCodigo1() + "%')";
                } else {
                    sqlquery += "pais like upper('%" + b.getCodigo1() + "%')";
                }
                cont = true;
            }
            
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                //System.out.println("HOLA!");
                Tratado t = new Tratado();
                
                
                t.setTitulo("titulo");
                
                trads1.add(t);
            }
            int i = trads1.size();
            estad.setPrimero(i);
            estad.setPais1(b.getCodigo1());
            
            if ((b.getPeriodoIni()!=0) && (b.getPeriodoFin()!=0)) {
              sqlquery = "SELECT DISTINCT * FROM \"STI\".tratado, \"STI\".pais WHERE ("+ b.getPeriodoIni() +" <= (extract(year from firmaFecha) <= " + b.getPeriodoFin() + ") AND (idTp = id)";
              cont = true;
            } else {
              sqlquery = "SELECT DISTINCT * FROM \"STI\".tratado, \"STI\".pais WHERE ";
              cont = false;
            }
            
            if (b.getCodigo2() != ""){
                if (cont == true){
                    sqlquery += "AND pais like upper('%" + b.getCodigo2() + "%')";
                } else {
                    sqlquery += "pais like upper('%" + b.getCodigo2() + "%')";
                }
                cont = true;
            }
            
            Statement stmt2 = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs2 = stmt2.executeQuery(sqlquery);
            while (rs2.next()) {
                //System.out.println("HOLA!");
                Tratado t = new Tratado();
                
               t.setTitulo("titulo");
                
               trads2.add(t);
            }
             int j = trads2.size();
            estad.setSegundo(j);
            estad.setPais2(b.getCodigo2()); 
            
            if ((b.getPeriodoIni()!=0) && (b.getPeriodoFin()!=0)) {
              sqlquery = "SELECT DISTINCT * FROM \"STI\".tratado, \"STI\".pais WHERE ("+ b.getPeriodoIni() +" <= (extract(year from firmaFecha) <= " + b.getPeriodoFin() + ") AND (idTp = id)";
              cont = true;
            } else {
              sqlquery = "SELECT DISTINCT * FROM \"STI\".tratado, \"STI\".pais WHERE ";
              cont = false;
            }
            
            if (b.getCodigo3() != ""){
                if (cont == true){
                    sqlquery += "AND pais like upper('%" + b.getCodigo3() + "%')";
                } else {
                    sqlquery += "pais like upper('%" + b.getCodigo3() + "%')";
                }
                cont = true;
            }
            
            Statement stmt3 = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs3 = stmt3.executeQuery(sqlquery);
            while (rs3.next()) {
               // System.out.println("HOLA!");
                Tratado t = new Tratado();
                
               t.setTitulo("titulo");
                trads3.add(t);
            }
            int k = trads3.size();
            estad.setTercero(k);
            estad.setPais3(b.getCodigo3());
            System.out.println();
            System.out.println();
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return estad;
    }
}
