package com.hirehub2PointO.controller;

import com.hirehub2PointO.model.Job;
import com.hirehub2PointO.services.JobServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewJobServlet")
public class ViewJobServlet extends HttpServlet {

    private JobServices jobServices;

    @Override
    public void init() throws ServletException {
        jobServices = new JobServices();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String q = req.getParameter("q");
        String location = req.getParameter("location");
        String company = req.getParameter("company");
        String experience = req.getParameter("experience");
        String salaryRange = req.getParameter("salaryRange");
        String jobSearch = req.getParameter("jobSearch");

        int page = 1;
        final int PAGE_SIZE = 6;

        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        int offset = (page - 1) * PAGE_SIZE;

        List<Job> jobs = null;
        int totalJobs = 0;

        if (q == null && location == null && company == null && experience == null && salaryRange == null && jobSearch == null) {
            jobs = jobServices.getAllJob(offset, PAGE_SIZE);
            totalJobs = jobServices.getAllJob();
        } else if (jobSearch != null) {
            jobs = jobServices.getJob(jobSearch, offset, PAGE_SIZE);
            totalJobs = jobServices.getJob(jobSearch);
        } else {
            jobs = jobServices.getJob(q, location, company, experience, salaryRange, offset, PAGE_SIZE);
            totalJobs = jobServices.getJob(q, location, company, experience, salaryRange);
        }

        HttpSession session = req.getSession();

        if (jobs == null || jobs.isEmpty()) {
            session.setAttribute("noJob", true);
        } else {
            int totalPages = (int) Math.ceil((double) totalJobs / PAGE_SIZE);
            session.setAttribute("jobSearch", jobSearch);
            session.setAttribute("jobs", jobs);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
        }

        req.getRequestDispatcher("viewJob.jsp").forward(req, resp);
    }
}
