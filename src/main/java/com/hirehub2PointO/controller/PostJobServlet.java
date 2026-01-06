package com.hirehub2PointO.controller;

import com.hirehub2PointO.model.Job;
import com.hirehub2PointO.services.EmailServices;
import com.hirehub2PointO.services.JobServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/postJobServlet")
public class PostJobServlet extends HttpServlet {

    private JobServices jobServices;
    private EmailServices emailServices;

    @Override
    public void init() throws ServletException {
        jobServices = new JobServices();
        emailServices = new EmailServices();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String title = req.getParameter("jobTitle");
        String email = req.getParameter("email");
        String companyName = req.getParameter("companyName");
        String companyWebsite = req.getParameter("companyWebsite");
        String location = req.getParameter("location");
        String type = req.getParameter("jobType");
        String experience = req.getParameter("experience");
        String salary = req.getParameter("salaryRange");
        String skills = req.getParameter("skills");
        LocalDate lastDate = LocalDate.parse(req.getParameter("lastDate"));
        String description = req.getParameter("description");

        Job job = new Job();
        job.setTitle(title);
        job.setCompanyName(companyName);
        job.setCompanyWebsite(companyWebsite);
        job.setLocation(location);
        job.setType(type);
        job.setExperience(experience);
        job.setSalary(salary);
        job.setSkills(skills);
        job.setLastDate(lastDate);
        job.setDescription(description);

        if (jobServices.postJob(job)) {
            if (emailServices.sendNotification(email, title, companyName, location, LocalDate.now())) {
                req.setAttribute("jobPosted", true);
            } else {
                req.setAttribute("emailNotSend", true);
            }
        } else {
            req.setAttribute("jobPosted", false);
        }
        req.getRequestDispatcher("postjob.jsp").forward(req, resp);
    }
}
