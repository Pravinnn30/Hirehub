<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hirehub | Home</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                margin: 0;
                font-family: 'Poppins', sans-serif;
            }

            /* HERO SECTION */
            .hero {
                height: 120vh;
                background:
                    linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                    url("assets/welcome.png") center/cover no-repeat;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                text-align: center;
            }

            .hero-content {
                max-width: 800px;
                padding: 20px;
            }

            .hero h1 {
                font-size: 64px;
                font-weight: 700;
                letter-spacing: 2px;
            }

            .hero p {
                font-size: 20px;
                margin: 20px 0;
                opacity: 0.9;
            }

            .hero-buttons a {
                margin: 10px;
                padding: 14px 35px;
                font-size: 18px;
                border-radius: 30px;
            }

            .btn-primary {
                background-color: #0d6efd;
                border: none;
            }

            .btn-outline-light:hover {
                background-color: white;
                color: black;
            }

            /* FEATURES */
            .features {
                padding: 80px 0;
                background: #f8f9fa;
            }

            .feature-box {
                background: white;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                transition: 0.3s;
            }

            .feature-box:hover {
                transform: translateY(-8px);
            }

            .feature-box h5 {
                margin-top: 15px;
                font-weight: 600;
            }

            footer {
                background: #111;
                color: #aaa;
                text-align: center;
                padding: 15px;
            }
            @media (max-width: 992px) {
                .hero-content {
                    padding: 100px 20px 0 20px;
                }
            }
            @media (max-width: 758px) {
                .hero-content {
                    padding: 50px 20px 0 20px;
                }
            }
            @media (max-width: 542px) {
                .hero-content {
                    padding: 50px 20px 0 20px;
                }
            }
        </style>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>

        <jsp:include page="header.jsp" />

        <!-- HERO SECTION -->
        <section class="hero">
            <div class="hero-content">
                <h1>Hirehub</h1>
                <p>Your Gateway to Career Opportunities</p>

                <div class="hero-buttons">
                    
                    <c:if test="${session_user == null}">
                        <a href="login.jsp" class="btn btn-primary">Login</a>
                        <a href="signup.jsp" class="btn btn-outline-light">Get Started</a>
                    </c:if>

                    <c:if test="${session_user != null}">
                        <a href="viewJobServlet" class="btn btn-light">Browse Jobs</a>
                        <a href="postjob.jsp" class="btn btn-outline-light">Post a Job</a>
                    </c:if>
                    
                </div>
            </div>
        </section>

        <!-- FEATURES SECTION -->
        <section class="features">
            <div class="container">
                <div class="row text-center g-4">

                    <div class="col-md-4">
                        <div class="feature-box">
                            <h5>Smart Job Search</h5>
                            <p>Find jobs that perfectly match your skills and interests.</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="feature-box">
                            <h5>Skill-Based Hiring</h5>
                            <p>Get matched with companies based on real abilities.</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="feature-box">
                            <h5>Career Growth</h5>
                            <p>Advance your career with trusted employers.</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp" />

    </body>
</html>