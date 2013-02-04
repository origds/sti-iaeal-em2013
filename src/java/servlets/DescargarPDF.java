/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DownloadAction;
import javabeans.Tratado;
import models.DatabaseTratado;
import servlets.GestionTratado;

/**
 *
 * @author carla
 */
public class DescargarPDF extends DownloadAction {

  private DatabaseTratado dt;

  private void createDatabaseTratado() {
    String driver = this.getServlet().getServletContext().getInitParameter("driver");
    String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
    dt = new DatabaseTratado(driver, databaseUrl);
  }

  protected StreamInfo getStreamInfo(ActionMapping mapping,
          ActionForm form,
          HttpServletRequest request,
          HttpServletResponse response)
          throws Exception {
    // Download a "pdf" file - gets the file name from the
    // Action Mapping's parameter
    String contentType = "application/pdf";
    System.out.println("");
    File file = new File(String.valueOf(request.getSession().getAttribute("tratado")));
    //File file = new File("/home/carla/Desktop/PruebaPDF.pdf");
    Tratado t = (Tratado) form;
    System.out.println("***** idd " + t.getId());
    createDatabaseTratado();
    dt.get(t, true);

    FileOutputStream f = new FileOutputStream(file);
    Document document = new Document();
    try {
      
      PdfWriter writer = PdfWriter.getInstance(document, f);
      Rectangle rct = new Rectangle(36, 54, 559, 788);
      //Definimos un nombre y un tamaño para el PageBox los nombres posibles son: 
      //“crop”, “trim”, “art” and “bleed”.
      writer.setBoxSize("art", rct);
      document.open();
      //Encabezado
      Font fuenteEnc = new Font(Font.getFamily("ARIAL"), 10, Font.BOLD);
      Font fuenteTitulo = new Font(Font.getFamily("ARIAL"), 14, Font.BOLD);
      Font fuenteText = new Font(Font.getFamily("ARIAL"), 10);
      DateFormat dates = new SimpleDateFormat("dd/MM/yyyy");
      Date date = new Date();


      
      Image usblogo = Image.getInstance("logoiaeal.png");
      //document.add(usblogo);

      //Logos
      /*String imageUrl = "http://www.iaeal.usb.ve/Logo%20para%20web.png";
      Image usblogo = Image.getInstance(new URL(imageUrl));*/
      usblogo.scaleAbsolute(120f, 60f);
      usblogo.setAbsolutePosition(400f, 720f);
      document.add(usblogo);
      

      String encabezado = "\nSartenejas " + dates.format(date) + "\n"
              + "República Bolivariana de Venezuela \n"
              + "Universidad Simón Bolívar \n"
              + "Instituto de Altos Estudios de America Latina \n"
              + "Sistema de Tratados y Acuerdos Internacionales de Venezuela\n";

      Paragraph pa = new Paragraph(encabezado, fuenteEnc);
      pa.setSpacingBefore(20);
      pa.setSpacingAfter(10);
      pa.setIndentationLeft(50);
      document.add(pa);

      // Titulo del Tratado.
      String s = t.getTitulo();
      Paragraph p = new Paragraph(s, fuenteTitulo);
      p.setAlignment(Element.ALIGN_CENTER);
      p.setSpacingBefore(20);
      p.setSpacingAfter(10);
      p.setIndentationLeft(50);
      document.add(p);


      s = "Fecha de Firma: " + t.getFirmaFecha() + " en " + t.getFirmaLugar()
              + "\nEntrada en Vigor: " + t.getEntradaVigor()
              + "\nFecha de Publicacion en Gaceta Oficial: " + t.getFechaGaceta()
              + "\nNumero de Gaceta Oficial: " + t.getNumGaceta();
      p = new Paragraph(s, fuenteText);
      p.setSpacingBefore(5);
      p.setIndentationLeft(50);
      document.add(p);

      //Mostrar Paises y Grupos involucrados
      System.out.println("****s es: " + s);

      s = "Paises involucrados: ";
      p = new Paragraph(s);

      if (t.getPaises().length == 0) {
        s += " No se han agregado paises para este tratado";
      } else {
        for (int i = 0; i != t.getPaises().length; i++) {
          if (i == t.getPaises().length - 2) {
            s += t.getPaises()[i] + " y ";
          } else if (i == t.getPaises().length - 1) {
            s += t.getPaises()[i];
          } else {
            s += t.getPaises()[i] + ", ";
          }
        }
      }
      p = new Paragraph(s, fuenteText);
      p.setIndentationLeft(50);
      document.add(p);


      s = "Grupos involucrados: ";
      if (t.getGrupos().length == 0) {
        s += "No se han agregado grupos para este tratado.";
      } else {
        for (int i = 0; i != t.getGrupos().length; i++) {
          if (i == t.getGrupos().length - 2) {
            s += t.getGrupos()[i] + " y ";
          } else if (i == t.getGrupos().length - 1) {
            s += t.getGrupos()[i];
          } else {
            s += t.getGrupos()[i] + ", ";
          }
        }
      }
      p = new Paragraph(s, fuenteText);
      p.setSpacingAfter(10);
      p.setIndentationLeft(50);
      document.add(p);

      //Se muestra el contenido del tratado
      s = t.getContenido();
      p = new Paragraph(s, fuenteText);
      p.setSpacingBefore(5);
      p.setSpacingAfter(10);
      p.setIndentationLeft(50);
      document.add(p);

      document.close();
      f.flush();
      f.close();
    } catch (Exception e) {
      //imprimimos los errores
      System.err.println(e);
      e.printStackTrace();
    }







    return new FileStreamInfo(contentType, file);
  }
} 