<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Portfolio</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles-font.css">
<body>
<div class="header2 bg-dark">
	<div class="">
		<!-- Header 1 code -->
		<nav class="navbar navbar-expand-lg h2-nav bg-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#header2" aria-controls="header2" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="icon-menu"></span>
			</button>
			<div class="collapse navbar-collapse hover-dropdown" id="header2">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="<%=request.getContextPath()%>/portfolio.jsp"> Top</a></li>
				</ul>
			</div>
		</nav>
		<!-- End Header 1 code -->
	</div>
</div>
	<div class="highlight-blue" style="background: #84e2a8;">
		<div class="container">
			<div class="intro">
				<h2 class="text-center">
					<strong style="font-size: 60px; color: #30383a;">SORRY</strong>
				</h2>
				<p class="text-center" style="font-size: 20px; color: #30383a;">we
					cloudn't find that page</p>
				<p class="text-center" style="color: #30383a;">
					go to&nbsp;<a href="<%=request.getContextPath()%>/portfolio.jsp">Kadota's
						portfolio page.</a>
				</p>
			</div>
			<div class="buttons"></div>
		</div>
	</div>
	<p class="text-muted mb-0 small" style="text-align: center;">&nbsp;
		© 2020 Kadota Masakazu</p>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/script.min.js"></script>
</body>

</html>