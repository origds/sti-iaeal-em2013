/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import javabeans.BusquedaForm;
import javabeans.Tratado;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DatabaseBusqueda;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author matteo
 */
public class GestionBusqueda extends MappingDispatchAction {

  /* forward name="success" path="" */
  private static final String SUCCESS = "success";
  private static final String FAILURE = "failure";
  private DatabaseBusqueda db;

  private void createDatabaseBusqueda() {
    String driver = this.getServlet().getServletContext().getInitParameter("driver");
    String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
    db = new DatabaseBusqueda(driver, databaseUrl);
  }

  public ActionForward buscar(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    BusquedaForm b = (BusquedaForm) form;
    ArrayList<Tratado> t = new ArrayList<Tratado>();
    b.setClaves(omitirAcentos(b.getClaves()));
    System.out.println("----clave= " + b.getClaves());
    b.setPais(omitirAcentos(b.getPais()));

    createDatabaseBusqueda();
    if (!db.get(b, t)) {
      //exception
    }
    System.out.println("---->"+t);
    request.getSession().setAttribute("paises", b.getPais());
    if ((b.getFechaini().compareTo("") != 0) || (b.getFechafin().compareTo("") != 0)) {
      request.getSession().setAttribute("fechafin",b.getFechafin());
      request.getSession().setAttribute("fechaini",b.getFechaini());
    } else {
      request.getSession().setAttribute("fechafin", b.getAnio());
      request.getSession().setAttribute("fechaini", b.getAnio());
    }
    request.getSession().setAttribute("tratados", t);
    return mapping.findForward(SUCCESS);
  }

  public ActionForward buscarForm(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    return mapping.findForward(SUCCESS);
  }

  public static String omitirAcentos(String s) {

    /*int aux[] = new int[s.length()];  
     int enes = 0, i = 0;
    
     while (true) {
     i = s.indexOf("ñ",i);
     System.out.println(i);
     if (i == -1)
     break;
      
     aux[enes] = i;
     enes++;
     i++;
     }
     */
    s = Normalizer.normalize(s, Normalizer.Form.NFD);
    s = s.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
    /*
     char c[] = s.toCharArray();
     s = "";
    
     for (i = 0; i < enes; i++) {
     c[aux[i]] = 'ñ';
     System.out.println("    " + aux[i]);
     }
    
     for (i = 0; i < c.length; i++) {
     s += "" + c[i];
     }
    
     System.out.println("---: " + s);
     */
    return s;
  }
}
