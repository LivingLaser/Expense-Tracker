<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-image: url('resources/img/admin/alogin.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
    <p class="h2 py-3 text-center text-light bg-dark">ADMINISTRATOR AUTHENTICATION</p>

    <c:if test="${adminMessage!=null}">
    <!-- alert box -->
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <c:out value="${adminMessage}"></c:out>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    </c:if>

    <div class="container d-grid gap-2 col-6 mx-auto">
        <h1 class="text-center text-light mt-5">LOGIN</h1>

        <form action="login_admin" method="post">
            <div class="mb-3 row">
                <label for="staticEmail" class="col-sm-2 col-form-label text-white">USERNAME:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="Enter Username" value="${admin.getUsername()}" required name="username">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="staticEmail" class="col-sm-2 col-form-label text-white">PASSWORD:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" placeholder="Enter Password" value="${admin.getPassword()}" required name="password">
                </div>
            </div>
            <div class="d-grid gap-2 col-6 mx-auto">
                <button type="submit" class="btn btn-primary mt-4">Login</button>
            </div>
        </form>
    </div>
</body>
</html>