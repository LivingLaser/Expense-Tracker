<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Expense</title>
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
        		Expense : <i class="fa fa-inr" aria-hidden="true"></i>${totalExpense.getTotalExpense()}
        	</a>
        </li>
      </ul>
    </header>
  </section>

  <!-- form -->
  <div class="body">
    <section class="form">
      <div class="container">
      	<!-- alert box -->
      	<c:if test="${recordMessage!=null}">
    	<div class="alert alert-danger alert-dismissible fade show" role="alert">
        	<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
        	<c:out value="${recordMessage}"></c:out>
        	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    	</div>
    	</c:if>
        <form class="row g-3" action="insert_record" method="post">
          <div class="col-md-6">
            <label for="inputEmail4" class="form-label">Name</label>
            <input type="text" class="form-control" value="${invalidRecord.getName()}" name="name" required>
          </div>
          <div class="col-md-6">
            <label for="inputPassword4" class="form-label">Amount</label>
            <input type="text" class="form-control" value="${invalidRecord.getAmount()}" name="amount" required>
          </div>
          <div class="col-12">
            <label for="inputAddress2" class="form-label">Enter Date</label>
            <input type="date" class="form-control pt-1" id="validDate" value="${invalidRecord.getDate()}" style="padding-top: 0%;" name="date" required>
          </div>

          <div class="col-md-6">
            <label for="inputState" class="form-label" style="padding-bottom: 0%;">Category</label>
            <select id="inputState" class="form-select" style="padding: 2%;padding-top: 0%;" name="icon" required>
              <option selected>--Select--</option>
              <option <c:if test="${invalidRecord.getIcon().equals('fa fa-shopping-bag')}">selected</c:if> value="fa fa-shopping-bag">Shopping</option>
              <option <c:if test="${invalidRecord.getIcon().equals('fa fa-plane')}">selected</c:if> value="fa fa-plane">Travel</option>
              <option <c:if test="${invalidRecord.getIcon().equals('fa fa-file-text')}">selected</c:if> value="fa fa-file-text">Bill Payment</option>
              <option <c:if test="${invalidRecord.getIcon().equals('fa fa-cutlery')}">selected</c:if> value="fa fa-cutlery">Beverage</option>
              <option <c:if test="${invalidRecord.getIcon().equals('fa fa-btc')}">selected</c:if> value="fa fa-btc">Crypto</option>
              <option <c:if test="${invalidRecord.getIcon().equals('fa fa-credit-card-alt')}">selected</c:if> value="fa fa-credit-card-alt">Others</option>
            </select>
          </div>
          
          <input type="hidden" value="${validUser.getUid()}" name="uid">
          <input type="hidden" value="expense" name="type">
          
          <div class="col-md-4 mt-5 ms-5">
            <button type="submit" class="btn btn-primary" style="background-color: blueviolet;">
              <i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add
            </button>
          </div>
        </form>
      </div>
    </section>

    <div class="scrollbar">
      <div class="side">
        <c:set var="row" value="0"></c:set>
        <c:forEach var="expense" items="${expenseList}">
        <c:set var="row" value="${row+1}"></c:set>
        <section class="inside">
          <div>
            <ol class="breadcrumb p-3 bg-body-tertiary rounded-3">
              <a class="breadcrumb-item">
                <a class="link-body-emphasis">
                  <i class="${expense.getIcon()} fa-2x" aria-hidden="true"></i>
                </a>
              </a>
              <a class="breadcrumb-item">
                <ul>
                	<a class="link-body-emphasis fw-semibold text-decoration-none">${expense.getName()}</a>
                </ul>
                <!-- money -->
                <ul style="font-size: large;">
                  <i class="fa fa-inr" aria-hidden="true"></i> <c:out value="${expense.getAmount()}"></c:out>
                </ul>

                <br>
                <!-- date -->
                <ul>
                  <i class="fa fa-calendar-check-o" aria-hidden="true"></i> <c:out value="${expense.getDate()}"></c:out>
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
	              	<input type="hidden" value="${expense.getUid()}" name="uid">
	              	<input type="hidden" value="${expense.getType()}" name="type">
	              	<input type="hidden" value="${expense.getOldDate()}" name="date">
	              	<input type="hidden" value="${expense.getTime()}" name="time">
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
  <c:forEach var="record" items="${expenseList}">
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
              <label for="exampleFormControlInput1" class="form-label">Name</label>
              <input type="text" class="form-control" id="exampleFormControlInput1" value="${record.getName()}" name="name">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Amount</label>
              <input type="text" class="form-control" id="exampleFormControlInput1" value="${record.getAmount()}" name="amount">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Enter Date</label>
              <input type="date" class="form-control" id="updateDate_${row}" value="${record.getOldDate()}" name="date">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Category</label>
	          <select class="form-control" id="exampleFormControlInput1" name="icon">
	              <option selected>--Select--</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-shopping-bag')}">selected</c:if> value="fa fa-shopping-bag">Shopping</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-plane')}">selected</c:if> value="fa fa-plane">Travel</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-file-text')}">selected</c:if> value="fa fa-file-text">Bill Payment</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-cutlery')}">selected</c:if> value="fa fa-cutlery">Beverage</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-btc')}">selected</c:if> value="fa fa-btc">Crypto</option>
	              <option <c:if test="${record.getIcon().equals('fa fa-credit-card-alt')}">selected</c:if> value="fa fa-credit-card-alt">Others</option>
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
  <!-- date validation -->
  <script>
  	var updateDate = document.getElementById('updateDate_${row}');
  	
  	// Get today's date
  	var updateToday = new Date();
  	var updateTodayDate = updateToday.toISOString().split("T")[0]; // Formatted as YYYY-MM-DD
  	
  	// Calculate date 10 years ago
  	var updatePast = new Date();
  	updatePast.setFullYear(updateToday.getFullYear() - 10);
  	var updatePastDate = updatePast.toISOString().split("T")[0]; // Formatted as YYYY-MM-DD
  	
  	// Set the max min date attributes
  	updateDate.max = updateTodayDate;
  	updateDate.min = updatePastDate;
  </script>
  </c:forEach>

  <!-- footer -->
  <jsp:include page="inc/footer.jsp"></jsp:include>
  
  <script src="resources/js/transaction.js"></script>
</body>
</html>