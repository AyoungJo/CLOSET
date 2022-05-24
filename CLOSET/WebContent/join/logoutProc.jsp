<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
</head>
<body>
<%
	response.setHeader("expires", "0");
	response.setHeader("pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	}
	
	session.invalidate(); // 모든세션정보 삭제
	response.sendRedirect("../suit/suitlist.jsp");
%>
</body>
</html>