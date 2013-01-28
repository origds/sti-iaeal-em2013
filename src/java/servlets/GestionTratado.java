/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.util.ArrayList;
import javabeans.Tratado;
import javabeans.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DatabaseLog;
import models.DatabaseTratado;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author carla
 */
public class GestionTratado extends MappingDispatchAction {

    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private static final String FAILURE = "failure";
    private DatabaseTratado dt;
    private DatabaseLog dl;

    private void createDatabaseTratado() {
        String driver = this.getServlet().getServletContext().getInitParameter("driver");
        String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
        dt = new DatabaseTratado(driver, databaseUrl);
    }
    
    private void createDatabaseLog() {
        String driver = this.getServlet().getServletContext().getInitParameter("driver");
        String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
        dl = new DatabaseLog(driver, databaseUrl);
    }

    public ActionForward crear(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
      Tratado t = (Tratado) form;
      if(t.getPaises().length > 1) {
        t.setClasificacion(true);
      } else {
        t.setClasificacion(false);
      }
      if("".equals(t.getFechaDeposito())) {
        t.setDeposito(false);
      } else {
        t.setDeposito(true);
      }
      if (request.getParameter("aprobado") == null) {
        t.setAprobado(false);
      } else {
        t.setAprobado(true);
      }
      /*String titulo;
      titulo = GestionBusqueda.omitirAcentos(t.getTitulo());
      */
      createDatabaseTratado();
      Usuario u = (Usuario) request.getSession().getAttribute("login");
      t.setUsuario(u);
      if(u.isAdministrador()) {
        t.setStatus(2); // 2 es el status de "Listo"
      } else {
        t.setStatus(0); // 0 es el status de "En Elaboracion"
      }

      if (!dt.save(t)) {
          return mapping.findForward(SUCCESS);
          //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
      }
      request.setAttribute("exito","tratadoCrear");
      return mapping.findForward(SUCCESS);
    }

    public ActionForward crearForm(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward(SUCCESS);
    }
    
    public ActionForward consultar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
      Tratado t = (Tratado) form;
      createDatabaseTratado();
      if (!dt.get(t,true)) {
        //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
      }
      request.setAttribute("tratado", t);
      return mapping.findForward(SUCCESS);
    }

    public ActionForward actualizar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
      Tratado t = (Tratado) form;
      // ESTO ES TEMPORAL
      if(t.getPaises() != null) {
        if(t.getPaises().length > 1) {
          t.setClasificacion(true);
        } else {
          t.setClasificacion(false);
        }
      } else {
        t.setClasificacion(false);
      }
      if("".equals(t.getFechaDeposito())) {
        t.setDeposito(false);
      } else {
        t.setDeposito(true);
      }
      if (request.getParameter("aprobado") == null) {
        t.setAprobado(false);
      } else {
        t.setAprobado(true);
      }
      createDatabaseTratado();
      if (!dt.update(t)) {
        //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
      }
      request.setAttribute("exito","tratadoModificar");
      createDatabaseLog();
      dl.log_actualizar_tratado(t,(Usuario)request.getSession().getAttribute("login"));
      return mapping.findForward(SUCCESS);
    }

    public ActionForward actualizarForm(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
      Tratado t = (Tratado) form;
      createDatabaseTratado();
      if (!dt.get(t,true)) {
        //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
      }
      Usuario u = (Usuario) request.getSession().getAttribute("login");
      if(!u.isAdministrador()) {
        if(!u.getUsuario().equals(t.getUsuario().getUsuario())) {
          return mapping.findForward(FAILURE);
        }  
      }
      request.setAttribute("tratado", t);
      return mapping.findForward(SUCCESS);
    }

    public ActionForward eliminar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        createDatabaseTratado();
        createDatabaseLog();
        Tratado t = (Tratado) form;
        dt.get(t, true);
        dl.log_eliminar_tratado(t);
        // FALTA COLOCAR LA MISMA VERIFICACION QUE EL ACTUALIZAR FORM
        if (!dt.delete(t)) {
            //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
        }
        request.setAttribute("tratado", t);
        return mapping.findForward(SUCCESS);
    }
    
    public ActionForward listar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
      createDatabaseTratado();
      Tratado t = new Tratado();
      t.setStatus(2); // El status 2 es listar tratados listos
      ArrayList<Tratado> tratados = dt.list(t);
      request.setAttribute("tratados", tratados);
      return mapping.findForward(SUCCESS);
    }
    
    public ActionForward listarPendientes(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    createDatabaseTratado();
    Tratado t = new Tratado();
    t.setStatus(1); //1 es el estatus de tratados pendientes
    ArrayList<Tratado> tratados = dt.list(t);
    request.setAttribute("tratados", tratados);
    return mapping.findForward(SUCCESS);
  }

    public ActionForward listarMisTratados(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    createDatabaseTratado();
    Tratado t = new Tratado();
    t.setStatus(0); 
    t.setUsuario((Usuario)request.getSession().getAttribute("login"));
    ArrayList<Tratado> tratados = dt.list(t);
    request.setAttribute("tratados", tratados);
    return mapping.findForward(SUCCESS);
  }
    
  public ActionForward aprobar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    Tratado t = (Tratado) form;
    createDatabaseTratado();
    if (!dt.get(t, true)) {
      //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
    }
    t.setStatus(2);
    if (!dt.update(t)) {
      //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
    }
    createDatabaseLog();
    dl.log_aprobar_tratado(t);
    return mapping.findForward(SUCCESS);
  }
  
  public ActionForward rechazar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    Tratado t = (Tratado) form;
    createDatabaseTratado();
    if (!dt.get(t, true)) {
      //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
    }
    t.setStatus(0);
    if (!dt.update(t)) {
      //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
    }
    createDatabaseLog();
    dl.log_rechazar_tratado(t);
    return mapping.findForward(SUCCESS);
  }
    
  public ActionForward marcarPendiente(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    Tratado t = (Tratado) form;
    createDatabaseTratado();
    if (!dt.get(t, true)) {
      //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
    }
    t.setStatus(1);
    if (!dt.update(t)) {
      //Arrojar excepcion o mensaje o redireccion a otra pagina por FAILURE
    }
    createDatabaseLog();
    dl.log_agregar_tratado(t);    
    return mapping.findForward(SUCCESS);
  }
    
}
