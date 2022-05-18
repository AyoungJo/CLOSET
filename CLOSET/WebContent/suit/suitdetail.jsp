<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="closet.closetBean"%>
<%@page import="closet.closetDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="suitdetail.css">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.js"></script>
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
<%-- <script>
   function loginCheck(){
      var id=<%=(String)session.getAttribute("sessionID")%>
      if(id==null){
         location.href="../join/login.jsp";
      }
   }
 </script> --%>
 <script type="text/javascript">
 function check()
   {
        inputForm = eval("document.suitdetail");

      if(inputForm.fitting_date.value == "")
      {
          alert("피팅 날짜를 선택해주세요");    
          return false;
      }
      if(inputForm.fitting_time.value == "-")
      {
          alert("피팅 시간을 선택해주세요");
          return false;
      }
      return true;
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

<title>Document</title>
</head>
<body>
<%
	closetBean rbean = new closetBean();
	
	String filename1 = "";
	String fullpath1 = "";
	
	String realpath = application.getRealPath("/upload");
	
	int maxSize = 1024*1024*5;
	String encType = "utf-8";
	String savefile = "img";
	int register_num=Integer.parseInt(request.getParameter("register_num"));
	
	 try{
		MultipartRequest multi
			= new MultipartRequest(request, realpath, maxSize, encType, new DefaultFileRenamePolicy());
	
		rbean.setReview_title(multi.getParameter("review_title"));
		rbean.setReview_content(multi.getParameter("review_content"));
		rbean.setReview_img(multi.getFilesystemName("review_img"));
		
		closetDAO cdao = closetDAO.getInstance();
		
		String member_email= (String)session.getAttribute("sessionID");
		cdao.insertReview(register_num, rbean, member_email);
		
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		closetBean review = cdao.getOneReview(review_num);  
	
		 
	 }catch(Exception e){
		 e.printStackTrace();
	 }    
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
    
        <!--detail product-->
        <form name= "suitdetail" action="cart.jsp" method="post" onsubmit="return check()">
        <%
      //한글 깨짐 방지
      request.setCharacterEncoding("utf-8");

      //addrDAO의 getOneDog(id)에 접근하여 선택한 실종동물 정보를 가져와 출력 
      closetDAO cdao = new closetDAO();
      /* int register_num=Integer.parseInt(request.getParameter("register_num")); */
      String member_email= (String)session.getAttribute("sessionID");
      closetBean cbean=cdao.getOneRegister(register_num, member_email);
      
      int num = cbean.getRegister_num();
      session.setAttribute("sessionNum", num);
      
    //session으로 가져오기
   		int snum = Integer.parseInt(session.getAttribute("sessionNum").toString());
   		String name = cbean.getRegister_name();
   		session.setAttribute("sessionName", name);
   		String mainimg = cbean.getRegister_mainimg();
   		session.setAttribute("sessionMainImg", mainimg);
   		String detailimg1 = cbean.getRegister_detailimg1();
   		session.setAttribute("sessionDetailImg1", detailimg1);
   		String detailimg2 = cbean.getRegister_detailimg2();
   		session.setAttribute("sessionDetailImg2", detailimg2);
   		String detailimg3 = cbean.getRegister_detailimg3();
   		session.setAttribute("sessionDetailImg3", detailimg3);
   		String detailimg4 = cbean.getRegister_detailimg4();
   		session.setAttribute("sessionDetailImg4", detailimg4);
      
      String color = cbean.getRegister_color();
      session.setAttribute("sessionColor", color);
      String size = cbean.getRegister_size();
      session.setAttribute("sessionSize", size);
      String office = cbean.getRegister_office();
      session.setAttribute("sessionOffice", office);
      String price = cbean.getRegister_price();
      session.setAttribute("sessionPrice", price);
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
            <div id="img_1"><img src="../upload/<%=cbean.getRegister_mainimg()%>" class="big__product__img"/></div>
            <div id="img_2" style="display:none;"><img src="../upload/<%=cbean.getRegister_detailimg1()%>" class="big__product__img"/></div>
         <div id="img_3" style="display:none;"><img src="../upload/<%=cbean.getRegister_detailimg2()%>" class="big__product__img"/></div>
         <div id="img_4" style="display:none;"><img src="../upload/<%=cbean.getRegister_detailimg3()%>" class="big__product__img"/></div>
         <div id="img_5" style="display:none;"><img src="../upload/<%=cbean.getRegister_detailimg4()%>" class="big__product__img"/></div>   
            <div class="detail-product__content">
                <h2 class="detail-product__title"><input type="hidden" value="<%=name %>" name="name" /><%=name %></h2>
                <ul class="detail-product__list">
                    <li class="detail-product__text">
                        <h3>정장 색상</h3>
                        <p ><input type="hidden" value="<%=color%>" name="color" /><%=color%></p>
                    </li>
                    <li class="detail-product__text">
                        <h3>사이즈</h3>
                        <p><input type="hidden" value="<%=size%>" name="size" /><%=size %></p>
                    </li>
                    <li class="detail-product__text">
                        <h3>보유 구청</h3>
                        <p><input type="hidden" value="<%=office%>" name="office" /><%=office%></p>
                    </li>
                    <li class="detail-product__text">
                        <h3>대여 가격</h3>
                        <p><input type="hidden" value="<%=price%>" name="price" /><%=price%></p>
                    </li>                   
                    <li class="detail-product__text">
                        <h3>피팅 날짜 선택</h3>
                        <input name="fitting_date" type="date" class="select__date">
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
                        <li><input class="reservation__button" type="submit" onclick="loginCheck()" value="피팅 옷장 담기"></li>
                    </ul>
                </div>
            </div>     
        </div>
        </form>
        
        
        <!--review part-->
        <div class="review-part" id="rvMove">
            <h2 class="review-part__title">REVIEW</h2>
            <table class="table1" id="contents" >
                    <tr class="table__title">
                        <td class="td1"><h4>번호</h4></td>
                        <td class="td2"><h4>제목</h4></td>
                        <!-- <td class="td2"><h4>사진</h4></td> -->
                        <!-- <td class="td2"><h5>내용</h5></td> -->
                        <td class="td3"><h4>작성자</h4></td>
                        <td class="td3"><h4>작성일</h4></td>
                    </tr>   
              <%
                int totalCount = 0;
                 totalCount = cdao.reviewCount();
                int pageSize=5; //페이지당 5개씩 보이게 함
                String strPageNum = request.getParameter("pageNum");
                if(strPageNum == null){
                   strPageNum = "1";
                }
                int pageNum=Integer.parseInt(strPageNum);
                int startRow = (pageNum-1)*pageSize +1;
                int endRow = pageNum*pageSize;
            %>
            <%
             ArrayList<closetBean> c = cdao.getRivewLists(startRow, endRow, register_num);
                
               for(int i=0; i<c.size(); i++){
                  //ArrayList로부터 빈즈클래스를 하나씩 꺼내서 출력함.
                     closetBean cBean = c.get(i);
            %>

              <tr id="contents" class="table__content">
                        <td class="content1"><%=cBean.getReview_num() %></td>
                        <%-- <td class="content2"><img class="product__img" src="../upload/<%=cBean.getReview_img() %>" height="100" width="100"></td> --%>
                        <td class="content2" >
                            <a href="#rvMove" class="review__link"><%=cBean.getReview_title() %></a>
                        </td>
                        <%-- <td class="content2"><%=cBean.getReview_content() %></td> --%>
                        <%
                           String username = cBean.getReview_username();
                             String id = username.substring(0, username.indexOf('@'));
                        %>
                        <%-- <td class="content2"><%=cBean.getReview_username() %></td> --%>
                        <td class="content2"><%=id %></td>
                        <td class="content3"><%=cBean.getReview_date() %></td>
                    </tr>
                     <tr class="table__content2">
                        <td colspan="5" class="conts"><%=cBean.getReview_content() %>
                           <br><br><img class="product__img" src="../upload/<%=cBean.getReview_img() %>" height="200" width="200" >
                          </td>
                     </tr>
               <%
                  }
               %> 

         </table>
          <div class="review__button__part">
               <input type="button" value="후기작성" class="review__btn"
                    onclick="location.href='suitdetail_review.jsp?regiester_num=<%=num %>#rvMove'">
          </div>
         <!--페이지 넘버링  -->
         
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
                     //이전
                     if(startPage > pageBlock){
                   	  %>
                   	  <a href="suitdetail.jsp?register_num=<%=snum%>&&pageNum=<%=endPage-pageBlock %>#rvMove" class="item"> 이전 </a>
                        <% 
                     } 
                     
                     //페이지 넘버 부여
                     for(int s=startPage; s<=endPage; s++){
                        if(s == pageNum){
                       	 %>
                       	 <a href="suitdetail.jsp?register_num=<%=snum%>&&pageNum=<%=s %>#rvMove" class="item"><b> <%=s %> </b></a>
                       	 <% 
                        }
                        else{
                       	 %>
                       	 <a href="suitdetail.jsp?register_num=<%=snum%>&&pageNum=<%=s %>#rvMove" class="item"> <%=s %> </a>
                       	 <% 
                        }
                     }
                     
                     //다음
                     if(endPage<pageCount){
                   	  %>
                   	  <a href="suitdetail.jsp?register_num=<%=snum%>&&pageNum=<%=startPage+pageBlock %>#rvMove" class="item"> 다음 </a>
                      <% 
                      }
                  }  
              %>
              </div>
           </div>  
        </div>
        
<script src="http://cdn.jquerytools.org/1.2.5/jquery.tools.min.js"></script>
<script language="javascript" type="text/javascript">
     $(function () {
     $('#contents tr').hide();
     $('#contents .table__title').show(); $('#contents').find('.content2').parent().show();
     $('#contents .content2').parent().click(function(){ 
     $('#contents tr').hide(); 
         $('#contents .table__title').show(); $('#contents').find('.content2').parent().show(); 
     var tr = $('#contents tr'); 
     var rindex = $(this).parent().children().index(this);
     for(var i = rindex; i < rindex + 2; i++){ 
     $(tr[i]).show();
     }
});
});
</script>
    
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