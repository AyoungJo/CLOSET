<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="closet.closetBean"%>
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
    <%-- <jsp:useBean id="cbean" class="closet.closetBean">
    <jsp:setProperty name="cbean" property="*"/>    
    </jsp:useBean> 
   <%
      Integer num = (Integer)session.getAttribute("sessionNum");
      closetDAO cdao = new closetDAO();
        cdao.insertReview(cbean);
        response.sendRedirect("suitdetail.jsp?register_num=" + num + "#rvMove");
    %> --%>
    <%
   closetBean cbean = new closetBean();
   
   String filename1 = "";
   String fullpath1 = "";
   
   String realpath = application.getRealPath("/upload");
   
   int maxSize = 1024*1024*5;
   String encType = "utf-8";
   String savefile = "img";
   
   try{
		MultipartRequest multi
			= new MultipartRequest(request, realpath, maxSize, encType, new DefaultFileRenamePolicy());
	
		cbean.setReview_title(multi.getParameter("review_title"));
		cbean.setReview_content(multi.getParameter("review_content"));
		cbean.setReview_img(multi.getFilesystemName("review_img"));
		
		
		closetDAO cdao = closetDAO.getInstance();
		String member_email= (String)session.getAttribute("sessionID");
		int register_num = Integer.parseInt(session.getAttribute("sessionNum").toString());
		
		cdao.insertReview(register_num, cbean, member_email);
		
		/* int register_num = Integer.parseInt(request.getParameter("register_num"));
		closetBean regist = cdao.getOneRegister(register_num); */
		Integer num = (Integer)session.getAttribute("sessionNum");
		response.sendRedirect("suitdetail.jsp?register_num=" + num + "#rvMove");
		 
	 }catch(Exception e){
		 e.printStackTrace();
	 }	     
    
    
    
%>
</body>
</html>