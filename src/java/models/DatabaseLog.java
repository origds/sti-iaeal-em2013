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
import javabeans.Log;
import javabeans.Tratado;
import javabeans.Usuario;
/*import java.util.Calendar;
 import java.util.GregorianCalendar;
 import javabeans.Fecha;*/

/**
 *
 * @author mary
 */
public class DatabaseLog {

  private Database database;
  private String datePattern = "MM/dd/yyyy";

  public DatabaseLog(String driver, String databaseUrl) {
    this.database = Database.getInstance(driver, databaseUrl);
  }
  
  public Boolean log_iniciar_sesion(Usuario u) {
    try {
      //Calendar fechaLogCalendar = new GregorianCalendar();
      System.out.println("ENTRE EN LOG INICIAR");
      java.util.Date fecha = new Date();
      //Fecha.setFechaAsString(fechaLogCalendar, fecha, datePattern);
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('" + u.getUsuario() + "', '', 'inicio sesion', '', '', '" + fecha.toString() + "')";
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

  public Boolean log_cerrar_sesion(Usuario u) {
    try {
      System.out.println("ENTRE EN LOG CERRAR");
      java.util.Date fecha = new Date();
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('" + u.getUsuario() + "', '', 'cerro sesion', '', '', '" + fecha.toString() + "')";
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

  /*Ademas de guardar el log cuando se agregan tratados tambien guarda el log cuando un tratado se agrega como pendiente*/
  
  public Boolean log_agregar_tratado(Tratado t) {
    try {
      System.out.println("ENTRE EN LOG AGREGO TRATADO");
      java.util.Date fecha = new Date();
      String sqlquery = "";
      if (t.getStatus() == 0) {
        sqlquery = "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '', 'transcriptor agrego tratado en temporal', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      } else if (t.getStatus() == 2) {
        sqlquery = "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '', 'administrador agrego tratado', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      } else if (t.getStatus() == 1) {
         sqlquery = "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '', 'transcriptor marco tratado como \"pendiente\"', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";    
      }
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

  public Boolean log_actualizar_tratado(Tratado t, Usuario u) {
    try {
      System.out.println("ENTRE EN LOG ACTUALIZAR TRATADO");
      java.util.Date fecha = new Date();
      String sqlquery = "";
      if (t.getStatus() == 0) {
        sqlquery = "INSERT INTO \"STI\".log VALUES ('" + u.getUsuario() + "', '', 'transcriptor actualizo tratado en temporal', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      } else if (t.getStatus() == 2) {
        sqlquery = "INSERT INTO \"STI\".log VALUES ('" + u.getUsuario() + "', '', 'administrador actualizo tratado', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      } else if (t.getStatus() == 1) {
        sqlquery = "INSERT INTO \"STI\".log VALUES ('" + u.getUsuario() + "', '', 'administrador actualizo tratado en temporal', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      }
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

  public Boolean log_eliminar_tratado(Tratado t) {
    try {
      System.out.println("ENTRE EN LOG ELIMINO TRATADO");
      java.util.Date fecha = new Date();
      String sqlquery = "";
      if (t.getStatus() == 1) {
        sqlquery += "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '', 'transcriptor elimino tratado en temporal', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      } else if (t.getStatus() == 2) {
        sqlquery += "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '', 'administrador elimino tratado', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      }
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
  
  /*el primer nombre es el user del que escribio tratado y el segundo es el nombre del administrador que lo aprobo*/
  public Boolean log_aprobar_tratado(Tratado t, Usuario u) {
    try {
      System.out.println("ENTRE EN LOG APROBAR TRATADO");
      java.util.Date fecha = new Date();
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '"+ u.getUsuario() +"', 'administrador aprobo tratado de transcriptor', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
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
  
  /*el primer nombre es el user del que escribio tratado y el segundo es el nombre del administrador que lo rechazo*/
  public Boolean log_rechazar_tratado(Tratado t, Usuario u) { 
    try {
      System.out.println("ENTRE EN LOG APROBAR TRATADO");
      java.util.Date fecha = new Date();
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '" + u.getUsuario() + "', 'administrador rechazo tratado de transcriptor', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
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

  public Boolean log_buscar_tratado(String tipouser, String campoB) {
    try {
      System.out.println("ENTRE EN LOG BUSCAR");
      java.util.Date fecha = new Date();
      
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('Usuario', '" + tipouser + "', 'busco tratado', '" + campoB + "', '', '" + fecha.toString() + "')";
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

  public Boolean log_crear_usuario(Usuario creador, Usuario creado) {
    try {
      System.out.println("ENTRE EN CREAR USUARIO");
      java.util.Date fecha = new Date();
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('" + creador.getUsuario() + "',";
      if (creado.isAdministrador()) {
        sqlquery += " 'administrador \""+creado.getUsuario()+"\"', 'creo un usuario', '', '', '" + fecha.toString() + "')";
      } else {
        sqlquery += " 'transcriptor \""+creado.getUsuario()+"\"', 'creo un usuario', '', '', '" + fecha.toString() + "')";
      }
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

  public Boolean log_eliminar_usuario(Usuario u) {
    try {
      System.out.println("ENTRE EN ELIMINAR USUARIO");
      java.util.Date fecha = new Date();
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('" + u.getUsuario() + "', '', 'elimino un usuario', '', '', '" + fecha.toString() + "')";
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

  public ArrayList<Log> list_log() {

    ArrayList<Log> l = new ArrayList<Log>();
    String sqlquery = "SELECT * FROM \"STI\".log";
    System.out.println(sqlquery);
    try {
      Statement st = Database.getConnection().createStatement();
      ResultSet rs = st.executeQuery(sqlquery);
      while (rs.next()) {
        Log log = new Log(rs.getString("usuario"),
                rs.getString("accion"),
                rs.getInt("idTratado"),
                rs.getString("fecha_hora"),
                rs.getString("tipoUser"),
                rs.getString("campoBusqueda"));
        l.add(log);
      }
      return l;
    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }
}