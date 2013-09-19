
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import javabeans.ClaseEstadistica;
import javabeans.est;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DatabaseEstadistica;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author mary
 */
public class GestionEstadistica extends MappingDispatchAction {

    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";


    public ActionForward estadistica(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ClaseEstadistica b = (ClaseEstadistica) form;
        est Estad;
        Estad = DatabaseEstadistica.getInstance().BuscarEstadistica(b);
        if ((b.getPeriodoIni1() == 0) & (b.getPeriodoFin1() == 0) & (b.getPeriodoIni2() == 0) & (b.getPeriodoFin2() == 0)
                & ("Paises...".equals(b.getCodigo1())) & ("Paises...".equals(b.getCodigo2())) & ("Paises...".equals(b.getCodigo3()))) {
            request.setAttribute("failure", "gestionEstadistica");
            return mapping.findForward(FAILURE);
        }
        if (((b.getPeriodoIni1() == 0) && (b.getPeriodoFin1() != 0)) || ((b.getPeriodoIni2() == 0) && (b.getPeriodoFin2() != 0))) {
            request.setAttribute("failure", "gestionEstadistica");
            return mapping.findForward(FAILURE);
        } else if (((b.getPeriodoFin1() == 0) && (b.getPeriodoIni1() != 0)) || ((b.getPeriodoFin2() == 0) && (b.getPeriodoIni2() != 0))) {
            request.setAttribute("failure", "gestionEstadistica");
            return mapping.findForward(FAILURE);
        }

        if ((b.getPeriodoIni1() > b.getPeriodoFin1()) || (b.getPeriodoIni2() > b.getPeriodoFin2())) {
            request.setAttribute("failure", "gestionEst");
            return mapping.findForward(FAILURE);

        }
        
        request.setAttribute("est", Estad);
        request.setAttribute("exito", "gestionEst");
        return mapping.findForward(SUCCESS);
    }

    public ActionForward estadisticaForm(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward(SUCCESS);
    }
}
