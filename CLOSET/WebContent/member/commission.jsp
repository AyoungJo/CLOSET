<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="commission.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>
<%
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		  response.setHeader("Cache-Control", "no-cache");
	 }
%>
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
		else if(value=="8"){//정장위탁
			location.href="../member/commission.jsp"; 
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
    function check()
   {
  		inputForm = eval("document.commisionInfo");
  		var referral_sex = $('input:radio[name=referral_sex]:checked').val();

  		]
  		if(referral_sex == undefined ){		
		    alert("성별을 선택해주세요");    
		    return false;
		}  		
		if(inputForm.referral_outer.value == "")
		{
		    alert("자켓 수량을 입력해주세요");    
		    inputForm.referral_outer.focus();
		    return false;
		}
		if(inputForm.referral_top.value == "")
		{
		    alert("셔츠/블라우스 수량을 입력해주세요");    
		    inputForm.referral_outer.focus();
		    return false;
		}
		if(inputForm.referral_bottom.value == "")
		{
		    alert("팬츠 수량을 입력해주세요");    
		    inputForm.referral_outer.focus();
		    return false;
		}
		if(inputForm.referral_skirt.value == "")
		{
		    alert("스커트 수량을 입력해주세요");    
		    inputForm.referral_skirt.focus();
		    return false;
		}
		if(inputForm.referral_visit.value == "")
		{
		    alert("방문 날짜를 입력해주세요");    /* 
		    inputForm.referral_visit.focus(); */
		    return false;
		}
		if(inputForm.referral_office.value == "-")
		{
		    alert("방문구청을 입력해주세요");/*     
		    inputForm.referral_visit.focus(); */
		    return false;
		}
		
		var referral_agreement = $('input:radio[name=referral_agreement]:checked').val();
		
		if(referral_agreement == undefined ){
			
		    alert("수익금 기부 동의여부를 선택해주세요");    
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
    <div class="container" style="min-height: 650px;">
        <div class="container-wrap">
       <jsp:useBean id="cbean" class="closet.closetBean"/>
    	<jsp:setProperty name="cbean" property="*" /> 

            <h1 class="title1">정장위탁 신청서 작성</h1>
            <p class="title2">정장에 대한 정보를 작성하여 위탁을 신청합니다.</p>
            <p class="title3">모든항목필수입력</p>
            <form class="form1" name="commisionInfo" method="post" action="commissionProc.jsp" onsubmit="return check()">
                <table class="table1" >
                    <tr>
                        <td class="td1">구분</td>
                        <td class="td2">
                           <ul class="choice__sex">
                               <li class="choice__sex__content"><input class="radio1" type="radio" name="referral_sex" value="남성의류"><span>남성의류</span></li>
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <li class="choice__sex__content"><input class="radio1" type="radio" name="referral_sex" value="여성의류"><span>여성의류</span></li>
                           </ul>                            
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">정장 카테고리</td>
                        <td class="td2">
                            <ul class="choice__cate">
                               <li class="choice__cate__content"><span>자켓</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="check1" type="number" min="0" max="10" name="referral_outer" placeholder="없을 경우 0입력"></li>
                               <li class="choice__cate__content"><span>셔츠/블라우스</span>&nbsp;&nbsp;&nbsp;<input class="check1" type="number" min="0" max="10" name="referral_top" placeholder="없을 경우 0 입력"></li>
                               <li class="choice__cate__content"><span>팬츠</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="check1" type="number" min="0" max="10" name="referral_bottom" placeholder="없을 경우 0 입력"></li>
                               <li class="choice__cate__content"><span>스커트</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="check1" type="number" min="0" max="10" name="referral_skirt" placeholder="없을 경우 0 입력"> </li>
                           </ul>  
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">방문날짜</td>
                        <td class="td2">
                            <input class="input_date" type="date" name="referral_visit">
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">방문구청</td>
                        <td class="td2">
                            <select name="referral_office" class="input1">
                            		<option selected>-</option>
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
                        <td class="td1" >수익금 기부 동의여부</td>
                        <td class="td2">
                            <ul class="choice__sex">
                               <li class="choice__sex__content"><input class="radio1" type="radio" name="referral_agreement" value="동의하지않음"><span>동의하지않음</span></li>
                               <li class="choice__sex__content"><input class="radio1" type="radio" name="referral_agreement" value="동의함"><span>동의함</span></li>
                           </ul> 
                        </td>
                    </tr>
               	</table>
               	<input class="button2" type="submit" value="제출하기">
            </form>            
            
        </div>
    </div>
    <!--footer-->
        <div class="footer">
            <div class="footer__align">
               
                <div class="footer__content">
                    <strong>Menu</strong>
                    <ul>
                        <li style="font-family:'NanumSquare';"><a href="#">CLOSET</a></li>
                        <li><a href="#">정장대여</a></li>
                        <li><a href="#">정장위탁</a></li>
                        <li><a href="#">자원봉사</a></li>
                    </ul>
                </div>
                <div class="footer__content">
                    <strong>MyPage</strong>
                    <ul>
                        <li><a href="#">위탁정장</a></li>
                        <li><a href="#">피팅예약내역</a></li>
                        <li><a href="#">나의정장</a></li>
                        <li><a href="#">정장후기</a></li>
                        <li><a href="#">개인정보수정</a></li>
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