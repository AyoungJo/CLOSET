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
<link rel="stylesheet" href="./service_center_notice_contents.css">
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
	<div class="container">
		<div class="container-wrap">

			<h1 class="title1">공지사항</h1>
			<p class="title2">CLOSET의 새로운 소식들과 유용한 정보들은 한 곳에서 확인하세요.</p>
			<form class="form1">
				<table class="table1">
					<tr>
						<td class="table__title1">
							<h5>제목</h5>
						</td>
						<td class="table__content">
							<p class="table_p">[클로젯]개인정보처리방침 개정</p>
						</td>
					</tr>
					<tr>
						<td class="table__title1">
							<h5>작성자</h5>
						</td>
						<td class="table__content">
							<p class="table_p">Closet</p>
						</td>
					</tr>
					<tr>
						<td class="table__title1">
							<h5>작성일</h5>
						</td>
						<td class="table__content">
							<p class="table_p">19/07/12</p>
						</td>
					</tr>
					<tr>
						<td class="table__title2">
							<h5>내용</h5>
						</td>
						<td class="table__content">
							<p class="table_p">1 개인정보의 처리 목적 ① <ㅇㅇㅇ>은(는) 다음의 목적을 위하여
								개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다. 고객 가입의사 확인, 고객에 대한
								서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는
								서비스의 공급·배송, 마케팅 및 광고에의 활용</p>
						</td>
					</tr>
				</table>
				<div class="btn_part">
					<input type="button" value="목록" class="btn_list">
				</div>
			</form>

		</div>
	</div>

	<!--footer-->
	<jsp:include page="../fix/footer.jsp" />

</body>
</html>