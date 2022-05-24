<%@page import="closet.closetDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" charset=UTF-8">
</head>
<body>
<%
	response.setHeader("expires", "0");
	response.setHeader("pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	}
	
	// 인코딩 처리
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("member_email");
	String pw = request.getParameter("member_pw");

	closetDAO cdao = new closetDAO();
	int check = cdao.loginCheck(id, pw);

	String msg = "";
	if (check == 1){ // 로그인 성공
		if (id.contains("master")) {
			session.setAttribute("sessionID", id);
			msg = "../admin_mypage/admin_suitlist.jsp";
		} else {
			session.setAttribute("sessionID", id);
			msg = "../suit/suitlist.jsp";
		}
	} else if (check == 0){ // 비밀번호가 틀릴경우	
		msg = "login.jsp?msg=0";
	} else { // 아이디가 틀릴경우	
		msg = "login.jsp?msg=-1";
	}
	response.sendRedirect(msg);
%>
</body>
</html>