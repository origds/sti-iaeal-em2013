/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author mary
 */

public class DatabaseLog {

  private Database database;
  private String datePattern = "MM/dd/yyyy";

  public DatabaseLog(String driver, String databaseUrl) {
      this.database = Database.getInstance(driver, databaseUrl);
  }
}