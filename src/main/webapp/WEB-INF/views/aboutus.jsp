<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png">
    <link rel="stylesheet" href="resources/css/about.css">
</head>
<body>
<!-- navbar -->
<jsp:include page="inc/navbar.jsp"></jsp:include>

<!-- c -->
<hr class="featurette-divider ">
 <div class="container ">
      <div class="row featurette colj ">
        <div class="col-md-7">
            <div class="txt"></div>
          <p class="featurette-heading fw-normal lh1" style=" padding:2rem 1rem 1rem 15rem; font-size: xxx-large; font-weight: bold;">About us<span class="text-body-secondary "> </span></p>
          <h2 class="lead" style=" padding:1rem 1rem 3rem 9rem;">Simplifying Expense Tracking for a Stress-Free Life
          </h2>
          <p style=" justify-content: center; padding-left: 3rem;">"At Budget Ninja, we believe that managing expenses shouldn't be a hassle. Our mission is to provide a simple, secure, and intuitive platform to help individuals and businesses track their expenses, stay organized, and achieve financial clarity." 
        </p>
        </div>
        <div class="col-md-5">
          <img src="resources/img/about/about base.jpg" alt="" height="400" width="400" style="border-radius: 100% ; padding: 1rem 1rem 1rem 5rem;">
        </div>
      </div>
    </div>


<div class="para" style="padding-left: 33rem ; font-size: xx-large;
font-weight: bolder;">
    <p class="ftr" style="padding-bottom: 2rem; padding-top: 2rem;"> Our Features
    </p>
</div>

<!-- features -->
 <div>
<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <img src="resources/img/about/about1.jpg" alt=""  height="140" width="140" style="border-radius: 50%;">
        <h2 class="fw-normal" style="color: rgb(205, 125, 230);">Easy expense tracking
        </h2>
        <p>With easy expense tracking, automatically log receipts, set budgets, and receive alerts, making financial organization effortless and stress-free.</p>
        
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="resources/img/about/about2.jpg" alt="" height="140" width="140" style="border-radius: 50%;">
        <h2 class="fw-normal" style="color: rgb(205, 125, 230);">Investment tracking
        </h2>
        <p>By tracking your investments, you can stay on top of market fluctuations, identify trends, and adjust your portfolio to achieve your long-term financial goals.</p>
        
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
       <img src="resources/img/about/about3.jpg" alt="" height="140" width="140" style="border-radius: 50%;">
        <h2 class="fw-normal" style="color: rgb(205, 125, 230);">Automated budgeting
        </h2>
        <p>
            With automated budgeting, track expenses, set financial goals, and receive alerts, freeing you from manual calculations and enabling informed financial decisions.
            </p>
        
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
</div>
 </div>
 <!-- team -->
 <hr class="featurette-divider ">
 <div class="container">
  <div class="team">
   
 <div class="row featurette">
    <div class="col-md-7 order-md-2">
      <p class="featurette-heading fw-normal lh-1" style="font-size: xx-large; padding: 1rem 3rem 1rem 2rem;" >Our Team</p>
      <p class="lead">Our team is a dynamic and talented group of individuals united by a shared vision to revolutionize financial management.</p>
    <div style="padding-left: 4rem; padding-top: 2rem; padding-bottom: 3rem;">
      <p style="font-size: x-large;">Our team Members</p>
      <ul>
        <li>-Bishwadeep Khanra</li>
        <li>-Sayanika Dey</li>
        <li>-Sayantan Das</li>
        <li>-Sayantan Das</li>
        <li>-Tiyasha Ghosh</li>
      </ul>
    </div>

    </div>
    <div class="col-md-5 order-md-1">
      <img src="resources/img/about/about team.jpg" alt="team"
      height="400" width="400" style="border-radius: 50%;padding:2rem 2rem 2rem 2rem ;">
    </div>
  </div>
</div>
</div>

<!-- footer -->
<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>