package com.system.email;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Properties;

public class MailSender {

    private static final Logger LOG = LoggerFactory.getLogger(MailSender.class);

    private static String host;
    private static String username;
    private static String password;

    static {
        Properties properties = new Properties();
        try {
            properties.load(MailSender.class.getClassLoader().getResourceAsStream("mail.properties"));

            host = properties.getProperty("mail.host");
            username = properties.getProperty("mail.username");
            password = properties.getProperty("mail.password");

        } catch(Exception e) {
            LOG.error("mail configuration init fail. error:{}", e);
        }
    }

    private MailSender(){}

    public static boolean send(String to, String subject, String content) {
        try {
            HtmlEmail email = new HtmlEmail();
            email.setAuthentication(username, password);
            email.setHostName(host);
            email.addTo(to);
            email.setFrom(username);
            email.setSubject(subject);
            email.setCharset("UTF-8");
            email.setHtmlMsg(content);
            email.send();
            return true;
        } catch (Exception e) {
            LOG.error("邮件发送失败:{}", e);
            return false;
        }
    }

}
