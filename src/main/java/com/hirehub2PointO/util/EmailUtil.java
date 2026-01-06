package com.hirehub2PointO.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.Properties;

public class EmailUtil {

    Properties props = ConfigUtil.getProperties();
    final String senderMail = props.getProperty("mail.senderMail");
    final String password = props.getProperty("mail.password");
    final String adminMail = props.getProperty("mail.adminMail");

    // Send OTP
    public boolean send(String receiverMail, String otp) {

        String host = "smtp.gmail.com";
        // Properties
        Properties prop = new Properties();
        prop.put("mail.smtp.host", host);
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");

        // Session
        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderMail, password);
            }
        });

        // Message
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderMail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiverMail));

            message.setSubject("Hirehub | Email Verification");

            message.setText(
                    "Hello,\n\nYour OTP for verification is: " + otp +
                            "\n\nThis OTP is valid for 10 minutes.\n\nRegards,\nHirehub Team"
            );

            Transport.send(message);
//            System.out.println("OTP sent successfully" + otp);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Send feedback to admin
    public boolean send(String name, String userEmail, String subject, String userMessage) {

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");

        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderMail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);

            // From: Your Website
            message.setFrom(new InternetAddress(senderMail, "Hire Support"));

            // To: support inbox
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(adminMail));

            // Reply goes to user
            message.setReplyTo(new Address[]{new InternetAddress((userEmail))});

            message.setSubject("Contact Us | " + subject);
            message.setText("New Contact Form Submission\n\n" + "User name:" + name + "\nUser Email: " + userEmail + "\n\n" + "Subject:" + subject + "\nMessage:" + userMessage);

            Transport.send(message);
            System.out.println("Feedback send successfully");
            return true;

        } catch (UnsupportedEncodingException | MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

    // send notification
    public boolean send(String receiverMail, String title, String companyName, String location, LocalDate postedDate) {
        String text = "Dear " + receiverMail +
                "\nWe’re pleased to inform you that your job posting has been successfully added to Hirehub and is now live on our platform.\n" +
                "\n" +
                "Job Details:\n" +
                "\n" +
                "Job Title:" + title + "\n" +
                "Company: " + companyName + "\n" +
                "Location: " + location + "\n" +
                "Posted On: " + postedDate + "\n" +
                "Your job listing is now visible to potential candidates, and you will start receiving applications shortly." +
                " You can manage, edit, or close this job anytime by logging into your recruiter dashboard.\n" +
                "\n" +
                "If you need any assistance or have questions regarding your posting, feel free to reach out to our support team.\n" +
                "\n" +
                "Thank you for choosing Hirehub to find the right talent.\n" +
                "\n" +
                "Best regards,\n" +
                "Hirehub Team\n" +
                "\uD83D\uDCE7 support@hirehub.com\n" +
                "\uD83C\uDF10  www.hirehub.com";

        String host = "smtp.gmail.com";
        // Properties
        Properties prop = new Properties();
        prop.put("mail.smtp.host", host);
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");

        // Session
        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderMail, password);
            }
        });

        // Message
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderMail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiverMail));

            message.setSubject("Notification | Your Job Has Been Successfully Posted");

            message.setText(text);

            Transport.send(message);
//            System.out.println("MAil send successfully.");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
}
