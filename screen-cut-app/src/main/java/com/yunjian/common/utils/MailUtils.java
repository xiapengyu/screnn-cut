package com.yunjian.common.utils;

import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yunjian.core.dto.MailAuthenticator;

public class MailUtils {
	
	private static Logger logger = LoggerFactory.getLogger(MailUtils.class); 
	
	public static String mail_user = "1976075166@qq.com";
	public static String mail_password = "nsmdglrjxoxkchjj";	//smtp登录都是使用授权码登录而不是邮箱密码
	public static String mail_transport_protocol = "smtp";
	public static String mail_smtp_host = "smtp.qq.com";
	public static String mail_smtp_port = "587";
	public static String mail_smtp_auth = "true";
	public static int mail_smtp_timeout = 10000;
	
    public static Properties getMailProperties() {
        Properties properties = new Properties();
        properties.put("mail.user", mail_user);
        properties.put("mail.password", mail_password);
        properties.put("mail.transport.protocol", mail_transport_protocol);
        properties.put("mail.smtp.host", mail_smtp_host);
        properties.put("mail.smtp.port", mail_smtp_port);
        properties.put("mail.smtp.auth", mail_smtp_auth);
        //properties.put("mail.debug", "true");
        return properties;
    }

    public static boolean sendMail(String to, String code) {
        if (to != null) {
            try {
                Properties prop = getMailProperties();
                String user = prop.getProperty("mail.user");
                String password = prop.getProperty("mail.password");
                MailAuthenticator auth = new MailAuthenticator(user, password);
                Session session = Session.getInstance(prop, auth);
                
                Transport transport = session.getTransport();
                transport.connect(prop.getProperty("mail.smtp.host"),prop.getProperty("mail.user"), prop.getProperty("mail.password"));

                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(user));
                message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
                message.setSubject("邮箱验证码");

                MimeMultipart mimeMultipart = new MimeMultipart("mixed");
                message.setContent(mimeMultipart);
                MimeBodyPart mimeBodyPart = new MimeBodyPart();
                mimeMultipart.addBodyPart(mimeBodyPart);
                MimeMultipart bodyMultipart = new MimeMultipart("related");
                mimeBodyPart.setContent(bodyMultipart);
                MimeBodyPart htmlPart = new MimeBodyPart();
                bodyMultipart.addBodyPart(htmlPart);
                String content = "验证码为{0}，有效时间5分钟，请妥善保管。" ;
                htmlPart.setContent(MessageFormat.format(content, code), "text/html;charset=utf-8");
                
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
            }catch (Exception e){
            	logger.error("邮件发送失败", e);
            	return false;
            }
            return true;
        } else {
            return false;
        }
    }
    
}