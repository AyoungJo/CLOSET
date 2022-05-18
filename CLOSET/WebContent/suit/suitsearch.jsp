<%@page import="closet.closetBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./suitsearch.css">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script
    type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.0.js"></script>
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
       else if(value=="15"){//검색
           location.href="../suit/suitsearch.jsp"; 
        }
    }
</script>

<jsp:useBean id="cdao" class="closet.closetDAO"/> 
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
              window.location.href="suitcategory.jsp?Kind="+encodeURI(Kind,"UTF-8");
              
           });
       });
</script> 
<script type="text/javascript">
   function search(val){
      var KeyWord = $("#KeyWord").val();
      /* alert(KeyWord); */
      window.location.href="suitsearch.jsp?KeyWord="+encodeURI(KeyWord,"UTF-8"); 
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
<title>Insert title here</title>
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
    
    <!--category&product-->
    <div class="content" style="min-height: 650px;">
    <!--category-->
        
       <!-- 검색결과 -->
        <div class="product">
            <div class="product__title__content">
                  <h1 class="product__title">정장 검색</h1>
                  <p class="product_p">CLOSET의 상품을 검색해보세요.</p>
            </div>
            <div class="search">
            <ul class="menu__list3">
                    <li>
                        <div class="menu__search2">
                            <input type="text" id="KeyWord" name="KeyWord" class="search__box2" placeholder="검색어를 입력하세요." >
                        </div>
                    </li>
                    <li>
                        <div class="menu__cart2">
                            <input type="button" onclick="search()" class="search__button" value="검색하기">
                        </div>
                    </li>
                </ul>
            </div>
            <table class="product__table">
            <%
               int totalCount = 0;
               String KeyWord= request.getParameter("KeyWord"); //쿼리문에서 한글 깨짐 방지 
                totalCount = cdao.SearchCount(KeyWord);
                int pageSize=12; //페이지당 12개씩 보이게 함
                String strPageNum = request.getParameter("pageNum");
                if(strPageNum == null){
                   strPageNum = "1";
                }
                int pageNum=Integer.parseInt(strPageNum);
                int startRow = (pageNum-1)*pageSize +1;
                int endRow = pageNum*pageSize;
            %>
            <%
            //검색
               /* String KeyWord= new String(request.getParameter("KeyWord").getBytes("ISO-8859-1"), "UTF-8"); //쿼리문에서 한글 깨짐 방지 */

             ArrayList<closetBean> sList= cdao.getSuitList(startRow, endRow, KeyWord);
           
           //3개씩 보여주기
             int j=0;
             for(int i=0; i< sList.size();i++){
                closetBean cbean=sList.get(i);
                int num = cbean.getRegister_num();
                  session.setAttribute("sessionNum", num);
                   String mainimg = cbean.getRegister_mainimg();
                     session.setAttribute("sessionMainImg", mainimg);
                     String name = cbean.getRegister_name();
                     session.setAttribute("sessionName", name);
                     String office = cbean.getRegister_office();
                     session.setAttribute("sessionOffice", office);
                if(j%3==0){
            %>
               <tr>
               <%
                } 
               %>
                  <td class="product__content">
                      <a href="suitdetail.jsp?register_num=<%=num%>">
                      <img class="product__img" src="../upload/<%=mainimg%>" >
                        <h4 class="product__content__title"><%=name%></h4>
                            <p class="product__content__price"><%=office%></p>
                            <p class="product__content__button">VIEW DETAIL</p>
                        </a>
                     </td>
                <%      
                  j++;
                  }
               %>   
               </tr> 
         </table>
          <div class="bd-color-grey">
               <div class="page_number">   
                  <%
                      if(totalCount>0){
                         int pageCount = totalCount/pageSize +(totalCount%pageSize == 0? 0:1);
                         
                         int pageBlock = 5;
                         
                         int startPage = ((pageNum/pageBlock)-(pageNum%pageBlock==0 ? 1:0))*pageBlock + 1;
                         int endPage = startPage + pageBlock -1 ;
                         if(endPage > pageCount){
                            endPage = pageCount;
                      }
                      
                      if(KeyWord != null && !KeyWord.equals("") ){
                       //이전
                          if(startPage > pageBlock){
                      %>
                          <a href="suitsearch.jsp?KeyWord=<%=KeyWord%>&&pageNum=<%=endPage-pageBlock %>" class="item"> 이전 </a>
                      <% 
                          } 
                          
                          //페이지 넘버 부여
                          for(int s=startPage; s<=endPage; s++){
                             if(s == pageNum){
                      %>
                                <a href="suitsearch.jsp?KeyWord=<%=KeyWord%>&&pageNum=<%=s %>" class="item"><b> <%=s %> </b></a>
                      <%
                             }
                             else{
                      %>
                                <a href="suitsearch.jsp?KeyWord=<%=KeyWord%>&&pageNum=<%=s %>" class="item"> <%=s %> </a>
                      <% 
                             }
                          }
                          
                          //다음
                          if(endPage<pageCount){
                      %>
                           <a href="suitsearch.jsp?KeyWord=<%=KeyWord%>&&pageNum=<%=startPage+pageBlock %>" class="item"> 다음 </a>
                      <% 
                           }
                      }
                      else{
                         if(startPage > pageBlock){
                              %>
                                  <a href="suitsearch.jsp?pageNum=<%=endPage-pageBlock %>" class="item"> 이전 </a>
                              <% 
                                  } 
                                  
                                  //페이지 넘버 부여
                                  for(int s=startPage; s<=endPage; s++){
                                     if(s == pageNum){
                              %>
                                        <a href="suitsearch.jsp?pageNum=<%=s %>" class="item"><b> <%=s %> </b></a>
                              <%
                                     }
                                     else{
                              %>
                                        <a href="suitsearch.jsp?pageNum=<%=s %>" class="item"> <%=s %> </a>
                              <% 
                                     }
                                  }
                                  
                                  //다음
                                  if(endPage<pageCount){
                              %>
                                   <a href="suitsearch.jsp?pageNum=<%=startPage+pageBlock %>" class="item"> 다음 </a>
                              <% 
                                   }
                               }
                      }
                  %>
                      
             
               </div>
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