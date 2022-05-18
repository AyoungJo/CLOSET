<%@page import="closet.closetBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta charset="UTF-8">
<link rel="stylesheet" href="admin_commission_list1.css">
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
<script type="text/javascript">
     function btn_alt(){
    	//위탁상태
		var commission=document.getElementById('commission_condition');
    	//commission.id='commission_condition_'+(cnt);
		commission.disabled=false; 
		 //등록상태
		var register=document.getElementById('register_condition');
    	//register.id='register_condition_'+(cnt);
		register.disabled=false;
		//버튼 클릭시 버튼명 변경
	   	var button = document.getElementById('button');
		//button.id='button_'+(cnt);
	   	   if (button.value=="확인"){
	   		   commission.disabled=true; 
	   		   register.disabled=true;
	   		   button.value = "수정";
	   	   }
	   	   else
	   		   button.value = "확인";
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
	<jsp:useBean id="cdao" class="closet.closetDAO" />
	<jsp:setProperty name="cbean" property="*" />


	<div class="container">
		<div class="container-wrap" style="min-height: 650px;">

			<h1 class="title1">정장위탁 신청서 목록</h1>
			<form class="form1">
				<table class="table1">
					<tr class="table__title">
						<td class="td1">번호</td>
						<td class="td2">위탁자</td>
						<td class="td3">제출날짜</td>
						<td class="td3">방문날짜</td>
						<td class="td4">위탁개수</td>
						<td class="td4">위탁상태</td>
						<td class="td4">등록상태</td>
						<td class="td1"><input class="table__button" type="button"
							id="button" onclick="btn_alt()" value="수정"></td>
					</tr>
					<%
    	ArrayList<closetBean> c = cdao.getAllReferral();
    	
    	for(int i=0; i<c.size(); i++){
    		closetBean cbean = c.get(i);
    		int suit_count = cbean.getReferral_outer() 
    						+ cbean.getReferral_top()
    						+ cbean.getReferral_bottom()
    						+ cbean.getReferral_skirt();
    		int count = 1;
    		%>
					<tr class="table__content" id="tr">
						<td class="content1"><%=cbean.getReferral_num() %></td>
						<td class="content2"><a
							href="admin_commission_confirm.jsp?referral_num=<%=cbean.getReferral_num() %>"
							class="table__link"><%=cbean.getReferral_username() %></a></td>
						<td class="content3"><%=cbean.getReferral_date() %></td>
						<td class="content3"><%=cbean.getReferral_visit() %></td>
						<td class="content4"><%= suit_count %></td>
						<td class="content4"><select name="commission_condition"
							id="commission_condition" class="commission_option"
							disabled="disabled">
								<option>위탁 미완료</option>
								<option>위탁 완료</option>
						</select></td>
						<td class="content4"><select name="register_condition"
							id="register_condition" class="register_option"
							disabled="disabled">
								<option>미등록</option>
								<option>등록 중</option>
								<option>등록완료</option>
						</select></td>
						<td class="content5">&nbsp;</td>
					</tr>
					<%    
          }    
                     %>
				</table>
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