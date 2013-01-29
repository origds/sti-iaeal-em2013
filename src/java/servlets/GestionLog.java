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