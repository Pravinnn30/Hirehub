<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Contact Us | HireMe</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="icon" href="./assets/icon3.png">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: #f5f7fa;
                font-family: 'Segoe UI', sans-serif;
            }

            .contact-header {
                background: linear-gradient(135deg, #0d6efd, #6610f2);
                color: white;
                padding: 70px 20px;
                text-align: center;
            }

            .contact-header h1 {
                font-weight: bold;
            }

            .contact-box {
                background: white;
                border-radius: 12px;
                padding: 30px;
                box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            }

            .info-box {
                background: #f8f9fa;
                border-radius: 12px;
                padding: 20px;
                height: 100%;
            }

            .info-box h5 {
                font-weight: 600;
            }

            footer {
                background: #111;
                color: #ccc;
                padding: 15px;
                text-align: center;
                margin-top: 50px;
            }
        </style>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <jsp:include page="header.jsp" />

        <!-- HEADER -->
        <section class="contact-header">
            <h1>Contact Us</h1>
            <p>We’d love to hear from you. Get in touch anytime!</p>
            <p>If you want to Post any job please mension the full detail about Job and requirement for Job role in Message box!</p>
        </section>

        <!-- CONTACT SECTION -->
        <section class="container my-5">
            <div class="row g-4">

                <!-- Contact Form -->
                <div class="col-lg-7 col-md-12">
                    <div class="contact-box">
                        <h4 class="mb-4">Send Us a Message</h4>

                        <c:if test="${feedbackSend}">
                            <div class="alert alert-success" role="alert">
                                Thank you for your feedback! We will get back to you soon.
                            </div>
                            <c:remove var="feedbackSend"/>
                        </c:if>
                        <c:if test="${notFeedbackSend}">
                            <div class="alert alert-danger" role="alert">
                                Due to technical glich feedback isn't send. Please try after some time.
                            </div>
                            <c:remove var="feedbackSend"/>
                        </c:if>
                        <form action="contactServlet" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email Address</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Subject</label>
                                <input type="text" name="subject" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Message</label>
                                <textarea name="message" rows="5" class="form-control message" required></textarea>
                            </div>

                            <button class="btn btn-primary w-100" type="submit">
                                Send Message
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Contact Info -->
                <div class="col-lg-5 col-md-12">
                    <div class="info-box">
                        <h5>Contact Information</h5>
                        <p><b>Email:</b> support@hireme.com</p>
                        <p><b>Phone:</b> +91 98765 43210</p>
                        <p><b>Location:</b> Palwal, India</p>

                        <hr>

                        <h6>Working Hours</h6>
                        <p>Mon – Fri: 9:00 AM – 6:00 PM</p>

                        <h6>Follow Us</h6>
                        <p>
                            <a href="https://www.linkedin.com/in/pravin-355174370/" target="_blank" class="me-2">LinkedIn</a> |
                            <a href="#" class="me-2">Twitter</a> |
                            <a href="#">Instagram</a>
                        </p>
                    </div>
                </div>

            </div>
        </section>

        <jsp:include page="footer.jsp" />

    </body>
</html>
