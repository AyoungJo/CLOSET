<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>
<style type="text/css">
	@import url("../fix/header.css");
	@import url("../fix/footer.css");
</style>
<link rel="stylesheet" href="./service_center_faq.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");   
%>

	<!--header-->
	<jsp:include page="../fix/header.jsp" />

	<jsp:useBean id="cdao" class="closet.closetDAO" />

	<!--main content-->
	<!--category&product-->
	<div class="content">
		<!--category-->
		<div class="category">
			<h3 class="category__title">고객센터</h3>
			<ul class="category__list">
				<li class="category__text"><a href="service_center_notice.jsp">공지사항</a></li>
				<li class="category__text"><a href="service_center_faq.jsp">FAQ</a></li>
				<li class="category__text"><a href="service_center_qna.jsp">1:1
						문의</a></li>
			</ul>
		</div>

		<div class="container">
			<div class="container-wrap">
				<h1 class="title1">FAQ</h1>
				<p class="title2">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</p>
				<form class="form1">
					<table class="table1">
						<tr class="table__title">
							<td class="td1">
								<h4>번호</h4>
							</td>
							<td class="td3">
								<h4>카테고리</h4>
							</td>
							<td class="td2">
								<h4>제목</h4>
							</td>
						</tr>
						<tr class="table__content">
							<td class="content1">1</td>
							<td class="content2">회원문의</td>
							<td class="content3"><a href="#" class="table__link">아이디와
									비밀번호가 생각나지 않아요. 어떻게 찾을 수 있나요?</a></td>
						</tr>
						<tr class="table__content">
							<td class="content1">2</td>
							<td class="content2">피팅예약문의</td>
							<td class="content3"><a href="#" class="table__link">피팅예약취소는
									어떻게 하나요?</a></td>
						</tr>
						<tr class="table__content">
							<td class="content1">3</td>
							<td class="content2">결제문의</td>
							<td class="content3"><a href="#" class="table__link">클로젯에서
									어떤 결제방법을 제공하나요?</a></td>
						</tr>
						<tr class="table__content">
							<td class="content1">4</td>
							<td class="content2">회원문의</td>
							<td class="content3"><a href="#" class="table__link">회원
									정보를 변경하려면 어떻게 해야 하나요?</a></td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>

	<!--footer-->
	<jsp:include page="../fix/footer.jsp" />

</body>
</html>