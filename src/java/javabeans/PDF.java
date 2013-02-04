/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javabeans.Tratado;

/**
 *
 * @author carla
 */
public class PDF {

  
  public static void generarPDF(Tratado t, File file) throws FileNotFoundException {

    /*String[] paises = {"Venezuela", "Colombia", "Cuba", "Chile"};
    String[] grupos = {"PDVSA", "ONU", "OPEP", "ONU", "OTRO"};
    Tratado t = new Tratado(1, "Acuerdo de Cooperacion para la agricultura de venezuela y de todos os paises del mundos", true, true, "Caracas",
            "02/08/2012", "02/05/2012", "01/01/2012", "01/01/2012", false,
            "05/05/2012", "02/08/2012", "tres dias", 1, 2, 3, "Observacion interesantisima",
            "Contenido cool", paises, grupos, 0, "carla");
*/

    FileOutputStream f = new FileOutputStream(file);
    Document document = new Document();
    try {
      System.out.println("ENTRE!!!!!************************\n\n");
      PdfWriter writer = PdfWriter.getInstance(document, f);


      Rectangle rct = new Rectangle(36, 54, 559, 788);
      //Definimos un nombre y un tamaño para el PageBox los nombres posibles son: “crop”, “trim”, “art” and “bleed”.
      writer.setBoxSize("art", rct);
      //HeaderFooter event = new HeaderFooter(this.getId(), this.getNumAutenticacion());
      //writer.setPageEvent(event);
      document.open();
      //Encabezado
      Font fuenteEnc = new Font(Font.getFamily("ARIAL"), 10, Font.BOLD);
      Font fuenteTitulo = new Font(Font.getFamily("ARIAL"), 14, Font.BOLD);
      Font fuenteText = new Font(Font.getFamily("ARIAL"), 10);
      DateFormat dates = new SimpleDateFormat("dd/MM/yyyy");
      Date date = new Date();


      //Logos
      String imageUrl = "http://www.iaeal.usb.ve/Logo%20para%20web.png";      
      Image usblogo = Image.getInstance(new URL(imageUrl));
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
      //p.setSpacingAfter(10);
      p.setIndentationLeft(50);
      document.add(p);

      //Mostrar Paises y Grupos involucrados
      s = "Paises involucrados: ";
      p = new Paragraph(s);
      for (int i = 0; i != t.getPaises().length; i++) {
        if (i == t.getPaises().length - 2) {
          s += t.getPaises()[i] + " y ";
        } else if (i == t.getPaises().length - 1) {
          s += t.getPaises()[i];
        } else {
          s += t.getPaises()[i] + ", ";
        }
      }
      p = new Paragraph(s, fuenteText);
      //p.setSpacingBefore(5);
      //p.setSpacingAfter(5);
      p.setIndentationLeft(50);
      document.add(p);


      s = "Grupos involucrados: ";
      for (int i = 0; i != t.getGrupos().length; i++) {
        if (i == t.getGrupos().length - 2) {
          s += t.getGrupos()[i] + " y ";
        } else if (i == t.getGrupos().length - 1) {
          s += t.getGrupos()[i];
        } else {
          s += t.getGrupos()[i] + ", ";
        }
      }
      p = new Paragraph(s, fuenteText);
      //p.setSpacingBefore(0);
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
  }
}
