<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="service_center_notice_admin_write.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.js"></script>
    <script src="../join/commission.js"></script>
    <title>Document</title>
</head>
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
	}
</script>   
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
                    <li class="menu__text" onclick="changepage(4)">CLOSET</li>
                    <li class="menu__text" onclick="changepage(5)">정장대여</a>
                        <ul class="sub-menu__list">
                            <li class="sub-menu__list__text" onclick="changepage(6)">남자 정장</li>
                            <li class="sub-menu__list__text" onclick="changepage(7)">여자 정장</li>
                        </ul>
                    </li>
                    <%
                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
        			{
        			%>
	                    <li class="menu__text"><a href="../member/commission.jsp">정장위탁</a>
	                    </li>
                    <%
        			}else{ //로그인 안되었을 때
        			%>        			
	        			<li class="menu__text"><a href="../join/login.jsp">정장위탁</a>
	                    </li>
                    <%
        			}
                    %>
                    <li class="menu__text"><a href="#">자원봉사</a>
                    </li>    
                    <%
                    if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
        			{
        			%>
	                    <li class="menu__text"><a href="#">마이페이지</a>
                        <ul class="sub-menu__list">
                            <li class="sub-menu__list__text"><a href="#">내정보</a></li>
                            <li class="sub-menu__list__text"><a href="#">피팅예약내역</a></li>
                            <li class="sub-menu__list__text"><a href="#">정장대여내역</a></li>
                            <li class="sub-menu__list__text"><a href="#">위탁내역</a></li>
                        </ul>
                    </li>
                    <%
        			}else{ //로그인 안되었을 때
        			%>        			
	        			<li class="menu__text" style="display:none"><a href="#">마이페이지</a>
                        <ul class="sub-menu__list">
                            <li class="sub-menu__list__text"><a href="#">내정보</a></li>
                            <li class="sub-menu__list__text"><a href="#">피팅예약내역</a></li>
                            <li class="sub-menu__list__text"><a href="#">정장대여내역</a></li>
                            <li class="sub-menu__list__text"><a href="#">위탁내역</a></li>
                        </ul>
                    </li>
                    <%
        			}
                    %>    
                </ul>
                <ul class="menu__list2">
                    <li> 
                    <form action="suitsearch.jsp" method="get">
                        <div class="menu__search">
                            <input type="text" name="KeyWord" class="search__box" placeholder="검색어를 입력하세요." >
                            <input type="submit" class="se_icon" value="검색">
                        </div>
                    </form>
                    </li>
                     <li>
                        <div class="menu__cart">
                            <button><img src="../images/cart.png" class="ce__icon"></button>
                        </div>
                    </li>   
                </ul>
            </div>
        </div>
    </div>
    
    <!--main content-->
    <!--category&product-->
    <div class="container">
        <div class="container-wrap">

            <h1 class="title1">공지사항</h1>
            
            <form class="form1">
                <table class="table1">
                    <tr>
                        <td class="table__title1">
                            <h5>제목</h5>
                        </td>
                        <td class="table__content">
                            <input type="text" class="table__input">
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title1">
                            <h5>작성자</h5>
                        </td>
                        <td class="table__content">
                            <input type="text" class="table__input">
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title1">
                            <h5>작성일</h5>
                        </td>
                        <td class="table__content">
                            <input type="date" class="table__input">
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title2">
                            <h5>내용</h5>
                        </td>
                        <td class="table__content">
                            <textarea class="table__input2" cols="72" rows="100"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="table__title3">
                            <h5>이미지</h5>
                        </td>
                        <td class="table__content">
                            <input type="file" name="pic" class="table__input3" />
                        </td>
                    </tr>

                </table>
                <div class="btn_part">
                    <input type="button" value="작성 완료" class="btn_ok">
                </div>
            </form>

        </div>
    </div>
    
    <!-- FOOTER SECTION -->
    <div class="footer">
        <div class="footer__content">
            <div class="footer__text">
                <p>㈜클로젯<br><br>
                    대표이사 : 최은희 / 서울시 종로구 대학로12길 31 자유빌딩 5층<br>
                    사업자등록번호 : 211-87-00620 / 통신판매업 신고 : 제 01-1968호 <br>
                    개인정보보호책임자 : 이문재 / 소비자피해보상보험 SGI 서울보증</p>
            </div>
            <div class="footer__icon__content">
                <img src="../images/instagram4.png" class="footer_icon">
                <img src="../images/facebook.png" class="footer_icon">
                <img src="../images/twitter.png" class="footer_icon">
                <img src="../images/periscope.png" class="footer_icon">
            </div>
        </div>
    </div>
    <div class="footer2">
        <div class="footer__content2">
            <p>COPYRIGHT ⓒ 2019 ㈜클로젯 ALL RIGHTS RESERVED</p>
        </div>
    </div>

</body>
</body>
</html>