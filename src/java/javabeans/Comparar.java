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
   private int cantidad1;
   private int cantidad2;
   private int diaIni1;
   private int mesIni1;
   private int anoIni1;
   private int diaFin1;
   private int mesFin1;
   private int anoFin1;
   private int diaIni2;
   private int mesIni2;
   private int anoIni2;
   private int diaFin2;
   private int mesFin2;
   private int anoFin2;
   private String nombre1;
   private String nombre2;

   public Comparar() {
   }

   public Comparar(int cantidad1, int cantidad2, int diaIni1, int mesIni1, int anoIni1,
          int diaFin1,  int mesFin1, int anoFin1, int diaIni2, int mesIni2, int anoIni2,
          int diaFin2, int mesFin2, int anoFin2, String nombre1,String nombre2) {
       this.cantidad1 = cantidad1;
       this.cantidad2 = cantidad2;
       this.diaIni1 = diaIni1;
       this.mesIni1 = mesIni1;
       this.anoIni1 = anoIni1;
       this.diaFin1 = diaFin1;
       this.mesFin1 = mesFin1;
       this.anoFin1 = anoFin1;
       this.diaIni2 = diaIni2;
       this.mesIni2 = mesIni2;
       this.anoIni2 = anoIni2;
       this.diaFin2 = diaFin2;
       this.mesFin2 = mesFin2;
       this.anoFin2 = anoFin2;
       this.nombre1 = nombre1;
       this.nombre2 = nombre2;
   }

  public String getNombre1() {
      return nombre1;
  } 
  
  public void setNombre1(String nombre1) {
      this.nombre1 = nombre1;
  } 
  
  public String getNombre2() {
      return nombre2;
  } 
  
  public void setNombre2(String nombre2) {
      this.nombre2 = nombre2;
  } 
  
  public int getDiaIni1() {
    return diaIni1;
  }

  public void setDiaIni1(int diaIni1) {
    this.diaIni1 = diaIni1;
  }

  public int getMesIni1() {
    return mesIni1;
  }

  public void setMesIni1(int mesIni1) {
    this.mesIni1 = mesIni1;
  }

  public int getAnoIni1() {
    return anoIni1;
  }

  public void setAnoIni1(int anoIni1) {
    this.anoIni1 = anoIni1;
  }

  public int getDiaFin1() {
    return diaFin1;
  }

  public void setDiaFin1(int diaFin1) {
    this.diaFin1 = diaFin1;
  }

  public int getMesFin1() {
    return mesFin1;
  }

  public void setMesFin1(int mesFin1) {
    this.mesFin1 = mesFin1;
  }

  public int getAnoFin1() {
    return anoFin1;
  }

  public void setAnoFin1(int anoFin1) {
    this.anoFin1 = anoFin1;
  }

  public int getDiaIni2() {
    return diaIni2;
  }

  public void setDiaIni2(int diaIni2) {
    this.diaIni2 = diaIni2;
  }

  public int getMesIni2() {
    return mesIni2;
  }

  public void setMesIni2(int mesIni2) {
    this.mesIni2 = mesIni2;
  }

  public int getAnoIni2() {
    return anoIni2;
  }

  public void setAnoIni2(int anoIni2) {
    this.anoIni2 = anoIni2;
  }

  public int getDiaFin2() {
    return diaFin2;
  }

  public void setDiaFin2(int diaFin2) {
    this.diaFin2 = diaFin2;
  }

  public int getMesFin2() {
    return mesFin2;
  }

  public void setMesFin2(int mesFin2) {
    this.mesFin2 = mesFin2;
  }

  public int getAnoFin2() {
    return anoFin2;
  }

  public void setAnoFin2(int anoFin2) {
    this.anoFin2 = anoFin2;
  }

  public int getCantidad1() {
    return cantidad1;
  }

  public void setCantidad1(int cantidad1) {
    this.cantidad1 = cantidad1;
  }

  public int getCantidad2() {
    return cantidad2;
  }

  public void setCantidad2(int cantidad2) {
    this.cantidad2 = cantidad2;
  }
      
}