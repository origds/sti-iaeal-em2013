
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
import javabeans.est;
import javabeans.Comparar;
import javabeans.Tratado;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DatabaseComparar;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import java.util.Date;

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
        if ((c.getDiaIni1() == 0) && (c.getMesIni1() == 0) && (c.getAnoIni1() == 0)
                && (c.getDiaFin1() == 0) && (c.getMesFin1() == 0) && (c.getAnoFin1() == 0)) {
            if ((c.getDiaIni2() == 0) && (c.getMesIni2() == 0) & (c.getAnoIni2() == 0)
                    && (c.getDiaFin2() == 0) && (c.getMesFin2() == 0) && (c.getAnoFin2() == 0)) {
                request.setAttribute("failure", "compararTra");                             
                return mapping.findForward(SUCCESS);
            }
        }
        System.out.println("Soy distinto de cero");
        
        request.setAttribute("Comparar", c);
        return mapping.findForward(FAILURE);

    }
}