package com.hirehub2PointO.dao;

import com.hirehub2PointO.model.User;
import com.hirehub2PointO.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDao {

    // save user (create)
    public boolean save(User user) {
        boolean isSave = false;

        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(user);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
        return isSave;
    }

    // get user (receive)
    public User get(String email, String password) {
        User user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query query = session.createQuery("from User where userGmail = :email and password = :password");
            query.setParameter("email", email);
            query.setParameter("password", password);
            user = (User) query.uniqueResult();

            return user;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public User get(String email) {
        User user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query query = session.createQuery("from User where userGmail = :email");
            query.setParameter("email", email);
            user = (User) query.uniqueResult();

            return user;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // update user (update)
    private boolean update(User user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            session.merge(user);
            transaction.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean update(String email, String password) {

        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            Query query = session.createQuery("UPDATE User SET password = :password WHERE userGmail = :email");
            query.setParameter("password", password);
            query.setParameter("email", email);

            int result = query.executeUpdate();
            transaction.commit();

            return result > 0;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }
}
