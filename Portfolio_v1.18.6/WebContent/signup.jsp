<%@page import="model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<%
	UserDto user = (UserDto) session.getAttribute("userInfo");
if (user != null) {
	response.sendRedirect("/signin.jsp");
}
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Create Account</title>
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

<body id=createAccoutTop>
<div class="header2 bg-dark">
  <div class="">
    <!-- Header 1 code -->
    <nav class="navbar navbar-expand-lg h2-nav bg-dark">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#header2"
      								 aria-controls="header2" aria-expanded="false" aria-label="Toggle navigation">
				<span class="icon-menu"></span>
			</button>
      <div class="collapse navbar-collapse hover-dropdown" id="header2">
        <ul class="navbar-nav">
          <li class="nav-item active">	<a class="nav-link"
          			href="<%=request.getContextPath()%>/portfolio.jsp"> 		Top</a></li>

          <li class="nav-item">			<a class="nav-link"
          			href="<%=request.getContextPath()%>/signin.jsp"		>		Sign in</a></li>

        </ul>
      </div>
    </nav>
    <!-- End Header 1 code -->
  </div>
</div>

    <div class="login-clean">
        <h1 class="text-center"><strong>Sign Up</strong><br></h1>
        <form action="<%=request.getContextPath()%>/view/UserCreateSvl"
			method="post">
            <h2 class="sr-only">Login Form</h2>
            <%
				String error = (String) request.getAttribute("error");
			if (error != null) {
			%>
			<p class="text-center" style="color: red;"><%=error%></p>
			<%
				}
			%>
            <h4>Name(max20)</h4>
            <p style="font-size: 14px;">English letter and number.</p>
            <div class="form-group"><input class="form-control" type="text" name="name" placeholder="Name" pattern="^[0-9A-Za-z]{1,20}$"required></div>
            <h4>Password(8-20)</h4>
            <p style="font-size: 12px;">Passwords must contain at least eight characters, including at least 1 lowercase and uppercase letter and 1 number.(max:20)</p>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}" required></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit" style="background: #17a2b8;"><strong>Create your Account</strong><br></button></div>
            <p>Already have an account?&nbsp;<a href="<%=request.getContextPath()%>/signin.jsp">Sign-In&nbsp;</a></p>
        </form>
    </div>
    <p class="text-center text-muted mb-0 small">&nbsp; © 2020 Kadota Masakazu</p>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/script.min.js"></script>
    <c:out value="${param['input']}"/>
</body>

</html>