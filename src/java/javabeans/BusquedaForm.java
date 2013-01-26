/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author origds
 */
public class BusquedaForm extends ValidatorForm {

    private String pais;
    private String anio;
    private String fechaini;
    private String fechafin;
    private String claves;
    private boolean Mgrupo;
    private boolean Mpais;
    private boolean Mfecha;

    public BusquedaForm() {
    }

    public BusquedaForm(String pais, String anio, String fechaini, String fechafin, String claves, boolean Mgrupo, boolean Mpais, boolean Mfecha) {
        this.pais = pais;
        this.anio = anio;
        this.fechaini = fechaini;
        this.fechafin = fechafin;
        this.claves = claves;
        this.Mgrupo = Mgrupo;
        this.Mpais = Mpais;
        this.Mfecha = Mfecha;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public String getFechaini() {
        return fechaini;
    }

    public void setFechaini(String fechaini) {
        this.fechaini = fechaini;
    }

    public String getFechafin() {
        return fechafin;
    }

    public void setFechafin(String fechafin) {
        this.fechafin = fechafin;
    }

    public String getClaves() {
        return claves;
    }

    public void setClaves(String claves) {
        this.claves = claves;
    }

    public boolean isMgrupo() {
        return Mgrupo;
    }

    public void setMgrupo(boolean Mgrupo) {
        this.Mgrupo = Mgrupo;
    }

    public boolean isMpais() {
        return Mpais;
    }

    public void setMpais(boolean Mpais) {
        this.Mpais = Mpais;
    }

    public boolean isMfecha() {
        return Mfecha;
    }

    public void setMfecha(boolean Mfecha) {
        this.Mfecha = Mfecha;
    }
}
