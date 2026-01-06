<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hirehub</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=login" />
        <link rel="stylesheet" href="style.css">
    </head>

    <body>

        <jsp:include page="header.jsp" />

        <section class="hero-section">
            <h1>Find Your Dream Job Today</h1>
            <p>
                Hirehub connects talented professionals with top companies.
                Explore thousands of job opportunities and take your career to the next level.
            </p>

            <div class="hero-buttons">
                <a href="viewJobServlet" class="btn btn-light">Browse Jobs</a>
                
                <c:set var="session_user" value="${session_user}"/>
                <c:if test="${session_user != null && session_user.getUserStatus().equals('admin')}">
                    <a href="postjob.jsp" class="btn btn-outline-light">Post a Job</a>
                </c:if>
            </div>
        </section>

        <section class="features">
            <div class="container">
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="feature-box">
                            <h4>✔ Verified Jobs</h4>
                            <p>All jobs are verified by our team to ensure authenticity.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-box">
                            <h4>✔ Easy Apply</h4>
                            <p>Upload Resume and Apply to jobs with a single click using your profile.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-box">
                            <h4>✔ Career Growth</h4>
                            <p>Find opportunities that help you grow professionally.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp" />

    </body>
</html>