/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

/**
 *
 * @author carla
 */
public class Evento extends PdfPageEventHelper {
    
    public void onEndPage(PdfWriter writer, Document document) {
        PdfContentByte cb = writer.getDirectContent();
        cb.saveState();
        cb.setColorStroke(new CMYKColor(1f, 0f, 0f, 0f));
        cb.setColorFill(new CMYKColor(1f, 0f, 0f, 0f));
        cb.rectangle(20,10,10,820);
        cb.fill();
        cb.restoreState();
    }
}
