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
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
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


/**
 *
 * @author carla
 */
public class DescargarPlantilla extends DownloadAction {

  protected DownloadAction.StreamInfo getStreamInfo(ActionMapping mapping,
          ActionForm form,
          HttpServletRequest request,
          HttpServletResponse response)
          throws Exception {
    // Download a "pdf" file - gets the file name from the
    // Action Mapping's parameter
    String contentType = "application/pdf";
    System.out.println("");

    String fileDir="/tratado"; //directory where all files are created and located 
    String fileName="/tratado.pdf";   
    
    File file = new File(request.getRealPath("/WEB-INF")+fileDir+fileName);


    FileOutputStream f = new FileOutputStream(file);
    Document document = new Document();

    try {
      PdfWriter writer = PdfWriter.getInstance(document, f);
//      PdfContentByte cb = writer.getDirectContent();
      Rectangle rct = new Rectangle(36, 54, 559, 788);
      //Definimos un nombre y un tamaño para el PageBox los nombres
      //posibles son: “crop”, “trim”, “art” and “bleed”.
      writer.setBoxSize("art", rct);
      //HeaderFooter event = new HeaderFooter(this.getId(), this.getNumAutenticacion());
      //writer.setPageEvent(event);
      document.open();
      
      PdfContentByte cb = writer.getDirectContent();
      cb.saveState();
      cb.setColorStroke(new CMYKColor(1f, 0f, 0f, 0f));
      cb.setColorFill(new CMYKColor(1f, 0f, 0f, 0f));
      cb.rectangle(20,10,10,820);
      cb.fill();
      cb.restoreState();
      
      //Encabezado
      Font fuenteEnc = new Font(Font.getFamily("ARIAL"), 10, Font.BOLD);
      Font fuenteTitulo = new Font(Font.getFamily("ARIAL"), 12, Font.BOLD);
      Font fuenteText = new Font(Font.getFamily("ARIAL"), 10);
      DateFormat dates = new SimpleDateFormat("dd/MM/yyyy");
      Date date = new Date();
      //Logos
      //http://upload.wikimedia.org/wikipedia/commons/2/21/USB_logo.svg USB
 
      Image usblogo = Image.getInstance(request.getRealPath("/interfaz/imagenes/StickerIAEAL2.png"));
      usblogo.scaleAbsolute(100f, 50f);
      usblogo.setAbsolutePosition(430f, 740f);
      document.add(usblogo);
      
      usblogo = Image.getInstance(request.getRealPath("/interfaz/imagenes/logoUSB.png"));
      usblogo.scaleAbsolute(80f, 45f);
      usblogo.setAbsolutePosition(90f, 740f);
      document.add(usblogo);
      

      String encabezado = "\nSartenejas " + dates.format(date) + "\n"
              + "República Bolivariana de Venezuela \n"
              + "Universidad Simón Bolívar \n"
              + "Instituto de Altos Estudios de América Latina \n"
              + "Sistema de Tratados y Acuerdos Internacionales de Venezuela\n";
      Paragraph pa = new Paragraph(encabezado, fuenteEnc);
      pa.setSpacingBefore(50);
      pa.setSpacingAfter(50);
      pa.setIndentationLeft(50);
      document.add(pa);

      // Titulo del Tratado.

      PdfPTable cuadro = new PdfPTable(1);
      Paragraph p = new Paragraph("Título: \n\n\n\n\n", fuenteTitulo);
      cuadro.addCell(p);
      document.add(cuadro);

      PdfPTable cuadro1 = new PdfPTable(2);

      String s = "Fecha de Firma: ";
      p = new Paragraph(s, fuenteText);
      PdfPCell cell1 = new PdfPCell(p);
      cuadro1.addCell(cell1);

      s = "Lugar de Firma: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Fecha de Depósito: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Entrada en Vigor: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Fecha de Publicación en Gaceta Oficial: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Numero de Gaceta Oficial: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Duración: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Período: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Volúmen: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Página: \n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Países: \n\n\n\n\n\n\n\n\n\n\n\n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Grupos: \n\n\n\n\n\n\n\n\n\n\n\n\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      document.add(cuadro1);
      document.close();
      f.flush();
      f.close();
    } catch (Exception e) {
      //imprimimos los errores
      System.err.println(e);
      e.printStackTrace();
    }
    return new DownloadAction.FileStreamInfo(contentType, file);
  }
}
