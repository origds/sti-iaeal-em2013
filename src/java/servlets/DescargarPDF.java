/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DownloadAction;

/**
 *
 * @author carla
 */
public class DescargarPDF extends DownloadAction {

  protected StreamInfo getStreamInfo(ActionMapping mapping,
          ActionForm form,
          HttpServletRequest request,
          HttpServletResponse response)
          throws Exception {
    // Download a "pdf" file - gets the file name from the
    // Action Mapping's parameter
    String contentType = "application/pdf";
    System.out.println("");
    //File file = new File(String.valueOf(request.getSession().getAttribute("tratado")));
    File file = new File("/home/carla/Desktop/PruebaPDF.pdf");
    return new FileStreamInfo(contentType, file);
  }
}
