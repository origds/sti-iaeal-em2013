package servlets;

import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;
import javabeans.Log;
import javabeans.Tratado;
import javabeans.Usuario;
import javabeans.BusquedaForm;
import javax.servlet.http.HttpServletRequest;
import models.DatabaseLog;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author mary
 */

public class GestionLog extends MappingDispatchAction {

    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private static final String FAILURE = "failure";
    private DatabaseLog dt;

    private void createDatabaseLog() {
        String driver = this.getServlet().getServletContext().getInitParameter("driver");
        String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
        dt = new DatabaseLog(driver, databaseUrl);
    }   
 
  public ActionForward save_logIS(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
           throws Exception {
              createDatabaseLog();
              Usuario u = new Usuario();
              Boolean logIS = dt.log_iniciar_sesion(u);
              if (logIS) {
                return mapping.findForward(SUCCESS);
              } else {
                return mapping.findForward(FAILURE);
              }
  }
  
  public ActionForward save_logCS(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
           throws Exception {
              createDatabaseLog();
              Usuario u = new Usuario();
              Boolean logCS = dt.log_cerrar_sesion(u);
              if (logCS) {
                return mapping.findForward(SUCCESS);
              } else {
                return mapping.findForward(FAILURE);
              }
  }
  
  public ActionForward save_logAT(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
           throws Exception {
              createDatabaseLog();
              Tratado t = new Tratado();
              Boolean logAT = dt.log_agregar_tratado(t);
              if (logAT) {
                return mapping.findForward(SUCCESS);
              } else {
                return mapping.findForward(FAILURE);
              }
  }
  
  public ActionForward save_logActT(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
           throws Exception {
              createDatabaseLog();
              Tratado t = new Tratado();
              Boolean logActT = dt.log_actualizar_tratado(t);
              if (logActT) {
                return mapping.findForward(SUCCESS);
              } else {
                return mapping.findForward(FAILURE);
              }
  }
  
  public ActionForward save_logET(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
           throws Exception {
              createDatabaseLog();
              Tratado t = new Tratado();
              Boolean logET = dt.log_eliminar_tratado(t);
              if (logET) {
                return mapping.findForward(SUCCESS);
              } else {
                return mapping.findForward(FAILURE);
              }
  }
  
  public ActionForward save_logBT(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, String tipo, String campo)
           throws Exception {
              createDatabaseLog();
              Boolean logBT = dt.log_buscar_tratado(tipo,campo);
              if (logBT) {
                return mapping.findForward(SUCCESS);
              } else {
                return mapping.findForward(FAILURE);
              }
  }
  
  public ActionForward save_logCU(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Usuario creador, Usuario creado)
           throws Exception {
              createDatabaseLog();
              Boolean logCU = dt.log_crear_usuario(creador, creado);
              if (logCU) {
                return mapping.findForward(SUCCESS);
              } else {
                return mapping.findForward(FAILURE);
              }
  }
  
  public ActionForward save_logEU(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Usuario u)
           throws Exception {
              createDatabaseLog();
              Boolean logEU = dt.log_eliminar_usuario(u);
              if (logEU) {
                return mapping.findForward(SUCCESS);
              } else {
                return mapping.findForward(FAILURE);
              }
  }
  
     /**
   *
   * @param mapping
   * @param form
   * @param request
   * @param response
   * @return
   * @throws Exception
   */
   
    
  @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
           throws Exception {
              createDatabaseLog();
              ArrayList<Log> lista = dt.list_log();
              request.setAttribute("log", lista);
              System.out.println("Tamaño de log recibidos"+ lista.size());
              return mapping.findForward(SUCCESS);
    }
  
}