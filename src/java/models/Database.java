/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author vicente
 */
public class Database {

    private String driver;
    private String databaseUrl;
    static private Connection connection = null;
    static private Database instance = null;

    public Database() {
    }

    public Database(String driver, String databaseUrl) {
        this.driver = driver;
        this.databaseUrl = databaseUrl;
    }

    static public Database getInstance(String driver, String databaseUrl) {

        if (Database.instance == null) {
            Database.instance = new Database(driver, databaseUrl);
        }
        instance.openConnection();
        return Database.instance;
    }

    public void openConnection() {

        try {
            Class.forName(driver).newInstance();
            connection = DriverManager.getConnection(databaseUrl, "stiuser", "postgres");
        } catch (Exception ex) {
            //Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }

    }

    public void closeConnection() {

        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }

    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getDatabaseUrl() {
        return databaseUrl;
    }

    public void setDatabaseUrl(String databaseUrl) {
        this.databaseUrl = databaseUrl;
    }

    public static Connection getConnection() {
        return connection;
    }

    public static void setConnection(Connection connection) {
        Database.connection = connection;
    }

    public static Database getInstance() {
        return instance;
    }

    public static void setInstance(Database instance) {
        Database.instance = instance;
    }
}
