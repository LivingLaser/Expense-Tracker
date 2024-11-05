<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQs</title>
    <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png">
    <link rel="stylesheet" href="resources/css/faq.css">
</head>
<body>
<!-- navbar -->
<jsp:include page="inc/navbar.jsp"></jsp:include>

   <!-- heading -->
    <div class="heading">
   <div class="container col-xxl-8 px-4 py-5">
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
      <div class="col-10 col-sm-8 col-lg-6">
        <img src="resources/img/faq/faq.jpg" class="d-block mx-lg-auto img-fluid" alt="Bootstrap Themes" width="700" height="500" style="border-radius: 50%;">
      </div>
      <div class="col-lg-6">
        <h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3">FAQ's</h1>
        <p class="lead">"Got Questions? We've Got Answers!
         Explore our FAQ section for helpful insights and troubleshooting tips on Budget Ninja. Can't find what you're looking for? Contact us!"
        </p>
        </div>
      </div>
    </div>
  </div>

<!-- qs -->
<div class="faq-container">
  <h1>Frequently Asked Questions</h1>
  
  <div class="faq-item">
      <div class="faq-question" onclick="toggleAnswer(this)">
          <h3>Can I set budget goals?
          </h3>
          <span class="arrow">▶</span>
      </div>
      <div class="faq-answer">
          <p>Yes, set targets for income, expenses, and savings.
          </p>
      </div>
  </div>
  
  <div class="faq-item">
      <div class="faq-question" onclick="toggleAnswer(this)">
          <h3>Can I categorize transactions?
          </h3>
          <span class="arrow">▶</span>
      </div>
      <div class="faq-answer">
          <p>Yes, assign categories (e.g., food, transportation).
          </p>
      </div>
  </div>

  <div class="faq-item">
      <div class="faq-question" onclick="toggleAnswer(this)">
          <h3>How do I track budget progress?
          </h3>
          <span class="arrow">▶</span>
      </div>
      <div class="faq-answer">
          <p>View reports and graphs.
          </p>
      </div>
  </div>
</div>

<!-- footer -->
<jsp:include page="inc/footer.jsp"></jsp:include>

<script src="resources/js/faq.js"></script>
</body>
</html>