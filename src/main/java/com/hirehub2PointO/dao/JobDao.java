package com.hirehub2PointO.dao;

import com.hirehub2PointO.model.Job;
import com.hirehub2PointO.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class JobDao {

    // save (create)
    public boolean save(Job job) {
        boolean isSave = false;
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            session.persist(job);
            transaction.commit();

            isSave = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSave;
    }

    // get (receive)

    public int get() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Job ORDER BY postedDate DESC", Job.class).list().size();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Job> get(int offset, int limit) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Job ORDER BY postedDate DESC", Job.class)
                    .setFirstResult(offset)
                    .setMaxResults(limit)
                    .list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int get(String title) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Job WHERE REPLACE(LOWER(title), ' ', '') LIKE REPLACE(LOWER(:t), ' ', '') ORDER BY postedDate DESC", Job.class)
                    .setParameter("t", "%" + title + "%")
                    .list().size();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Job> get(String title, int offset, int limit) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Job WHERE REPLACE(LOWER(title), ' ', '') LIKE REPLACE(LOWER(:t), ' ', '') " + "ORDER BY postedDate DESC", Job.class)
                    .setParameter("t", "%" + title + "%")
                    .setFirstResult(offset)
                    .setMaxResults(limit)
                    .list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int get(String q, String location, String company, String experience, String salary) {

        Transaction transaction = null;
        List<Job> jobs = new ArrayList<>();

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();

            StringBuilder hql = new StringBuilder("FROM Job WHERE 1=1 ");

            // Search by title (ignore case & space)
            if (q != null && !q.trim().isEmpty()) {
                hql.append("AND REPLACE(LOWER(title), ' ', '') LIKE REPLACE(LOWER(:q), ' ', '') ");
            }

            if (location != null && !location.trim().isEmpty()) {
                hql.append("AND LOWER(location) = LOWER(:location) ");
            }

            if (company != null && !company.trim().isEmpty()) {
                hql.append("AND LOWER(companyName) = LOWER(:company) ");
            }

            if (experience != null && !experience.trim().isEmpty()) {
                hql.append("AND LOWER(experience) = LOWER(:experience) ");
            }

            if (salary != null && !salary.trim().isEmpty()) {
                hql.append("AND LOWER(salary) = LOWER(:salary) ");
            }

            hql.append("ORDER BY postedDate DESC");

            Query<Job> query = session.createQuery(hql.toString(), Job.class);

            // Set parameters safely
            if (q != null && !q.trim().isEmpty())
                query.setParameter("q", "%" + q + "%");

            if (location != null && !location.trim().isEmpty())
                query.setParameter("location", location);

            if (company != null && !company.trim().isEmpty())
                query.setParameter("company", company);

            if (experience != null && !experience.trim().isEmpty())
                query.setParameter("experience", experience);

            if (salary != null && !salary.trim().isEmpty())
                query.setParameter("salary", salary);

            jobs = query.list();

            transaction.commit();
            return jobs.size();

        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }

        return 0;
    }

    public List<Job> get(String q, String location, String company, String experience, String salary, int offset, int limit) {

        Transaction transaction = null;
        List<Job> jobs = new ArrayList<>();

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();

            StringBuilder hql = new StringBuilder("FROM Job WHERE 1=1 ");

            // Search by title (ignore case & space)
            if (q != null && !q.trim().isEmpty()) {
                hql.append("AND REPLACE(LOWER(title), ' ', '') LIKE REPLACE(LOWER(:q), ' ', '') ");
            }

            if (location != null && !location.trim().isEmpty()) {
                hql.append("AND LOWER(location) = LOWER(:location) ");
            }

            if (company != null && !company.trim().isEmpty()) {
                hql.append("AND LOWER(companyName) = LOWER(:company) ");
            }

            if (experience != null && !experience.trim().isEmpty()) {
                hql.append("AND LOWER(experience) = LOWER(:experience) ");
            }

            if (salary != null && !salary.trim().isEmpty()) {
                hql.append("AND LOWER(salary) = LOWER(:salary) ");
            }

            hql.append("ORDER BY postedDate DESC");

            Query<Job> query = session.createQuery(hql.toString(), Job.class);

            // Set parameters safely
            if (q != null && !q.trim().isEmpty())
                query.setParameter("q", "%" + q + "%");

            if (location != null && !location.trim().isEmpty())
                query.setParameter("location", location);

            if (company != null && !company.trim().isEmpty())
                query.setParameter("company", company);

            if (experience != null && !experience.trim().isEmpty())
                query.setParameter("experience", experience);

            if (salary != null && !salary.trim().isEmpty())
                query.setParameter("salary", salary);

            query.setFirstResult(offset);
            query.setMaxResults(limit);

            jobs = query.list();

            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }

        return jobs;
    }

    // delete
    public boolean delete(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Query query = session.createQuery("Delete From Job Where jobId = :id");
            int result = query.setParameter("id", id).executeUpdate();
            transaction.commit();

            return result > 0;
        }
    }

    private boolean delete(Job job) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.remove(job);
            transaction.commit();
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return false;
    }
}
