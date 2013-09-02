/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import javabeans.BusquedaForm;
import javabeans.Comparar;
import javabeans.Tratado;
import javabeans.EnvioMail;
import javabeans.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DataBaseMail;
import models.DatabaseBusqueda;
import models.DatabaseComparar;
import models.DatabaseLog;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author Jhosbert
 */
public class enviar extends MappingDispatchAction {

    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Usuario e = (Usuario) form;
        String s = DataBaseMail.getInstance().enviarMail(e);
        System.out.println("Esta es la contrasena que voy a enviar" + s);
        //request.setAttribute("Comparar", c);

        String cor = e.getCorreo();
        String asunto = "Cambio de Contrasena";
        String from = "sgtiaeal@gmail.com";
        String[] dest = new String[1];
        dest[0] = cor;
        //Double nr = Math.random()*890000+100000;
        String mensaje = "Mensaje para la reposicion de la contrasena.. \n\n\n Su Nueva Contrasena : " + s + " \n\n\n Le recomendamos entrar al sistema y cambiar su contrasena.";
        if (!"no".equals(s)) {
            EnvioMail correo = new EnvioMail(from, dest[0], asunto, mensaje);

            try {
                correo.Enviar();
            } catch (Exception x) {                
                x.printStackTrace();                
            }
        }
        if ("no".equals(s)) {
            request.setAttribute("failure", "olvidoCon");
            return mapping.findForward(FAILURE);
        }
        request.setAttribute("exito", "olvidoContrasena");
        return mapping.findForward(SUCCESS);
    }
}
