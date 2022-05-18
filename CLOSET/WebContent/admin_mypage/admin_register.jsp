<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<link rel="stylesheet" href="admin_register.css">
<script type="text/javascript"
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
	      else if(value=="3"){//정장관리
	         location.href="../admin_mypage/admin_suitlist.jsp"; 
	      }
		  else if(value=="4"){//위탁정장
		      location.href="../admin_mypage/admin_commission_list1.jsp"; 
		  }
	       else if(value=="5"){//피팅예약
	      location.href="../admin_mypage/admin_fitting_list1.jsp"; 
		   }
			else if(value=="6"){//이용정장
		      location.href="../admin_mypage/admin_appli_list1.jsp"; 
		   }
			else if(value=="7"){//자원봉사
		      location.href="../admin_mypage/admin_volunteer_list1.jsp"; 
		   } 
			else if(value=="8"){//회원정보
		      location.href="../admin_mypage/admin_memberlist.jsp"; 
		   }
			 else if(value=="9"){//고객센터
		      location.href="#"; 
		   } 
   }
</script>
<script type="text/javascript">
<%
	request.setCharacterEncoding("utf-8");
%>
    function register_check()
   {
    	registerForm = eval("document.registerForm");
  		var register_sex = $('input:radio[name=register_sex]:checked').val();
  		if(register_sex == undefined ){		
		    alert("성별을 선택해주세요");    
		    return false;
		}  		
		if(registerForm.register_category.value == "-")
		{
		    alert("카테고리를 선택해주세요");    
		    registerForm.register_category.focus();
		    return false;
		}
		if(registerForm.register_size.value == "")
		{
		    alert("사이즈를 입력해주세요");    
		    registerForm.register_size.focus();
		    return false;
		}
		if(registerForm.register_name.value == "")
		{
		    alert("정장명을 입력해주세요");    
		    registerForm.register_name.focus();
		    return false;
		}
		if(registerForm.register_color.value == "")
		{
		    alert("색상을 입력해주세요");    
		    registerForm.register_color.focus();
		    return false;
		}
		if(registerForm.register_price.value == "")
		{
		    alert("가격을 입력해주세요");    
		    registerForm.register_color.focus();
		    return false;
		}
		if(registerForm.register_office.value == "-")
		{
		    alert("보유구청을 선택해주세요");
		    registerForm.register_office.focus();
		    return false;
		}
		if(registerForm.register_mainimg.value == "")
		{
		    alert("메인이미지를 첨부해주세요");
		    return false;
		}
		if(registerForm.register_detailimg1.value == "")
		{
		    alert("상세이미지1을 첨부해주세요");
		    return false;
		}
		if(registerForm.register_detailimg2.value == "")
		{
		    alert("상세이미지2를 첨부해주세요");
		    return false;
		}
		if(registerForm.register_detailimg3.value == "")
		{
		    alert("상세이미지3을 첨부해주세요");
		    return false;
		}
		if(registerForm.register_detailimg4.value == "")
		{
		    alert("상세이미지4를 첨부해주세요");
		    return false;
		}
		
	   		/* location.href = "registerProc.jsp"; */
	   		return true;   	
		
   } 
         	
    </script>
<script type="text/javascript">
    function register_submit(){
       	var con = confirm("정장 등록을 완료하시겠습니까?");
    	   	//확인을 눌렀을 시
    	   	if(con == true){
    	   		location = "admin_register_confirm.jsp";
    	   	}	   	
    	}
    </script>
<script>    
     $(function(){
        $("#m_jarket").show();
        $("#m_shirt").show();
        $("#m_pants").show();
        $("#m_set").show();
        $("#f_jarket").hide();
        $("#f_blouse").hide();
        $("#f_pants").hide();
        $("#f_skirt").hide();
        $("#f_set").hide();
       
        $("#m_cloths").click(function(){
          var man = $("#m_cloths").val();
          if(man=="남성의류"){
             $("#m_jarket").show();
              $("#m_shirt").show();
              $("#m_pants").show();
              $("#m_set").show();
              $("#f_jarket").hide();
              $("#f_blouse").hide();
              $("#f_pants").hide();
              $("#f_skirt").hide();
              $("#f_set").hide();
         }
       });
        $("#f_cloths").click(function(){
          var female = $("#f_cloths").val();
          if(female=="여성의류"){
             $("#m_jarket").hide();
              $("#m_shirt").hide();
              $("#m_pants").hide();
              $("#m_set").hide();
              $("#f_jarket").show();
              $("#f_blouse").show();
              $("#f_pants").show();
              $("#f_skirt").show();
              $("#f_set").show(); 
          }
       });
       });
    </script>

<title>Document</title>
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

				<%
                   } 
                  %>
				<li class="header__text"><a href="../join/logoutProc.jsp">로그아웃</a></li>
				<li class="header__text"><a href="../suit/suitlist.jsp">회원사이트
						바로가기</a></li>
			</ul>
		</div>
		<%--         <%
        int referral_num = Integer.parseInt(request.getParameter("referral_num"));
        closetDAO cdao = new closetDAO();
        closetBean cbean = cdao.getOneReferral(referral_num);
        
        %> --%>

		<!--menu-->
		<div class="bottom__menu">
			<div class="logo__area">
				<a href="admin_suitlist.jsp"> <img src="../images/logo6.png"
					class="logo">
				</a>
			</div>
			<div class="menu">
				<ul class="menu__list1">
					<li class="menu__text" onclick="changepage(3)">정장관리</li>
					<li class="menu__text" onclick="changepage(4)">위탁정장</li>
					<li class="menu__text" onclick="changepage(5)">피팅예약</li>
					<li class="menu__text" onclick="changepage(6)">이용정장</li>
					<li class="menu__text" onclick="changepage(7)">자원봉사</li>
					<li class="menu__text" onclick="changepage(8)">회원정보</li>
					<li class="menu__text" onclick="changepage(9)">고객센터</li>
				</ul>
			</div>
		</div>
	</div>
	<%
    	int referral_num = Integer.parseInt(request.getParameter("referral_num").trim());
    	closetDAO cdao = new closetDAO();
    	closetBean rbean = cdao.getOneReferral(referral_num);
    	
    	String member_email = rbean.getReferral_username();    
    %>

	<!--main content-->
	<div class="container">
		<div class="container-wrap">
			<h1 class="title1">정장 등록</h1>

			<form class="form1" name="registerForm" method="post"
				action="admin_register_confirm.jsp"
				onsubmit="return register_check()" enctype="multipart/form-data">
				<!-- action="registerProc.jsp" enctype="multipart/form-data" -->
				<table class="table1">
					<!-- 정장주인이름  -->
					<%-- <input type="hidden" value="<%=rbean.getReferral_username()%>" name="register_username"> --%>
					<!-- 정장위탁자 성함  -->
					<tr>
						<td class="td">위탁자명</td>
						<td class="td"><input class="input1" type="text"
							value="<%=member_email%>" name="register_username" readonly>
						</td>
					</tr>
					<tr>
						<td class="td">구분</td>
						<td class="td">
							<ul class="choice__sex">
								<li class="choice__sex__content"><input class="radio1"
									type="radio" id="m_cloths" name="register_sex" value="남성의류"><span>남성의류</span>
								</li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<li class="choice__sex__content"><input class="radio1"
									type="radio" id="f_cloths" name="register_sex" value="여성의류"><span>여성의류</span>
								</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="td">정장 카테고리</td>
						<td class="td"><select id="category" name="register_category"
							class="input1">
								<option selected>-</option>
								<option value="1.자켓" id="m_jarket">1.자켓</option>
								<option value="2.셔츠" id="m_shirt">2.셔츠</option>
								<option value="3.팬츠" id="m_pants">3.팬츠</option>
								<option value="4.자켓" id="f_jarket">4.자켓</option>
								<option value="5.셔츠/블라우스" id="f_blouse">5.셔츠/블라우스</option>
								<option value="6.팬츠" id="f_pants">6.팬츠</option>
								<option value="7.스커트" id="f_skirt">7.스커트</option>
						</select></td>
					</tr>
					<%-- <input type="hidden" value="<%=rbean.getReferral_username()%>" name="register_username"> --%>


					<tr>
						<td class="td">대여 가격</td>
						<td class="td"><input class="input1" type="text"
							name="register_price"></td>
					</tr>
					<tr>
						<td class="td">사이즈</td>
						<td class="td"><input class="input1" type="text"
							name="register_size" placeholder="ex) S or M or L"></td>
					</tr>
					<tr>
						<td class="td">정장명</td>
						<td class="td"><input class="input1" type="text"
							name="register_name" placeholder="색상명 + 정장카테고리"></td>
					</tr>
					<tr>
						<td class="td">색상</td>
						<td class="td"><input class="input1" type="text"
							name="register_color" placeholder="ex) 블랙 or 화이트 or 베이지 or ">
						</td>
					</tr>
					<tr>
						<td class="td">보유구청</td>
						<td class="td"><select name="register_office" class="input1"
							value="<%=rbean.getReferral_office()%>">
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
						</select></td>
					</tr>
					<tr>
						<td class="td">메인 이미지첨부</td>
						<td class="td"><input class="input2" type="file"
							name="register_mainimg" accept=".gif, .jpg, .png, .bmp">
						</td>
					</tr>
					<tr>
						<td class="td">상세 이미지첨부1</td>
						<td class="td"><input class="input2" type="file"
							name="register_detailimg1" accept=".gif, .jpg, .png, .bmp">
						</td>
					</tr>
					<tr>
						<td class="td">상세 이미지첨부2</td>
						<td class="td"><input class="input2" type="file"
							name="register_detailimg2" accept=".gif, .jpg, .png, .bmp">
						</td>
					</tr>
					<tr>
						<td class="td">상세 이미지첨부3</td>
						<td class="td"><input class="input2" type="file"
							name="register_detailimg3" accept=".gif, .jpg, .png, .bmp">
						</td>
					</tr>
					<tr>
						<td class="td">상세 이미지첨부4</td>
						<td class="td"><input class="input2" type="file"
							name="register_detailimg4" accept=".gif, .jpg, .png, .bmp">
						</td>
					</tr>
				</table>
				<input class="button2" type="submit" value="등록">
			</form>
		</div>
	</div>
	<!--footer-->
	<div class="footer">
		<div class="footer__align">
			<div class="footer__content">
				<strong>Menu</strong>
				<ul>
					<li style="font-family: 'NanumSquare';"><a
						href="../main/closet.jsp">CLOSET</a></li>
					<li><a href="../suit/suitlist.jsp">정장대여</a></li>
					<%
                   if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
       			{
       			%>
					<li><a href="../member/commission.jsp">정장위탁</a></li>
					<%
       			}else{ //로그인 안되었을 때
       			%>
					<li><a href="../join/login.jsp">정장위탁</a></li>
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
					<li><a
						href="../member_mypage/mypage.jsp?member_email=<%=sessionID%>">위탁정장</a>
					</li>
					<%
       			}else{ //로그인 안되었을 때
       			%>
					<li><a href="../join/login.jsp">위탁정장</a></li>
					<%
       			}
                   if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
       			{
                   	String sessionID = (String)session.getAttribute("sessionID");	        			
       			%>
					<li><a
						href="../member_mypage/mypage_fitting.jsp?member_email=<%=sessionID%>">피팅예약내역</a>
					</li>
					<%
       			}else{ //로그인 안되었을 때
       			%>
					<li><a href="../join/login.jsp">피팅예약내역</a></li>
					<%
       			}
                   if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
       			{
                   	String sessionID = (String)session.getAttribute("sessionID");	        			
       			%>
					<li><a
						href="../member_mypage/mypage_mysuit.jsp?member_email=<%=sessionID%>">나의정장</a>
					</li>
					<%
       			}else{ //로그인 안되었을 때
       			%>
					<li><a href="../join/login.jsp">나의정장</a></li>
					<%
       			}
                   if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
       			{
                   	String sessionID = (String)session.getAttribute("sessionID");	        			
       			%>
					<li><a
						href="../member_mypage/mypage_review.jsp?member_email=<%=sessionID%>">정장후기</a>
					</li>
					<%
       			}else{ //로그인 안되었을 때
       			%>
					<li><a href="../join/login.jsp">정장후기</a></li>
					<%
       			}
                   if(session.getAttribute("sessionID") != null) // 로그인이 되었을 때
       			{
                   	String sessionID = (String)session.getAttribute("sessionID");	        			
       			%>
					<li><a
						href="../member_mypage/mypage_pass.jsp?member_email=<%=sessionID%>">개인정보수정</a>
					</li>
					<%
       			}else{ //로그인 안되었을 때
       			%>
					<li><a href="../join/login.jsp">개인정보수정</a></li>
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
					<li><img src="../images/location.png" class="footer__icon">(04763)
						서울시 성동구 살곶이길 200(사근동)</li>
					<li><img src="../images/call.png" class="footer__icon">+82
						392 3929 210</li>
					<li><img src="../images/envelope.png" class="footer__icon">closet@naver.com</li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>