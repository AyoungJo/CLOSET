<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="admin_commission_confirm.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>
<title>Insert title here</title>
<jsp:useBean id="cdao" class="closet.closetDAO" scope="application" />
<%
	int referral_num = Integer.parseInt(request.getParameter("referral_num"));
	
	closetBean cbean = cdao.getOneReferral(referral_num);
		
	/* int num = cbean.getReferral_num();
    session.setAttribute("sessionNum", num);
    
    int rnum = Integer.parseInt(session.getAttribute("sessionNum").toString()); */
%>
<script type="text/javascript">
     function register_confirm(){
    	var con = confirm("정장 위탁 신청서를 기반으로 등록하시겠습니까?");
    	//확인을 눌렀을 시
    	if(con == true){
    		    		
    		location = "admin_register.jsp?referral_num="+<%=referral_num%>;
    	}    		
	} 	
     
</script>
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

</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
%>

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

	<!--category&product-->
	<div class="content" style="min-height: 650px;">
		<!--main content-->
		<div class="container">
			<div class="container-wrap">
				<h1 class="title1">정장위탁 신청서 확인</h1>

				<form class="form1"
					action="admin_register.jsp?referral_num=<%=cbean.getReferral_num()%>"
					method="post">
					<table class="table1">
						<tr>
							<td class="td1"><h4>위탁자명</h4></td>
							<td>
								<p class="radio1"><%=cbean.getReferral_username()%></p>
							</td>
						</tr>
						<tr>
							<td class="td1"><h4>구분</h4></td>
							<td>
								<p class="radio1"><%=cbean.getReferral_sex() %></p>
							</td>
						</tr>
						<tr>
							<td class="td1"><h4>정장 카테고리 및 수량</h4></td>
							<td class="td2">
								<ul class="choice__cate">
									<li class="choice__cate__content"><span class="check1">자켓</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cbean.getReferral_outer()%>개</li>
									<li class="choice__cate__content"><span>셔츠/블라우스</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cbean.getReferral_top() %>개</li>
									<li class="choice__cate__content"><span>팬츠</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cbean.getReferral_bottom() %>개</li>
									<li class="choice__cate__content"><span>스커트</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cbean.getReferral_skirt() %>개</li>
								</ul>
							</td>
						</tr>

						<tr>
							<td class="td1"><h4>방문날짜</h4></td>
							<td class="td2">
								<p class="radio1"><%=cbean.getReferral_visit() %></p>
							</td>
						</tr>
						<tr>
							<td class="td1"><h4>방문구청</h4></td>
							<td class="td2">
								<p class="radio1"><%=cbean.getReferral_office() %></p>
							</td>
						</tr>
						<tr>
							<td class="td1"><h4>수익금 기부 동의여부</h4></td>
							<td class="td2">
								<p class="radio1"><%=cbean.getReferral_agreement() %></p>
							</td>
						</tr>
					</table>
					<input class="button1" type="submit" value="정장등록"
						onclick=register_confirm()> <input class="button2"
						type="button" value="목록보기"
						onclick="location.href='../admin_mypage/admin_commission_list1.jsp'">
				</form>

			</div>
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