<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Forgot Password | Hirehub</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=login" />
        
        <style>
            body {
                background: linear-gradient(to right, #0d6efd, #6610f2);
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            /* Centering wrapper will be added around the box in the body */
            .forgot-box {
                background: #ffffff;
                padding: 36px;
                border-radius: 12px;
                width: 100%;
                max-width: 480px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.18);
                margin: 12px;
            }

            .forgot-box h3 {
                text-align: center;
                margin-bottom: 18px;
                font-weight: 700;
                font-size: 1.25rem;
            }

            .form-control {
                height: 46px;
            }

            .btn-submit {
                width: 100%;
                font-weight: 600;
                padding: 10px 14px;
            }

            .msg {
                text-align: center;
                margin-bottom: 12px;
                font-weight: 500;
            }

            .error { color: #c92a2a; }
            .success { color: #2b8a3e; }

            .back-link { text-align: center; margin-top: 14px; }

            /* Responsive tweaks */
            @media (max-width: 576px) {
                .forgot-box { padding: 20px; border-radius: 10px; }
                .forgot-box h3 { font-size: 1.1rem; }
            }

            @media (min-width: 577px) and (max-width: 992px) {
                .forgot-box { max-width: 420px; }
            }
        </style>
        <link rel="stylesheet" href="style.css">
        
    </head>

    <body>
        <jsp:include page="header.jsp" />

        <main class="d-flex align-items-center justify-content-center" style="min-height:calc(100vh - 160px); padding:24px;">
            <div class="forgot-box">

                <h3>Forgot Password</h3>

                <c:if test="${sessionExpire}">
                    <p class="alert alert-danger" style="text-align: center;">Session expired. Please try again</p>
                    <c:remove var="sessionExpire"/>
                </c:if>

                <c:if test="${userNotExist}">
                    <p class="alert alert-danger" style="text-align: center;">User not exist! Please signup</p>
                    <c:remove var="userNotExist"/>
                </c:if>

                <c:if test="${otpNotSend}">
                    <p class="alert alert-danger" style="text-align: center;">Error sending OTP. Please try again</p>
                    <c:remove var="otpNotSend"/>
                </c:if>

                <!-- Forgot Password Form -->
                <form action="forgetPasswordServlet" method="post">
                    <div class="mb-3">
                        <label>Email Address</label>
                        <input type="email" name="email" class="form-control" placeholder="Enter your registered email" required>
                    </div>

                    <button type="submit" class="btn btn-primary btn-submit">
                        Send OTP
                    </button>
                </form>

                <div class="back-link">
                    <a href="login.jsp">← Back to Login</a>
                </div>

            </div>
        </main>

        <jsp:include page="footer.jsp" />
        
    </body>
</html>