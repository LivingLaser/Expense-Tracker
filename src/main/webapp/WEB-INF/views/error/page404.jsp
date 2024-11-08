<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>404 Not Found</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="resources/css/page404.css">
</head>
<body>
  <h1>404</h1>
  <div class="cloak__wrapper">
    <div class="cloak__container">
      <div class="cloak"></div>
    </div>
  </div>
  <div class="info">
    <h2>We can't find that page</h2>
    <p>We're fairly sure that page used to be here, but seems to have gone missing. We do apologise on it's behalf.</p>
    <a href="${pageContext.request.contextPath}/" rel="noreferrer noopener">Home</a>
  </div>
</body>
</html>