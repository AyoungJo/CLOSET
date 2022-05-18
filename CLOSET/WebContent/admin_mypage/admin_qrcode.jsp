<%@page import="java.net.InetAddress"%>
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
		int register_num = Integer.parseInt(request.getParameter("register_num"));

	InetAddress Address = InetAddress.getLocalHost();
	System.out.println("로컬 컴퓨터의 IP 주소 : " + Address.getHostAddress());
	String IpAddr = Address.getHostAddress();

	response.sendRedirect("https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl=http://" + IpAddr
			+ ":9090/CLOSET2/suit/appli.jsp?register_num=" + register_num + "&choe=UTF-8");
	%>
</body>
</html>