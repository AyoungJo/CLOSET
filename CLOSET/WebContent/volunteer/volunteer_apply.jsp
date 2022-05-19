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
	@import url("../fix/footer.css")	
</style>
    <link rel="stylesheet" href="volunteer_apply.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");   
%> 

	<!--header-->
	<jsp:include page="../fix/header.jsp" />	
	
	<jsp:useBean id="cdao" class="closet.closetDAO"/>
 
    <!--category&product-->
    <div class="content" style="min-height: 650px;">   
    <!--product-->
        <div class="product">
        <%
        	String member_email = (String)session.getAttribute("sessionID");
        %>
           <form name="volunteerForm" action="volunteer_applyProc.jsp" method="post"
           	onsubmit="return voluncheck();" >
               <h3 class="title1">자원봉사 신청서</h3>
               <table class="table1">
               		<input type="hidden" name="volunteer_username" value=<%=member_email %> /> 
                    <tr>
                        <td class="table__title1">
                            <h5>봉사활동 날짜</h5>
                        </td>
                        <td class="table__content">
                            <input class="table__input" type="date" name="volunteer_date">
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title1">
                            <h5>활동시간</h5>
                        </td>
                        <td class="table__content">
                            <select class="table__input" name="volunteer_time">
                            		<option value="0" selected>-</option>
                                    <option value="TIME1">TIME1. 오전 9:00 - 오후 12:00</option>
                                    <option value="TIME2">TIME2. 오후 12:00 - 오후 15:00</option>
                                    <option value="TIME3">TIME3. 오후 15:00 - 오후 18:00</option>                                    
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title1">
                            <h5>활동구청</h5>
                        </td>
                        <td class="table__content">
                            <select class="table__input" name="volunteer_office">
                                    <option value="0" selected >-</option>
                            		<option>강남구청</option>
                                    <option>강동구청</option>
                                    <option>강북구청</option>
                                    <option>강서구청</option>
                                    <option>관악구청</option>
                                    <option>광진구청</option>
                                    <option>구로구청</option>
                                    <option>금천구청</option>
                                    <option>노원구청</option>
                                    <option>도봉구청</option>
                                    <option>동대문구청</option>
                                    <option>동작구청</option>
                                    <option>마포구청</option>
                                    <option>서대문구청</option>
                                    <option>서초구청</option>
                                    <option>성동구청</option>
                                    <option>성북구청</option>
                                    <option>송파구청</option>
                                    <option>양천구청</option>
                                    <option>영등포구청</option>
                                    <option>용산구청</option>
                                    <option>은평구청</option>
                                    <option>중구청</option>
                                    <option>중랑구청</option>
 									<option>종로구청</option>
                                </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="td__calendar">
                             <iframe src="https://calendar.google.com/calendar/embed?height=700&amp;wkst=1&amp;bgcolor=%23ffffff&amp;ctz=Asia%2FSeoul&amp;src=Y2xvc2V0bWFzdGVyMjAxOUBnbWFpbC5jb20&amp;color=%2322AA99&amp;showTitle=1&amp;title=CLOSET%20%EC%9E%90%EC%9B%90%EB%B4%89%EC%82%AC%20%EC%8B%A0%EC%B2%AD%ED%98%84%ED%99%A9&amp;showCalendars=1&amp;showPrint=0&amp;showTabs=0&amp;showNav=1" style="border-width:0" width="900" height="700" frameborder="0" scrolling="no"></iframe>
                        </td>
                    </tr>
                </table>
                <div class="btn_part">
                    <input type="submit" value="자원봉사 신청" class="btn_ok">
                </div>
            </form>
        </div>
    </div>
    
	<!--footer-->    
    <jsp:include page="../fix/footer.jsp" />

</body>
</html>