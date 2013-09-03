
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
import javabeans.ClaseEstadistica;
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
 * @author Andel
 */
public class GestionEstadistica extends MappingDispatchAction {
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";
  
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            ClaseEstadistica b = (ClaseEstadistica) form;
            est Estad;
            Estad = DatabaseEstadistica.getInstance().BuscarEstadistica(b);
            if ((b.getPeriodoIni1()== 0) & (b.getPeriodoFin1() == 0) & (b.getPeriodoIni2()== 0) & (b.getPeriodoFin2() == 0)
                    & ("Paises...".equals(b.getCodigo1())) & ("Paises...".equals(b.getCodigo2())) & ("Paises...".equals(b.getCodigo3()))){
                request.setAttribute("failure", "gestionEstadistica");
                return mapping.findForward(FAILURE);
            } else {
                request.setAttribute("est", Estad);
                request.setAttribute("exito", "gestionEst");
                return mapping.findForward(SUCCESS);
            }
    }
}
