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
   private String cantidad1;
   private String cantidad2;
   private int periodoIni1;
   private int periodoFin1;
   private int periodoIni2;
   private int periodoFin2;

   public Comparar() {
   }

   public Comparar(String cantidad1, String cantidad2, int periodoIni1, int periodoFin1,  int periodoIni2, int periodoFin2) {
       this.cantidad1 = cantidad1;
       this.cantidad2 = cantidad2;
       this.periodoIni1 = periodoIni1;
       this.periodoFin1 = periodoFin1;
       this.periodoIni2 = periodoIni2;
       this.periodoFin2 = periodoFin2;
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

  public String getCantidad1() {
    return cantidad1;
  }

  public void setCantidad1(String cantidad1) {
    this.cantidad1 = cantidad1;
  }

  public String getCantidad2() {
    return cantidad2;
  }

  public void setCantidad2(String cantidad2) {
    this.cantidad2 = cantidad2;
  }
      
}