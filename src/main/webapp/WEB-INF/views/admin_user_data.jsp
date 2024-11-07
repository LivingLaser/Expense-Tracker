<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
<c:when test="${(adminLoggedIn!=null) && (adminLoggedIn)}">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png">
    <style>
        .table {
            border: 3px;
        }

        .table tr th {
            text-align: center;
            text-decoration: none;
        }

        .table tr td {
            text-align: center;
        }

        .scrollable-div {
            overflow-y: scroll;
            max-height: 490px;
        }

        .scrollable-div thead {
            position: sticky;
            top: 0;
            z-index: 1;
        }
    </style>
</head>
<body>
    <!-- navbar -->
    <jsp:include page="inc/admin_navbar.jsp"></jsp:include>

    <p class="text-center h2">USERS DATA</p>
    <div class="container-fluid">
        <div class="scrollable-div">
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Sl. No.</th>
                        <th scope="col">User ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Password</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="row" value="0"></c:set>
                <c:forEach var="user" items="${users}">
                    <c:set var="row" value="${row+1}"></c:set>
                    <tr>
                        <th scope="row">${row}</th>
                        <td>${user.getUid()}</td>
                        <td>${user.getName()}</td>
                        <td>${user.getEmail()}</td>
                        <td>${user.getPhone()}</td>
                        <td>${user.getPassword()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
</c:when>
<c:otherwise><jsp:include page="error/page403.jsp"></jsp:include></c:otherwise>
</c:choose>