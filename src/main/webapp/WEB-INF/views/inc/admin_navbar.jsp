<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand">
                <b>ADMINISTRATION PANEL</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i>Budget Ninja</i>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="btn btn-outline-light mx-2" href="${pageContext.request.contextPath}/admin_dashboard" role="button">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-light mx-2" href="${pageContext.request.contextPath}/admin_logout" role="button">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>