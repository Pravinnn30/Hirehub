<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Signup | Hirehub</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            .signup-card {
                background: white;
                padding: 40px;
                border-radius: 12px;
                width: 100%;
                max-width: 420px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.2);
                margin: 40px auto;
            }

            .signup-card h3 {
                text-align: center;
                margin-bottom: 25px;
            }

            .form-control {
                font-size: 18px;
                height: 45px;
            }

            .btn-custom {
                width: 100%;
                height: 45px;
                font-weight: 600;
            }

            .msg {
                text-align: center;
                color: red;
                margin-bottom: 10px;
            }

            .success {
                color: green;
            }
        </style>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        
        <jsp:include page="header.jsp" />

        <div class="signup-card">
            <h3>Create Account</h3>
            
            <c:if test="${userAlreadyExist}">
                <p class="alert alert-danger" style="text-align: center;">User already Exist! Please login</p>
                <c:remove var="userAlreadyExist"/>
            </c:if>

            <c:if test="${sessionExpire}">
                <p class="alert alert-danger" style="text-align: center;">Session expired. Please try again</p>
                <c:remove var="sessionExpire"/>
            </c:if>

            <c:if test="${otpNotSend}">
                <p class="alert alert-danger" style="text-align: center;">Due to Network issue otp isn't send please try again</p>
                <c:remove var="otpNotSend"/>
            </c:if>

            <form action="signupServlet" method="post">
                <select name="userStatus" class="form-control mb-3">
                    <option value="user" selected>User</option>
                </select>
                <input type="text" name="name" class="form-control mb-3" placeholder="Full Name" required>
                <input type="email" name="email" class="form-control mb-3" placeholder="Email Address" required>
                <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

                <button type="submit" name="action" value="sendOtp" method="post"
                        class="btn btn-primary btn-custom">
                    Send OTP
                </button>
            </form>
            <div class="help" style="margin-top:12px; text-align: center;"><a href="login.jsp" class="text-decoration-none">← Back to Login</a></div>

        </div>

        <jsp:include page="footer.jsp" />

    </body>
</html>