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
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String id= (String)session.getAttribute("sessionID");
        String pw = request.getParameter("member_pw");

        // DB에서 아이디, 비밀번호 확인
        closetDAO cdao = new closetDAO();
        int check = cdao.passCheck(id, pw);
        
        // URL 및 로그인관련 전달 메시지
        String msg = "";
        if(check == 1)    // 로그인 성공
        {             
           	msg = "mypage_myinfo.jsp?member_email="+id;
        }
        
        else    // 아이디가 틀릴경우
        {
            msg = "mypage_pass.jsp";
        }
         
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
        
    %>
    out.println(<%=id %>)

</body>
</html>