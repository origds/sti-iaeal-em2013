/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;
import javabeans.BusquedaForm;
import javabeans.Tratado;

/**
 *
 * @author origds
 */
public class DatabaseBusqueda {

  private Database database;

  public DatabaseBusqueda(String driver, String databaseUrl) {
    this.database = Database.getInstance(driver, databaseUrl);
  }

  public boolean get(BusquedaForm b, ArrayList<Tratado> tratados) throws SQLException {

    boolean got = false;
    boolean and = false, or = false;

    String clave, pais, sqlqueryBusqueda;
    String varPais[];
    Scanner s, s1;

    //Select que se hara a la base de datos
    if (b.getPais().compareTo("") != 0) {
      sqlqueryBusqueda = "SELECT DISTINCT id, titulo, firmaFecha FROM \"STI\".tratado, \"STI\".pais";
    } else {
      sqlqueryBusqueda = "SELECT id, titulo, firmaFecha FROM \"STI\".tratado";
    }

    sqlqueryBusqueda += " WHERE ";

    if (b.getAnio().compareTo("") != 0) {
      if (and) {
        sqlqueryBusqueda += "AND ";
      }

      sqlqueryBusqueda += "(extract(year from firmaFecha) = " + b.getAnio() + ") ";
      and = true;
    }



    if (b.getPais().compareTo("") != 0) {
      if (and) {
        sqlqueryBusqueda += "AND ";
      }

      pais = b.getPais();
      varPais = pais.split(",");
      for (int i = 0; i < varPais.length; i++) {
        varPais[i] = varPais[i].trim();

        if (or) {
          sqlqueryBusqueda += "OR ";
        }

        sqlqueryBusqueda += "((\"STI\".pais.pais ILIKE '" + varPais[i] + "') AND (\"STI\".pais.idTP = \"STI\".tratado.id)) ";
        or = true;
      }
      and = true;
      or = false;
    }

    if (!b.getFechaini().isEmpty()) {
      if (and) {
        sqlqueryBusqueda += "AND ";
      }

      sqlqueryBusqueda += "(extract(year from firmaFecha) >= " + b.getFechaini() + ")";
      and = true;
    }

    if (!b.getFechafin().isEmpty()) {
      if (and) {
        sqlqueryBusqueda += "AND ";
      }

      sqlqueryBusqueda += "(extract(year from firmaFecha) <= " + b.getFechafin() + ")";
    }

    if (b.getClaves().compareTo("") != 0) {

      if (and) {
        sqlqueryBusqueda += "AND ";
      }

      sqlqueryBusqueda += "(";
      clave = b.getClaves();
      s = new Scanner(clave);

      while (s.hasNext()) {

        if (or) {
          sqlqueryBusqueda += "AND ";
        }


        sqlqueryBusqueda += "(lower(unaccent(titulo)) ILIKE '%" + s.next() + "%') ";
        or = true;

      }

      sqlqueryBusqueda += ")";
    }

    if (sqlqueryBusqueda.trim().equals("SELECT id, titulo FROM \"STI\".tratado WHERE")) {
      return true;
    }

    System.out.println("");
    System.out.println("");
    System.out.println("\n");
    System.out.println(sqlqueryBusqueda);
    System.out.println("");
    System.out.println("");
    System.out.println("");
    System.out.println("");

    ArrayList<String> paises = new ArrayList<String>();
    ArrayList<String> grupos = new ArrayList<String>();
    Tratado t;

    try {
      Statement st = database.getConnection().createStatement();
      ResultSet rs = st.executeQuery(sqlqueryBusqueda);
      got = rs.next();
      //System.out.println("---titulo= " + rs.getString("titulo"));
      int id;
      if (got) {

        t = new Tratado();
        t.setId(rs.getInt("id"));
        t.setTitulo(rs.getString("titulo"));
        t.setFirmaFecha(fromChinesetoGregorian(rs.getDate("firmaFecha").toString()));
        tratados.add(t);

        while (rs.next()) {

          System.out.println("titulo= " + rs.getString("titulo"));
          t = new Tratado();

          t.setId(rs.getInt("id"));
          t.setTitulo(rs.getString("titulo"));
          t.setFirmaFecha(fromChinesetoGregorian(rs.getDate("firmaFecha").toString()));
          tratados.add(t);
        }
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    }

    got = got && !tratados.isEmpty();

    return got;
  }

  static private String fromChinesetoGregorian(String date) {
    String items[];

    items = date.split("-");

    if (items.length != 3) {
      return "01/01/1970";
    }

    return items[2] + "/" + items[1] + "/" + items[0];
  }
}