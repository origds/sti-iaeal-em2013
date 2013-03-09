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
import javabeans.Buscable;
import javabeans.Tratado;
import javabeans.est;
import javabeans.Comparar;

/**
 *
 * @author Isa
 */
public class DatabaseComparar {

  private Database database;
  static private Connection conexion;

  protected DatabaseComparar() {
  }
}
