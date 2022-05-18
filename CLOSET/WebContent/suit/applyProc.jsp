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
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
%>
	<%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="cbean" class="closet.closetBean">
    <jsp:setProperty name="cbean" property="*"/>    
    </jsp:useBean>
	<%
        closetDAO cdao = new closetDAO();
		//추가
		String member_email= (String)session.getAttribute("sessionID");
		int suitnum = (Integer)session.getAttribute("suitnum"); 

        /* cdao.insertApply(cbean, member_email); */
        cdao.insertApply(cbean, suitnum, member_email); 
        response.sendRedirect("appli_success.jsp");
  		
    %>
</body>
</html>