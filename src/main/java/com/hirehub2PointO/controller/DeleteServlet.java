package com.hirehub2PointO.controller;

import com.hirehub2PointO.services.JobServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet {

    private JobServices jobServices = null;

    @Override
    public void init() throws ServletException {
        jobServices = new JobServices();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String jobID = req.getParameter("jobId");

        if (!jobServices.deleteJob(Integer.parseInt(jobID))) {
            req.setAttribute("deleteError", true);
        } else {
            req.setAttribute("deleteJob", true);
        }
        req.getRequestDispatcher("/viewJobServlet").forward(req, resp);

    }
}
