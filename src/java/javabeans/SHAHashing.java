/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vicente
 */
public abstract class SHAHashing {
  
  public static String cifrar(String contrasena) {
    
    try {
      MessageDigest md = MessageDigest.getInstance("SHA-512");
      md.update(contrasena.getBytes());

      byte byteData[] = md.digest();

      //convert the byte to hex format method 1
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < byteData.length; i++) {
       sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
      }
      return sb.toString();
    } catch (NoSuchAlgorithmException ex) {
      Logger.getLogger(SHAHashing.class.getName()).log(Level.SEVERE, null, ex);
    }
    return "";
  }
  
}
