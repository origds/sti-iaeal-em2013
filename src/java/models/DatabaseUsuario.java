/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import javabeans.Usuario;

/**
 *
 * @author vicente
 */
public class DatabaseUsuario {

  private Database database;

  public DatabaseUsuario(String driver, String databaseUrl) {
    this.database = Database.getInstance(driver, databaseUrl);
  }

  public boolean save(Usuario u) {

    int saved = 0;

    String sqlquery = "INSERT INTO \"STI\".usuario VALUES "
            + "('" 
            + u.getUsuario() + "' , '"
            + u.getContrasena() + "' , '"
            + u.getNombre() + "' , '"
            + u.getApellido() + "' , '"
            + u.getCorreo() + "' , '"
            + u.isAdministrador() + "' , '"
            + new Timestamp(0)
            + "')";
    System.out.println(sqlquery);
    try {
      Statement st = Database.getConnection().createStatement();
      saved = st.executeUpdate(sqlquery);
    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    return saved > 0;
  }

  public boolean get(Usuario u, boolean getByUsuario) {

    boolean got = false;
    String sqlquery;
    if(getByUsuario) {
      sqlquery = "SELECT * FROM \"STI\".usuario "
            + "WHERE usuario = '" + u.getUsuario() + "'";
    } else {
      sqlquery = "SELECT * FROM \"STI\".usuario "
            + "WHERE usuario = '" + u.getUsuario() + "' AND "
            + "contrasena = '" + u.getContrasena() + "'";
    }

    System.out.println(sqlquery);
    try {
      Statement st = Database.getConnection().createStatement();
      ResultSet rs = st.executeQuery(sqlquery);
      got = rs.next();
      if (got) {
        u.setContrasena(rs.getString("contrasena"));
        u.setNombre(rs.getString("nombre"));
        u.setApellido(rs.getString("apellido"));
        u.setCorreo(rs.getString("correo"));
        u.setAdministrador(rs.getBoolean("administrador"));
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(rs.getTimestamp("ultimaSesion"));
        u.setUltimaSesion(gc);
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    return got;
  }

  public boolean update(Usuario u) {

    int updated = 0;
    String sqlquery = "UPDATE \"STI\".usuario SET "
            + "usuario = '" + u.getUsuario() + "', "
            + "contrasena = '" + u.getContrasena() + "', "
            + "nombre = '" + u.getNombre() + "', "
            + "apellido = '" + u.getApellido() + "', "
            + "correo = '" + u.getCorreo() + "', "
            + "administrador = '" + u.isAdministrador() + "'";
    if(u.getUltimaSesion() != null) {
      sqlquery += ", ultimaSesion = '" + new Timestamp (u.getUltimaSesion().getTimeInMillis()) + "'";
    }        
    sqlquery += " WHERE usuario = '" + u.getUsuario() + "'";
    System.out.println(sqlquery);
    try {
      Statement st = Database.getConnection().createStatement();
      updated = st.executeUpdate(sqlquery);
    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    if (updated > 0) {
      log_iniciar_sesion(u);
    }
    return updated > 0;
  }

  public boolean delete(Usuario u) {

    int deleted = 0;
    String sqlquery = "DELETE FROM \"STI\".usuario WHERE "
            + "usuario = '" + u.getUsuario() + "'";
    System.out.println(sqlquery);
    try {
      Statement st = Database.getConnection().createStatement();
      deleted = st.executeUpdate(sqlquery);
    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    return deleted > 0;
  }

  public ArrayList<Usuario> list() {

    ArrayList<Usuario> l = new ArrayList<Usuario>();
    String sqlquery = "SELECT * FROM \"STI\".usuario";
    System.out.println(sqlquery);
    try {
      Statement st = Database.getConnection().createStatement();
      ResultSet rs = st.executeQuery(sqlquery);
      while (rs.next()) {
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(rs.getTimestamp("ultimaSesion"));
        Usuario u = new Usuario(rs.getString("usuario"),
                rs.getString("contrasena"),
                rs.getString("nombre"),
                rs.getString("apellido"),
                rs.getString("correo"),
                rs.getBoolean("administrador"),
                gc); // Esta fecha se podria dejar como null
        l.add(u);
      }
      return l;
    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }
  
   public Boolean log_iniciar_sesion(Usuario u) {
    try {
      //Calendar fechaLogCalendar = new GregorianCalendar();
      System.out.println("ENTRE EN LOG INICIAR");
      java.util.Date fecha = new Date();
      //Fecha.setFechaAsString(fechaLogCalendar, fecha, datePattern);
      String sqlquery = "INSERT INTO \"STI\".log VALUES ('" + u.getUsuario() + "', '', 'Inició Sesión', '', '', '" + fecha.toString() + "')";
      System.out.println(sqlquery);
      Statement st = database.getConnection().createStatement();
      Integer i = st.executeUpdate(sqlquery);
      System.out.println("INSERTE EN EL LOG: " + i); //bien
      return i > 0;
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
    return false;
  }
}
