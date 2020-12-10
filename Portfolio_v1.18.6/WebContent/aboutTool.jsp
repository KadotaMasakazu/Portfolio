<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>About Tool</title>
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

<body id = aboutToolTop>
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
          			href="<%=request.getContextPath()%>/yourAccount.jsp">		My Page</a></li>
          <li class="nav-item">			<a class="nav-link js-scroll-trigger"
          			href="#appconfig">											App Config</a></li>
          <li class="nav-item">			<a class="nav-link js-scroll-trigger"
          			href="#references">											References</a></li>
          <li class="nav-item">			<a class="nav-link"
          			href="<%=request.getContextPath()%>/editAccount.jsp">		Edit Account</a></li>
          <li class="nav-item">			<a class="nav-link"
          			href="<%=request.getContextPath()%>/view/UserSignOutSvl">	Sign Out</a></li>
        </ul>
      </div>
    </nav>
    <!-- End Header 1 code -->
  </div>
</div>

    <div class="article-clean">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
                    <div class="intro">
                    	<header>
                        	<h1 class="text-center">
                        		<strong>本サイトの開発環境について</strong><br></h1>
                        </header>
                        <h6 class="text-center">
                        		本サイトはAWSのElasticBeanstalkとRoute53を使い、ネット上に公開しています。</h6>
                        	<img class="img-fluid" src="<%=request.getContextPath()%>/img/app.png"></div>
                    <div class="text" style="font-size: 15px;">
                        <ul class="list-group">
                            <li class="list-group-item" style="background: #f8f9fa;">
                            	<span id = "appconfig"  style="font-size: 15px;">
                            				ElasticBeanstalkの環境設定<br></span>
                              	<ul>
                                    <li>Tomcat8.5<br></li>
                                    <li>Java8<br></li>
                                    <li>MySQL</li>
                                    <li>Amazon Linux/3.4.1(2020年11月26日作成時)<br></li>
                                </ul>
                            </li>
                            <li class="list-group-item" style="background: #f8f9fa;font-size: 15px;">
                            	<span style="font-size: 15px;">使用したツール</span>
                                <ul>
                                    <li>Eclipse(Java8)</li>
                                    <li>Bootstrap Studio(HTML,CSS,JavaScript)</li>
                                    <li>RLogin(EC2,MySQL)</li>
                                </ul>
                            </li>
                        </ul>
  <h2 style="background: #dfe7f1;">Route53のhttps通信に関して</h2>
         <p> 独自ドメイン[www.kadotaportfolio.com]を取得→AWS Certificate Managerからhttpsの証明書を発行→
            Route53にて、[www.kadotaportfolio.com]のエイリアス先にElastic Beanstalkの環境を設定。の手順でhttps通信を行いました。
                        参考元はAWSの公式ドキュメントです。<br /></p>
  <h2 style="background: #dfe7f1;">Elastic Beanstalkを採用した経緯</h2>
         <p> ポートフォリオサイトを作成するうえで必要なサーバーやネットワークの設定を構築するコストと、
           	WebアプリとDataBaseの接続やバージョン管理の利便性を考慮して採用することにしました。</p>
  <h2 style="background: #dfe7f1;">作成手順について</h2>
         <p> 1.Bootstrap Studio(HTML&amp;CSS&amp;JS)→ 2.Eclipse(JSP,Servlet) → 3.Beanstalk(デプロイ)の順で作成しました。</p>
         <p>デプロイの形式はWARファイルをアップロードするものです。</p>
  <h2 style="background: #dfe7f1;">参考資料</h2>
         <p class="text-break">「AWS Elastic Beanstalk ドキュメント」,
         		&lt;https://docs.aws.amazon.com/ja_jp/elastic-beanstalk/?id=docs_gateway&gt;2020年11月26日アクセス<br></p>
         <p class="text-break">関口郁夫(2017)「ログイン処理(Daoを使った改良版)」<br>
         &lt;http://fksekiguchi.sakura.ne.jp/wp/it_basic_understanding/jspservlet/loginusingdao&gt;2020年11月26日アクセス<br></p>
         <p>国本大悟(2019)「スッキリわかるサーブレット&amp;JSP入門 第二版」&nbsp;<br></p>
         <p>Mana(2020)「一冊ですべて身につくHTML&amp;CSSとWebデザイン入門講座」<br></p>
         <p>mochikoAsTech(2018)「AWSをはじめよう」<br></p>
         <p>mochikoAsTech(2019)「DNSをはじめよう 改訂第二版」<br></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <p class="text-center text-muted mb-0 small">&nbsp; © 2020 Kadota Masakazu</p>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/script.min.js"></script>
</body>

</html>