<%@page import="closet.closetDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="./signup.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	}
%>
    <jsp:useBean id="cbean" class="closet.closetBean">
    <jsp:setProperty name="cbean" property="*"/>    
    </jsp:useBean>
<%
    closetDAO cdao = new closetDAO();
    cdao.insertMember(cbean);
    response.sendRedirect("signUpSuccess.jsp");
%>    
</body>
</html>