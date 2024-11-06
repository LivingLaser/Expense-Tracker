<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${(validUser!=null) && (userLoggedIn)}">
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Income</title>
  <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png">
  <link rel="stylesheet" href="resources/css/transaction.css">
</head>
<body>
  <!-- navbar -->
  <jsp:include page="inc/navbar.jsp"></jsp:include>
  
  <!-- income block -->
  <section>
    <header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item">
        	<a class="nav-link" style="font-size: xx-large; color: blueviolet;">
        		Income : <i class="fa fa-inr" aria-hidden="true"></i>${totalIncome.getTotalIncome()}
        	</a>
        </li>
      </ul>
    </header>
  </section>

  <!-- form -->
  <div class="body">
    <section class="form">
      <div class="container">

        <form class="row g-3" action="insert_record" method="post">
          <div class="col-md-6">
            <label for="inputEmail4" class="form-label">Title</label>
            <input type="text" class="form-control" id="inputEmail4" name="name" required>
          </div>
          <div class="col-md-6">
            <label for="inputPassword4" class="form-label">Amount</label>
            <input type="text" class="form-control" id="inputPassword4" name="amount" required>
          </div>
          <div class="col-12">
            <label for="inputAddress2" class="form-label">Enter Date</label>
            <input type="date" class="form-control pt-1" id="validDate" style="padding-top: 0%;" name="date" required>
          </div>

          <div class="col-md-6">
            <label for="inputState" class="form-label" style="padding-bottom: 0%;">Option</label>
            <select id="inputState" class="form-select" style="padding: 2%;padding-top: 0%;" name="icon" required>
              <option selected>--Select--</option>
              <option value="fa fa-briefcase">Salary</option>
              <option value="fa fa-money">Freelance</option>
              <option value="fa fa-line-chart">Treading</option>
              <option value="fa fa-building">Bussiness</option>
              <option value="fa fa-gamepad">Gaming</option>
              <option value="fa fa-globe">Others</option>
            </select>
          </div>
          
          <input type="hidden" value="${validUser.getUid()}" name="uid">
          <input type="hidden" value="income" name="type">
          
          <div class="col-md-4 mt-5 ms-5">
            <button type="submit" class="btn btn-primary" style="background-color: blueviolet;">
              <i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add
            </button>
          </div>
        </form>
      </div>
    </section>

    <div class="scrollbar">
      <div class="side ">
        <c:set var="row" value="0"></c:set>
        <c:forEach var="income" items="${incomeList}">
        <c:set var="row" value="${row+1}"></c:set>
        <section class="inside">
          <div>
            <ol class="breadcrumb p-3 bg-body-tertiary rounded-3">
              <a class="breadcrumb-item">
                <a class="link-body-emphasis">
                  <i class="${income.getIcon()} fa-2x" aria-hidden="true"></i>
                </a>
              </a>
              <a class="breadcrumb-item">
                <ul>
                	<a class="link-body-emphasis fw-semibold text-decoration-none">${income.getName()}</a>
                </ul>
                <!-- money -->
                <ul style="font-size: large;">
                  <i class="fa fa-inr" aria-hidden="true"></i> <c:out value="${income.getAmount()}"></c:out>
                </ul>

                <br>
                <!-- date -->
                <ul>
                  <i class="fa fa-calendar-check-o" aria-hidden="true"></i> <c:out value="${income.getDate()}"></c:out>
                </ul>
              </a>
              <!-- edit -->
              <ul>
	            <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#updateRecord_${row}">
	               <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
	            </button>
              </ul>
              <!-- delete -->
              <ul>
              	<form action="delete_record" method="post">
	              	<input type="hidden" value="${income.getUid()}" name="uid">
	              	<input type="hidden" value="${income.getType()}" name="type">
	              	<input type="hidden" value="${income.getOldDate()}" name="date">
	              	<input type="hidden" value="${income.getTime()}" name="time">
	              	<button type="submit" class="btn btn-dark">
	                  <i class="fa fa-trash" aria-hidden="true"></i> Delete
	                </button>
                </form>
              </ul>
            </ol>
          </div>
        </section>
        </c:forEach>
      </div>
    </div>
  </div>
  
  <c:set var="row" value="0"></c:set>
  <c:forEach var="record" items="${incomeList}">
  <c:set var="row" value="${row+1}"></c:set>
  <!-- modal for update record -->
  <div class="modal fade" id="updateRecord_${row}" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Update Record</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="update_record" method="post">
          <div class="modal-body">
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Title</label>
              <input type="text" class="form-control" id="exampleFormControlInput1" value="${record.getName()}" name="name">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Amount</label>
              <input type="text" class="form-control" id="exampleFormControlInput1" value="${record.getAmount()}" name="amount">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Date</label>
              <input type="date" class="form-control" id="exampleFormControlInput1" value="${record.getOldDate()}" name="date">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Option</label>
	          <select class="form-control" id="exampleFormControlInput1" name="icon">
	              <option selected>--Select--</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-briefcase')}">selected</c:if> value="fa fa-briefcase">Salary</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-money')}">selected</c:if> value="fa fa-money">Freelance</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-line-chart')}">selected</c:if> value="fa fa-line-chart">Treading</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-building')}">selected</c:if> value="fa fa-building">Bussiness</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-gamepad')}">selected</c:if> value="fa fa-gamepad">Gaming</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-globe')}">selected</c:if> value="fa fa-globe">Others</option>
              </select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <input type="hidden" value="${record.getUid()}" name="uid">
            <input type="hidden" value="${record.getType()}" name="type">
            <input type="hidden" value="${record.getOldDate()}" name="oldDate">
            <input type="hidden" value="${record.getTime()}" name="time">
            <button type="submit" class="btn btn-outline-light">Update</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  </c:forEach>

  <!-- footer -->
  <jsp:include page="inc/footer.jsp"></jsp:include>
  
  <script src="resources/js/transaction.js"></script>
</body>
</html>
</c:if>