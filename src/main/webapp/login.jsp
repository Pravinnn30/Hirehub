<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | Hirehub</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=login" />
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        
        <jsp:include page="header.jsp" />

        <div class="login-card">
            <h3>Login to Hirehub and GetHired</h3>

            <c:if test="${userNotExist}">
                <p class="alert alert-danger" style="text-align: center;">Either Password is incorrect Or User not exist</p>
                <c:remove var="userNotExist"/>
            </c:if>

            <c:if test="${passwordUpdated}">
                <p class="alert alert-success" style="text-align: center;">Password change successfully</p>
                <c:remove var="passwordUpdated"/>
            </c:if>

            <c:if test="${error}">
                <p class="alert alert-danger" style=" text-align: center;">Password Not changed</p>
                <c:remove var="error"/>
            </c:if>

            <c:if test="${signupSuccess}">
                <p class="alert alert-success" style="text-align: center;">You have signin. Now Please login to Continue</p>
                <c:remove var="signupSuccess"/>
            </c:if>
            
            <form action="login" method="post">
                <div class="mb-3">
                    <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                </div>
                <div class="mb-3">
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-login">Login</button>
            </form>

            <div class="extra-links">
                <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
                <p><a href="forgotPassword.jsp">Forgot Password?</a></p>
            </div>

        </div>

        <jsp:include page="footer.jsp" />

    </body>
</html>