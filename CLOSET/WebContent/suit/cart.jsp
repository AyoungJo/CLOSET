<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./cart.css">
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
<!-- <script type="text/javascript">
function deleteRow(obj) {
   var message=confirm("선택한 정장을 삭제하시겠습니까?");
    var tr = $(obj).parent().parent();     
    
    tr.remove();

    session.removeAttribute("cart");
}
</script>  -->
<!-- <script>
$('#cartTable tr').on('click', function(){
    $(this).parent().parent().remove();/* 
	var tr = $(this);
	var td = tr.children();
	
	var img = td.eq(0).text(); */
});
</script> -->

<script>
function deleteRow(obj) {
	   var con=confirm("선택한 정장을 삭제하시겠습니까?");
	   var tr=$(obj).parent().parent();
	   tr.remove();

	   /* if(con == true){   		
		$("#selectBtn").click(function(){ 
		    
		    var rowData = new Array(); 
		    var tdArr = new Array();
		    var checkbox = $("input[name=a3]:checked");
		
		    
		    checkbox.each(function(i) {
		        
		        // checkbox.parent() : checkbox의 부모는 <td>이다.
		        // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		        var tr = checkbox.parent().parent().eq(i);
		        var td = tr.children();
		                
		        // 체크된 row의 모든 값을 배열에 담는다.
		        rowData.push(tr.text());
		                
		        // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		        var img = td.eq(1).text()+", "
		        var name = td.eq(2).text()+", ";
		        var price = td.eq(3).text()+", ";
		        var office = td.eq(4).text()+", ";
		        var date = td.eq(5).text()+", ";
		        var time = td.eq(6).text()+", ";
		                
		        // 가져온 값을 배열에 담는다.
		        tdArr.push(img);
		        tdArr.push(name);
		        tdArr.push(price);
		        tdArr.push(office);
		        tdArr.push(date);
		        tdArr.push(time);
		
		        tdArr.remove(); */

}
</script>
<!-- <script type="text/javascript">
$(document)ready(function(){
   if(document.getElementById("cartTable").getElementsByTagName("tr").length>10){
      alert("장바구니에는 10개까지 담을 수 있습니다.");
   }
});
</script> -->
<script>
function checkbox(obj){
   var isChk = false;
    var chkbox2 = document.getElementsByName("a3");
    for(var i=0;i<chkbox2.length;i++){
       if(chkbox2[i].checked==true){
          isChk=true;
          location.href="cartProc.jsp";
          break;
       }
       /* location.href="cartProc.jsp"; */
     }
    if(!isChk){
        alert("피팅 하실 정장을 선택해주세요.");
        return false;
    }
}

</script>
<script>
function chk_count(obj){
   var chkbox = document.getElementsByName("a3");
   var chkCnt = 0;
   for(var i=0;i<chkbox.length; i++){
      if(chkbox[i].checked){
         chkCnt++;
      }
   }
   if(chkCnt>3){
      alert("피팅신청은 3개까지만 가능합니다.");
      obj.checked = false;
      return false;
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
    <div class="container">
        <div class="container-wrap">
      <form class="form1">
            <h1 class="title1">피팅 옷장</h1>
            <p class="title2">피팅 예약을 신청한 사람이 우선권을 가집니다.</p>
            <%
          
          request.setCharacterEncoding("UTF-8");
          
         String realpath = application.getRealPath("/upload");
         
         int maxSize = 1024*1024*5;
         String encType = "utf-8";
         String savefile = "img";
         
         int num=(Integer)session.getAttribute("sessionNum");
             closetDAO cdao = new closetDAO();
             closetBean cb = cdao.getOneCartRegister(num);

           
            String fitting_mainimg = cb.getRegister_mainimg();
            String fitting_name =request.getParameter("name");
            String fitting_price =request.getParameter("price");
            String fitting_office =request.getParameter("office");
            String fitting_date=request.getParameter("fitting_date");
            String fitting_time=request.getParameter("fitting_time");        
            
            
            ArrayList<String> list;
            ArrayList<String> list1;
            ArrayList<String> list2;
            ArrayList<String> list3;
            ArrayList<String> list4;
            ArrayList<String> list5;
            ArrayList<String> list6;            
                        
            if(session.getAttribute("fitting_mainimg")==null){
            	list1 = new ArrayList<String>();              
           }else{
              //저장된 데이터가 있으면              
              list1 = (ArrayList<String>)session.getAttribute("fitting_mainimg");
           } 
           if(session.getAttribute("fitting_name")==null){
              list2 = new ArrayList<String>();
           }else{
             list2 = new ArrayList<String>();
              list2 = (ArrayList<String>)session.getAttribute("fitting_name");
           }          
           if(session.getAttribute("fitting_price")==null){
               list3 = new ArrayList<String>();
            }else{
              list3 = new ArrayList<String>();
               list3 = (ArrayList<String>)session.getAttribute("fitting_price");
            }    
            if(session.getAttribute("fitting_office")==null){
               list4 = new ArrayList<String>();
            }else{
               list4 = (ArrayList<String>)session.getAttribute("fitting_office");
            }                      
           if(session.getAttribute("fitting_date")==null){
               list5 = new ArrayList<String>();
            }else{
              list5 = new ArrayList<String>();
               list5 = (ArrayList<String>)session.getAttribute("fitting_date");              
            }
           if(session.getAttribute("fitting_time")==null){
            list6 = new ArrayList<String>();
           }else{
             list6 = new ArrayList<String>();
              list6 = (ArrayList<String>)session.getAttribute("fitting_time");           
           }            
           
            list1.add(fitting_mainimg); 
             session.setAttribute("fitting_mainimg",list1); 
             
             list2.add(fitting_name);
          	session.setAttribute("fitting_name",list2);
          
             list3.add(fitting_price);
          	session.setAttribute("fitting_price",list3);
          
             list4.add(fitting_office);
          	session.setAttribute("fitting_office",list4);
          
             list5.add(fitting_date);
          	session.setAttribute("fitting_date",list5);
          
             list6.add(fitting_time);
          	session.setAttribute("fitting_time",list6); 
                   
          
        %>
                <table class="table1" id="cartTable">
                    <tr class="table__title">

                        <td class="td1">
                            
                        </td>
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
                        <td class="td7"></td>
                    </tr>
                    <%
                    for(int i = 0; i<list1.size(); i++){
                    %>
                    <tbody>
                  <tr class="table__content" >
                           <input type="hidden" name="num<%=i %>" />
                              <td class="content1">
                                 <div class="agree">
                                	<div class="all_agree">
                                    <input type="checkbox" onclick="chk_count(this)" name="a3" class="check_box">
                                    <label for="a3"></label>
                               		</div>
                               	  </div>
                              </td>
                              <td class="content2">
                                <a href="suitdetail.jsp?register_num=<%=num%>">
                                <img src="../upload/<%=list1.get(i)%>" class="icon">
                               </a>
                              </td>
                              <td class="content2"><%=list2.get(i)%></td>
                              <td class="content4"><%=list3.get(i) %>원</td>
                              <td class="content5"><%=list4.get(i) %></td>
                              <td class="content5"><%=list5.get(i) %></td>
                              <td class="content6"><%=list6.get(i) %></td>
                              <%                              
                              	
                              %>
                              <td class="content7">
                              <!-- onclick="deleteRow(this);" -->
                                  <button class="close__icon" onclick="deleteRow(this);" id="selectBtn"></button>
                              </td>
                       </tr>
                     <%
                       }
                    
                     %>
                  </tbody>
                </table>
                <!-- <input type="button" value="피팅예약하기" onclick="checkbox(this)" class="table__button2" >
            	<input type="button" value="쇼핑계속하기" onclick="history.back()" class="table__button2"> -->
            	<input type="button" value="피팅예약하기" onclick="checkbox(this)" class="button1" >
            	<input type="button" value="계속둘러보기" onclick="history.back()" class="button2">
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