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
    int cuarto;
    int quinto;
    int sexto;
    int ano1;
    int ano2;
    int ano3;
    int ano4;

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

    public int getCuarto() {
      return cuarto;
    }

    public int getQuinto() {
      return quinto;
    }

    public int getSexto() {
      return sexto;
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

    public void setCuarto(int cuarto) {
      this.cuarto = cuarto;
    }
    
    public void setQuinto(int quinto) {
      this.quinto = quinto;
    }

    public void setSexto(int sexto) {
      this.sexto = sexto;
    }
    
    public int getAno1(){
        return ano1;
    }
    
    public void setAno1(int ano1){
        this.ano1 = ano1;
    }
    
     public int getAno2(){
        return ano2;
    }
    
    public void setAno2(int ano2){
        this.ano2 = ano2;
    }
    
    public int getAno3(){
        return ano3;
    }
    
    public void setAno3(int ano3){
        this.ano3 = ano3;
    }
    
     public int getAno4(){
        return ano4;
    }
    
    public void setAno4(int ano4){
        this.ano4 = ano4;
    }
    
    
}
