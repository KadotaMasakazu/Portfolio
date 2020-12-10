<%@page import="model.UserDto"%>
<%@page import="model.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>My Page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles-font.css">
</head>
<%
	UserDto user = (UserDto) session.getAttribute("userInfo");
if (user == null) {
	response.sendRedirect("/404.jsp");
}
%>
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
          <li class="nav-item active">	<a class="nav-link"
          			href="<%=request.getContextPath()%>/portfolio.jsp"> 		Top</a></li>
          <li class="nav-item">			<a class="nav-link"
          			href="<%=request.getContextPath()%>/editAccount.jsp">		Edit Account</a></li>
          <li class="nav-item">			<a class="nav-link"
          			href="<%=request.getContextPath()%>/aboutTool.jsp">			About Tool</a></li>
          <li class="nav-item">			<a class="nav-link"
          			href="<%=request.getContextPath()%>/view/UserSignOutSvl">	Sign Out</a></li>
        </ul>
      </div>
    </nav>
    <!-- End Header 1 code -->
  </div>
</div>
	<div class="features-boxed">
		<div class="container">
			<div class="intro">
				<h2 class="text-center">
					Welcome to
					<%=user.getName()%></h2>
			</div>
			<%
				String msg = (String) request.getAttribute("msg");
			if (msg != null) {
			%>
			<p class="text-center" style="color: green;"><%=msg%></p>
			<%
				}
			%>
			<div class="row justify-content-center features">
				<div class="col-sm-6 col-md-5 col-lg-4 item">
					<div class="box" style="height: 300px;">
						<i class="far fa-edit icon" style="color: #30383a;"></i>
						<h3 class="name">アカウント情報の変更・退会</h3>
						<a class="btn btn-primary" role="button"
							href="<%=request.getContextPath()%>/editAccount.jsp"><strong>Edit
								your Account</strong></a>
					</div>
				</div>
				<div class="col-sm-6 col-md-5 col-lg-4 item">
					<div class="box" style="height: 300px;">
						<i class="far fa-folder-open icon"
							style="border-color: #30383a; color: #30383a;"></i>
						<h3 class="name">本サイトの開発環境について</h3>
						<p class="description">実際に使用したツールを説明します。</p>
						<a class="learn-more"
							href="<%=request.getContextPath()%>/aboutTool.jsp">Learn more
							»</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<p class="text-center text-muted mb-0 small">&nbsp; © 2020 Kadota
		Masakazu</p>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/script.min.js"></script>
</body>

</html>