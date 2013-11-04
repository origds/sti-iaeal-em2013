/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import javabeans.Fecha;
import javabeans.LoginForm;
import javabeans.SHAHashing;
import javabeans.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DatabaseLog;
import models.DatabaseUsuario;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author vicente
 */
public class GestionUsuario extends MappingDispatchAction {

  private final static String SUCCESS = "success";
  private static final String FAILURE = "failure";
  private DatabaseUsuario dt;
  private DatabaseLog dl;

  private void createDatabaseUsuario() {
      String driver = this.getServlet().getServletContext().getInitParameter("driver");
      String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
      dt = new DatabaseUsuario(driver, databaseUrl);
  }
  

  private void createDatabaseLog() {
      String driver = this.getServlet().getServletContext().getInitParameter("driver");
      String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
      dl = new DatabaseLog(driver, databaseUrl);
  }

  public ActionForward iniciarSesion(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
      LoginForm l = (LoginForm) form;
      Usuario u = new Usuario();
      u.setUsuario(l.getUsuarioLogin());
      u.setContrasena(SHAHashing.cifrar(l.getContrasenaLogin()));
      createDatabaseUsuario();
      if (dt.get(u, false)) {
          request.getSession().setAttribute("ultimaSesion",
                  Fecha.getFechaAsString(u.getUltimaSesion(), "dd-MM-yyyy HH:mm"));
          Calendar gc = new GregorianCalendar();
          gc.setTimeZone(TimeZone.getDefault());
          u.setUltimaSesion(gc);
          System.out.println(Fecha.getFechaAsString(u.getUltimaSesion(), "dd-MM-yyyy HH:mm"));
          createDatabaseUsuario();
          if (!dt.update(u)) {  
              return mapping.findForward(FAILURE); // Revisar
          }
          request.getSession().setAttribute("login", u);
          return mapping.findForward(SUCCESS);
      }
      request.setAttribute("revisar","usuarioInvalido");
      return mapping.findForward(FAILURE);
  }

  public ActionForward cerrarSesion(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {    
    createDatabaseLog();
    dl.log_cerrar_sesion((Usuario)request.getSession().getAttribute("login"));
    request.getSession().invalidate();
    return mapping.findForward(SUCCESS);
  }

  public ActionForward crear(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    Usuario u = (Usuario) form;
    u.setContrasena(SHAHashing.cifrar(u.getContrasena()));
    createDatabaseUsuario();
    if (!dt.save(u)) {
      request.setAttribute("revisar","usuarioRegistrado");  
      return mapping.findForward(FAILURE); // Revisar
    }
    request.setAttribute("exito","usuarioCrear");
    createDatabaseLog();
    dl.log_crear_usuario((Usuario)request.getSession().getAttribute("login"),u);
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
    Usuario u = (Usuario) form;
    createDatabaseUsuario();
    if (!dt.get(u,true)) {
      return mapping.findForward(FAILURE); // Revisar
    }
    request.setAttribute("usuario", u);
    return mapping.findForward(SUCCESS);
  }

  public ActionForward listar(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    createDatabaseUsuario();
    ArrayList<Usuario> usuarios = dt.list();
    request.setAttribute("usuarios", usuarios);
    return mapping.findForward(SUCCESS);
  }

  public ActionForward actualizar(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    Usuario u = (Usuario) form;
    Usuario l = new Usuario();
    l.setUsuario(u.getUsuario());
    createDatabaseUsuario();
    if (!dt.get(l,true)) {
      return mapping.findForward(FAILURE); // Revisar
    }
    if("xxxxxx".equals(u.getContrasena())) {
      u.setContrasena(l.getContrasena());
    } else {
      u.setContrasena(SHAHashing.cifrar(u.getContrasena()));
    }  
    
    if (request.getParameter("administrador") == null) {
      u.setAdministrador(false);
    } else {
      u.setAdministrador(true);
    }
    if (!dt.update(u)) {
      return mapping.findForward(FAILURE); // Revisar     
    }
    request.setAttribute("exito","usuarioModificar");
    return mapping.findForward(SUCCESS);
  }

  public ActionForward actualizarForm(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    Usuario u = (Usuario) form;
    createDatabaseUsuario();
    if (!dt.get(u,true)) {
      return mapping.findForward(FAILURE); // Revisar
    }
    request.setAttribute("usuario", u);
    return mapping.findForward(SUCCESS);
  }
  
  public ActionForward actualizarPerfil(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    Usuario u = (Usuario) form;
    Usuario l = new Usuario();
    l.setUsuario(u.getUsuario());
    createDatabaseUsuario();
    if (!dt.get(l,true)) {
      return mapping.findForward(FAILURE); // Revisar
    }
    if("xxxxxx".equals(u.getContrasena())) {
      u.setContrasena(l.getContrasena());
    } else {
      u.setContrasena(SHAHashing.cifrar(u.getContrasena()));
    }  
    createDatabaseUsuario();
    if (!dt.update(u)) {
      return mapping.findForward(FAILURE); // Revisar     
    }
    request.getSession().setAttribute("login", u);
    request.setAttribute("exito","usuarioPerfil");
    return mapping.findForward(SUCCESS);
  }
  
  public ActionForward actualizarPerfilForm(ActionMapping mapping,
          ActionForm form, HttpServletRequest request,
          HttpServletResponse response)
          throws Exception {
    Usuario u = (Usuario) form;
    createDatabaseUsuario();
    if (!dt.get(u,true)) {
      return mapping.findForward(FAILURE); // Revisar
    }
    request.setAttribute("usuario", u);
    return mapping.findForward(SUCCESS);
  }

  public ActionForward eliminar(ActionMapping mapping, ActionForm form,
          HttpServletRequest request, HttpServletResponse response)
          throws Exception {
    Usuario u = (Usuario) form;
    createDatabaseUsuario();
    createDatabaseLog();
    dt.get(u, true);
    dl.log_eliminar_usuario((Usuario) request.getSession().getAttribute("login"), u);
    if (!dt.delete(u)) {
      return mapping.findForward(FAILURE); // Revisar
    }
    request.setAttribute("usuario", u);
    return mapping.findForward(SUCCESS);
  }
  
}