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
<%      // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        String id= request.getParameter("member_email");
        String pw = request.getParameter("member_pw");
        
        int register_num = Integer.parseInt(request.getParameter("register_num"));

        closetDAO cdao = new closetDAO();
        int check = cdao.loginCheck(id, pw);
        
        String msg = "";
        if(check == 1)    // 로그인 성공
        {             
             session.setAttribute("sessionID",id);
             /* String referer = (String)request.getHeader("REFERER"); */
             msg = "../suit/appli.jsp?register_num="+register_num;           
            /* response.sendRedirect(request.getHeader("referer")); */ 
        }
        else if(check == 0) // 비밀번호가 틀릴경우
        {
            msg = "../suit/appli_login.jsp?msg=0";  
        }
        else    // 아이디가 틀릴경우
        {
            msg = "../suit/appli_login.jsp?msg=-1";
        }
        
        response.sendRedirect(msg);
        
%>
</body>
</html>