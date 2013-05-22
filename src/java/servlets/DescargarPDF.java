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
import javabeans.Tratado;
import models.DatabaseTratado;
import servlets.GestionTratado;
import servlets.Evento;

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
      
    String fileDir="/descargasPDF"; //directory where all files are created and located 
    String fileName="/tratado.pdf";   
      
    String contentType = "application/pdf";
    System.out.println("");
    
    Tratado t = (Tratado) form;
    createDatabaseTratado();
    dt.get(t, true);
    
    System.out.println("-------- " + t.getTitulo());
    File file = new File(String.valueOf(request.getSession().getAttribute("tratado")));
    
    System.out.println(String.valueOf(request.getSession().getAttribute("tratado")));
    //    File file = new File(request.getRealPath("/WEB-INF")+fileDir+fileName);
//    System.out.println(file.getAbsolutePath());
//    System.out.println(file.createNewFile());
//    System.out.println("HOLAAAA!!!!!!\n" + request.getRealPath("/WEB-INF")+fileDir+fileName);


    FileOutputStream f = new FileOutputStream(file);
    Document document = new Document();
    try {
      
      PdfWriter writer = PdfWriter.getInstance(document, f);
      Rectangle rct = new Rectangle(36, 54, 559, 788);
      //Definimos un nombre y un tamaño para el PageBox los nombres posibles son: 
      //“crop”, “trim”, “art” and “bleed”.
      writer.setBoxSize("art", rct);
      document.open();
      
      Evento evento = new Evento();
      writer.setPageEvent(evento);
            
      PdfContentByte cb = writer.getDirectContent();
      cb.saveState();
      cb.setColorStroke(new CMYKColor(1f, 0f, 0f, 0f));
      cb.setColorFill(new CMYKColor(1f, 0f, 0f, 0f));
      cb.rectangle(20,10,10,820);
      cb.fill();
      cb.restoreState();
      
      //Encabezado
      Font fuenteEnc = new Font(Font.getFamily("ARIAL"), 10, Font.BOLD);
      Font fuenteTitulo = new Font(Font.getFamily("ARIAL"), 14, Font.BOLD);
      Font fuenteText = new Font(Font.getFamily("ARIAL"), 10);
      DateFormat dates = new SimpleDateFormat("dd/MM/yyyy");
      Date date = new Date();


      
      //Image usblogo = Image.getInstance("logoiaeal.png");
      //document.add(usblogo);
      String imageUrl = "http://img248.imageshack.us/img248/4109/stickeriaeal2.png";
      Image usblogo = Image.getInstance(new URL(imageUrl));
      usblogo.scaleAbsolute(100f, 50f);
      usblogo.setAbsolutePosition(430f, 740f);
      document.add(usblogo);
      
      imageUrl = "http://www.usb.ve/conocer/corporativa/archivos/logos/logo/logo.png";
      usblogo = Image.getInstance(new URL(imageUrl));
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
      pa.setSpacingAfter(10);
      pa.setIndentationLeft(50);
      document.add(pa);

      
            // Titulo del Tratado.
      
            // Titulo del Tratado.
      String s = t.getTitulo() + "\n\n";
      Paragraph p = new Paragraph(s, fuenteTitulo);
      p.setAlignment(Element.ALIGN_CENTER);
      p.setSpacingBefore(20);
      p.setSpacingAfter(10);
      p.setIndentationLeft(50);
      document.add(p);
      PdfPTable cuadro1 = new PdfPTable(2);

      
      if (t.getFirmaFecha() == null){
          s = "Fecha de Firma: Informacion no disponible.";
      } else {      
        s = "Fecha de Firma: " + t.getFirmaFecha() + "\n\n";
      }
      p = new Paragraph(s, fuenteText);
      PdfPCell cell1 = new PdfPCell(p);
      cuadro1.addCell(cell1);

      s = "Lugar de Firma: " + t.getFirmaLugar() ;
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Fecha de Depósito: " + t.getFechaDeposito() + "\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Entrada en Vigor: " + t.getEntradaVigor() ;
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Fecha de Publicación en Gaceta Oficial: " + t.getFechaGaceta()+ "\n\n" ;
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Numero de Gaceta Oficial: " + t.getNumGaceta() ;
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Clasificación: ";
      if (t.getGrupos().length == 0){
          s += "Bilateral\n";
      } else {
          s+= "Multilateral\n";
      }
      cuadro1.addCell(new Paragraph(s, fuenteText));
      
      s = "Duración: " + t.getDuracion() + "\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Período: " + t.getPeriodo() ;
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Volúmen: " + t.getVolumen()+ "\n\n" ;
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Página: " + t.getPagina() ;
      cuadro1.addCell(new Paragraph(s, fuenteText));

      s = "Este tratado se encuentra disponible en: " + t.getObservacion() + "\n\n";
      cuadro1.addCell(new Paragraph(s, fuenteText));
      
      s = "Países Involucrados: \n\n";
      if (t.getPaises().length == 0) {
        s += " No se han agregado países para este tratado";
      } else {
        for (int i = 0; i != t.getPaises().length; i++) {
          if (i == t.getPaises().length - 2) {
            s += t.getPaises()[i] + " y \n";
          } else if (i == t.getPaises().length - 1) {
            s += t.getPaises()[i];
          } else {
            s += t.getPaises()[i] + ", \n";
          }
        }
      }
      cuadro1.addCell(new Paragraph(s, fuenteText));
      
           
      s = "Grupos Participantes: \n\n";      
      if (t.getGrupos().length == 0) {
      s += "No se han agregado grupos para este tratado.";
      } else {
        for (int i = 0; i != t.getGrupos().length; i++) {
          if (i == t.getGrupos().length - 2) {
            s += t.getGrupos()[i] + " y \n";
          } else if (i == t.getGrupos().length - 1) {
            s += t.getGrupos()[i];
          } else {
            s += t.getGrupos()[i] + ", \n";
          }
        }
      }   
      
      cuadro1.addCell(new Paragraph(s, fuenteText));

      document.add(cuadro1);

        if (t.getContenido() != null) {
            s = "Contenido: \n\nx" +t.getContenido() + "\n\n";
            p = new Paragraph(s, fuenteText);
            p.setSpacingBefore(50);
            p.setSpacingAfter(50);
            p.setIndentationLeft(50);
            document.add(p);
        } else {
            s = "Este tratado no posee contenido.\n";
            p = new Paragraph(s, fuenteText);
            p.setSpacingBefore(50);
            p.setSpacingAfter(50);
            p.setIndentationLeft(50);
            document.add(p);
        }
              
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