<%@page import="closet.closetBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="admin_fitting_reservation.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>
<title>Document</title>
<script type="text/javascript">
   function changepage(value)
   {
	   if(value=="0"){
	         location.href="../suit/suitlist.jsp";
	      }
	      else if(value=="1"){//로그인
	         location.href="../join/login.jsp";
	      }
	      else if(value=="2"){//회원가입
	         location.href="../join/signUp.jsp";
	      }
	      else if(value=="3"){//정장관리
	         location.href="../admin_mypage/admin_suitlist.jsp"; 
	      }
		  else if(value=="4"){//위탁정장
		      location.href="../admin_mypage/admin_commission_list1.jsp"; 
		  }
	       else if(value=="5"){//피팅예약
	      location.href="../admin_mypage/admin_fitting_list1.jsp"; 
		   }
			else if(value=="6"){//이용정장
		      location.href="../admin_mypage/admin_appli_list1.jsp"; 
		   }
			else if(value=="7"){//자원봉사
		      location.href="../admin_mypage/admin_volunteer_list1.jsp"; 
		   } 
			else if(value=="8"){//회원정보
		      location.href="../admin_mypage/admin_memberlist.jsp"; 
		   }
			 else if(value=="9"){//고객센터
		      location.href="#"; 
		   } 
   }
</script>
<script>
       $(document).ready(function category(){
           //최상단 체크박스 클릭
           var Kind = '';
           $("#category li").on("click", function(){
              Kind = $(this).val();
              if(Kind == "1"){
                 Kind = "1.자켓";
              }
              else if(Kind == "2"){
                 Kind = "2.셔츠";
              }
              else if(Kind == "3"){
                 Kind = "3.팬츠";
              }
              else if(Kind == "4"){
                 Kind = "4.자켓";
              }
              else if(Kind == "5"){
                 Kind = "5.셔츠/블라우스";
              }
              else if(Kind == "6"){
                 Kind = "6.팬츠";
              }
              else if(Kind == "7"){
                 Kind = "7.치마";
              }
              window.location.href="admin_suitcategory.jsp?Kind="+encodeURI(Kind,"UTF-8");
              
           });
       });
</script>
<!-- <script type="text/javascript">
   function search(val){
      var KeyWord = $("#KeyWord").val();
      /* alert(KeyWord); */
      window.location.href="suitsearch.jsp?KeyWord="+encodeURI(KeyWord,"UTF-8"); 
   }
</script> -->

<script type="text/javascript">
   function office(val){
      /* alert(val); */
      var office = val;
      if(office=="전체"){
         location.href="suitlist.jsp?office='전체'";
      }
      window.location.href="admin_suitoffice.jsp?office="+encodeURI(office,"UTF-8"); 
   }
</script>
</head>
<body>
	<!--header-->
	<div class="header__fixed">
		<div class="header">
			<ul class="header__nav">
				<li class="header__text">
					<%
                    if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
                    { 
                   %>
				
				<li class="header__text" onclick="changepage(1)">로그인</li>
				<li class="header__text" onclick="changepage(2)">회원가입</li>
				<% 
                    }
                     
                    else // 로그인 했을 경우
                    {                                  
                       String sessionID = (String)session.getAttribute("sessionID");
                       String id = sessionID.substring(0, sessionID.indexOf('@'));
                       
                  %>
				<font color="#4d4d4d"><%=id %></font>님

				<%
                   } 
                  %>
				<li class="header__text"><a href="../join/logoutProc.jsp">로그아웃</a></li>
				<li class="header__text"><a href="../suit/suitlist.jsp">회원사이트
						바로가기</a></li>
			</ul>
		</div>

		<!--menu-->
		<div class="bottom__menu">
			<div class="logo__area">
				<a href="admin_suitlist.jsp"> <img src="../images/logo6.png"
					class="logo">
				</a>
			</div>
			<div class="menu">
				<ul class="menu__list1">
					<li class="menu__text" onclick="changepage(3)">정장관리</li>
					<li class="menu__text" onclick="changepage(4)">위탁정장</li>
					<li class="menu__text" onclick="changepage(5)">피팅예약</li>
					<li class="menu__text" onclick="changepage(6)">이용정장</li>
					<li class="menu__text" onclick="changepage(7)">자원봉사</li>
					<li class="menu__text" onclick="changepage(8)">회원정보</li>
					<li class="menu__text" onclick="changepage(9)">고객센터</li>
				</ul>
			</div>
		</div>
	</div>

	<!--main content-->
	<div class="container">
		<div class="container-wrap">
			<form class="form1">
				<h1 class="title1">피팅 예약 내역</h1>

				<table class="table1" id="cartTable">
					<tr class="table__title">


						<td class="td2">
							<h4>정장이미지</h4>
						</td>
						<td class="td2">
							<h4>정장명</h4>
						</td>
						<td class="td4">
							<h4>대여가격</h4>
						</td>
						<td class="td5">
							<h4>보유구청</h4>
						</td>
						<td class="td5">
							<h4>방문날짜</h4>
						</td>
						<td class="td6">
							<h4>방문시간</h4>
						</td>

					</tr>

					<tbody>
						<tr class="table__content">
							<td class="content2"><img src="../images/a1.png"
								class="icon"> </a></td>
							<td class="content2">그레이 헤링본 자켓</td>
							<td class="content4">10000원</td>
							<td class="content5">용산구청</td>
							<td class="content5">2019-11-08</td>
							<td class="content6">09:00~11:00</td>
						</tr>
						<tr class="table__content">
							<td class="content2"><img src="../images/x1.png"
								class="icon"> </a></td>
							<td class="content2">블랙 스트레치 자켓</td>
							<td class="content4">10000원</td>
							<td class="content5">용산구청</td>
							<td class="content5">2019-11-08</td>
							<td class="content6">11:00~13:00</td>
						</tr>
					</tbody>
				</table>
				<!-- <input type="button" value="피팅예약하기" onclick="checkbox(this)" class="table__button2" >
            	<input type="button" value="쇼핑계속하기" onclick="history.back()" class="table__button2"> -->
				<input type="button" value="목록보기"
					onclick="location.href='../admin_mypage/admin_fitting_list1.jsp'"
					class="button1">
			</form>
		</div>
	</div>

	<!--footer-->
	<div class="footer">
		<div class="footer__align">
			<div class="footer__content">
				<strong>Menu</strong>
				<ul>
					<li style="font-family: 'NanumSquare';"><a
						href="../main/closet.jsp">CLOSET</a></li>
					<li><a href="../suit/suitlist.jsp">정장대여</a></li>
					<%
	                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
	        			{
	        			%>
					<li><a href="../member/commission.jsp">정장위탁</a></li>
					<%
	        			}else{ //로그인 안되었을 때
	        			%>
					<li><a href="../join/login.jsp">정장위탁</a></li>
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
					<li><a
						href="../member_mypage/mypage.jsp?member_email=<%=sessionID%>">위탁정장</a>
					</li>
					<%
	        			}else{ //로그인 안되었을 때
	        			%>
					<li><a href="../join/login.jsp">위탁정장</a></li>
					<%
	        			}
	                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
	        			{
	                    	String sessionID = (String)session.getAttribute("sessionID");	        			
	        			%>
					<li><a
						href="../member_mypage/mypage_fitting.jsp?member_email=<%=sessionID%>">피팅예약내역</a>
					</li>
					<%
	        			}else{ //로그인 안되었을 때
	        			%>
					<li><a href="../join/login.jsp">피팅예약내역</a></li>
					<%
	        			}
	                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
	        			{
	                    	String sessionID = (String)session.getAttribute("sessionID");	        			
	        			%>
					<li><a
						href="../member_mypage/mypage_mysuit.jsp?member_email=<%=sessionID%>">나의정장</a>
					</li>
					<%
	        			}else{ //로그인 안되었을 때
	        			%>
					<li><a href="../join/login.jsp">나의정장</a></li>
					<%
	        			}
	                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
	        			{
	                    	String sessionID = (String)session.getAttribute("sessionID");	        			
	        			%>
					<li><a
						href="../member_mypage/mypage_review.jsp?member_email=<%=sessionID%>">정장후기</a>
					</li>
					<%
	        			}else{ //로그인 안되었을 때
	        			%>
					<li><a href="../join/login.jsp">정장후기</a></li>
					<%
	        			}
	                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
	        			{
	                    	String sessionID = (String)session.getAttribute("sessionID");	        			
	        			%>
					<li><a
						href="../member_mypage/mypage_pass.jsp?member_email=<%=sessionID%>">개인정보수정</a>
					</li>
					<%
	        			}else{ //로그인 안되었을 때
	        			%>
					<li><a href="../join/login.jsp">개인정보수정</a></li>
					<%
	        			}
	                    %>
				</ul>
			</div>
			<div class="footer__content">
				<strong>Service Center</strong>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">1:1문의</a></li>

				</ul>
			</div>
			<div class="footer__content">
				<strong>Have a question?</strong>
				<ul>
					<li><img src="../images/location.png" class="footer__icon">(04763)
						서울시 성동구 살곶이길 200(사근동)</li>
					<li><img src="../images/call.png" class="footer__icon">+82
						392 3929 210</li>
					<li><img src="../images/envelope.png" class="footer__icon">closet@naver.com</li>
				</ul>
			</div>

		</div>
	</div>

</body>
</html>