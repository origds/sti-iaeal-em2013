/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.SQLException;
import java.sql.Statement;
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
            String sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + u.getUsuario() + "'), '', 'inicio sesion', '', '', '" + fecha.toString() + "')";
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
            String sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + u.getUsuario() + "'), '', 'cerro sesion', '', '', '" + fecha.toString() + "')";
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
  
    public Boolean log_agregar_tratado(Tratado t) {
        try {
            System.out.println("ENTRE EN LOG AGREGO TRATADO");
            java.util.Date fecha = new Date();
            String sqlquery = "";
            if (t.getStatus() == 1) {
              sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + t.getUsuario() + "'), '', 'transcriptor agrego tratado en temporal', '', '" + t.getId() + "', '" + fecha.toString() + "')";
            } else if (t.getStatus() == 2) {
              sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + t.getUsuario() + "'), '', 'administrador agrego tratado', '', '" + t.getId() + "', '" + fecha.toString() + "')";
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
    
    public Boolean log_actualizar_tratado(Tratado t) {
        try {
            System.out.println("ENTRE EN LOG ACTUALIZAR TRATADO");
            java.util.Date fecha = new Date();
            String sqlquery = "";
            if (t.getStatus() == 1) {
              sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + t.getUsuario() + "'), '', 'transcriptor actualizo tratado en temporal', '', '" + t.getId() + "', '" + fecha.toString() + "')";
            } else if (t.getStatus() == 2) {
              sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + t.getUsuario() + "'), '', administrador actualizo tratado', '', '" + t.getId() + "', '" + fecha.toString() + "')";
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
              sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + t.getUsuario() + "'), '', 'transcriptor elimino tratado en temporal', '', '" + t.getId() + "', '" + fecha.toString() + "')";
            } else if (t.getStatus() == 2) {
              sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + t.getUsuario() + "'), '', 'administrador elimino tratado', '', '" + t.getId() + "', '" + fecha.toString() + "')";
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
     
    public Boolean log_buscar_tratado(Log l, Tratado t) {
        try {
            System.out.println("ENTRE EN LOG AGREGO TRANS");
            java.util.Date fecha = new Date();
            String sqlquery = "INSERT INTO \"STI\".log VALUES (lower('USUARIO'), '"  + l.getTipoUser() + "', 'busco tratado', '" + l.getCampoBusqueda() + "', '" + t.getId() + "', '" + fecha.toString() + "')";
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
    
    public Boolean log_crear_usuario(Usuario u) {
        try {
            System.out.println("ENTRE EN CREAR USUARIO");
            java.util.Date fecha = new Date();
            String sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + u.getUsuario() + "'), ";
            if (u.isAdministrador()) {
                sqlquery += " 'administrador', 'creo un usuario', '', '', '" + fecha.toString() + "')";
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
            System.out.println("ENTRE EN CREAR USUARIO");
            java.util.Date fecha = new Date();
            String sqlquery = "INSERT INTO \"STI\".log VALUES (lower('" + u.getUsuario() + "'), ";
            if (u.isAdministrador()) {
                sqlquery += " 'administrador', 'elimino un usuario', '', '', '" + fecha.toString() + "')";
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
 
}