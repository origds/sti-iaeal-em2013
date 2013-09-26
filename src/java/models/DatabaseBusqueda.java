/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
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
        
        for (int i=0;i<tratados.size();i++){
          String sqlqueryPais = "SELECT pais FROM \"STI\".pais "
                                + "WHERE idTP = '" + tratados.get(i).getId() + "'";

          System.out.println(sqlqueryPais);
          ArrayList<String> paises = new ArrayList<String>();
          st = Database.getConnection().createStatement();
          rs = st.executeQuery(sqlqueryPais);

          while(rs.next()) {
            paises.add(rs.getString("pais"));
          }

          for(int j = 0; j < paises.size(); j++){
            System.out.println("***** PAISES: " +paises.get(j));
          }


          String [] paisesArreglo = new String [paises.size()];
          for(int j = 0 ; j < paises.size(); ++j) {
            paisesArreglo[j] = paises.get(j);
          }

          tratados.get(i).setPaises(paisesArreglo);
        }
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    }

    got = got && !tratados.isEmpty();

    return got;
  }

   public Boolean log_buscar_tratado(String tipouser, String campoB) {
    try {
      System.out.println("ENTRE EN LOG BUSCAR TRATADO");
      java.util.Date fecha = new Date();
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('Usuario', '" + tipouser + "', 'Buscó tratado', '" + campoB + "', '', '" + fecha.toString() + "')";
      System.out.println(sqlquery);
      Statement st = database.getConnection().createStatement();
      Integer i = st.executeUpdate(sqlquery);
      System.out.println("INSERTE EN EL LOG: " + i);
      return i > 0;
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
    return false;
  }
   
  static private String fromChinesetoGregorian(String date) {
    String items[];

    items = date.split("-");

    if (items.length != 3) {
      return "01/01/1970";
    }

    return items[1] + "/" + items[2] + "/" + items[0];
  }
}