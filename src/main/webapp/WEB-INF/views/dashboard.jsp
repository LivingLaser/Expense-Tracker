<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${(validUser!=null) && (userLoggedIn)}">
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png">
  <link rel="stylesheet" href="resources/css/dash.css">
</head>
<body>

  <!-- navbar -->
  <jsp:include page="inc/navbar.jsp"></jsp:include>

  <div class="container-fluid mt-3 top">
    <div class="leftSide">
      <div class="heading">
        <h2>Total Budget Overview</h2>
      </div>
      <div class="body">
        <div class="balance">
          <h5>Balance</h5>
          <h6><i class="fa fa-inr" aria-hidden="true"></i>${transaction.getBalance()}</h6>
        </div>
        <div class="income">
          <h5>Income</h5>
          <h6><i class="fa fa-inr" aria-hidden="true"></i>${transaction.getTotalIncome()}</h6>
        </div>
        <div class="expense">
          <h5>Expense</h5>
          <h6><i class="fa fa-inr" aria-hidden="true"></i>${transaction.getTotalExpense()}</h6>
        </div>
      </div>
    </div>
    <div class="rightSide">
      <div class="piechart">
        <canvas id="doughnut"></canvas>
      </div>
    </div>
  </div>

  <div class="container mt-4 bottom">
    <div class="upper">
      <div class="title mt-3">
        <h5 id="chart-header">${chartHeading}</h5>
      </div>
      <div class="buttons mt-2">
        <a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/dashboard_quarter">3M</a>
        <a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/dashboard_semi">6M</a>
        <a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/dashboard_annual">1Y</a>
      </div>
    </div>
    <div class="lower">
      <div class="linechart">
        <canvas id="line"></canvas>
      </div>
    </div>
  </div>
  
  <!-- footer -->
  <jsp:include page="inc/footer.jsp"></jsp:include>

  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    // Doughnut Chart
    const dChart = document.getElementById('doughnut').getContext('2d');
    var income = '${transaction.getTotalIncome()}';
    var expense = '${transaction.getTotalExpense()}';
    var savings = '${transaction.getBalance()}';
    <c:if test="${fn:contains(transaction.getBalance(), '-')}">savings = '0'</c:if>

    new Chart(dChart, {
      type: 'doughnut',
      data: {
        labels: ['Income', 'Expense', 'Savings'],
        datasets: [{
          data: [income, expense, savings],
          backgroundColor: ['rgb(65, 255, 66)', 'rgb(224, 49, 49)', 'rgb(94, 98, 255)'],
          borderWidth: 0
        }]
      },
      options: {
        maintainAspectRatio: false,
        cutout: '80%'
      }
    });


    // Line Chart
    const lChart = document.getElementById('line').getContext('2d');
    var chartLabels = [
    	<c:forEach var="label" items="${labels}">
    		'<c:out value="${label}"></c:out>',
    	</c:forEach>
    ];
    var incomeData = [
    	<c:forEach var="income" items="${incomeData.values()}">
    		'<c:out value="${income}"></c:out>',
    	</c:forEach>
    ];
    var expenseData = [
    	<c:forEach var="expense" items="${expenseData.values()}">
    		'<c:out value="${expense}"></c:out>',
    	</c:forEach>
    ];

    new Chart(lChart, {
      type: 'line',
      data: {
        labels: chartLabels,
        datasets: [{
          label: 'Income',
          data: incomeData,
          borderColor: 'rgba(82, 232, 240, 0.8)',
          backgroundColor: 'rgba(16, 99, 104, 0.8)',
          borderWidth: 2,
          pointRadius: 5
        },
        {
          label: 'Expense',
          data: expenseData,
          borderColor: 'rgba(255, 136, 177, 1)',
          backgroundColor: 'rgba(255, 136, 177, 0.2)',
          borderWidth: 2,
          pointRadius: 5
        }]
      },
      options: {
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  </script>
</body>
</html>
</c:if>