/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author vicente
 */
public abstract class Fecha {
  
  // Pattern "dd-MM-yyyy HH:mm" or "dd-MM-yyyy"
  
  public static String getFechaAsString(Calendar gc, String pattern) {
    SimpleDateFormat sdf = new SimpleDateFormat(pattern);
    return (sdf.format(gc.getTime()));
  }
  
  public static void setFechaAsString(Calendar gc, String fecha, String pattern) {

    if(fecha.length() != 0) {

      SimpleDateFormat sdf = new SimpleDateFormat(pattern);

      try {   
        Date date = sdf.parse(fecha);
        if(gc == null) {
          gc = new GregorianCalendar();
        }
        gc.setTime(date);  
      } catch (ParseException ex) {
        //Logger.getLogger(Tratado.class.getName()).log(Level.SEVERE, null, ex);
        ex.printStackTrace();
      }
    }
  }
      
}
