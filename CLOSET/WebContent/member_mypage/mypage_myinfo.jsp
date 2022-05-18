<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="mypage_myinfo.css">
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
	function checkValue()
	{	
		inputForm = eval("document.infoupdate");
		var checkBox = $('input:checkbox[name=essential_chk]:checked').val();
		var email = document.userInfo.member_email.value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		
		if(inputForm.now_pw.value==""){
			alert("기존 비밀번호를 입력해주세요");
			return false;
		}	
	     
		if(inputForm.member_pw.value==""){
			alert("새비밀번호를 입력해주세요");
			return false;
		}
	
		if(inputForm.member_pw2.value == ""){
			alert("비밀번호 확인을 입력해주세요");
			return false;
		}
		if(inputForm.member_name.value == ""){
			alert("이름을 입력해주세요");
			return false;
		}
		if(inputForm.member_tel1.value == ""){
			alert("휴대전화 번호를 입력해주세요");
			return false;
		}
		if(inputForm.member_tel2.value == ""){
			alert("휴대전화 번호를 입력해주세요");
			return false;
		}
		if(inputForm.member_tel3.value == ""){
			alert("휴대전화 번호를 입력해주세요");
			return false;
		}
		if(inputForm.member_post.value == ""){
			alert("주소를 입력해주세요");
			return false;
		}
		if(inputForm.member_addr1.value == ""){
			alert("주소를 입력해주세요");
			return false;
		}
		if(inputForm.member_addr2.value == ""){
			alert("주소를 입력해주세요");
			return false;
		}
	    
	    return true;
	    
	}
	</script>
	<!-- 비밀번호 유효성 확인 -->
	<script>
	 $(function(){
		 var exptext = /^[A-Za-z0-9]([-_.]?[0-9a-zA-Z]){8,16}$/;
	
		 $("#alert-ok").hide();
		 $("#alert-no").hide();
		 $("input").keyup(function(){
			 var pwd1 = $("#pwd1").val();
			 if(pwd1 != ""){
				 if(exptext.test(pwd1)==false){
					 $("#alert-ok").hide();
					 $("#alert-no").show();
					 $("#submit").removeAttr("disabled"); //버튼 비활성화 속성을 제거
				 }else{
					 $("#alert-no").hide();
					 $("#alert-ok").show();
					 $("#submit").attr("disabled", "disabled"); //버튼 비활성화
				 }
			 }
		 });
	  });    
	</script>
	
	<!--비밀번호 일치 확인-->
	 <script>    
	  $(function(){
		 $("#alert-success").hide();
		 $("#alert-danger").hide();
		 $("input").keyup(function(){
			 var pwd1 = $("#pwd1").val();
			 var pwd2 = $("#pwd2").val();
			 if(pwd1 != "" || pwd2 != ""){
				 if(pwd1 == pwd2){
					 $("#alert-success").show();
					 $("#alert-danger").hide();
					 $("#submit").removeAttr("disabled"); //버튼 비활성화 속성을 제거
				 }else{
					 $("#alert-success").hide();
					 $("#alert-danger").show();
					 $("#submit").attr("disabled", "disabled"); //버튼 비활성화
				 }
			 }
		 });
	  });    
    </script> 
    <!-- 주소찾기  -->
     <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
    function daumPostcode(){
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;                
                } else {
                    document.getElementById("extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    </script>

 
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
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
        
        <jsp:useBean id="cdao" class="closet.closetDAO" scope="application"/>
        <%

        	String member_email= (String)session.getAttribute("sessionID");
        	closetBean cbean = cdao.getOnemember(member_email);       	
        %>

        <div class="container" style="min-height: 650px;">
            <div class="container-wrap">
               <h1 class="title1">개인 정보 수정
               </h1>
                <p class="title3">모든사항필수입력</p>
                <form class="form1" name="infoupdate" action="mypage_myinfoProc.jsp" method="post" onsubmit="return checkValue();">
                    <table class="table1">
                        <tr>
                        <td class="td"><h4 class="table_title">이메일</h4></td>
                        <td class="td">
                        	<% 
			                 String sessionID = (String)session.getAttribute("sessionID");
			                %>
			                
                            <input class="input1" type="text" name="member_email" value=<%=sessionID%> readonly>                            
                            	이메일은 변경이 불가합니다.
                        </td>
                    </tr>
                    <tr>
                        <td class="td"><h4 class="table_title">현재 비밀번호</h4></td>
                        <td class="td">
                            <input class="input1" type="password" name="now_pw">
                        </td>
                    </tr>
                    <tr>
                        <td class="td1"><h4 class="table_title">새 비밀번호</h4></td>
                        <td class="td2">
                            <input class="input1" type="password" name="member_pw" id ="pwd1" placeholder="영문,숫자,특수문자를 사용하여 8~16자">
                        </td>
                    </tr>
                    <tr>
                           <td></td>
                           <td id="alert-ok" class="pwalert" >&nbsp;&nbsp;&nbsp;&nbsp;유효한 비밀번호</td>
	                       <td id="alert-no"  class="pwalert" >&nbsp;&nbsp;&nbsp;&nbsp;영문,숫자,특수문자를 사용하여 8~16자</td>
                    </tr>
                    <tr>
                        <td class="td1"><h4 class="table_title">새 비밀번호 확인</h4></td>
                        <td class="td2">
                            <input class="input1" type="password" name="member_pw2" id ="pwd2">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
	                       <td id="alert-success" class="pwalert" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다.</td>
	                       <td id="alert-danger"  class="pwalert" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다.</td>
                    </tr>
                    <tr>
                        <td class="td"><h4 class="table_title">이름</h4></td>
                        <td class="td">
                            <input class="input1" type="text" value="<%=cbean.getMember_name()%>" name="member_name" >
                        </td>
                    </tr>
                    <tr>
                        <td class="td"><h4 class="table_title">휴대전화</h4></td>
                        <td class="td">
                            <input class="input2" type="text" value="0<%=cbean.getMember_tel1()%>" name="member_tel1">
                            <input class="input3" type="text" value="<%=cbean.getMember_tel2()%>" name="member_tel2"> 
                            <input class="input3" type="text" value="<%=cbean.getMember_tel3()%>" name="member_tel3">
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="td"><h4 class="table_title">주소</h4></td>
                        <td class="td">
                            <input class="input4" type="text" placeholder="우편번호" value="<%=cbean.getMember_post()%>" name="member_post" id="postcode">
                            <input class="button1" type="button" onclick="daumPostcode()" value="우편번호 찾기"><br>
                            <input class="input1" type="text" placeholder="주소" value="<%=cbean.getMember_addr1()%>" name="member_addr1" id="address"><br>
                            <input class="input1" type="text" placeholder="상세주소" value="<%=cbean.getMember_addr2()%>" name="member_addr2" id="detailAddress"><br>
                            <input class="input1" type="text" placeholder="참고항목" id="extraAddress">
                        </td>
                    </tr>
                    </table>
                    <div class="button__part">
                        <input class="button3" type="button" value="취소">
                        <input class="button4" type="button" value="탈퇴하기" onclick="location.href='mypage_withdraw.jsp'">
                        <input class="button2" type="submit" value="회원정보 수정">
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