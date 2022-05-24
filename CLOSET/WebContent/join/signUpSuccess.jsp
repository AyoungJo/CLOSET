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
    <link rel="stylesheet" href="signupsuccess.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		  response.setHeader("Cache-Control", "no-cache");
	 }	
%> 
	<!--header-->
	<jsp:include page="../fix/header.jsp" />	

	<jsp:useBean id="cdao" class="closet.closetDAO"/>

    <!--main content-->
	<div class="container">
		<div class="container-wrap">
			<form class="form1">
				<table class="table1">
					<tr>
						<td><h1 class="title1">회원가입이 완료되었습니다.</h1></td>
					</tr>
				</table>
			</form>
			<input class="button2" type="button"
				onclick="location.href='login.jsp'" value="로그인 바로가기">
		</div>
	</div>
	
	<!--footer-->    
    <jsp:include page="../fix/footer.jsp" />
    
</body>
</html>

