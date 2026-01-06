<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>About Us | Hirehub</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
                font-family: 'Segoe UI', sans-serif;
            }

            .about-header {
                background: linear-gradient(135deg, #0d6efd, #6610f2);
                color: white;
                padding: 80px 20px;
                text-align: center;
            }

            .about-header h1 {
                font-size: 48px;
                font-weight: bold;
            }

            .about-header p {
                font-size: 18px;
                max-width: 800px;
                margin: auto;
            }

            .section {
                padding: 60px 20px;
            }

            .section h3 {
                font-weight: 700;
                margin-bottom: 20px;
            }

            .card-box {
                border-radius: 12px;
                padding: 30px;
                background: #ffffff;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                height: 100%;
            }

            .icon {
                font-size: 40px;
                color: #0d6efd;
                margin-bottom: 15px;
            }

            footer {
                background: #111;
                color: #ccc;
                text-align: center;
                padding: 15px;
            }

            /* Responsive tweaks for tablet and mobile */
            @media (max-width: 768px) {
                .about-header {
                    padding: 40px 12px;
                }

                .about-header h1 {
                    font-size: 32px;
                }

                .about-header p {
                    font-size: 16px;
                    max-width: 520px;
                }

                .section {
                    padding: 30px 12px;
                }

                .card-box {
                    padding: 20px;
                }

                .icon {
                    font-size: 34px;
                }
            }

            @media (max-width: 480px) {
                .about-header {
                    padding: 28px 10px;
                }

                .about-header h1 {
                    font-size: 24px;
                }

                .about-header p {
                    font-size: 15px;
                }

                .card-box {
                    padding: 16px;
                }

                .icon {
                    font-size: 28px;
                }
            }
        </style>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <!-- HEADER -->
        <section class="about-header">
            <h1>About Hirehub</h1>
            <p>Your trusted platform for connecting talent with opportunity.</p>
        </section>

        <!-- ABOUT COMPANY -->
        <section class="section container">
            <div class="row">
                <div class="col-md-6">
                    <h3>Who We Are</h3>
                    <p>
                        Hirehub is a modern job portal designed to bridge the gap between
                        skilled professionals and top employers. We aim to simplify
                        hiring and job searching through smart technology and user-friendly design.
                    </p>
                </div>
                <div class="col-md-6">
                    <h3>Our Mission</h3>
                    <p>
                        Our mission is to empower job seekers with opportunities and help
                        companies discover the right talent quickly and efficiently.
                    </p>
                </div>
            </div>
        </section>

        <!-- FEATURES -->
        <section class="section bg-light">
            <div class="container">
                <div class="row text-center g-4">

                    <div class="col-md-4">
                        <div class="card-box">
                            <div class="icon">🚀</div>
                            <h5>Fast Hiring</h5>
                            <p>Post jobs and find the right candidates faster than ever.</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card-box">
                            <div class="icon">🎯</div>
                            <h5>Smart Matching</h5>
                            <p>Smart recommendations based on skills and experience.</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card-box">
                            <div class="icon">🔒</div>
                            <h5>Secure Platform</h5>
                            <p>Your data is safe with industry-standard security practices.</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- WHY CHOOSE US -->
        <section class="section container">
            <h3 class="text-center mb-4">Why Choose Hirehub?</h3>
            <div class="row">
                <div class="col-md-4">
                    <ul>
                        <li>Verified employers</li>
                        <li>Real-time job updates</li>
                        <li>Easy application process</li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul>
                        <li>Modern UI & fast performance</li>
                        <li>Personalized job suggestions</li>
                        <li>Secure user accounts</li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul>
                        <li>Support for freshers & professionals</li>
                        <li>Skill-based matching</li>
                        <li>Trusted by companies</li>
                    </ul>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp" />
        
    </body>
</html>