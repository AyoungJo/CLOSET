<%@page import="closet.closetBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="mypage_volunteer.css">
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
    
<!--category&product-->
    <div class="content" >  
        <!--main content-->
       <div class="category">
            <h3 class="category__title">Mypage</h3>
            <ul class="category__list">
                <li class="category__text"><a href="mypage.jsp">위탁정장</a></li>
                <li class="category__text"><a href="mypage_fitting.jsp">피팅예약내역</a></li>
                <li class="category__text"><a href="mypage_mysuit.jsp">나의정장</a></li>
                <li class="category__text"><a href="mypage_review.jsp">정장후기</a></li>
                <li class="category__text"><a href="mypage_volunteer.jsp">자원봉사</a></li>
                <li class="category__text"><a href="mypage_pass.jsp">개인정보수정</a></li>
                <li class="category__text"><a href="#">1:1 문의</a></li>
            </ul>
        </div>

        <div class="container" style="min-height: 650px;">
            <div class="container-wrap">
               <h1 class="title1">자원봉사
                   <span class="title2">자원봉사 신청 내역 조회가 가능합니다.</span>
               </h1>
               
               <h3 class="title3">
                자원봉사신청서 내역
                </h3>
                <form class="form1">
                    <table class="table1">
                        <tr class="table__title">
                            <td class="td1">
                                <h4>번호</h4>
                            </td>
                            <td class="td3">
                                <h4>봉사날짜</h4>
                            </td>
                            <td class="td2">
                                <h4>활동시간</h4>
                            </td>
                            <td class="td3">
                                <h4>활동구청</h4>
                            </td>
                        </tr>
                        <jsp:useBean id="cdao" class="closet.closetDAO"/>
              			<%-- <jsp:useBean id="cbean" class="closet.closetBean"/> --%>
                        <%
                        	String member_email = (String)session.getAttribute("sessionID");
					    	ArrayList<closetBean> v = cdao.getVolunteer(member_email);
					    	
					    	for(int i=0; i<v.size(); i++){
					    		System.out.println(v.size());
					    		closetBean vbean = v.get(i);
					    		/* int count = 1; */
			    		%>
                        <tr class="table__content">
                            <td class="content1"><%= vbean.getVolunteer_num() %></td>
                            <td class="content2">
                                <%=vbean.getVolunteer_date() %>
                            </td>
                            <td class="content1">
                            <%
                            	String time = vbean.getVolunteer_time();
                            	if(time.equals("TIME1")){
                            	%>
                                	<%=vbean.getVolunteer_time() %> 오전 9:00 - 오후 12:00
                                <%
                            	}else if(time.equals("TIME2")){
                            	%>
                            		<%=vbean.getVolunteer_time() %> 오후 12:00 - 오후 15:00
                            	<%
                            	}else if(time.equals("TIME3")){
                                %>
                               		<%=vbean.getVolunteer_time() %> 오후 15:00 - 오후 18:00
                            	<%
                            	}
                            	%>
                            </td>
                            <td class="content2">
                               	 <%=vbean.getVolunteer_office() %>
                            </td>
                        </tr>
                        <%    
					   		}
					    %>
                    </table>
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