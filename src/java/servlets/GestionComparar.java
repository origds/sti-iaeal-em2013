
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
    
    
    public ActionForward comparar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Comparar c = (Comparar) form;
       
        System.out.println("HOlaaaaaaaaaaaaaaaaaaaaaaaaaa "+ c.getNombre1());
        System.out.println("Chaoooooooooooooooooooooooooo "+ c.getNombre2());

        /** Validacion de campos vacios **/    
        if ((c.getDiaIni1() == 0) && (c.getMesIni1() == 0) && (c.getAnoIni1() == 0)
                && (c.getDiaFin1() == 0) && (c.getMesFin1() == 0) && (c.getAnoFin1() == 0)) {
            if ((c.getDiaIni2() == 0) && (c.getMesIni2() == 0) & (c.getAnoIni2() == 0)
                    && (c.getDiaFin2() == 0) && (c.getMesFin2() == 0) && (c.getAnoFin2() == 0)) {

                request.setAttribute("failure", "compararTra");
                return mapping.findForward(FAILURE);

            }
        }
        
        /** Validacion de fechas completas (Primer periodo) **/
        if ((c.getDiaIni1() == 0) || (c.getMesIni1() == 0) || (c.getAnoIni1() == 0)) {
            request.setAttribute("failure", "compararTra");
            return mapping.findForward(FAILURE);
        }
         if ((c.getDiaFin1() == 0) || (c.getMesFin1() == 0) || (c.getAnoFin1() == 0)) {
            request.setAttribute("failure", "compararTra");
            return mapping.findForward(FAILURE);
         }
         
        /** Validacion de fechas completas (Segundo periodo) **/
        if ((c.getDiaIni2() == 0) || (c.getMesIni2() == 0) || (c.getAnoIni2() == 0)) {
            request.setAttribute("failure", "compararTra");
            return mapping.findForward(FAILURE);
        } 
                
        if ((c.getDiaFin2() == 0) || (c.getMesFin2() == 0) || (c.getAnoFin2() == 0)) {
            request.setAttribute("failure", "compararTra");
            return mapping.findForward(FAILURE);
        } 
       
        
        /** Validacion de fechas iniciales mayores a las finales (primer periodo) **/      
        if (c.getAnoIni1() > c.getAnoFin1()) {
            request.setAttribute("failure", "comTra");
            return mapping.findForward(FAILURE);
        } else if (c.getAnoIni1() == c.getAnoFin1()) {
            if (c.getMesIni1() > c.getMesFin1()) {
                request.setAttribute("failure", "comTra");
                return mapping.findForward(FAILURE);
            } else if (c.getMesIni1() == c.getMesFin1()) {
                if (c.getDiaIni1() > c.getDiaFin1()) {
                    request.setAttribute("failure", "comTra");
                    return mapping.findForward(FAILURE);
                }
            }
        }
    
        /** Validacion de fechas iniciales mayores a las finales (segundo periodo) **/      
        if (c.getAnoIni2() > c.getAnoFin2()) {
            request.setAttribute("failure", "comTra");
            return mapping.findForward(FAILURE);
        } else if (c.getAnoIni2() == c.getAnoFin2()) {
            if (c.getMesIni2() > c.getMesFin2()) {
                request.setAttribute("failure", "comTra");
                return mapping.findForward(FAILURE);
            } else if (c.getMesIni2() == c.getMesFin2()) {
                if (c.getDiaIni2() > c.getDiaFin2()) {
                    request.setAttribute("failure", "comTra");
                    return mapping.findForward(FAILURE);
                }
            }
        }
        
        c = DatabaseComparar.getInstance().compararTratados(c);

        request.setAttribute("Comparar", c);
        return mapping.findForward(SUCCESS);
    }

    
    public ActionForward compararForm(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward(SUCCESS);
    }
}