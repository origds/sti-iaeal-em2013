/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author mary
 */
public class Log extends ActionForm {
    private String usuario;
    private String accion;
    private int idTratado;
    private String fecha_hora;

    public Log(){
    }
    
    public Log(String usuario, String accion, int idTratado, String fecha_hora){
        this.usuario = usuario;
        this.accion = accion;
        this.idTratado = idTratado;
        this.fecha_hora = fecha_hora;
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
