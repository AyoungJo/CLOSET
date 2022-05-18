<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="closet_main">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="closet.css">
<title>Document</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="../main/closet.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="animate.min.css">
<script src="jquery.waypoints.min.js"></script>
</head>
<body class="closet_main__body">
	<nav id="navbar" class="navbar">
	<ul class="nav-menu">
		<li><a data-scroll="closet" href="#closet" class="dot active">
				<span>closet</span>
		</a></li>
		<li><a data-scroll="about" href="#about" class="dot"> <span>about</span>
		</a></li>
		<li><a data-scroll="values" href="#values" class="dot"> <span>values</span>
		</a></li>
		<li><a data-scroll="process" href="#process" class="dot"> <span>process</span>
		</a></li>
		<li><a data-scroll="recommand" href="#recommand" class="dot">
				<span>recommand</span>
		</a></li>
	</ul>
	</nav>

	<section id="closet" class="main__section"
		style="background-image: url(../images/b3.png);background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
    background-size: cover;">

	<div class="closet__section">
		<a href="../suit/suitlist.jsp" class="tooltip">
			<div class="animated" id="animated__part">
				<img src="../images/logo1.png" class="logo__img">
			</div>
		</a>
	</div>

	</section>

	<section id="about" class="main__section"
		style="background-image: url(../images/2.png);background-attachment:fixed;background-repeat: no-repeat;background-position: center;background-size: cover;">
	<div class="about__section">
		<h2 class="about-closet__title">
			ABOUT <span>CLOSET</span>
		</h2>
		<p class="about-closet__text">
			5명의 팀원들이 청년들을 응원하고자 프로젝트를 시작했습니다. 정장을 기증받아 꼭 필요한 청년들에게 공유함으로써,<br>
			취업비용 중 면접복장의 부담을 줄이고 그 수익을 다양한 청년 취업 지원 나눔사업을 통해 환원함으로써 공유경제를 실현하고
			있습니다.
		</p>
		<ul class="about-closet__content__box">
			<li><img src="../images/u1.gif" class="about-closet__content1">
			</li>
			<li><img src="../images/u2.gif" class="about-closet__content2">
			</li>
			<li><img src="../images/u3.gif" class="about-closet__content3">
			</li>
		</ul>
	</div>
	</section>
	<section id="values" class="main__section"
		style="background-image: url(../images/background2.png);background-repeat: no-repeat;
    background-position: left;
    background-size: cover;">
	<div class="values__section">
		<div class="closet-values">
			<h2 class="closet-values__title">
				CLOSET <span>VALUES</span>
			</h2>
			<ul>
				<li class="closet-values__text"><span>01</span>&nbsp;&nbsp; 새로운
					가치로 태어나는 나의 정장</li>
				<li class="closet-values__text"><span>02</span>&nbsp;&nbsp; 가장
					가까운 곳에서 만나는 정장 공유경제 서비스</li>
				<li class="closet-values__text"><span>03</span>&nbsp;&nbsp;
					지역구청과 클린봉사자가 함께 하는 착한 정장</li>
				<li class="closet-values__text"><span>04</span>&nbsp;&nbsp; 정장
					공유시 발생되는 수익금을 통한 청년 취업 사업 지원</li>
			</ul>
		</div>
	</div>
	</section>
	<section id="process" class="main__section"
		style="background-image: url(../images/b5.png);background-repeat: no-repeat;
    background-position: center;
    background-size: cover;">
	<div class="closet-process">
		<h2 class="closet-process__title">
			CLOSET <span>PROCESS</span>
		</h2>

	</div>
	</section>
	<section id="recommand" class="main__section"
		style="background-image: url(../images/b6.png);background-attachment:fixed;background-repeat: no-repeat;background-position:left;background-size: cover;">
	<div class="recommand__content">
		<p class="recommand__text1">잠들어 있는 정장을 찾아 CLOSET에 위탁해보는 건 어떨까요?</p>
		<p class="recommand__text2">
			위탁한 정장이 대여되면 수익금의 일부가 기부가능하며,<br>
			 기부금은 지역 구청과 연계한 <mark>청년 취업 지원 나눔 사업</mark> 에 사용됩니다.
		</p>
		<button class="recommand__btn"
			onclick="location.href='../suit/suitlist.jsp'">정장공유 시작하기</button>
	</div>
	</section>
</body>
</html>