<%@page import="closet.closetDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./signup.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		  response.setHeader("Cache-Control", "no-cache");
	 }
%>
<%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="cbean" class="closet.closetBean">
    <jsp:setProperty name="cbean" property="*"/>    
    </jsp:useBean>
<%
    closetDAO cdao = new closetDAO();

    // 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
    // insertMember()는 회원 정보를 member 테이블에 저장한다.
    cdao.insertMember(cbean);
    response.sendRedirect("signUpSuccess.jsp");
%>
    
</body>
</html>