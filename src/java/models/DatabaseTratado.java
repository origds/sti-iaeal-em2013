/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javabeans.Fecha;
import javabeans.Tratado;
import javabeans.Usuario;

/**
 *
 * @author carla
 */
public class DatabaseTratado {

  private Database database;
  private String datePattern = "MM/dd/yyyy";

  public DatabaseTratado(String driver, String databaseUrl) {
      this.database = Database.getInstance(driver, databaseUrl);
  }

  public boolean save(Tratado t) {

    int savedTratado=0, savedPais=0, savedGrupo=0;
    String sqlqueryTratado;
    String sqlqueryPaises    = "";
    String sqlqueryGrupos   = "";

    Calendar firmaFechaCalendar        = new GregorianCalendar();
    Calendar fechaGacetaCalendar       = new GregorianCalendar();
    Calendar canjeNotificacionCalendar = new GregorianCalendar();
    Calendar fechaDepositoCalendar     = new GregorianCalendar();
    Calendar entradaVigorCalendar      = new GregorianCalendar();
    
    Fecha.setFechaAsString(firmaFechaCalendar, t.getFirmaFecha(), datePattern);
    Fecha.setFechaAsString(fechaGacetaCalendar, t.getFechaGaceta(), datePattern);
    Fecha.setFechaAsString(canjeNotificacionCalendar, t.getCanjeNotificacion(), datePattern);
    Fecha.setFechaAsString(fechaDepositoCalendar, t.getFechaDeposito(), datePattern);
    Fecha.setFechaAsString(entradaVigorCalendar, t.getEntradaVigor(), datePattern);

    //Se verifica el tipo de clasificacion del tratado
    t.checkClasificacion();

    String titulomayuscula = t.getTitulo().toUpperCase();
    t.setTitulo(titulomayuscula);
    System.out.println("Titulo" + t.getTitulo());
   
    // Se insertan los.toUpperCase() valores a la tabla tratado  
    sqlqueryTratado = "INSERT INTO \"STI\".tratado (titulo,"
          + " clasificacion, aprobado, firmaLugar, firmaFecha, numGaceta, "
          + "fechaGaceta, canjeNotificacion, deposito, fechaDeposito, "
          + "entradaVigor, duracion, periodo, volumen, pagina, "
          + "observacion, contenido, status, usuarioT) VALUES "
          + "('" 
          + t.getTitulo() + "' , '"
          + t.isClasificacion() + "' , '"
          + t.isAprobado() + "' , '"
          + t.getFirmaLugar() + "' , '"
          + firmaFechaCalendar.getTime() + "' , '"
          + t.getNumGaceta() + "' , '"
          + fechaGacetaCalendar.getTime() + "' , '"
          + canjeNotificacionCalendar.getTime() + "' , '"
          + t.isDeposito() + "' , '"
          + fechaDepositoCalendar.getTime() + "' , '"
          + entradaVigorCalendar.getTime() + "' , '"
          + t.getDuracion() + "' , '"
          + t.getPeriodo() + "' , '"
          + t.getVolumen() + "' , '"
          + t.getPagina() + "' , '"
          + t.getObservacion() + "' , '"
          + t.getContenido() + "', '"
          + t.getStatus() + "', '"
          + t.getUsuario().getUsuario()
          + "')";
     
      try { //ejecuto los query
        
        System.out.println("SQLQUERIES:");
        System.out.println(sqlqueryTratado);
        
        Statement st = Database.getConnection().createStatement();
        savedTratado = st.executeUpdate(sqlqueryTratado);

        get(t, false); 

        /* Se insertan los valores de los paises participantes en la tabla
        de paises */

        for (int i=0; i<t.getPaises().length; ++i) {
            sqlqueryPaises += "INSERT INTO \"STI\".pais VALUES " 
                + "('" + t.getId() + "' , '"  
                + t.getPaises()[i] + "'); ";
        }

        /* Se insertan los valores de los grupos de los paises en la tabla
        de grupos */

        for (int i=0; i<t.getGrupos().length; ++i) {
          if(!"".equals(t.getGrupos()[i])) {
            sqlqueryGrupos += "INSERT INTO \"STI\".grupo VALUES " 
                + "('" + t.getId() + "' , '"  
                + t.getGrupos()[i] + "'); ";
          }
        }
        
        System.out.println(sqlqueryPaises);
        System.out.println(sqlqueryGrupos);
        
        savedPais = st.executeUpdate(sqlqueryPaises);
        savedGrupo = st.executeUpdate(sqlqueryGrupos);

      } catch (SQLException ex) {
          ex.printStackTrace();
          //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
      }
      if (savedTratado>0 && savedPais>0 && savedGrupo>=0){
        log_agregar_tratado(t);
      }
      return (savedTratado>0 && savedPais>0 && savedGrupo>=0);
  }

  public boolean get(Tratado t, boolean getById) {

    boolean got = false;

    // Se hace el select de la tabla tratado sobre el id de ese tratado
    String sqlqueryTratado;
    if(getById) {
      sqlqueryTratado = "SELECT * FROM \"STI\".tratado "
              + "WHERE id = '" + t.getId() + "'";
    } else {
      Calendar c = new GregorianCalendar();
      Fecha.setFechaAsString(c, t.getFirmaFecha(), datePattern);

      sqlqueryTratado = "SELECT * FROM \"STI\".tratado "
        + "WHERE titulo = '" + t.getTitulo() + "'" + " AND "
        + "firmaLugar = '" + t.getFirmaLugar() + "'" + " AND "
        + "firmaFecha = '" + c.getTime() + "'";
    }

    System.out.println("*********SQLQUERIES:");

    
    try {
      
      Statement st = Database.getConnection().createStatement();
      ResultSet rs = st.executeQuery(sqlqueryTratado);
      got = rs.next();
      if (got) { //Se guardan el tratado t todos los atts seleccionados de la tabla
        GregorianCalendar gc;

        t.setId(rs.getInt("id"));
        t.setTitulo(rs.getString("titulo"));
        t.setClasificacion(rs.getBoolean("clasificacion"));
        t.setAprobado(rs.getBoolean("aprobado"));
        t.setFirmaLugar(rs.getString("firmaLugar"));
        t.setNumGaceta(rs.getString("numGaceta"));
        t.setDeposito(rs.getBoolean("deposito"));
        t.setDuracion(rs.getString("duracion"));
        t.setPeriodo(rs.getInt("periodo"));
        t.setVolumen(rs.getInt("volumen"));
        t.setPagina(rs.getInt("pagina"));
        t.setObservacion(rs.getString("observacion"));
        t.setContenido(rs.getString("contenido"));
        t.setStatus(rs.getInt("status"));
        
        t.setFechas(rs, datePattern);
        
        String sqlqueryPais = "SELECT * FROM \"STI\".pais "
            + "WHERE idTP = '" + t.getId() + "'";

        String sqlqueryGrupo = "SELECT * FROM \"STI\".grupo "
            + "WHERE idTG = '" + t.getId() + "'";
        
        System.out.println(sqlqueryPais);
        System.out.println(sqlqueryGrupo);
        
        if(t.getUsuario() == null) {
          Usuario u = new Usuario();
          u.setUsuario(rs.getString("usuarioT"));
          t.setUsuario(u);
        } else {
          t.getUsuario().setUsuario(rs.getString("usuarioT"));
        }

        ArrayList<String> paises = new ArrayList<String>();
        ArrayList<String> grupos = new ArrayList<String>();       
        
        st = Database.getConnection().createStatement();
        rs = st.executeQuery(sqlqueryPais);

        while(rs.next()) {
          paises.add(rs.getString("pais"));
        }

        for(int i = 0; i < paises.size(); i++){
          System.out.println("***** PAISES: " +paises.get(i));
        }
        st = Database.getConnection().createStatement();
        rs = st.executeQuery(sqlqueryGrupo);

        while(rs.next()) {
          grupos.add(rs.getString("grupo"));
        }
        
        String [] paisesArreglo = new String [paises.size()];
        for(int i = 0 ; i < paises.size(); ++i) {
          paisesArreglo[i] = paises.get(i);
        }
        
        String [] gruposArreglo = new String [grupos.size()];
        for(int i = 0 ; i < grupos.size(); ++i) {
          gruposArreglo[i] = grupos.get(i);
        }
        
        if(getById) {
          t.setPaises(paisesArreglo);
          t.setGrupos(gruposArreglo);
        }

      }

    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    got = got && (t.getPaises() != null) && (t.getPaises().length > 0);
    return got;
  }

  public boolean update(Tratado t) {

    int updatedTratado = 0; 
    int savedPais = 0; 
    int deletedPais = 0; 
    int savedGrupo = 0;
    int deletedGrupo = 0;

    String sqlqueryTratado;
    String sqlqueryPais = ""; 
    String sqlqueryGrupo= ""; 
    String sqlqueryDeletePais; 
    String sqlqueryDeleteGrupo;  
    
    Calendar firmaFechaCalendar        = new GregorianCalendar();
    Calendar fechaGacetaCalendar       = new GregorianCalendar();
    Calendar canjeNotificacionCalendar = new GregorianCalendar();
    Calendar fechaDepositoCalendar     = new GregorianCalendar();
    Calendar entradaVigorCalendar      = new GregorianCalendar();
    
    Fecha.setFechaAsString(firmaFechaCalendar, t.getFirmaFecha(), datePattern);
    Fecha.setFechaAsString(fechaGacetaCalendar, t.getFechaGaceta(), datePattern);
    Fecha.setFechaAsString(canjeNotificacionCalendar, t.getCanjeNotificacion(), datePattern);
    Fecha.setFechaAsString(fechaDepositoCalendar, t.getFechaDeposito(), datePattern);
    Fecha.setFechaAsString(entradaVigorCalendar, t.getEntradaVigor(), datePattern);
    
    //Se verifica cual es la nueva clasificacion del tratado.
    System.out.println("GRUPOOS" + t.getGrupos());
    if (t.getGrupos() == null) {
      t.checkClasificacionFalse();
    } else {
      t.checkClasificacion();
    }
    
    String titulomayus = t.getTitulo().toUpperCase();
    t.setTitulo(titulomayus);
    System.out.println("Titulo" + titulomayus);
    
    System.out.println("Clasificacion UPDATE= " + t.isClasificacion());
    // Se hace el update para la tabla tratado
    sqlqueryTratado = "UPDATE \"STI\".tratado SET "
        + "titulo = '" + t.getTitulo() + "' , "
        + "clasificacion = '" + t.isClasificacion() + "' , "
        + "aprobado = '" + t.isAprobado() + "' , "
        + "firmaLugar = '" + t.getFirmaLugar() + "' , "
        + "firmaFecha= '" + firmaFechaCalendar.getTime() + "' , "
        + "numGaceta = '" + t.getNumGaceta() + "' , "
        + "fechaGaceta = '" + fechaGacetaCalendar.getTime() + "' , "
        + "canjeNotificacion='" + canjeNotificacionCalendar.getTime() + "' , "
        + "deposito = '" + t.isDeposito() + "' , "
        + "fechaDeposito = '" + fechaDepositoCalendar.getTime() + "' , "
        + "entradaVigor = '" + entradaVigorCalendar.getTime() + "' , "
        + "duracion = '" + t.getDuracion() + "' , "
        + "periodo = '" + t.getPeriodo() + "' , "
        + "volumen = '" + t.getVolumen() + "' , "
        + "pagina = '" + t.getPagina() + "' , "
        + "observacion = '" + t.getObservacion() + "' , "
        + "contenido = '" + t.getContenido() + "' , "
        + "status = '" + t.getStatus() + "' "   
        + "WHERE id = '" + t.getId() + "' ";

    /* Para hacer update de los paises y los grupos se eliminan las 
    instancias primero y luefo un ciclo que reocorra el arraylist para 
    insertar los nuevos valores */
    
    sqlqueryDeletePais = "DELETE FROM \"STI\".pais WHERE "
        + "idTP = '" + t.getId() + "'";

    for (int i=0; i < t.getPaises().length; ++i) {
      sqlqueryPais += "INSERT INTO \"STI\".pais VALUES ('" + t.getId() + "' , '" + t.getPaises()[i] + "'); ";
    }

    sqlqueryDeleteGrupo = "DELETE FROM \"STI\".grupo WHERE "
        + "idTG = '" + t.getId() + "'";

    if (!(t.getGrupos() == null)) {
      for (int i=0; i < t.getGrupos().length; ++i) {
        if(!"".equals(t.getGrupos()[i])) {
          sqlqueryGrupo += "INSERT INTO \"STI\".grupo VALUES ('" + t.getId() + "' , '" + t.getGrupos()[i] + "'); ";
        }
      }
    }
    
    System.out.println("SQLQUERIES:");
    System.out.println(sqlqueryTratado);
    System.out.println(sqlqueryDeletePais);
    System.out.println(sqlqueryPais);
    System.out.println(sqlqueryDeleteGrupo);
    System.out.println(sqlqueryGrupo);

    // Se ejecutan los query
    try {
      Statement st = Database.getConnection().createStatement();
      updatedTratado = st.executeUpdate(sqlqueryTratado);
      deletedPais = st.executeUpdate(sqlqueryDeletePais);
      savedPais = st.executeUpdate(sqlqueryPais);
      deletedGrupo = st.executeUpdate(sqlqueryDeleteGrupo);
      savedGrupo = st.executeUpdate(sqlqueryGrupo);
    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }

    /* Se verifica que de cambiarse los valores para grupo se haya 
    borrado y guardado el nuevo valor */
    boolean b= true;
    if ((!(t.getGrupos() == null)) && (t.getGrupos().length > 0)) {
      b = (deletedGrupo > 0) && (savedGrupo > 0);
    }

    return (updatedTratado > 0 && deletedPais > 0 && savedPais > 0 && b);
  }

  public boolean delete(Tratado t) {

    int deletedTratado = 0;
    int deletedPais = 0;
    int deletedGrupo = 0;

    // Se eliminan los valores relacionados con el tratado de las 3 tablas
    String sqlqueryTratado = "DELETE FROM \"STI\".tratado WHERE "
            + "id = '" +t.getId()+ "'";

    String sqlqueryPais = "DELETE FROM \"STI\".pais WHERE "
            + "idTP = '" +t.getId()+ "'";

    String sqlqueryGrupo = "DELETE FROM \"STI\".grupo WHERE "
            + "idTG = '" +t.getId()+ "'";

    System.out.println("SQLQUERIES:");
    System.out.println(sqlqueryTratado);
    System.out.println(sqlqueryPais);
    System.out.println(sqlqueryGrupo);

    //Se ejecutan los query
    try {
      Statement st = Database.getConnection().createStatement();
      deletedPais = st.executeUpdate(sqlqueryPais);
      deletedGrupo = st.executeUpdate(sqlqueryGrupo);
      deletedTratado = st.executeUpdate(sqlqueryTratado);
     
    } catch (SQLException ex) {
        ex.printStackTrace();
        //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    return (deletedTratado > 0 && deletedPais > 0 && deletedGrupo >= 0);
  }

  public ArrayList<Tratado> list(Tratado ts) {

    // Se declara la lista a retornar
    ArrayList<Tratado> l = new ArrayList<Tratado>();
    String sqlqueryTratado;
    
    //Se hace el select de todos los tratados sobre la tabla de tratados
    if (ts.getUsuario()==null) {
      sqlqueryTratado = "SELECT * FROM \"STI\".tratado WHERE status = '"
              + ts.getStatus() + "'";
    } else {
      sqlqueryTratado = "SELECT * FROM \"STI\".tratado WHERE usuarioT = '" 
              + ts.getUsuario().getUsuario() + "' AND status = '" 
              + ts.getStatus() + "'";
    }
        
    System.out.println("SQLQUERIES:");
    System.out.println(sqlqueryTratado);
    
    try {
      Statement st = Database.getConnection().createStatement();
      ResultSet rsT = st.executeQuery(sqlqueryTratado);

      /* Luego que se ejecuta el select, se itera sobre los valores 
       * obtenidos para pasarlos a un objeto t y luego añadirlo a la 
       * lista
       */

      while (rsT.next()) {
        Tratado t = new Tratado(rsT.getInt("id"),
                                rsT.getString("titulo"), 
                                rsT.getBoolean("clasificacion"),
                                rsT.getBoolean("aprobado"), 
                                rsT.getString("firmaLugar"),
                                "",
                                rsT.getString("numGaceta"), 
                                "",
                                "",
                                rsT.getBoolean("deposito"),
                                "",
                                "",
                                rsT.getString("duracion"),
                                rsT.getInt("periodo"), 
                                rsT.getInt("volumen"), 
                                rsT.getInt("pagina"),
                                rsT.getString("observacion"), 
                                rsT.getString("contenido"),
                                null,
                                null,
                                rsT.getInt("status"), 
                                null
                               );

        t.setFechas(rsT, datePattern);

        st = Database.getConnection().createStatement();
        String sqlqueryPais = "SELECT pais FROM \"STI\".pais WHERE idTP = " + t.getId();
        System.out.println(sqlqueryPais);
        
        ResultSet rsP = st.executeQuery(sqlqueryPais);
        ArrayList<String> paises = new ArrayList<String> ();
        while (rsP.next()){
          paises.add(rsP.getString("pais"));
        }               

        st = Database.getConnection().createStatement();
        String sqlqueryGrupo = "SELECT grupo FROM \"STI\".grupo WHERE idTG = " + t.getId();
        System.out.println(sqlqueryGrupo);
        
        ResultSet rsG = st.executeQuery(sqlqueryGrupo);
        ArrayList<String> grupos = new ArrayList<String> ();
        while (rsG.next()) {
          grupos.add(rsG.getString("grupo"));
        }

        String [] paisesArreglo = new String [paises.size()];
        for(int i = 0 ; i < paises.size(); ++i) {
          paisesArreglo[i] = paises.get(i);
        }
        
        t.setPaises(paisesArreglo);
        
        String [] gruposArreglo = new String [grupos.size()];
        for(int i = 0 ; i < grupos.size(); ++i) {
          gruposArreglo[i] = grupos.get(i);
        }
        
        t.setGrupos(gruposArreglo);

        l.add(t);
      }
      return l;
    } catch (SQLException ex) {
      ex.printStackTrace();
      //Logger.getLogger(DatabaseUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }
  
   public Boolean log_agregar_tratado(Tratado t) {
    try {
      System.out.println("ENTRE EN LOG AGREGO TRATADO");
      java.util.Date fecha = new Date();
      String sqlquery = "";
      if (t.getStatus() == 0) {
        sqlquery = "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '', 'Transcriptor agregó tratado en temporal', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      } else if (t.getStatus() == 2) {
        sqlquery = "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '', 'Administrador agregó tratado', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";
      } else if (t.getStatus() == 1) {
         sqlquery = "INSERT INTO \"STI\".log VALUES ('" + t.getUsuario().getUsuario() + "', '', 'Transcriptor marcó tratado como \"Pendiente\"', '', '" + t.getTitulo() + "', '" + fecha.toString() + "')";    
      }
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