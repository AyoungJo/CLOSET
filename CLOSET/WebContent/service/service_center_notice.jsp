<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
 	src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>
    
<link rel="stylesheet" href="service_center_notice.css">
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");   
%> 
	<!--header-->
	<%@ include file="../fix/header.jsp"%>

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
				<h1 class="title1">공지사항</h1>
				<p class="title2">CLOSET의 새로운 소식들과 유용한 정보들은 한 곳에서 확인하세요.</p>
				<form class="form1">
					<table class="table1">
						<tr class="table__title">
							<td class="td1">
								<h4>번호</h4>
							</td>
							<td class="td2">
								<h4>제목</h4>
							</td>
							<td class="td3">
								<h4>작성자</h4>
							</td>
							<td class="td3">
								<h4>작성일</h4>
							</td>
							<td class="td3">
								<h4>조회</h4>
							</td>
						</tr>
						<tr class="table__content">
							<td class="content1">공지</td>
							<td class="content2"><a href="#" class="table__link">[클로젯]
									개인정보처리방침 개정</a></td>
							<td class="content3">Closet</td>
							<td class="content3">19/07/12</td>
							<td class="content3">612</td>
						</tr>
						<tr class="table__content">
							<td class="content1">공지</td>
							<td class="content2"><a href="#" class="table__link">[클로젯]
									이용약관 및 개인정보처리방침 개정</a></td>
							<td class="content3">Closet</td>
							<td class="content3">19/07/12</td>
							<td class="content3">612</td>
						</tr>
						<tr class="table__content">
							<td class="content1">공지</td>
							<td class="content2"><a href="#" class="table__link">[클로젯]
									시스템 점검 안내</a></td>
							<td class="content3">Closet</td>
							<td class="content3">19/07/12</td>
							<td class="content3">612</td>
						</tr>
						<tr class="table__content">
							<td class="content1">공지</td>
							<td class="content2"><a href="#" class="table__link">[클로젯]
									시스템 점검 안내</a></td>
							<td class="content3">Closet</td>
							<td class="content3">19/07/12</td>
							<td class="content3">612</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>

	<!--footer-->
	<%@ include file="../fix/footer.jsp"%>

</body>
</html>