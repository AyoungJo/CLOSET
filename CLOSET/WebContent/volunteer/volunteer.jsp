<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<script type="text/javascript"
 	src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>
<style type="text/css">
	@import url("../fix/header.css");
	@import url("../fix/footer.css");	
</style>
<link rel="stylesheet" href="volunteer.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");   
%> 

	<!--header-->
	<jsp:include page="../fix/header.jsp" />	

	<jsp:useBean id="cdao" class="closet.closetDAO"/>
   
	<script>   
		function volunapply(){			
			location.href = "../volunteer/volunteer_apply.jsp";	
		}
	</script>
	
    <!--main content-->
     <!--list-top-->     
	     <div class="list-top">
	         <img src="../images/back_c.jpg" class="list-top__img">
	         <h2 class="suit-share__title"><span>VOLUNTEER</span>&nbsp;RECRUIT</h2>
	         <p class="suit-share__text">              
	           	각 지역구청에서 CLOSET 운영에 도움을 주실 자원봉사자를 모집합니다.<br>
	           	의류정리, 의류포장, 다림질 등 CLOSET 운영에 관심 있는 학생들과 일반봉사자분들의 많은 참여를 기다립니다.<br>           
	     </div>
	    <!--category&product-->
	    <div class="container">
		    <div class="content">   
		    <!--product-->
		        <div class="product">
		           <form>
		            <table class="product__table">
		                <tr class="product__line">
		                    <td class="product__content__title">
		                       	활동가능시간
		                    </td>
		                    <td class="product__content">
		                        TIME1. 오전 9:00 - 오후 12:00 (3시간)<br>
		                        TIME2. 오후 12:00 - 오후 15:00 (3시간)<br>
		                        TIME3. 오후 15:00 - 오후 18:00 (3시간)
		                        
		                    </td>
		                </tr>
		                <tr class="product__line">
		                    <td class="product__content__title">
		                       	모집대상
		                    </td>
		                    <td class="product__content">
		                        	연령 17세 이상 / 정기적으로 봉사할 계획이 있으신 분 누구나
		                    </td>
		                </tr>
		                <tr class="product__line">
		                    <td class="product__content__title">
		                       	활동장소
		                    </td>
		                    <td class="product__content">
		                        	지역구청
		                    </td>
		                </tr>
		                <tr class="product__line">
		                    <td class="product__content__title">
		                      	 활동내용
		                    </td>
		                    <td class="product__content">
		                        	의류정리, 의류포장, 다림질 등
		                    </td>
		                </tr>
		                <tr class="product__line">
		                    <td class="product__content__title">
		                     	  봉사특전
		                    </td>
		                    <td class="product__content">
		                        1365 자원봉사 시간 승인
		                    </td>
		                </tr>
		            </table>
		            <div class="btn_part">
		                    <input type="button" value="자원봉사 신청" onclick="javascript:volunapply()" class="btn_ok">
		            </div>
		            </form>
		        </div>
		    </div>
    	</div>   
    
	<!--footer-->    
    <jsp:include page="../fix/footer.jsp" />

</body>
</html>