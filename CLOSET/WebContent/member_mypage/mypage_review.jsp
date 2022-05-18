<%@page import="java.util.ArrayList"%>
<%@page import="closet.closetDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="mypage_review.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.js"></script>
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
<script>
//정장후기 보기 버튼 클릭 시, 후기란으로 이동
   $(document).ready(function(){
      $('#rvbtn').click(function(){
         var offset = $('#rvMove').offset();
         $('html').animate({scrollTop : offset.top}, 400);
      });
   });
</script> 
<jsp:useBean id="cdao" class="closet.closetDAO"/> 
 
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
   closetBean rbean = new closetBean();
   
      
      /* closetDAO cdao = closetDAO.getInstance(); */
      
      String member_email= (String)session.getAttribute("sessionID");
      /* session.setAttribute("sessionID", member_email); */
      /* cdao.insertReview(register_num, rbean, member_email); */
      
      /* int review_num = Integer.parseInt(request.getParameter("review_num")); */
      /* closetBean review = cdao.getOneReview(review_num); */  
      
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
    
    <!--main content-->
    <!--category&product-->
    <div class="content">
        <!--category-->
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
               <h1 class="title1">정장 후기
                   <span class="title2">이용한 정장에 대해 작성한 후기를 확인할 수 있습니다.</span>
               </h1>
            
               
                <h3 class="title3">
                <%
                	/* closetDAO cdao = cdao.getInstance(); */
                	member_email= (String)session.getAttribute("sessionID");
	                int mreview_count = 0;
	                mreview_count = cdao.mreviewCount(member_email);
                %>
                	작성완료 후기(<%=mreview_count %>)
                </h3>
                <form class="form1">
                    <table class="table1">
                    <%
		                int totalCount = 0;
		                totalCount = mreview_count;
		                int pageSize=6; //페이지당 12개씩 보이게 함
		                String strPageNum = request.getParameter("pageNum");
		                if(strPageNum == null){
		                   strPageNum = "1";
		                }
		                int pageNum=Integer.parseInt(strPageNum);
		                int startRow = (pageNum-1)*pageSize +1;
		                int endRow = pageNum*pageSize;
		            %>
		            <%
			             ArrayList<closetBean> c = cdao.getMemberReview(startRow, endRow, member_email);
			              
			             int j=0;
			             for(int i=0; i<c.size(); i++){
			                //ArrayList로부터 빈즈클래스를 하나씩 꺼내서 출력함.
			                    closetBean cbean = c.get(i);
			                    if(j%3==0){//한 행에 데이터 3개를 놓기위해서
			           %> 
                        <tr class="product__line">
                        <%
			               } 
			            %>
                        
                            <td class="product__content">
                                <a href="mypage_myreview.jsp?member_email=<%=member_email %>&&register_num=<%=cbean.getRegister_num()%>#rvMove">
		                            <img class="product__img" src="../upload/<%=cbean.getRegister_mainimg() %>" >
		                            <h4 class="product__content__title"><%=cbean.getRegister_name()%></h4>
		                            <%-- <p class="product__content__price"><%=cbean.getReview_date() %></p> --%>
		                            <p class="product__content__button">작성후기보기</p>
		                        </a>
                            </td>
                            <%  
				               j++;
				               }
				            %>
                        </tr>
                    </table>
                   <!--페이지 넘버링  -->         
           <div class="bd-color-grey">
              <div class="page_number">   
                 <%
	                 closetBean cbean = new closetBean();
	                 int num = cbean.getRegister_num();
	                 session.setAttribute("sessionNum", num);
	                 
	                 //session으로 가져오기
	                 int snum = Integer.parseInt(session.getAttribute("sessionNum").toString());
                     if(totalCount>0){
                        int pageCount = totalCount/pageSize +(totalCount%pageSize == 0? 0:1);
                        
                        int pageBlock = 5;
                        
                        int startPage = ((pageNum/pageBlock)-(pageNum%pageBlock==0 ? 1:0))*pageBlock + 1;
                        int endPage = startPage + pageBlock -1 ;
                        if(endPage > pageCount){
                           endPage = pageCount;
                     }
                     //이전
                     if(startPage > pageBlock){
                        %>
                        <a href="mypage_review.jsp?register_num=<%=snum%>&&pageNum=<%=endPage-pageBlock %>" class="item"> 이전 </a>
                        <% 
                     } 
                     
                     //페이지 넘버 부여
                     for(int s=startPage; s<=endPage; s++){
                        if(s == pageNum){
                           %>
                           <a href="mypage_review.jsp?register_num=<%=snum%>&&pageNum=<%=s %>" class="item"><b> <%=s %> </b></a>
                           <% 
                        }
                        else{
                           %>
                           <a href="mypage_review.jsp?register_num=<%=snum%>&&pageNum=<%=s %>" class="item"> <%=s %> </a>
                           <% 
                        }
                     }
                     
                     //다음
                     if(endPage<pageCount){
                        %>
                        <a href="mypage_review.jsp?register_num=<%=snum%>&&pageNum=<%=startPage+pageBlock %>" class="item"> 다음 </a>
                      <% 
                      }
                  }  
              %> 
              </div>
           </div> 
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