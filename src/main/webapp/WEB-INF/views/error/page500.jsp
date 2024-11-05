<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>500 Internal Server Error</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=IBM+Plex+Mono:400|Oswald:600'>
  <link rel="stylesheet" href="resources/css/page500.css">
</head>
<body>
  <div id="error">Error</div>
  <div class="error-num">500
    <div class="error-num__clip">500</div>
  </div>
  <p id="desc">Uh oh, there seems to be a problem.</p>
  <p>Let me help you find <a href="${pageContext.request.contextPath}/">a way out</a></p>
</body>
</html>