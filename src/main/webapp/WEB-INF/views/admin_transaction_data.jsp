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
    <title>Transaction Records</title>
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
            max-height: 465px;
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

    <!-- headings -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-transparent">
        <div class="container-fluid">
            <a class="navbar-brand text-dark" style="font-size: 30px;"><b>TRANSACTION RECORDS</b></a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item me-5">
                        <h2 class="text-success">
                            <i class="fa fa-arrow-up" aria-hidden="true"></i>
                            <i class="fa fa-inr" aria-hidden="true"></i>${total.getTotalIncome()}
                        </h2>
                    </li>
                    <li class="nav-item me-5">
                        <h2 class="text-danger">
                            <i class="fa fa-arrow-down" aria-hidden="true"></i>
                            <i class="fa fa-inr" aria-hidden="true"></i>${total.getTotalExpense()}
                        </h2>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- transaction records -->
    <div class="container-fluid">
        <div class="scrollable-div">
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Type</th>
                        <th scope="col">User ID</th>
                        <th scope="col">Category</th>
                        <th scope="col">Name</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">ADMIN ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="record" items="${records}">
                    <tr>
                        <th scope="row">
                        <c:choose>
                        	<c:when test="${record.getType().equals('income')}">
                        		<i class="fa fa-arrow-up fa-lg text-success" aria-hidden="true"></i>
                        	</c:when>
                        	<c:when test="${record.getType().equals('expense')}">
                        		<i class="fa fa-arrow-down fa-lg text-danger" aria-hidden="true"></i>
                        	</c:when>
                        </c:choose>
                        </th>
                        <td>${record.getUid()}</td>
                        <td><i class="${record.getIcon()} fa-2x" aria-hidden="true"></i></td>
                        <td>${record.getName()}</td>
                        <td><i class="fa fa-inr" aria-hidden="true"></i>${record.getAmount()}</td>
                        <td>${record.getDate()}</td>
                        <td>${record.getTime()}</td>
                        <td>
                            <form action="delete_transaction" method="post">
                                <input type="hidden" value="${record.getUid()}" name="uid">
                                <input type="hidden" value="${record.getType()}" name="type">
                                <input type="hidden" value="${record.getOldDate()}" name="date">
                                <input type="hidden" value="${record.getTime()}" name="time">
                                <input type="submit" value="Delete" class="btn btn-danger" onclick="return confirm('Are you sure ?')">
                            </form>
                        </td>
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