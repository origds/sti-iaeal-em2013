/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import javabeans.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.tiles.TilesRequestProcessor;

/**
 *
 * @author vicente
 */
public class PreProcesamiento extends TilesRequestProcessor {
  
  @Override
  public boolean processPreprocess(HttpServletRequest request, 
          HttpServletResponse response) {
    
    HttpSession sesion = request.getSession();
    
    Usuario u = (Usuario) sesion.getAttribute("login");
    boolean login = (u != null);
    boolean administrador = false;
        
    if(login) {
      administrador = u.isAdministrador();
    }
    
    String servletPath = request.getServletPath();
    
    if(servletPath.equals("/Welcome.do")) {
      return true;
    } else if(servletPath.equals("/Index.do")) {
      return true;
    } else if(servletPath.equals("/home.do")) {
      return true;
    } else if(servletPath.equals("/iniciarSesion.do")) {
      return !login;
    } else if(servletPath.equals("/cerrarSesion.do")) {
      return login;
    } else if(servletPath.equals("/usuario/gestionar.do")) {
      return login && administrador;
    } else if(servletPath.equals("/usuario/crearForm.do")) {
      return login && administrador;
    } else if(servletPath.equals("/usuario/crear.do")) {
      return login && administrador;
    } else if(servletPath.equals("/usuario/consultar.do")) {
      return login && administrador;
    } else if(servletPath.equals("/usuario/actualizarForm.do")) {
      return login && administrador;
    } else if(servletPath.equals("/usuario/actualizar.do")) {
      return login && administrador;
    } else if(servletPath.equals("/usuario/actualizarPerfilForm.do")) {
      return login;
    } else if(servletPath.equals("/usuario/actualizarPerfil.do")) {
      return login;
    } else if(servletPath.equals("/usuario/eliminar.do")) {
      return login && administrador;
    } else if(servletPath.equals("/ListarLog.do")) {
      return login && administrador;
    } else if(servletPath.equals("/tratado/gestionar.do")) {
      return true;
    } else if(servletPath.equals("/tratado/gestionarPendientes.do")) {
      return login && administrador;
    } else if(servletPath.equals("/tratado/gestionarMisTratados.do")) {
      return login && !administrador;
    } else if(servletPath.equals("/tratado/crearForm.do")) {
      return login;
    } else if(servletPath.equals("/tratado/crear.do")) {
      return login;
    } else if(servletPath.equals("/tratado/actualizarForm.do")) {
      return login;
    } else if(servletPath.equals("/tratado/actualizar.do")) {
      return login;
    } else if(servletPath.equals("/tratado/eliminar.do")) {
      return login;
    } else if(servletPath.equals("/tratado/aprobar.do")) {
      return login && administrador;
    } else if(servletPath.equals("/tratado/rechazar.do")) {
      return login && administrador;
    } else if(servletPath.equals("/tratado/marcarPendiente.do")) {
      return login && !administrador;
    } else if(servletPath.equals("/buscar.do")) {
      return true;
    } else if(servletPath.equals("/buscarForm.do")) {
      return true;
    } else {
      return true;
    }
  }
           
}
