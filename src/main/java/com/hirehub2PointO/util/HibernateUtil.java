package com.hirehub2PointO.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Properties;

public class HibernateUtil {
    private static SessionFactory sessionFactory;
    private static Properties props = ConfigUtil.getProperties();

    static {
        try {
            Configuration cfg = new Configuration().configure("Hibernate.cfg.xml");

            // Override DB credentials
            cfg.setProperty("hibernate.connection.url", props.getProperty("db.url"));
            cfg.setProperty("hibernate.connection.username", props.getProperty("db.username"));
            cfg.setProperty("hibernate.connection.password", props.getProperty("db.password"));

            sessionFactory = cfg.buildSessionFactory();

        } catch (Throwable e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
