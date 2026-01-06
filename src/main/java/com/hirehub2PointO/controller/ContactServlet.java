package com.hirehub2PointO.controller;

import com.hirehub2PointO.services.EmailServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/contactServlet")
public class ContactServlet extends HttpServlet {

    private EmailServices emailServices;

    @Override
    public void init() throws ServletException {
        emailServices = new EmailServices();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        if (emailServices.sendFeedback(name, email, subject, message)) {
            req.setAttribute("feedbackSend", true);
        } else {
            req.setAttribute("notFeedbackSend", true);
        }

        req.getRequestDispatcher("contectus.jsp").forward(req, resp);
    }
}
