<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 수정 정보 넘기기 -->
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="cbean" class="closet.closetBean" />
	<jsp:setProperty name="cbean" property="*" />
	<jsp:useBean id="cdao" class="closet.closetDAO" scope="application" />
	<%
		cdao.modifyRegister(cbean);
		response.sendRedirect("../admin_mypage/admin_suitlist.jsp");
	%>
</body>
</html>