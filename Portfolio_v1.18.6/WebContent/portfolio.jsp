<%@page import="model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" 		content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="description" 	content="Kadota's Portfolio 未経験エンジニアによるポートフォリオサイト">
    <title>Kadota's Portfolio</title>
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

<body id="page-top">

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
          <li class="nav-item active">	<a class="nav-link" 				  href="#page-top" >	Home</a></li>
          <li class="nav-item">			<a class="nav-link js-scroll-trigger" href="#aboutMe">		About Me</a></li>
          <li class="nav-item">			<a class="nav-link js-scroll-trigger" href="#works">		Works</a></li>
          <li class="nav-item">			<a class="nav-link js-scroll-trigger" href="#contactme">	Contact Me</a></li>
        </ul>
        <ul class="navbar-nav">
          <% if(session.getAttribute("userInfo")!=null) {%>
          			<li class="nav-item"><a class="nav-link"
          					href="<%=request.getContextPath()%>/yourAccount.jsp">		My Page</a></li>
          			<li class="nav-item"><a class="nav-link"
          					href="<%=request.getContextPath()%>/view/UserSignOutSvl">	Sign Out</a></li>
                    <% } else{%>
                    <li class="nav-item"><a class="nav-link"
                    		href="<%=request.getContextPath()%>/signup.jsp">			Sign Up</a></li>
                    <%} %>
        </ul>
      </div>
    </nav>
    <!-- End Header 1 code -->
  </div>
</div>
    <header class="d-flex masthead" style="background: url('<%=request.getContextPath()%>/img/top_background.jpg') center / cover;">
        <div class="container my-auto text-center">
            <h1 class="text-body mb-1">Kadota's Portfolio</h1>
            <h3 class="mb-5"><em>未経験webエンジニア</em></h3>
            <a class="btn btn-dark btn-lg btn-xl js-scroll-trigger" role="button" href="#aboutSite" style="background: #30383a;">
            <i class="fas fa-chevron-down"></i></a>
            <div class="overlay"></div>
        </div>
    </header>
    <section id ="aboutSite" class="content-section bg-light">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <h1>About this site</h1>
                    <p class="lead mb-5">こちらはWebエンジニアを目指しているkadotaのポートフォリオサイトです。</p>
                </div>
            </div>
        </div>
    </section>
    <section id = "aboutMe" class="content-section bg-primary text-white text-center">
        <div class="container">
            <div class="content-section-heading">
                <h3 class="text-secondary mb-0"></h3>
                <h1 class="mb-5" style="height: 48px;">About me</h1>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <span class="mx-auto service-icon rounded-circle mb-3" style="height: 126px;">
                    <img class="rounded-circle img-fluid" src="<%=request.getContextPath()%>/img/profile.jpg"
                    		style="height: 126px;" /></span>
                </div>
                <div class="col">
                    <p style="font-size: 20px;">VRがきっかけでプログラミングに興味を持ち、アルバイトをしながら学んでいたが限界を感じ、
                    							職業訓練で学び始める。その後、プログラミングの面白さに気づきプログラマーを目指す。</p>
                    <p></p>
                </div>
            </div>
        </div>
    </section>
	<section id = "works" class="callout"
		style="background:linear-gradient(90deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.1) 100%),
				url(&quot;<%=request.getContextPath()%>/img/bg-callout.jpg&quot;);
				background-position:center center;background-repeat:no-repeat;background-size:cover;">
		<div class="container text-center">
			<h1 class="mx-auto mb-5">
				<span>Works</span>
			</h1>
			<div class="card">
				<div
					class="card-body text-dark bg-light border rounded-0 border-dark shadow-sm">
					<h4 class="card-title">1.ポートフォリオサイト</h4>
					<img class="img-fluid"
						src="<%=request.getContextPath()%>/img/portfolio.png" width="500">

					<p class="text-center card-text" style="font-size: 20px;">
						自己紹介とjavaによるログイン機能が付いたサイトです。<br>作成を通じて、
						jsp,sevletによる情報の受け渡し、AWSを使ったサイトの公開の考え方を学ぶことができました。<br>
						ログイン機能は下のボタンから確認することができます。
					</p>
					<p class="text-center card-text" style="font-size: 15px;">
						使用言語&nbsp; &nbsp;HTML/CSS,Bootstrap4,JavaScript,Java8,Tomcat8.5,AWS
						(Beanstalk,Route53)<br>
					</p>
					<%
					UserDto user = (UserDto) session.getAttribute("userInfo");
					if (user == null) {
					%>
					<a class="btn btn-info" role="button"
						href="<%=request.getContextPath()%>/signup.jsp">&nbsp;Sign Up</a>
					<%}else{ %>

					<a class="btn btn-info" role="button"
						href="<%=request.getContextPath()%>/yourAccount.jsp">&nbsp;My Page</a>
					<%} %>
				</div>
			</div>
		</div>
	</section>
	<section class="content-section" style="background: #f8f9fa;">
        <div class="container">
            <div class="heading">
                <h1 class="text-center">My Skills</h1>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card special-skill-item border-0" style="background: rgb(153,214,221);">
                        <div class="card-header bg-transparent border-0">
                        	<i class="fab fa-java" style="font-size: 35px;"></i></div>
                        <div class="card-body">
                            <h3 class="card-title">Java</h3>
                            <ul>
                                <li style="font-size: 20px;">MVC設計とTomcatを用いた動的webサイトの構築。<br></li>
                                <li style="font-size: 20px;">オブジェクト指向やCollectionの学習。<br></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card special-skill-item border-0" style="background: rgb(153,214,221);">
                        <div class="card-header bg-transparent border-0">
                        	<i class="fab fa-aws" style="font-size: 35px;"></i></div>
                        <div class="card-body">
                            <h3 class="card-title">AWS</h3>
                            <ul>
                                <li style="font-size: 20px;">Elastic Beanstalkを使用したアプリケーションのデプロイ。<br></li>
                                <li style="font-size: 20px;">WordPressサイトの公開。
                                								(mochikoAsTech(2018)AWSをはじめよう.を参考に作成。)<br></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card special-skill-item border-0" style="background: rgb(153,214,221);">
                    	<i class="fa fa-group" style="font-size: 35px;"></i>
                        <div class="card-body">
                            <h3 class="card-title">Group work</h3>
                            <ul>
                                <li style="font-size: 20px;">職業訓練校にてグループリーダーを担当し、プロジェクトの管理を経験。<br></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section id = "contactme"class="content-section bg-light">
            <div class="container text-center">
                <div class="row">
                    <div class="col-lg-10 mx-auto">
                        <h1>Contact Me</h1>
                        <p class="lead mb-5">ここまでご覧いただきありがとうございました。連絡先やソースコードはこちら</p>
                        <p class="lead mb-5">ソースコード:<a href= "https://github.com/KadotaMasakazu/Portfolio">
                        							https://github.com/KadotaMasakazu/Portfolio</a><br></p>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <footer class="footer text-center" style="height: 160px;">
        <div class="container">
            <p class="text-muted mb-0 small">&nbsp; © 2020 Kadota Masakazu</p>
        </div><a class="js-scroll-trigger scroll-to-top rounded" href="#page-top"><i class="fa fa-angle-up"></i></a></footer>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/script.min.js"></script>
</body>

</html>
