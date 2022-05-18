<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="cbean" class="closet.closetBean" />
	<jsp:setProperty name="cbean" property="*" />
	<%
		closetDAO cdao = new closetDAO();
	int register_num = Integer.parseInt(request.getParameter("register_num"));
	String member_email = (String) session.getAttribute("sessionID");

	cdao.getOneRegister(register_num, member_email);

	response.sendRedirect("admin_register_revise.jsp?register_num=" + register_num);
	%>

</body>
</html>