<%@page import="closet.closetBean"%>
<%@page import="closet.closetDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="suitdetail_review.css">
	<meta http-equiv="Content-Type" charset="UTF-8">    
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
    <script src="../join/commission.js"></script>
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
		else if(value=="13"){//장바구니
	          location.href="../suit/cart.jsp"; 
	       }
	      else if(value=="15"){//검색페이지
	          location.href="../suit/suitsearch.jsp"; 
	       }
	}
</script>    
<script type="text/javascript">
<%
   request.setCharacterEncoding("utf-8");
%>
   function review_check()
   {
       reviewForm = eval("document.reviewForm");
      if(reviewForm.review_title.value == "")
      {
          alert("제목를 입력해주세요");   
          history.back();
          reviewForm.review_title.focus();
          return false;
      }
      if(reviewForm.review_content.value == "")
      {
          alert("내용을 입력해주세요"); 
          history.back();
          reviewForm.review_content.focus();
          return false;
      }
      if(reviewForm.review_img.value == "")
      {
          alert("이미지를 첨부해주세요");
          history.back();
          return false;
      }
      
            /* location.href = "registerProc.jsp"; */
         return true; 
      
   } 
</script>
<script type="text/javascript">
   function switch_img(divName, totalImgs){
      for (var i=1; i<=totalImgs; i++) {
         var showDivName = 'img_' + i;
         var showObj = document.getElementById(showDivName);
         if (showDivName == divName)
            showObj.style.display = 'block';
         else
            showObj.style.display = 'none';
         }
   }
</script>
<script>
//정장후기 보기 버튼 클릭 시, 후기란으로 이동
   $(document).ready(function(){
      $('#rvbtn').click(function(){
         var offset = $('#rvMove').offset();
         $('html').animate({scrollTop : offset.top}, 400);
      });
   });
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
<title>Insert title here</title>
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
        <!--detail product-->
        <form name= "cartForm" action="cart.jsp" method="post" onsubmit="return loginCheck()">
        <%
        	String name = (String)session.getAttribute("sessionName");
        	String mainimg = (String)session.getAttribute("sessionMainImg");
        	String detailimg1 = (String)session.getAttribute("sessionDetailImg1");
        	String detailimg2 = (String)session.getAttribute("sessionDetailImg2");
        	String detailimg3 = (String)session.getAttribute("sessionDetailImg3");
        	String detailimg4 = (String)session.getAttribute("sessionDetailImg4");
        	
        	String color = (String)session.getAttribute("sessionColor");
        	String size = (String)session.getAttribute("sessionSize");
        	String office = (String)session.getAttribute("sessionOffice");
        	String price = (String)session.getAttribute("sessionPrice");
        	
        	int snum = Integer.parseInt(session.getAttribute("sessionNum").toString());
        %>
        <div class="detail-product">
            <div class="detail__img__box">
                <ul class="small__product__list">
                    <li class="small__product__img">
                       <a href="javascript:void(0)" onclick="switch_img('img_1', 5);"><img src="../upload/<%=mainimg%>" alt=""/></a>
                    </li>
                    <li class="small__product__img">
                       <a href="javascript:void(0)" onclick="switch_img('img_2', 5);"><img src="../upload/<%=detailimg1%>" alt=""/></a>
                    </li>
                    <li class="small__product__img">
                       <a href="javascript:void(0)" onclick="switch_img('img_3', 5);"><img src="../upload/<%=detailimg2%>" alt=""/></a>
                    </li>
                    <li class="small__product__img">
                       <a href="javascript:void(0)" onclick="switch_img('img_4', 5);"><img src="../upload/<%=detailimg3%>" alt=""/></a>
                    </li>
                    <li class="small__product__img">
                       <a href="javascript:void(0)" onclick="switch_img('img_5', 5);"><img src="../upload/<%=detailimg4%>" alt=""/></a>
                    </li>
                </ul>
            </div> 
            <div id="img_1"><img src="../upload/<%=mainimg%>" class="big__product__img"/></div>
            <div id="img_2" style="display:none;"><img src="../upload/<%=detailimg1%>" class="big__product__img"/></div>
         <div id="img_3" style="display:none;"><img src="../upload/<%=detailimg2%>" class="big__product__img"/></div>
         <div id="img_4" style="display:none;"><img src="../upload/<%=detailimg3%>" class="big__product__img"/></div>
         <div id="img_5" style="display:none;"><img src="../upload/<%=detailimg4%>" class="big__product__img"/></div>   
            <div class="detail-product__content">
                <h2 class="detail-product__title"><%=name %></h2>
                <ul class="detail-product__list">
                    <li class="detail-product__text">
                        <h3>정장 색상</h3>
                        <p><%=color %></p>
                    </li>
                    <li class="detail-product__text">
                        <h3>사이즈</h3>
                        <p><%=size %></p>
                    </li>
                    <li class="detail-product__text">
                        <h3>보유 구청</h3>
                        <p><%=office %></p>
                    </li>
                    <li class="detail-product__text">
                        <h3>대여 가격</h3>
                        <p><%=price %></p>
                    </li>
                    <li class="detail-product__text">
                        <h3>피팅 날짜 선택</h3>
                        <input type="date" class="select__date">
                    </li>
                    <li class="detail-product__text">
                        <h3>피팅 시간 선택</h3>
                        <select name="fitting_time" class="select__date">
                           <option selected>-</option>
                             <option value="09:00~11:00">09:00~11:00</option>
                             <option value="11:00~13:00">11:00~13:00</option>
                             <option value="13:00~15:00">13:00~15:00</option>
                             <option value="15:00~17:00">15:00~17:00</option>
                        </select>
                    </li>
                </ul>
                <div class="detail-page__button">
                    <ul>
                        <li><input class="review__button" type="button" id="rvbtn" value="정장후기 보기" onclick="rvMove()"></li>
                        <li><input class="reservation__button" type="submit" value="피팅 장바구니 담기"></li>
                        
                    </ul>
                </div>
            </div>     
        </div>
        </form>    
        
        <!--review part-->
        <div class="review-part" id="rvMove">
            <h2 class="review-part__title">REVIEW</h2>
            <form name="reviewForm"  method="post" action="suitdetail_reviewProc.jsp" 
            	onsubmit="return review_check()" enctype="multipart/form-data" >
            <table class="table1">
                <tr>
                    <td class="table__title1"><h4>제목</h4></td>
                    <td class="table__content">
                        <input type="text" class="table__input" name="review_title">
                    </td>
                </tr>
                <tr>
                    <td class="table__title2"><h4>내용</h4></td>
                    <td class="table__content">
                        <textarea class="table__input2" cols="72" rows="100" name="review_content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="table__title3"><h4>이미지</h4></td>
                    <td class="table__content">
                        <input type="file" class="table__input3" name="review_img" accept=".gif, .jpg, .png, .bmp"/>
                    </td>
                </tr>        
                     
            </table>
                <div class="review__button__part">
                    <input type="submit" value="작성완료" class="review__btn">
                </div>
            </form>
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