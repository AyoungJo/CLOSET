<%@page import="closet.closetDAO"%>
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
		closetDAO cdao = new closetDAO();
	/* int num = Integer.parseInt(request.getParameter("suitnum"));
	session.setAttribute("suitnum", num); */
	int suitnum = (Integer) session.getAttribute("suitnum");

	String member_email = (String) session.getAttribute("sessionID");

	cdao.returndeleteApply(suitnum);
	%>
	<script>
		alert("반납이 완료되었습니다.");
		location.href = "admin_appli_list1.jsp";
	</script>

</body>
</html>