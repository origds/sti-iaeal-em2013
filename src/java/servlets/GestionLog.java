package servlets;

/** import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;**/
import models.DatabaseLog;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author mary
 */

public class GestionLog extends MappingDispatchAction {

    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private static final String FAILURE = "failure";
    private DatabaseLog dt;

    private void createDatabaseLog() {
        String driver = this.getServlet().getServletContext().getInitParameter("driver");
        String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
        dt = new DatabaseLog(driver, databaseUrl);
    }
    
}