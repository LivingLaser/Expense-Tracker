<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Sign Up</title>
    <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png">
    <link rel="stylesheet" href="resources/css/login_signup.css">
</head>
<body>
    <br><br>

    <div class="cont">

        <div class="form sign-in">
            <!-- Centered Logo -->
            <img src="resources/img/logo/BUDGET.png" alt="Logo" class="logo">
            <h2>Welcome</h2>
            <form action="login" method="post">
                <label>
                    <span>Email</span>
                    <input type="email" value="${userPassed.getEmail()}" required name="email">
                </label>
                <label>
                    <span>Password</span>
                    <input type="password" value="${userPassed.getPassword()}" required name="password">
                </label>

                <button type="submit" class="submit" >Log In</button>
            </form>

            <c:if test="${loginMessage!=null}">
                <span style="color: red;">${loginMessage}</span>
            </c:if>

        </div>
        <div class="sub-cont">
            <!-- Centered Logo -->
            <img src="resources/img/logo/BUDGET.png" alt="Logo" class="logo">
            <div class="img">
                <div class="img__text m--up">

                    <h3>Don't have an account? Please Sign up!</h3>

                    <c:if test="${signupMessage!=null}">
                        <h4 style="padding-top: 100px; color: ${color};">${signupMessage}</h4>
                    </c:if>
                    
                    <c:if test="${accountMessage!=null}">
                        <h4 style="padding-top: 100px; color: chartreuse;">${accountMessage} 
                        <a href="${pageContext.request.contextPath}/" style="color: chartreuse">Go to Home.</a></h4>
                    </c:if>
                </div>
                <div class="img__text m--in">

                    <h3>If you already have an account, just Login.</h3>
                </div>
                <div class="img__btn">
                    <span class="m--up">Sign Up</span>
                    <span class="m--in">Log In</span>
                </div>
            </div>
            <div class="form sign-up">
                <h2>Create your Account</h2>
                <form action="signup" method="post">
                    <label>
                        <span>Name</span>
                        <input type="text" value="${userData.getName()}" required name="name">
                        
                        <div id="name-error" class="error-message">Only letters and spaces are allowed</div>
                    </label>
                    <label>
                        <span>Email</span>
                        <input type="email" value="${userData.getEmail()}" required name="email">
                        <div id="signup-email-error" class="error-message">Invalid email</div>
                    </label>
                    <label>
                        <span>Phone No</span>
                        <input type="text" title="Give a valid 10 digit phone no." pattern="[6-9]{1}[0-9]{9}" value="${userData.getPhone()}" required name="phone">
                    </label>
                    <label>
                        <span>Password</span>
                        <input type="password" id="password" value="${userData.getPassword()}" required name="password">
                    </label>
                    <label>
                        <span>Confirm Password</span>
                        <input type="password" id="confirmPassword" required>
                    </label>
                    <span id="error-message" style="color: red; display: none;">Passwords do not match!</span>

                    <button type="submit" class="submit" id="signupButton" disabled>Sign Up</button>
                </form>

            </div>
        </div>
    </div>

    <script src="resources/js/login_signup.js"></script>
</body>
</html>