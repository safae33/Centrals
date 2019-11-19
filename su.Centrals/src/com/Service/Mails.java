package com.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.Dao.UserDao;
import com.Model.User;



public class Mails {
	@Autowired
	private static UserDao userDao;
	
	
	private static String from = "renprosantralsistemi";  // GMail user name (just the part before "@gmail.com")
    private static String pass = "ekensafa05"; // GMail password
//    String[] to = { RECIPIENT }; // list of recipient email addresses
    
    
    public static void sendToAdminWhenFaultClose(String techName, String centralName) {
    	sendToAdminWhenFaultCloseByTech(techName, centralName);
    }
    
    public static void sendToTech(String to) {
    	sendToTechnician(to);
    }
    public static void sendToAdminDailyOk() {
    	sendToAdminWhenDailyOk();
    }
    
    private static void sendToAdminWhenFaultCloseByTech(String techName, String centralName) {
    	//List<User> users = userDao.read();
    	List<String> to = new ArrayList<String>();
//    	for(User us : users) {
//    		to.add(us.getMail());
//    	}
    	to.add("s.emrey97@gmail.com");
    	String subject = "Arıza Kaydı Kapatıldı";
    	String body = centralName + " Santralindeki  " + techName + " isimli teknikere atanmış olan arıza kaydı tekniker tarafından kapatılmıştır. Detaylar için lütfen sisteme giriş yapınız.";
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.size()];

            // To get the array of addresses
            for( int i = 0; i < to.size(); i++ ) {
                toAddress[i] = new InternetAddress(to.get(i));
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }

    private static void sendToAdminWhenDailyOk() {
    	List<User> users = userDao.read();
    	List<String> to = new ArrayList<String>();
    	for(User us : users) {
    		to.add(us.getMail());
    	}
    	String subject = "Veri Girişi Tammalandı";
    	String body = "Tüm santraller günlük veri girişini tamamladılar.";
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.size()];

            // To get the array of addresses
            for( int i = 0; i < to.size(); i++ ) {
                toAddress[i] = new InternetAddress(to.get(i));
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
    
    private static void sendToTechnician(String to) {
    	String subject = "Arıza Kaydı Açıldı";
    	String body = "Adınıza bir arıza kaydı oluşturuldu. Detaylar için lütfen sisteme giriş yapınız.";
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress toAddress = new InternetAddress(to);

            message.addRecipient(Message.RecipientType.TO, toAddress);

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}

