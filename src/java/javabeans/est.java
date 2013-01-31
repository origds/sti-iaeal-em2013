/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author Andel
 */
public class est extends ActionForm{
    int primero;
    String pais1;
    int segundo;
    String pais2;
    int tercero;
    String pais3;

    public est() {
    }

    public void setPais1(String pais1) {
        this.pais1 = pais1;
    }

    public void setPais2(String pais2) {
        this.pais2 = pais2;
    }

    public void setPais3(String pais3) {
        this.pais3 = pais3;
    }

    public String getPais1() {
        return pais1;
    }

    public String getPais2() {
        return pais2;
    }

    public String getPais3() {
        return pais3;
    }

    public int getPrimero() {
        return primero;
    }

    public int getSegundo() {
        return segundo;
    }

    public int getTercero() {
        return tercero;
    }

    public void setPrimero(int primero) {
        this.primero = primero;
    }

    public void setSegundo(int segundo) {
        this.segundo = segundo;
    }

    public void setTercero(int tercero) {
        this.tercero = tercero;
    }
    
    
}
