<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- navbar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary mt-3 rounded-5" data-bs-theme="dark">
    <div class="container-fluid">
      <a class="navbar-brand fw-bold fs-4" href="${pageContext.request.contextPath}/">
        <img src="resources/img/logo/BUDGET.png" class="rounded-5" height="50" width="50" alt="logo"> Budget Ninja
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ps-5">
          <li class="nav-item">
            <a class="nav-link active" href="${pageContext.request.contextPath}/" style="color: rgb(185, 109, 255);">
                <i class="fa fa-home fa-lg" aria-hidden="true"></i> Home
            </a>
          </li>
          <c:if test="${(validUser!=null) && (userLoggedIn)}">
          <li class="nav-item ps-3">
            <a class="nav-link active" href="${pageContext.request.contextPath}/dashboard_quarter" style="color: rgb(185, 109, 255);">
                <i class="fa fa-tachometer fa-lg" aria-hidden="true"></i> Dashboard
            </a>
          </li>
          <li class="nav-item ps-3">
            <a class="nav-link active" aria-disabled="true" href="${pageContext.request.contextPath}/incomes" style="color: rgb(185, 109, 255);">
                <i class="fa fa-arrow-up fa-lg" aria-hidden="true"></i> Income
            </a>
          </li>
          <li class="nav-item ps-3">
            <a class="nav-link active" aria-disabled="true" href="${pageContext.request.contextPath}/expenses" style="color: rgb(185, 109, 255);">
                <i class="fa fa-arrow-down fa-lg" aria-hidden="true"></i> Expense
            </a>
          </li>
          </c:if>
          <li class="nav-item ps-3">
            <a class="nav-link active" aria-disabled="true" href="${pageContext.request.contextPath}/faq" style="color: rgb(185, 109, 255);">
                <i class="fa fa-question-circle fa-lg" aria-hidden="true"></i> FAQs
            </a>
          </li>
          <li class="nav-item ps-3">
            <a class="nav-link active" aria-disabled="true" href="${pageContext.request.contextPath}/about" style="color: rgb(185, 109, 255);">
                <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> About Us
            </a>
          </li>
        </ul>
        <ul class="d-flex navbar-nav">
            <li class="nav-item dropdown pe-5">
                <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: rgb(185, 109, 255);">
                    <i class="fa fa-cog fa-spin fa-lg" aria-hidden="true"></i> Settings
                </a>

                <ul class="dropdown-menu">
                    <c:if test="${!((validUser!=null) && (userLoggedIn))}">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/register">Login / Sign-up</a></li>
                    </c:if>
                    <c:if test="${(validUser!=null) && (userLoggedIn)}">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user_logout">Logout</a></li>
                    </c:if>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin_login">ADMIN</a></li>
                </ul>
            </li>
            <c:if test="${(validUser!=null) && (userLoggedIn)}">
            <li class="nav-item">
              <button class="nav-link active" aria-disabled="true" data-bs-toggle="modal" data-bs-target="#profileModal">
                  <i class="fa fa-user-circle-o fa-lg" aria-hidden="true" style="color: rgb(185, 109, 255);"></i> ${validUser.getName()}
              </button>
            </li>
            </c:if>
        </ul>
      </div>
    </div>
  </nav>

  <!-- modal for profile page -->
  <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Profile</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid" style="text-align: center;">
            <i class="fa fa-user-circle-o fa-5x" aria-hidden="true"></i>
            <h2>${validUser.getName()}</h2>
          </div>
          <div class="container-fluid pt-5">
            <h5 class="ps-3">Email: ${validUser.getEmail()}</h5>
            <h5 class="ps-3">Phone: ${validUser.getPhone()}</h5>
            <h5 class="ps-3">Password: ${validUser.getPassword()}</h5>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#updateModal">Edit Profile</button>
        </div>
      </div>
    </div>
  </div>

  <!-- modal for update page -->
  <div class="modal fade" id="updateModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Update Profile</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="update_user" method="post">
        <div class="modal-body">
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Name</label>
            <input type="text" class="form-control" placeholder="Name" value="${validUser.getName()}" name="name">
          </div>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Email</label>
            <input type="email" class="form-control" placeholder="Email" value="${validUser.getEmail()}" name="email">
          </div>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Phone</label>
            <input type="text" class="form-control" placeholder="Phone" value="${validUser.getPhone()}" name="phone">
          </div>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Password</label>
            <input type="password" class="form-control" placeholder="Password" value="${validUser.getPassword()}" name="password">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <input type="hidden" value="${validUser.getUid()}" name="uid">
          <button type="submit" class="btn btn-outline-light">Update</button>
        </div>
        </form>
      </div>
    </div>
  </div>