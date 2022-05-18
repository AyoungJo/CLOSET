<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	 function emailCheck2(member_email) {	  
    	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    	if(!member_email.value){
            alert("이메일을 입력하세요.");
            return;
        }else if(exptext.test(member_email.value)==false){
	        //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우         
	        alert("이메일 형식으로 입력하세요.");
	        return;		        
        }
    	
    	String email = request.getParameter("inputEmail");
    	int check = mem_insert.emailConfirm(email);
    	
    	if(check == 1){
    		alert("이미 사용중인 이메일 입니다.");
    	}else {
    		alert("사용 가능한 이메일 입니다.");
    		out.println("<input type=button"+ "value='사용하기'" + "onclick='setEmail()'>");
    	}	
		
	</script>
	<script>

		function setEmail(){
			self.close();
		}
		
		function endEmail(){
			self.close();
		}
	</script>
</head>
<body>
<title>이메일 중복체크</title>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String email = request.getParameter("member_email");
	closetDAO mem_insert = closetDAO.getInstance();
	int check = mem_insert.emailConfirm(email);
	
	if(check == 1){		
%>
		<center>
			<b><font color="red"><%=email %></font>는 <br> 이미 사용중인 이메일 입니다.</b>
			<form name="checkForm" method="post" action="emailCheck.jsp" onsubmit="return emailCheck2()">
			<b>다른 이메일을 입력해주세요.</b> <br><br>		
			<input type="text" name="inputEmail" id="inputEmail">
			<input type="submit" value="중복 확인"> 	
		</center>		
	<%
	}else {
	%>	<center>
		<b><font color="red"><%=email %></font>는 사용가능한 이메일 입니다.</b><br><br>
		<input type="button" value="사용하기" onclick="setEmail()">
		</form>
	</center>
	<%
	}
	%>	

</body>
</html>