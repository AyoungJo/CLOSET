<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type">
<script type="text/javascript"
 	src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>
<style type="text/css">
	@import url("../fix/header.css");
	@import url("../fix/footer.css");	
</style>    
<link rel="stylesheet" href="service_center_notice_admin_modified.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");   
%> 

	<!--header-->
	<jsp:include page="../fix/header.jsp" />	

	<jsp:useBean id="cdao" class="closet.closetDAO"/>
    
    <!--main content-->
    <!--category&product-->
    <div class="container">
        <div class="container-wrap">

            <h1 class="title1">공지사항</h1>
            
            <form class="form1">
                <table class="table1">
                    <tr>
                        <td class="table__title1">
                            <h5>제목</h5>
                        </td>
                        <td class="table__content">
                            <input type="text" class="table__input">
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title1">
                            <h5>작성자</h5>
                        </td>
                        <td class="table__content">
                            <input type="text" class="table__input">
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title1">
                            <h5>작성일</h5>
                        </td>
                        <td class="table__content">
                            <input type="date" class="table__input">
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title2">
                            <h5>내용</h5>
                        </td>
                        <td class="table__content">
                            <textarea class="table__input2" cols="72" rows="100"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title3">
                            <h5>이미지</h5>
                        </td>
                        <td class="table__content">
                            <input type="file" name="pic" class="table__input3" />
                        </td>
                    </tr>

                </table>
                <div class="btn_part">
                    <input type="button" value="수정 완료" class="btn_ok">
                </div>
            </form>

        </div>
    </div>

	<!--footer-->    
    <jsp:include page="../fix/footer.jsp" />

</body>
</html>