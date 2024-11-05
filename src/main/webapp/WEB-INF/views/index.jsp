<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="color-scheme" content="dark" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <link rel="shortcut icon" href="resources/img/logo/BUDGET.png" type="image/png" />
    <link rel="stylesheet" href="resources/css/style.css" />
  </head>
  <body>
    <header id="header">
      <div class="container">
        <nav>
          <a href="${pageContext.request.contextPath}/" tabindex="-1">
            <img src="resources/img/home/logo.jpeg" class="logo" />
          </a>
          <h1 class="name">Budget Ninja</h1>
          <ul id="sidemenu">
            <li class="active-link"><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="#about">Problems &amp; Solutions</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#portfolio">Reviews</a></li>
            <li><a href="#contact">Contact Us</a></li>
            <li><a href="${pageContext.request.contextPath}/faq">FAQs</a></li>
            <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
            <li><a href="${pageContext.request.contextPath}/admin_login">ADMIN</a></li>
            <i class="fa-solid fa-xmark awesome-active" onclick="closemenu()"></i>
          </ul>
          <div class="backdrop"></div>
          <i class="fa-solid fa-bars awesome-active" onclick="openmenu()"></i>
        </nav>
        <div class="header-container">
          <div class="header-text">
            <p class="subtitle">Expense Tracker</p>
            <h1>Track every rupee,<span></span><br />live every moment.</h1>
            <c:choose>
            <c:when test="${(validUser!=null) && (userLoggedIn)}">
            	<a href="${pageContext.request.contextPath}/dashboard_quarter" tabindex="-1" class="btn btn2 awesome-active">Dashboard</a>
            </c:when>
            <c:otherwise>
            	<a href="${pageContext.request.contextPath}/register" tabindex="-1" class="btn btn2 awesome-active">Sign Up</a>
            </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </header>
    <main>
      <!----------------------------------------Problems-------------------------------------------------------------->
      <div id="about">
        <div class="container">
          <h1 class="sub-title mb2">Problems</h1>
          <div class="row">
            <div class="about-col-2">
              <p>
                Without an expense tracker, managing finances can feel like navigating a ship without a compass. People often encounter issues like:
                          <br><br>
                          Overspending: Without tracking, it's easy to lose track of expenses and end up spending more than planned.
                          <br><br>
                          Missed Bills: Forgetting due dates can lead to missed payments and late fees.
                          <br><br>
                          Poor Budgeting: Without clear insights, creating and sticking to a budget becomes a challenge.
                          <br><br>
                          Lack of Savings: Without monitoring spending habits, it's hard to identify areas to cut back and save more.
                          <br><br>
                          Stress and Anxiety: Uncertainty about financial status can lead to increased stress and anxiety.
              </p>
              <br>
              <p>
                An expense tracker can provide clarity, help establish and follow budgets, and ultimately bring peace of mind. It’s like having a financial coach in your pocket.
              </p>
              <br><br>


              <h1 class="sub-title mb2">Solutions</h1>

              <p>
                At Expense Tracker, we believe in the power of financial clarity. Our mission is to help you take control of your finances by offering a user-friendly platform that tracks every rupee you spend and earn. We understand that managing money can be daunting, so we've designed our tool to be intuitive and insightful, providing you with real-time data, detailed analytics, and personalized tips to help you make informed financial decisions.
              </p>
              <br><br><br>
              <p>
                Whether you're saving for a dream vacation or simply trying to stay on top of your budget, we're here to make your financial journey smoother and smarter. Let us help you live every moment without worrying about your wallet.
              </p>


              
            </div>
            
            <div class="about-col-1 my-img">
              <img src="resources/img/home/coin.png" />
            </div>
          </div>
        </div>
      </div>
      <!------------------------------------------------------Services---------------------------------------->
      <div id="services">
        <div class="container">
          <h1 class="sub-title">Our Services</h1>
          <div class="services-list">
            <div>
              <i class="fa-solid fa-hand-holding-dollar"></i>
              <h2>Add Income</h2>
              <p>
                Income is a fundamental aspect of economic life, representing the money that individuals or entities receive in exchange for their labor, goods, services, or investments. It forms the foundation upon which personal and societal wealth is built, impacting various facets of life, from daily expenditures to long-term financial planning and economic stability.
              </p>
              <a href="${pageContext.request.contextPath}/">Learn More</a>
            </div>
            <div>
              <i class="fa-solid fa-wallet"></i>
              <h2>Check Balance</h2>
              <p>
                A bank balance is a fundamental indicator of an individual's financial health, representing the amount of money held in one's bank account. It is a crucial aspect of personal finance management, reflecting one's ability to save, spend, and invest. Maintaining a healthy bank balance is essential for various reasons, including financial security, planning for future expenses, and achieving long-term financial goals.
              </p>
              <a href="${pageContext.request.contextPath}/">Learn More</a>
            </div>
            <div>
              <i class="fa-solid fa-chart-line"></i>
              <h2>Compare with Charts</h2>
              <p>
                In today's data-driven world, the ability to present information clearly and effectively is more important than ever. Charts, a fundamental tool in data visualization, play a critical role in this process. They transform complex data sets into visual representations, making it easier to understand, interpret, and communicate information.
              </p>
              <a href="${pageContext.request.contextPath}/">Learn More</a>
            </div>
          </div>
        </div>
      </div>
      <!--------------------------------------------------Reviews---------------------------------------------->
      <div id="portfolio">
        <div class="container colored">
          <h1 class="sub-title">Our Reviews</h1>
          <div class="work-list">
            <div class="work">
              <img src="resources/img/home/review.png" />
              <div class="layer">
                <div class="layer-wrapper">
                  <h3>Effortless Budgeting</h3>
                  <p>
                    This app has transformed the way I manage my finances. Inputting expenses is a breeze, categorization is intuitive, and tracking my spending feels like a game. The user-friendly interface makes budgeting a joy, not a chore.
                  </p>
                  <a href="${pageContext.request.contextPath}/">
                  	<i class="fa-solid fa-arrow-up-right-from-square"></i>
                  </a>
                </div>
              </div>
            </div>
            <div class="work">
              <img src="resources/img/home/secure.png" />
              <div class="layer">
                <div class="layer-wrapper">
                  <h3>Accurate, Reliable, and Secure</h3>
                  <p>
                    This app has never let me down. It's accurate, reliable, and always keeps my financial data secure. I trust it completely. The app's developers have clearly prioritized data security, implementing robust measures to protect user information. I have no concerns about the safety of my financial data when using this app.
                  </p>
                  <a href="${pageContext.request.contextPath}/">
                  	<i class="fa-solid fa-arrow-up-right-from-square"></i>
                  </a>
                </div>
              </div>
            </div>
            <div class="work">
              <img src="resources/img/home/support.png" />
              <div class="layer">
                <div class="layer-wrapper">
                  <h3>Excellent Customer Support</h3>
                  <p>
                    The customer support team is top-notch. They're always quick to respond and provide helpful solutions to any issues I've encountered. I've had a few questions and concerns, and the support team has always been patient, understanding, and knowledgeable. They've gone above and beyond to ensure my satisfaction. I'm impressed by their commitment to providing excellent customer service.
                  </p>
                  <a href="${pageContext.request.contextPath}/">
                    <i class="fa-solid fa-arrow-up-right-from-square"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <a href="${pageContext.request.contextPath}/" class="btn awesome-active">See More</a>
        </div>
      </div>
      <!-----------------------------------------------Contact------------------------------------------------>

      <div id="contact">
        <div class="container">
          <h1 class="sub-title mb2">Contact Us</h1>
          <div class="row">
            <div class="contact-right">
              <form autocomplete="off" name="submit-to-google-sheet">
                <label for="name">Name</label>
                <input
                  type="text"
                  name="Name"
                  id="name"
                  placeholder="Your Name"
                  required
                />

                <label for="email">Email address</label>
                <input
                  id="email"
                  type="email"
                  name="Email"
                  placeholder="Your Email"
                  required
                />
                <label for="message">Message</label>
                <textarea
                  id="message"
                  name="Message"
                  rows="6"
                  placeholder="Your Message"
                ></textarea>
                <button type="submit" class="btn btn2 awesome-active">
                  Submit
                </button>
              </form>
              <span id="msg"></span>
            </div>
            <div class="contact-left">
              <p>
                <i class="fa-solid fa-envelope"></i
                ><a href="mailto:techdrill6@gmail.com">techdrill6@gmail.com</a>
              </p>
              <p>
                <i class="fa-solid fa-square-phone"></i
                ><a href="tel:+91-6289549477">+91-1234567890</a>
              </p>
              <div class="social-icons">
                <a href="${pageContext.request.contextPath}/"><i class="fa-brands fa-facebook"></i></a>
                <a href="${pageContext.request.contextPath}/"><i class="fa-brands fa-twitter-square"></i></a>
                <a href="${pageContext.request.contextPath}/"><i class="fa-brands fa-instagram"></i></a>
                <a href="${pageContext.request.contextPath}/"><i class="fa-brands fa-linkedin"></i></a>
              </div>
              
            </div>
          </div>
        </div>
      </div>
    </main>
    <footer>
      <div class="copyright">
        <p class="container">&copy; 2024 Budget Ninja. All rights reserved. || <a href="">Privacy Policy</a> || <a href="">Terms of Service</a></p>
      </div>
    </footer>

    <div id="snackbar">
      <div class="box">
        <div class="text">Something went wrong</div>
      </div>
    </div>
    <div class="loading-modal">
      <i class="fas fa-circle-notch fa-spin"></i>
    </div>
    
    <script src="https://kit.fontawesome.com/434db59a98.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
    <script src="resources/js/script.js"></script>
  </body>
</html>