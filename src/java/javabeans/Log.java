/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author mary blabla
 */
public class Log extends ActionForm {
    private String usuario;
    private String accion;
    private String idTratado;
    private String fecha_hora;
    private String tipoUser;
    private String campoBusqueda;

    public Log(){
    }
    
    public Log(String usuario, String accion, String idTratado, String fecha_hora, String tipo, String campo){
        this.usuario = usuario;
        this.accion = accion;
        this.idTratado = idTratado;
        this.fecha_hora = fecha_hora;
        this.tipoUser = tipo;
        this.campoBusqueda = campo;
    }
    
    public String getUsuario() {
        return usuario;
    }
    
    public String getAccion() {
        return accion;
    }

    public String getFecha_hora() {
        return fecha_hora;
    }

    public String getIdTratado() {
      return idTratado;
    }

    public void setIdTratado(String idTratado) {
      this.idTratado = idTratado;
    }

    public String getTipoUser() {
      return tipoUser;
    }

    public void setTipoUser(String tipoUser) {
      this.tipoUser = tipoUser;
    }

    public String getCampoBusqueda() {
      return campoBusqueda;
    }

    public void setCampoBusqueda(String campoBusqueda) {
      this.campoBusqueda = campoBusqueda;
    }
	
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public void setFecha_hora(String fecha_hora) {
        this.fecha_hora = fecha_hora;
    }

}		