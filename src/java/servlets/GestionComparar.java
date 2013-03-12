/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import javabeans.Comparar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DatabaseComparar;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author mary
 */
public class GestionComparar extends MappingDispatchAction {
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";
  
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            Comparar c = (Comparar) form;
            c = DatabaseComparar.getInstance().compararTratados(c);
            request.setAttribute("Comparar", c);
            return mapping.findForward(SUCCESS);
    }
}