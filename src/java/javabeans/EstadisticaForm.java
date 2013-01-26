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
public class EstadisticaForm extends ValidatorForm {

  private String pais;
  private String fechaini;
  private String fechafin;
  private String ejeX; //pais = 0 , periodo = 1
  private String tipoGrafica; //barra = 0 , torta = 1

  public EstadisticaForm() {
  }

  public EstadisticaForm(String pais, String fechaini, String fechafin, String ejeX, String tipoGrafica) {
    this.pais = pais;
    this.fechaini = fechaini;
    this.fechafin = fechafin;
    this.ejeX = ejeX;
    this.tipoGrafica = tipoGrafica;
  }

  public String getPais() {
    return pais;
  }

  public void setPais(String pais) {
    this.pais = pais;
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

  public String getEjeX() {
    return ejeX;
  }

  public void setEjeX(String ejeX) {
    this.ejeX = ejeX;
  }

  public String getTipoGrafica() {
    return tipoGrafica;
  }

  public void setTipoGrafica(String tipoGrafica) {
    this.tipoGrafica = tipoGrafica;
  }
}