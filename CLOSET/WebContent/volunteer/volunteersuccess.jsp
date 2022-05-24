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
<link rel="stylesheet" href="volunteersuccess.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");   
%>

	<!--header-->
	<jsp:include page="../fix/header.jsp" />

	<jsp:useBean id="cdao" class="closet.closetDAO" />

	<%
		String member_email = request.getParameter("member_email");
		session.setAttribute("username", member_email);
		String username = (String)session.getAttribute("username");
	%>

	<!--category&product-->
	<div class="content">
		<!--main content-->
		<div class="container">
			<div class="container-wrap">
				<form class="form1">
					<table class="table1">
						<tr>
							<td>
								<h1 class="title1">자원봉사자 신청이 완료되었습니다.</h1>
							</td>
						</tr>
					</table>
					<input class="button2" type="button"
						onclick="location.href='../member_mypage/mypage_volunteer.jsp?member_email=<%=member_email%>'"
						value="신청내역 확인하기">
				</form>
			</div>
		</div>
	</div>

	<!--footer-->
	<jsp:include page="../fix/footer.jsp" />

</body>
</html>