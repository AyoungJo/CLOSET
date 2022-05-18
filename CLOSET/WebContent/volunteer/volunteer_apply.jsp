<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="volunteer_apply.css">
     <script
    type="text/javascript"
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
      else if(value=="3"){//고객센터
         /*location.href="signUp.jsp" */
      }
      else if(value=="4"){//closet
         location.href="../main/closet.jsp"; 
      }
      else if(value=="5"){//정장대여
         location.href="../suit/suitlist.jsp"; 
      }
      else if(value=="6"){//남자정장
         location.href="../suit/suitlist.jsp"; 
      }
      else if(value=="7"){//여자정장
         location.href="../suit/suitlist.jsp"; 
      }
      else if(value=="8"){//자원봉사
          location.href="../volunteer/volunteer.jsp"; 
       }
      else if(value=="13"){//장바구니
          location.href="../suit/cart.jsp"; 
       }
      else if(value=="15"){//검색페이지
          location.href="../suit/suitsearch.jsp"; 
       }
   }
</script>   

 <script type="text/javascript" >
 <%
 	request.setCharacterEncoding("utf-8");
 %>
 

	function voluncheck()
	{	
		form = eval("document.volunteerForm");
		
		 if(form.volunteer_date.value==""){
			alert("봉사활동날짜를 선택해주세요");
			form.volunteer_date.focus();
			return false;
		 } 	
		 if(form.volunteer_time.value=="0"){
			form.volunteer_time.focus();
			alert("봉사활동시간을 선택해주세요");
			return false;
		 }
		if(form.volunteer_office.value=="0"){
			alert("봉사활동구청을 선택해주세요");
			form.volunteer_office.focus();
			return false;
		}
	    return true;
	    
	}
</script>
<script>
       $(document).ready(function sex(){
           //최상단 체크박스 클릭
           var Sex = '';
           $("#sex li").on("click", function(){
        	  Sex = $(this).val();
              if(Sex == "1"){
            	  Sex = "남성의류";
              }
              else if(Sex == "2"){
            	  Sex = "여성의류";
              }
              window.location.href="../suit/suitsex.jsp?Sex="+encodeURI(Sex,"UTF-8");
              
           });
       });
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
                </li>
    						<li class="header__text"><a href="../join/logoutProc.jsp">로그아웃</a></li>
    					<%
    					} 
    					%>
                <li class="header__text"><a href="#">고객센터</a></li>
            </ul>
        </div>
        
        <!--menu-->
        <div class="bottom__menu">
            <div class="logo__area">
               <a href="#">
               <img src="../images/logo6.png" class="logo" onclick="changepage(0)">
               </a>
            </div>
            <div class="menu">
                <ul class="menu__list1"> 
                    <li class="menu__text1" onclick="changepage(4)" onmouseover="this.style.color='#30cfc0'" onmouseout="this.style.color='#000000'">CLOSET</li>|
                    <li class="menu__text1"  onmouseover="this.style.color='#30cfc0'" onmouseout="this.style.color='#000000'">정장대여</a>
                        <ul class="sub-menu__list" id="sex">
                            <li class="sub-menu__list__text" value="1" onclick="sex()" onmouseover="this.style.color='#30cfc0'" onmouseout="this.style.color='#000000'">남자 정장</li>
                            <li class="sub-menu__list__text" value="2" onclick="sex()" onmouseover="this.style.color='#30cfc0'" onmouseout="this.style.color='#000000'">여자 정장</li>
                        </ul>
                    </li>|
                    <%
                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
        			{
        			%>
	                    <li class="menu__text1"><a href="../member/commission.jsp">정장위탁</a>
	                    </li>|
                    <%
        			}else{ //로그인 안되었을 때
        			%>        			
	        			<li class="menu__text1"><a href="../join/login.jsp">정장위탁</a>
	                    </li>|
                    <%
        			}
                    %>
                    <li class="menu__text1"><a href="../volunteer/volunteer.jsp">자원봉사</a>
                    </li>|
                    <%
                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
                    {
                    	String sessionID = (String)session.getAttribute("sessionID");
        			%>
                    <li class="menu__text1"><a href="../member_mypage/mypage.jsp?member_email=<%=sessionID%>">마이페이지</a>
                        <ul class="sub-menu__list">
                            <li class="sub-menu__list__text"><a href="../member_mypage/mypage.jsp?member_email=<%=sessionID%>">위탁정장</a></li>
                            <li class="sub-menu__list__text"><a href="../member_mypage/mypage_fitting.jsp?member_email=<%=sessionID%>">피팅예약내역</a></li>
                            <li class="sub-menu__list__text"><a href="../member_mypage/mypage_mysuit.jsp?member_email=<%=sessionID%>">나의정장</a></li>
                            <li class="sub-menu__list__text"><a href="../member_mypage/mypage_review.jsp?member_email=<%=sessionID%>">정장후기</a></li>
                            <li class="sub-menu__list__text"><a href="../member_mypage/mypage_volunteer.jsp?member_email=<%=sessionID%>">자원봉사</a></li>
                            <li class="sub-menu__list__text"><a href="../member_mypage/mypage_pass.jsp?member_email=<%=sessionID%>">개인정보수정</a></li>
                            <li class="sub-menu__list__text"><a href="../member_mypage/mypage.jsp?member_email=<%=sessionID%>">1:1문의</a></li>
                        </ul>
                    </li>
                    <%
        			}else{ //로그인 안되었을 때
        			%>       			
	        			<li class="menu__text1"><a href="../join/login.jsp">마이페이지</a>
                    </li>
                    <%
        			}
                    %>     
                    
                </ul>
                <ul class="menu__list2">     
                    <li class="menu__text2">    
                            <button class="s__link" onclick="changepage(13)"><img src="../images/hanger1.png" class="ce__icon">피팅 옷장</button>
                    </li>
                    <li class="menu__text2">
                            <button class="s__link" onclick="changepage(15)"><img src="../images/search.png" class="se__icon" >검색</button>
                    </li>
                </ul>
               
            </div>
        </div>
    </div>
    <%
    if(session.getAttribute("sessionID") == null){
		
		response.sendRedirect("../join/login.jsp");
	}else{
		String member_email = (String)session.getAttribute("sessionID");
	}
    %>
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
      <div class="footer">
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
                      <li><a href="#">공지사항</a></li>
                      <li><a href="#">FAQ</a></li>
                      <li><a href="#">1:1문의</a></li>
                      
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
      </div>

</body>
</html>