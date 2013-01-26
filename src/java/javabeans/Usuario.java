/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import java.util.Calendar;
import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author vicente
 */
public class Usuario extends ValidatorForm {

    private String usuario;
    private String contrasena;
    private String nombre;
    private String apellido;
    private String correo;
    private boolean administrador;
    private Calendar ultimaSesion;

    public Usuario() {
    }

    public Usuario(String usuario, String contrasena, String nombre, String apellido, String correo, boolean administrador, Calendar ultimaSesion) {
      this.usuario = usuario;
      this.contrasena = contrasena;
      this.nombre = nombre;
      this.apellido = apellido;
      this.correo = correo;
      this.administrador = administrador;
      this.ultimaSesion = ultimaSesion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public boolean isAdministrador() {
        return administrador;
    }

    public void setAdministrador(boolean administrador) {
        this.administrador = administrador;
    }

    public Calendar getUltimaSesion() {
        return ultimaSesion;
    }

    public void setUltimaSesion(Calendar ultimaSesion) {
        this.ultimaSesion = ultimaSesion;
    }

}