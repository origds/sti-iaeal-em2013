/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author Isa
 */
public class Comparar extends ActionForm {
   
   private String codigo1;
   private String codigo2;
   private String codigo3;
   private int periodoIni1;
   private int periodoFin1;
   private int periodoIni2;
   private int periodoFin2;

    public Comparar() {
    }

    public Comparar(String codigo1, String codigo2, String codigo3, int periodoIni1, int periodoFin1,  int periodoIni2, int periodoFin2) {
        this.codigo1 = codigo1;
        this.codigo2 = codigo2;
        this.codigo3 = codigo3;
        this.periodoIni1 = periodoIni1;
        this.periodoFin1 = periodoFin1;
        this.periodoIni2 = periodoIni2;
        this.periodoFin2 = periodoFin2;
    }

    public String getCodigo1() {
        return codigo1;
    }

    public String getCodigo2() {
        return codigo2;
    }

    public String getCodigo3() {
        return codigo3;
    }

    public void setCodigo1(String codigo1) {
        this.codigo1 = codigo1;
    }

    public void setCodigo2(String codigo2) {
        this.codigo2 = codigo2;
    }

    public void setCodigo3(String codigo3) {
        this.codigo3 = codigo3;
    }

  public int getPeriodoIni1() {
    return periodoIni1;
  }

  public void setPeriodoIni1(int periodoIni1) {
    this.periodoIni1 = periodoIni1;
  }

  public int getPeriodoIni2() {
    return periodoIni2;
  }

  public void setPeriodoIni2(int periodoIni2) {
    this.periodoIni2 = periodoIni2;
  }
  
  public int getPeriodoFin1() {
    return periodoFin1;
  }

  public void setPeriodoFin1(int periodoFin1) {
    this.periodoFin1 = periodoFin1;
  }
  
  public int getPeriodoFin2() {
    return periodoFin2;
  }

  public void setPeriodoFin2(int periodoFin2) {
    this.periodoFin2 = periodoFin2;
  }
      
}