/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import javax.mail.Message.RecipientType;


/**
 *
 * @author Jhosbert
 */

public class EnvioMail {
    
    private String from;
    private String to;
    private String asunto;
    private String msg;
    
    public EnvioMail(String from, String to, String asunto, String msg) {
        this.from = from;
        this.to = to;
        this.asunto = asunto;
        this.msg = msg;
    }
    
    public void Enviar() {
        String host = "smtp.gmail.com";
        String userid = "sgtiaeal";
        String password = "admin123456";
        
        try {
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.setProperty("mail.transport.protocol", "smtps");
            props.put("mail.smtp.user", userid);
            props.put("mail.smtp.password", password);
            props.put("mail.smtp.port", "465");
            props.put("mail.smtps.auth", "true");
            Session session = Session.getDefaultInstance(props,null);
            MimeMessage message = new MimeMessage(session);
            InternetAddress fromAddress = new InternetAddress(this.from);
            InternetAddress toAddress = new InternetAddress(this.to);
            
            message.setFrom(fromAddress);
            message.setRecipient(RecipientType.TO,toAddress);
            message.setSubject(this.asunto);
            message.setText(this.msg);
            
            Transport transport = session.getTransport("smtps");
            transport.connect(host,userid,password);
            transport.sendMessage(message,message.getAllRecipients());
            transport.close();
                    
        }catch(AddressException e){
            e.printStackTrace();
        }catch(MessagingException e) {
            e.printStackTrace();
        }
        
    }
    
}