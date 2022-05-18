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
<jsp:useBean id="cbean" class="closet.closetBean"/>
<jsp:setProperty property="*" name="cbean"/>

<jsp:useBean id="cdao" class="closet.closetDAO" scope="application"/>
<%
	String id= request.getParameter("member_email");
	cdao.modifyMember(cbean);

	response.sendRedirect("mypage.jsp");

%>

</body>
</html>