/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.Calendar;
import javabeans.Buscable;
import javabeans.EstadisticaForm;
import javabeans.Tratado;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DatabaseEstadistica;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import java.util.Date;

/**
 *
 * @author betocols
 */
public class GestionEstadistica extends MappingDispatchAction {

  /* forward name="success" path="" */
  private static final String SUCCESS = "success";
  private static final String FAILURE = "failure";
  private DatabaseEstadistica db;

  private void createDatabaseEstadistica() {
    String driver = this.getServlet().getServletContext().getInitParameter("driver");
    String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
    db = new DatabaseEstadistica(driver, databaseUrl);
  }

  public ActionForward generarEstadistica(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    EstadisticaForm e = (EstadisticaForm) form;
    ArrayList<Tratado> t = (ArrayList<Tratado>) request.getSession().getAttribute("tratados");
    ArrayList<Buscable> b = new ArrayList<Buscable>();
    String paises, fec, pai; //String donde se almacenaran los paises buscados.
    paises = null;
    fec = null;
    String[] fechas = new String[2], paisesABuscar = null, fechasABuscar = null, datos; //String donde se almacenaran las fechas inicio y fin
    int total = 0, rgoFechas = 0, j, i;   //Se almacena el total de tratados conseguidos en la busqueda.
    boolean esta = false;
    String[] elemento;
    int[] conteo;
    double[] porcentaje;

    //Si el ejeX es de Paises
    if (Integer.parseInt(e.getEjeX()) == 0) {

      //Si hay elementos en los paises del EstadisticaForm
      if (!e.getPais().isEmpty()) {
        //Asigno el valor de los paises de EstadisticaForm
        paises = e.getPais();
      }
    } else if (Integer.parseInt(e.getEjeX()) == 1) {

      //Si hay fechas inicial en el EstadisticaForm
      if (!e.getFechaini().isEmpty()) {
        fechas[0] = e.getFechaini();
      } else {
        fechas[0] = "1830";
      }

      //Si hay fechas final en el EstadisticaForm
      if (!e.getFechafin().isEmpty()) {
        fechas[1] = e.getFechafin();
      } else {
        fechas[1] = "" + Calendar.getInstance().get(Calendar.YEAR);
      }
    }

    createDatabaseEstadistica();

    if (!db.get(e, b, t)) {
      //excepcion
    }

    //Obtengo los datos de los buscables y la suma de los cont
    datos = new String[b.size()];
    for (i = 0; i < b.size(); i++) {
      datos[i] = ((String) b.get(i).getDato());
      total += b.get(i).getCont();
    }

    if (Integer.parseInt(e.getEjeX()) == 0) {
      //Si tengo una lista de paises
      if (paises != null) {
        paisesABuscar = paises.split(",");
        for (j = 0; j < paisesABuscar.length; j++) {
          pai = paisesABuscar[j].trim();
          //Revisa que sea un string valido
          if (pai.compareTo("") != 0) {
            //Revisa si el pais esta entre los paises buscados
            for (i = 0; i < datos.length; i++) {
              if (GestionBusqueda.omitirAcentos(datos[i].toLowerCase()).compareTo(GestionBusqueda.omitirAcentos(pai.toLowerCase())) == 0) {
                break;
              }
            }
            if (i == datos.length) {
              //if (!datos.contains(pai)) {
              b.add(new Buscable(pai, 0));
            }
          }
        }
      }
    } else if (Integer.parseInt(e.getEjeX()) == 1) {

      rgoFechas = Integer.parseInt(fechas[1]) - Integer.parseInt(fechas[0]);
      fechasABuscar = new String[rgoFechas];
      for (j = 0; j < rgoFechas; j++) {
        //Asigno a la primera posicion la fecha
        fechasABuscar[j] = Integer.toString(Integer.parseInt(fechas[0]) + j);
      }

      //Reviso si las fechasABuscar estan entre los buscables, de no estar los agrego al final de la lista.
      for (j = 0; j < fechasABuscar.length; j++) {
        fec = fechasABuscar[j];
        //Revisa si el pais esta entre los paises buscados
        for (i = 0; i < datos.length; i++) {
          if (datos[i].compareTo(fec) == 0) {
            break;
          }
        }
        if (i == datos.length) {
          //if (!datos.contains(pai)) {
          b.add(new Buscable(fec, 0));
        }
      }
    }
    
    b.add(new Buscable("Otros", (t.size() - total)));
    
    elemento = new String[b.size()];
    conteo = new int[b.size()];
    porcentaje = new double[b.size()];

    for (i = 0; i < b.size(); i++) {
      elemento[i] = b.get(i).getDato();
      conteo[i] = b.get(i).getCont();
      porcentaje[i] = ((double)conteo[i] * 100.00) / (double)t.size();
      porcentaje[i] = Math.floor(porcentaje[i] * 100) / 100;
    }

    request.getSession().setAttribute("resultEstadisticaTratados", b);
    request.getSession().setAttribute("elemento", elemento);
    request.getSession().setAttribute("conteo", conteo);
    request.getSession().setAttribute("porcentaje", porcentaje);
    return mapping.findForward(SUCCESS);
  }

  public ActionForward estadisticaForm(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    return mapping.findForward(SUCCESS);
  }
}