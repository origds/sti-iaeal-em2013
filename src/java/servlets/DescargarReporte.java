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
import javabeans.ClaseEstadistica;
import javabeans.est;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DatabaseEstadistica;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DownloadAction;

/**
 *
 * @author carla
 */
public class DescargarReporte extends DownloadAction {
 
    private DatabaseEstadistica dt;

    private void createDatabaseReporte() {
        String driver = this.getServlet().getServletContext().getInitParameter("driver");
        String databaseUrl = this.getServlet().getServletContext().getInitParameter("databaseUrl");
        dt = new DatabaseEstadistica(driver, databaseUrl);
      }

    @Override
    protected StreamInfo getStreamInfo(
            ActionMapping mapping, 
            ActionForm form, 
            HttpServletRequest request, 
            HttpServletResponse response) 
            throws Exception {
        
        String fileDir="/estadistica"; //directory where all files are created and located 
        String fileName="/reporte.pdf";   

        String contentType = "application/pdf";

        ClaseEstadistica estad = (ClaseEstadistica) form;
        est estCompleta = new est();
        createDatabaseReporte();
        estCompleta = dt.BuscarEstadistica(estad);

        //Creamos el archivo temporalmente en el path
        //build/web/WEB-INF/estadistica/reporte.dpf
        File file = new File(request.getRealPath("/WEB-INF")+fileDir+fileName);

        FileOutputStream f = new FileOutputStream(file);
        
        //Creamos el documento PDF
        Document document = new Document();
              
        
        try {
        
            PdfWriter writer = PdfWriter.getInstance(document, f);
            Rectangle rct = new Rectangle(36, 54, 559, 788);
            writer.setBoxSize("art", rct);
            document.open();
            
            //Creamos el evento para agregar el rectangulo azul en todas las 
            //paginas del PDF.
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
            
            //Sticker del IAEAL
            String imageUrl = "http://img248.imageshack.us/img248/4109/stickeriaeal2.png";
            Image usblogo = Image.getInstance(new URL(imageUrl));
            usblogo.scaleAbsolute(100f, 50f);
            usblogo.setAbsolutePosition(430f, 740f);
            document.add(usblogo);

            //Logo de la USB
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
        
            
            String s = "Reporte de Estadística";
            Paragraph p = new Paragraph(s, fuenteTitulo);
            p.setAlignment(Element.ALIGN_CENTER);
            p.setSpacingBefore(20);
            p.setSpacingAfter(10);
            p.setIndentationLeft(50);
            document.add(p);

  
            boolean paises1 = estad.getCodigo1() != null && estad.getCodigo2() != null && estad.getCodigo3() != null
                && !estad.getCodigo1().equals("Paises...") && !estad.getCodigo2().equals("Paises...")
                && !estad.getCodigo3().equals("Paises...");
            
            boolean paises2 = !estad.getCodigo1().equals("Paises...") || !estad.getCodigo2().equals("Paises...")
                              || !estad.getCodigo3().equals("Paises...");
            
            boolean periodos = estCompleta.getAno1() != 0 && estCompleta.getAno2() != 0 && estCompleta.getAno3() != 0
                && estCompleta.getAno4() != 0;
    
            
                        
            
            s = "Usted ha realizado una estadistica con los paises: ";
            
            if (estad.getCodigo1() != "Paises...")
                s += estad.getCodigo1() + " ";
            
            if (estad.getCodigo2() != "Paises...")
                s += estad.getCodigo2() + " ";
            
            if (estad.getCodigo3() != "Paises...")
                s += estad.getCodigo3() + " ";
            
            Paragraph p1 = new Paragraph(s, fuenteText);
            p1.setAlignment(Element.ALIGN_JUSTIFIED);
            p1.setSpacingBefore(10);
            p1.setSpacingAfter(5);
            p1.setIndentationLeft(50);
            
            
            s = "A continuación se tiene un cuadro resumen en el cual se ";
            s += "muestran los resultados obtenidos al realizar la estadística.\n";
            Paragraph p2 = new Paragraph(s, fuenteText);
            p2.setSpacingBefore(10);
            p2.setSpacingAfter(20);
            p2.setIndentationLeft(50);      
            
            
                      
            
            //si tengo al menos un pais y todos los periodos
            if (paises2 && periodos){
                document.add(p1);
                s = "Para cada país se tiene la cantidad de tratados totales ";
                s += "firmados por Venezuela con dicho país. Seguidamente se tiene ";
                s += "la cantidad de tratados firmados por un país para el primer período ";
                s += "y analogamente para el segundo período escogido.\n";
                p = new Paragraph(s, fuenteText);
                p.setAlignment(Element.ALIGN_JUSTIFIED);
                p.setSpacingBefore(20);
                p.setSpacingAfter(5);
                p.setIndentationLeft(50);
                document.add(p);
                document.add(p2);                
                
                document = reportePaisPeriodo(estad, estCompleta, document);
                s = "Gracias al cuadro se puede inferir que ";
                s += "para el periodo que va desde " + estad.getPeriodoIni1();
                s += " hasta " + estad.getPeriodoFin1() + " se tienen un total ";
                s += "de " + estCompleta.gettotalPP1() + " tratados firmados por Venezuela";
                s += ", mientras que para el periodo " + estad.getPeriodoIni2();
                s += " - " + estad.getPeriodoFin2() + " se tienen un total de ";
                s += estCompleta.gettotalPP2();
                p = new Paragraph(s, fuenteText);
                p.setAlignment(Element.ALIGN_JUSTIFIED_ALL);
                p.setSpacingBefore(20);
                p.setSpacingAfter(5);
                p.setIndentationLeft(50);
                document.add(p);
                
            //si tengo todos los paises
            } else if (paises1){
                document.add(p1);
                s = "Para cada país se tiene la cantidad de tratados totales ";
                s += "firmados por Venezuela con dicho país.";
                p = new Paragraph(s, fuenteText);
                p.setAlignment(Element.ALIGN_JUSTIFIED);
                p.setSpacingBefore(20);
                p.setSpacingAfter(5);
                p.setIndentationLeft(50);
                document.add(p);
                document.add(p2);
                document = reportePais(estad, estCompleta, document);            
            } else if (periodos){
                s = "Para cada periodo se tiene la cantidad de tratados totales ";
                s += "firmados por Venezuela en ese intervalo de tiempo\n";
                p = new Paragraph(s, fuenteText);
                p.setAlignment(Element.ALIGN_JUSTIFIED);
                p.setSpacingBefore(20);
                p.setSpacingAfter(5);
                p.setIndentationLeft(50);
                document.add(p);
                document.add(p2);
                document = reportePeriodo(estad, estCompleta, document);            
                
                s = "Gracias al cuadro se puede inferir que ";
                s += "para el periodo que va desde " + estad.getPeriodoIni1();
                s += " hasta " + estad.getPeriodoFin1() + " se tienen un total ";
                s += "de " + estCompleta.gettotalP1() + " tratados firmados por Venezuela";
                s += ", mientras que para el periodo " + estad.getPeriodoIni2();
                s += " - " + estad.getPeriodoFin2() + " se tienen un total de ";
                s += estCompleta.gettotalP2();
                p = new Paragraph(s, fuenteText);
                p.setAlignment(Element.ALIGN_JUSTIFIED_ALL);
                p.setSpacingBefore(20);
                p.setSpacingAfter(5);
                p.setIndentationLeft(50);
                document.add(p);
            }
            
            document.close();
            f.flush();
            f.close();
            
        } catch (Exception e) {
            System.err.println(e);
            e.printStackTrace();
        }
        return new FileStreamInfo(contentType, file);
    }
    
    public Document reportePaisPeriodo(ClaseEstadistica estad, est estCompleta, 
                                    Document document){
        
        Font fuenteText = new Font(Font.getFamily("ARIAL"), 10);
        
        try {
        
            PdfPTable cuadro = new PdfPTable(4);
            PdfPTable cuadro2 = new PdfPTable(4);
            PdfPTable cuadro3 = new PdfPTable(4);
            PdfPTable cuadro4 = new PdfPTable(4);


            String s = "Paises: \n\n";
            Paragraph p = new Paragraph(s, fuenteText);
            p.setAlignment(Element.ALIGN_CENTER);
            PdfPCell cell1 = new PdfPCell(p);
            cuadro.addCell(cell1);


            s = "Cantidad por paises: \n\n\n";
            cuadro.addCell(new Paragraph(s, fuenteText));

            s = "Cantidad de Tratados en el periodo: \n\n";
            s += String.valueOf(estad.getPeriodoIni1()) + " - " + String.valueOf(estad.getPeriodoFin1()) + "\n\n";
            p = new Paragraph(s, fuenteText);
            p.setAlignment(Element.ALIGN_CENTER);
            cuadro.addCell(p); 

            s = "Cantidad de Tratados en el periodo: \n\n";
            s += String.valueOf(estad.getPeriodoIni2()) + " - " + String.valueOf(estad.getPeriodoFin2()) + "\n\n";
            cuadro.addCell(new Paragraph(s, fuenteText));


            //Fila 2 Columna 1 Nombre del Pais
            s = estad.getCodigo1() + "\n\n";
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 2 Cantidad de tratados para el primer pais
            s = String.valueOf(estCompleta.gettotal1());
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 3 Cantidad de tratados para el primer periodo del primer pais
            s = String.valueOf(estCompleta.getPrimero());
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 4 Cantidad de tratados para el segundo periodo del primer pais
            s = String.valueOf(estCompleta.getCuarto());
            cuadro2.addCell(new Paragraph(s, fuenteText));



            //Fila 3 Columna 1 Nombre del Pais
            s = estad.getCodigo2() + "\n\n";
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 2 Cantidad de tratados para el segundo pais
            s = String.valueOf(estCompleta.gettotal2());
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 3 Cantidad de tratados para 
            //el segundo pais en el primer periodo
            s = String.valueOf(estCompleta.getSegundo());
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 4 Cantidad de tratados para el segundo pais en el
            //segundo periodo
            s = String.valueOf(estCompleta.getQuinto());
            cuadro2.addCell(new Paragraph(s, fuenteText));


            //Fila 4 Columna 1 Nombre del Pais
            s = estad.getCodigo3() + "\n\n";
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 4 Columna 2 Cantidad de tratados para el segundo pais
            s = String.valueOf(estCompleta.gettotal3());
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 4 Columna 3 Cantidad de tratados para 
            //el segundo pais en el primer periodo
            s = String.valueOf(estCompleta.getTercero());
            cuadro2.addCell(new Paragraph(s, fuenteText));
            //Fila 4 Columna 4 Cantidad de tratados para el segundo pais en el
            //segundo periodo
            s = String.valueOf(estCompleta.getSexto());
            cuadro2.addCell(new Paragraph(s, fuenteText));

            document.add(cuadro);
            document.add(cuadro2);
            document.add(cuadro3);
            
        } catch (Exception e){
            System.err.println(e);
            e.printStackTrace();
        }
        return document;

    }
    
    public Document reportePais(ClaseEstadistica estad, est estCompleta, 
                                Document document){
        
        Font fuenteText = new Font(Font.getFamily("ARIAL"), 10);
        
            try {
        
            PdfPTable cuadro = new PdfPTable(2);
            PdfPTable cuadro2 = new PdfPTable(2);
            PdfPTable cuadro3 = new PdfPTable(2);
            PdfPTable cuadro4 = new PdfPTable(2);


            String s = "Paises: \n\n";
            Paragraph p = new Paragraph(s, fuenteText);
            PdfPCell cell1 = new PdfPCell(p);
            cuadro.addCell(cell1);


            s = "Cantidad de Tratadps por paises: \n\n\n";
            cuadro.addCell(new Paragraph(s, fuenteText));



            //Fila 2 Columna 1 Nombre del Pais
            s = estad.getCodigo1() + "\n\n";
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 2 Cantidad de tratados para el primer pais
            s = String.valueOf(estCompleta.gettotal1());
            cuadro2.addCell(new Paragraph(s, fuenteText));


            //Fila 3 Columna 1 Nombre del Pais
            s = estad.getCodigo2() + "\n\n";
            cuadro3.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 2 Cantidad de tratados para el segundo pais
            s = String.valueOf(estCompleta.gettotal2());
            cuadro3.addCell(new Paragraph(s, fuenteText));


            //Fila 4 Columna 1 Nombre del Pais
            s = estad.getCodigo3() + "\n\n";
            cuadro3.addCell(new Paragraph(s, fuenteText));

            //Fila 4 Columna 2 Cantidad de tratados para el segundo pais
            s = String.valueOf(estCompleta.gettotal3());
            cuadro3.addCell(new Paragraph(s, fuenteText));

            document.add(cuadro);
            document.add(cuadro2);
            document.add(cuadro3);
            
        } catch (Exception e){
            System.err.println(e);
            e.printStackTrace();
        }
        return document;
    }
    
    
    public Document reportePeriodo(ClaseEstadistica estad, est estCompleta,
            Document document){
    
    Font fuenteText = new Font(Font.getFamily("ARIAL"), 10);
        
        try {
        
            PdfPTable cuadro = new PdfPTable(2);
            PdfPTable cuadro2 = new PdfPTable(2);
            PdfPTable cuadro3 = new PdfPTable(2);
            PdfPTable cuadro4 = new PdfPTable(2);


            String s = "Paises: \n\n";
            Paragraph p = new Paragraph(s, fuenteText);
            PdfPCell cell1 = new PdfPCell(p);
            cuadro.addCell(cell1);


            s = "Periodos: \n\n\n";
            cuadro.addCell(new Paragraph(s, fuenteText));

            s = "Tratados por periodo: \n\n";
            p = new Paragraph(s, fuenteText);
            cuadro.addCell(p); 

            
            //Fila 2 Columna 1 Periodo 1
            s = String.valueOf(estCompleta.getAno1()) + " - " + String.valueOf(estCompleta.getAno2()) + "\n\n";
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 2 Cantidad de tratados para el primer periodo
            s = String.valueOf(estCompleta.gettotalP1());
            cuadro2.addCell(new Paragraph(s, fuenteText));


            //Fila 3 Columna 1 Periodo 2
            s = String.valueOf(estCompleta.getAno3()) + " - " + String.valueOf(estCompleta.getAno4()) + "\n\n";
            cuadro2.addCell(new Paragraph(s, fuenteText));

            //Fila 2 Columna 2 Cantidad de tratados para el segundo pais
            s = String.valueOf(estCompleta.gettotalP2());
            cuadro2.addCell(new Paragraph(s, fuenteText));

            document.add(cuadro);
            document.add(cuadro2);
            document.add(cuadro3);
            
        } catch (Exception e){
            System.err.println(e);
            e.printStackTrace();
        }
        return document;
    
    
    
    
    }
    
    
}
