<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:if test="${session_user.userStatus.equals('admin')}">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Post Job | Hirehub</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background-color: #f5f7fa;
            }

            .job-form-container {
                max-width: 800px;
                margin: 40px auto;
                background: white;
                padding: 35px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }

            .job-form-container h3 {
                text-align: center;
                margin-bottom: 25px;
            }

            label {
                font-weight: 600;
            }

            .btn-submit {
                width: 100%;
                font-weight: 600;
            }
        </style>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <jsp:include page="header.jsp" />

        <div class="job-form-container">

            <c:if test="${jobPosted}">
                <p class="alert alert-success" style="text-align: center;">Job posted successfully!</p>
                <c:remove var="jobPosted"/>
            </c:if>

            <c:if test="${jobPosted != null && !jobPosted}">
                <p class="alert alert-danger" style="text-align: center;">Due to error. Job not posted!</p>
                <c:remove var="jobPosted"/>
            </c:if>

            <c:if test="${emailNotSend}">
                <p class="alert alert-danger" style="text-align: center;">Email isn't not send Requester</p>
                <c:remove var="jobPosted"/>
            </c:if>

            <c:if test="${notificationNotSend}">
                <p class="alert alert-danger" style="text-align: center;">Notification isn't not send Requester</p>
                <c:remove var="jobPosted"/>
            </c:if>

            <h3>Post a New Job</h3>

            <!-- FORM START -->
            <form action="postJobServlet" method="post">

                <!-- Job Title -->
                <div class="mb-3">
                    <label>Job Title</label>
                    <input type="text" name="jobTitle" class="form-control" required>
                </div>

                <!-- email of person who request to post a job -->
                <div class="mb-3">
                    <label>Email of Request</label>
                    <input type="text" name="email" class="form-control" required>
                </div>

                <!-- Company Name -->
                <div class="mb-3">
                    <label>Company Name</label>
                    <input type="text" name="companyName" class="form-control" required>
                </div>

                <!-- Company Website -->
                <div class="mb-3">
                    <label>Company Website</label>
                    <input type="url" name="companyWebsite" class="form-control" 
                        placeholder="https://company.com" required>
                </div>

                <!-- Job Location -->
                <div class="mb-3">
                    <label>Job Location</label>
                    <input type="text" name="location" class="form-control" required>
                </div>

                <!-- Job Type -->
                <div class="mb-3">
                    <label>Job Type</label>
                    <select name="jobType" class="form-select" required>
                        <option value="">Select</option>
                        <option>Full-Time</option>
                        <option>Part-Time</option>
                        <option>Internship</option>
                        <option>Contract</option>
                    </select>
                </div>

                <!-- Experience -->
                <div class="mb-3">
                    <label>Experience Required</label>
                    <select name="experience" class="form-select" required>
                        <option value="">Select</option>
                        <option>Fresher</option>
                        <option>1-2 Years</option>
                        <option>2-5 Years</option>
                        <option>5+ Years</option>
                    </select>
                </div>

                <!-- Salary -->
                <div class="mb-3">
                    <label>Salary (Optional)</label>
                    <select name="salaryRange" class="form-select">
                        <option value="Not Specified">Not specified</option>
                        <option value="0-3" >0-3 LPA</option>
                        <option value="3-6" >3-6 LPA</option>
                        <option value="6-12" >6-12 LPA</option>
                        <option value="12+" >12+ LPA</option>
                    </select>
                </div>

                <!-- Skills -->
                <div class="mb-3">
                    <label>Required Skills</label>
                    <input type="text" name="skills" class="form-control"
                        placeholder="Java, Spring Boot, MySQL">
                </div>

                <!-- Last date -->
                <div class="mb-3">
                    <label>Last date</label>
                    <input type="date" name="lastDate" class="form-control" required>
                </div>

                <!-- Job Description -->
                <div class="mb-3">
                    <label>Job Description</label>
                    <textarea name="description" rows="5" class="form-control message" maxlength="999" required></textarea>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary btn-submit">Post Job</button>

            </form>

        </div>
        <jsp:include page="footer.jsp" />
    </body>
    </html>
</c:if>
<c:if test="${session_user == null}">
    <c:redirect url="home.jsp"/>
</c:if>