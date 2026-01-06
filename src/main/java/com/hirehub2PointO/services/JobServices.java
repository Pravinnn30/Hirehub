package com.hirehub2PointO.services;

import com.hirehub2PointO.dao.JobDao;
import com.hirehub2PointO.model.Job;
import com.hirehub2PointO.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class JobServices {

    private final JobDao jobDao = new JobDao();

    // save job
    public boolean postJob(Job job) {
        return jobDao.save(job);
    }

    // get jobs

    public int getAllJob() {
        return jobDao.get();
    }

    public List<Job> getAllJob(int offset, int limit) {
        return jobDao.get(offset, limit);
    }

    public int getJob(String q) {
        return jobDao.get(q);
    }

    public List<Job> getJob(String q, int offset, int limit) {
        return jobDao.get(q, offset, limit);
    }

    public int getJob(String q, String location, String company, String experience, String salary) {
        return jobDao.get(q, location, company, experience, salary);
    }

    public List<Job> getJob(String q, String location, String company, String experience, String salary, int offset, int limit) {
        return jobDao.get(q, location, company, experience, salary, offset, limit);
    }

    // delete job
    public boolean deleteJob(int id){
        return jobDao.delete(id);
    }

}
