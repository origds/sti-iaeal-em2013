/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javabeans.Buscable;
import javabeans.Tratado;
import javabeans.est;
import javabeans.ClaseEstadistica;

/**
 *
 * @author betocols
 */
public class DatabaseEstadistica {

    private Database database;
    static private Connection conexion;

    protected DatabaseEstadistica() {
    }
    static private DatabaseEstadistica instance = null;

    static public DatabaseEstadistica getInstance() {
        if (null == DatabaseEstadistica.instance) {
            DatabaseEstadistica.instance = new DatabaseEstadistica();
        }
        conectar();
        return DatabaseEstadistica.instance;
    }

    public static boolean conectar() {
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/stidb",
                    "stiuser",
                    "postgres");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public DatabaseEstadistica(String driver, String databaseUrl) {
        this.database = Database.getInstance(driver, databaseUrl);
    }

    public String ArmarQuery(int ini, int fin, String codigo) {
        boolean cont;
        String sqlquery;

        if ((ini != 0) && (fin != 0)) {
            sqlquery = "SELECT * FROM \"STI\".tratado, \"STI\".pais WHERE (" + ini
                    + " <= (extract(year from firmaFecha)) "
                    + "AND (extract(year from firmaFecha)) <= " + fin + ") AND (idTp = id) ";
            cont = true;
        } else {
            sqlquery = "SELECT * FROM \"STI\".pais WHERE ";
            cont = false;
        }

        System.out.println("Periodos del query");
        System.out.println(ini);
        System.out.println(fin);
        if (!"".equals(codigo)) {
            if (cont == true) {
                sqlquery += "AND upper(pais) like upper('%" + codigo + "%')";
            } else {
                sqlquery += "upper(pais) like upper('%" + codigo + "%')";
            }
            cont = true;
        }
        return sqlquery;
    }

    public est BuscarEstadistica(ClaseEstadistica b) {
        ArrayList<Tratado> trads1 = new ArrayList<Tratado>(0);
        ArrayList<Tratado> trads2 = new ArrayList<Tratado>(0);
        ArrayList<Tratado> trads3 = new ArrayList<Tratado>(0);
        est estad = new est();
        String sqlquery;
        int i;

        try {

            //Para cuando no hay paises
            if (b.getCodigo1().equals("Paises...") & b.getCodigo2().equals("Paises...")
                    & b.getCodigo3().equals("Paises...")) {

                if ((b.getPeriodoIni1() == 0) & (b.getPeriodoFin1() == 0)) {
                    if ((b.getPeriodoIni2() == 0) & (b.getPeriodoFin2() == 0)) {
                        throw new Exception("Debe ingresar un periodo valido");
                    }
                }

                if ((b.getPeriodoIni1() != 0) && (b.getPeriodoFin1() != 0)) {
                    if (b.getPeriodoIni1() > b.getPeriodoFin1()) {
                        throw new Exception("El inicio del periodo 1 debe ser mayor al final");
                    }

                    sqlquery = "SELECT COUNT (*) AS contador FROM \"STI\".tratado WHERE (" + b.getPeriodoIni1()
                            + " <= (extract(year from firmaFecha)) "
                            + "AND (extract(year from firmaFecha)) <= "
                            + b.getPeriodoFin1() + ")";

                    System.out.println(sqlquery);
                    Statement stmt = conexion.createStatement();
                    ResultSet rs = stmt.executeQuery(sqlquery);
                    rs.next();
                    int count = rs.getInt("contador");
                    rs.close();

                    estad.settotalP1(count);
                    estad.setAno1(b.getPeriodoIni1());
                    estad.setAno2(b.getPeriodoFin1());
                    System.out.println("CANTIDAAAD 1");
                    System.out.println(estad.gettotalP1());

                }

                if ((b.getPeriodoIni2() != 0) && (b.getPeriodoFin2() != 0)) {
                    if (b.getPeriodoIni2() > b.getPeriodoFin2()) {
                        throw new Exception("El inicio del periodo 2 debe ser mayor al final");
                    }

                    sqlquery = "SELECT COUNT (*) AS contador FROM \"STI\".tratado WHERE (" + b.getPeriodoIni2()
                            + " <= (extract(year from firmaFecha)) "
                            + "AND (extract(year from firmaFecha)) <= "
                            + b.getPeriodoFin2() + ")";

                    System.out.println(sqlquery);
                    Statement stmt = conexion.createStatement();
                    ResultSet rs = stmt.executeQuery(sqlquery);
                    rs.next();
                    int count = rs.getInt("contador");
                    rs.close();

                    estad.settotalP2(count);
                    estad.setAno3(b.getPeriodoIni2());
                    estad.setAno4(b.getPeriodoFin2());
                    System.out.println("CANTIDAAAD 2");
                    System.out.println(estad.gettotalP2());
                }
            }

            //Para cuando no hay peridos
            if ((b.getPeriodoIni1() == 0) & (b.getPeriodoFin1() == 0)) {

                // Query para el primer pais
                sqlquery = ArmarQuery(0, 0, b.getCodigo1());
                System.out.println(sqlquery);
                Statement stmt = conexion.createStatement();
                ResultSet rs = stmt.executeQuery(sqlquery);
                while (rs.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads1.add(t);
                }

                i = trads1.size();
                estad.settotal1(i);
                estad.setPais1(b.getCodigo1());
                estad.setAno1(b.getPeriodoIni1());
                estad.setAno2(b.getPeriodoFin1());

                //Query para el segundo pais
                sqlquery = ArmarQuery(0, 0, b.getCodigo2());
                System.out.println(sqlquery);
                Statement stmt2 = conexion.createStatement();
                ResultSet rs2 = stmt2.executeQuery(sqlquery);
                while (rs2.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads2.add(t);
                }
                i = trads2.size();
                estad.settotal2(i);
                estad.setPais2(b.getCodigo2());
                estad.setAno1(b.getPeriodoIni1());
                estad.setAno2(b.getPeriodoFin1());

                //Query para el tercer pais
                sqlquery = ArmarQuery(0, 0, b.getCodigo3());
                System.out.println(sqlquery);
                Statement stmt3 = conexion.createStatement();
                ResultSet rs3 = stmt3.executeQuery(sqlquery);
                while (rs3.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads3.add(t);
                }
                i = trads3.size();
                estad.settotal3(i);
                estad.setPais3(b.getCodigo3());
                estad.setAno1(b.getPeriodoIni1());
                estad.setAno2(b.getPeriodoFin1());

            }

            //Query para el primer periodo
            if ((b.getPeriodoIni1() != 0) && (b.getPeriodoFin1() != 0)) {

                if (b.getPeriodoIni1() > b.getPeriodoFin1()) {
                    throw new Exception("El inicio del periodo 1 debe ser mayor al final");
                }

                // Query para el primer pais
                sqlquery = ArmarQuery(b.getPeriodoIni1(), b.getPeriodoFin1(), b.getCodigo1());
                System.out.println(sqlquery);
                Statement stmt = conexion.createStatement();
                ResultSet rs = stmt.executeQuery(sqlquery);
                while (rs.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads1.add(t);
                }
                i = trads1.size();
                estad.setPrimero(i);
                estad.setPais1(b.getCodigo1());
                estad.setAno1(b.getPeriodoIni1());
                estad.setAno2(b.getPeriodoFin1());

                //Query para el segundo pais
                sqlquery = ArmarQuery(b.getPeriodoIni1(), b.getPeriodoFin1(), b.getCodigo2());
                System.out.println(sqlquery);
                Statement stmt2 = conexion.createStatement();
                ResultSet rs2 = stmt2.executeQuery(sqlquery);
                while (rs2.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads2.add(t);
                }
                i = trads2.size();
                estad.setSegundo(i);
                estad.setPais2(b.getCodigo2());
                estad.setAno1(b.getPeriodoIni1());
                estad.setAno2(b.getPeriodoFin1());

                //Query para el tercer pais
                sqlquery = ArmarQuery(b.getPeriodoIni1(), b.getPeriodoFin1(), b.getCodigo3());
                System.out.println(sqlquery);
                Statement stmt3 = conexion.createStatement();
                ResultSet rs3 = stmt3.executeQuery(sqlquery);
                while (rs3.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads3.add(t);
                }
                i = trads3.size();
                estad.setTercero(i);
                estad.setPais3(b.getCodigo3());
                estad.setAno1(b.getPeriodoIni1());
                estad.setAno2(b.getPeriodoFin1());

                estad.settotal1(estad.getPrimero() + estad.getCuarto());
                estad.settotal2(estad.getSegundo() + estad.getQuinto());
                estad.settotal3(estad.getTercero() + estad.getSexto());

            }

            //Query para el segundo periodo
            if ((b.getPeriodoIni2() != 0) && (b.getPeriodoFin2() != 0)) {

                if (b.getPeriodoIni2() > b.getPeriodoFin2()) {
                    throw new Exception("El inicio del periodo 2 debe ser mayor al final");
                }

                // Query para el primer pais
                sqlquery = ArmarQuery(b.getPeriodoIni2(), b.getPeriodoFin2(), b.getCodigo1());
                System.out.println(sqlquery);
                Statement stmt4 = conexion.createStatement();
                ResultSet rs4 = stmt4.executeQuery(sqlquery);
                while (rs4.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads1.add(t);
                }
                i = trads1.size();
                estad.setCuarto(i);
                estad.setPais1(b.getCodigo1());
                estad.setAno3(b.getPeriodoIni2());
                estad.setAno4(b.getPeriodoFin2());

                //Query para el segundo pais
                sqlquery = ArmarQuery(b.getPeriodoIni2(), b.getPeriodoFin2(), b.getCodigo2());
                System.out.println(sqlquery);
                Statement stmt5 = conexion.createStatement();
                ResultSet rs5 = stmt5.executeQuery(sqlquery);
                while (rs5.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads2.add(t);
                }
                i = trads2.size();
                estad.setQuinto(i);
                estad.setPais2(b.getCodigo2());
                estad.setAno3(b.getPeriodoIni2());
                estad.setAno4(b.getPeriodoFin2());

                //Query para el tercer pais
                sqlquery = ArmarQuery(b.getPeriodoIni2(), b.getPeriodoFin2(), b.getCodigo3());
                System.out.println(sqlquery);
                Statement stmt6 = conexion.createStatement();
                ResultSet rs6 = stmt6.executeQuery(sqlquery);
                while (rs6.next()) {
                    Tratado t = new Tratado();
                    t.setTitulo("titulo");
                    trads3.add(t);
                }
                i = trads3.size();
                estad.setSexto(i);
                estad.setPais3(b.getCodigo3());
                estad.setAno3(b.getPeriodoIni2());
                estad.setAno4(b.getPeriodoFin2());

                estad.settotal1(estad.getPrimero() + estad.getCuarto());
                estad.settotal2(estad.getSegundo() + estad.getQuinto());
                estad.settotal3(estad.getTercero() + estad.getSexto());

            }

            estad.settotalPP1(estad.getPrimero() + estad.getSegundo() + estad.getTercero());
            estad.settotalPP2(estad.getCuarto() + estad.getQuinto() + estad.getSexto());

        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return estad;
    }
}
