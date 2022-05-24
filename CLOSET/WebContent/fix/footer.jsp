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
<script src="../join/commission.js"></script>
<body>
<!--footer-->
<!-- <div class="footer"> -->
<footer class="footer">
    <div class="footer__align">               
        <div class="footer__content">
            <strong>Menu</strong>
            <ul>
                <li style="font-family:'NanumSquare';"><a href="../main/closet.jsp">CLOSET</a></li>
                <li><a href="../suit/suitlist.jsp">정장대여</a></li>
                <%
             if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
 			{
 			%>
              <li><a href="../member/commission.jsp">정장위탁</a>
              </li>
             <%
 			}else{ //로그인 안되었을 때
 			%>        			
  			<li><a href="../join/login.jsp">정장위탁</a>
              </li>
             <%
 			}
             %>
                <li><a href="#">자원봉사</a></li>
            </ul>
        </div>
        <div class="footer__content">
            <strong>MyPage</strong>
            <ul>
            	<%
             if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
 			{
             	String sessionID = (String)session.getAttribute("sessionID");
 			
 			%>
              <li><a href="../member_mypage/mypage.jsp?member_email=<%=sessionID%>">위탁정장</a>
              </li>
             <%
 			}else{ //로그인 안되었을 때
 			%>        			
  			<li><a href="../join/login.jsp">위탁정장</a>
              </li>
             <%
 			}
             if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
 			{
             	String sessionID = (String)session.getAttribute("sessionID");	        			
 			%>
              <li><a href="../member_mypage/mypage_fitting.jsp?member_email=<%=sessionID%>">피팅예약내역</a>
              </li>
             <%
 			}else{ //로그인 안되었을 때
 			%>        			
  			<li><a href="../join/login.jsp">피팅예약내역</a>
              </li>
             <%
 			}
             if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
 			{
             	String sessionID = (String)session.getAttribute("sessionID");	        			
 			%>
              <li><a href="../member_mypage/mypage_mysuit.jsp?member_email=<%=sessionID%>">나의정장</a>
              </li>
             <%
 			}else{ //로그인 안되었을 때
 			%>        			
  			<li><a href="../join/login.jsp">나의정장</a>
              </li>
             <%
 			}
             if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
 			{
             	String sessionID = (String)session.getAttribute("sessionID");	        			
 			%>
              <li><a href="../member_mypage/mypage_review.jsp?member_email=<%=sessionID%>">정장후기</a>
              </li>
             <%
 			}else{ //로그인 안되었을 때
 			%>        			
  			<li><a href="../join/login.jsp">정장후기</a>
              </li>
             <%
 			}
             if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
 			{
             	String sessionID = (String)session.getAttribute("sessionID");	        			
 			%>
              <li><a href="../member_mypage/mypage_pass.jsp?member_email=<%=sessionID%>">개인정보수정</a>
              </li>
             <%
 			}else{ //로그인 안되었을 때
 			%>        			
  			<li><a href="../join/login.jsp">개인정보수정</a>
              </li>
             <%
 			}
             %>
            </ul>
        </div>
        <div class="footer__content">
            <strong>Service Center</strong>
            <ul>
                <li><a href="../service/service_center_notice.jsp">공지사항</a></li>
                <li><a href="../service/service_center_faq.jsp">FAQ</a></li>
                <li><a href="../service/service_center_qna.jsp">1:1문의</a></li>
                
            </ul>
        </div>
        <div class="footer__content">
            <strong>Have a question?</strong>
            <ul>
                <li><img src="../images/location.png" class="footer__icon">(04763) 서울시 성동구 살곶이길 200(사근동)</li>
                <li><img src="../images/call.png" class="footer__icon">+82 392 3929 210</li>
                <li><img src="../images/envelope.png" class="footer__icon">closet@naver.com</li>
            </ul>
        </div>
                 
    </div>
</footer>
</body>
</html>