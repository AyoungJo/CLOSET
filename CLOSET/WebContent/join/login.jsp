<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<script type="text/javascript"
 	src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>
<style type="text/css">
	@import url("../fix/header.css");
	@import url("../fix/footer.css");	
</style>
<link rel="stylesheet" href="login.css">
<%
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	 }
%>
<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (inputForm.member_email.value == "") {
			alert("이메일를 입력하세요");
			inputForm.member_email.focus();
			return false;
		}
		if (inputForm.member_pw.value == "") {
			alert("비밀번호를 입력하세요");
			inputForm.member_pw.focus();
			return false;
		}
	}
</script>
<script>
	//아이디 저장(쿠키가져오기)
	$(document).ready(function() {
		$("#input-chk").change(function() { // 체크박스에 변화가 발생 시
			if ($("#input-chk").is(":checked")) { // ID 저장 체크 시
				var userInputId = $("input[name='member_email']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시
				deleteCookie("userInputId");
			}
		});

		// 아이디 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("input[name='member_email']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($("#input-chk").is(":checked")) { // ID 저장 체크 시
				var userInputId = $("input[name='member_email']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {//쿠키 삭제하기
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {//쿠키 가져오기
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
<%
	// 로그인 유지작업 
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("member_email")) {
				/* 실행흐름이 서버에 있을 경우 서버코드로써 강제이동
				       서버에서 클라이언트()에게 특정페이지로 이동하는 정보만 응답으로 준다.
				   java코드로 페이지 이동 -> sendRedirect("url");
				*/
				response.sendRedirect("closet.jsp");
			}
		}
	}
%>	
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");   
%>

	<!--header-->
	<jsp:include page="../fix/header.jsp" />

	<jsp:useBean id="cdao" class="closet.closetDAO" />

	<!--main content-->
	<div class="container">
		<h1 class="title1" style="font-family: 'NanumSquare';">LOGIN</h1>
		<p class="title2">정장 공유 서비스 CLOSET에 오신 것을 환영합니다</p>
		<form class="form1" action="loginProc.jsp" name="loginInfo"
			onsubmit="return checkValue()" method="post">
			<div class="login">
				<div>
					<input class="input1" type="text" name="member_email"
						placeholder="이메일">
				</div>
				<div>
					<input class="input1" type="password" name="member_pw"
						placeholder="비밀번호" style="font-family: sans-serif;">
				</div>

				<br>
				<div class="agree">
					<div class="all_agree">
						<input type="checkbox" id="a1" name="저장" /> <label for="a1"><span>이메일저장</span></label>
						<a href="signUp.jsp" class="signup__link">회원가입 바로가기</a>
					</div>
					<div>
						<input class="button1" type="submit" value="로그인">
					</div>
				</div>
			</div>
		</form>
	</div>

	<!--footer-->  
    <jsp:include page="../fix/footer.jsp" />
    
</body>
</html>