/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author vicente
 */
public class LoginForm extends ValidatorForm {

    private String usuarioLogin;
    private String contrasenaLogin;
    
    public LoginForm() {
    }

    public LoginForm(String usuarioLogin, String contrasenaLogin) {
        this.usuarioLogin = usuarioLogin;
        this.contrasenaLogin = contrasenaLogin;
    }
  
    /*@Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        super.reset(mapping, request);
        //revisar
        setUsuario("abc");
        setContrasena("1234567");
    }*/

    public String getUsuarioLogin() {
        return usuarioLogin;
    }

    public void setUsuarioLogin(String usuarioLogin) {
        this.usuarioLogin = usuarioLogin;
    }

    public String getContrasenaLogin() {
        return contrasenaLogin;
    }

    public void setContrasenaLogin(String contrasenaLogin) {
        this.contrasenaLogin = contrasenaLogin;
    }
}