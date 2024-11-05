<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
<c:when test="${(adminLoggedIn!=null) && (adminLoggedIn)}">
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png">
    <style>
        body {
            background-image: url('resources/img/admin/adashboard.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
<!-- navbar -->
<jsp:include page="inc/admin_navbar.jsp"></jsp:include>

    <!-- cards -->
    <div class="container mt-5">
        <br><br><br>
        <div class="row">
            <div class="col-md-6">
                <div class="card py-3">
                    <div class="card-body">
                        <h4 class="card-title">User's Data</h4>
                        <p class="card-text">All the users data can be accessed from here</p>
                        <div class="text-center">
                            <a class="btn btn-primary px-5" href="${pageContext.request.contextPath}/user_list">Visit</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card py-3">
                    <div class="card-body">
                        <h4 class="card-title">Transactions</h4>
                        <p class="card-text">All income and expense records can be accessed from here</p>
                        <div class="text-center">
                            <a class="btn btn-primary px-5" href="${pageContext.request.contextPath}/record_list">Visit</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
</c:when>
<c:otherwise><jsp:include page="error/page403.jsp"></jsp:include></c:otherwise>
</c:choose>