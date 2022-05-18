<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
   <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="appli_login.css">
    <script type="text/javascript">
      function checkValue()
      {
          inputForm = eval("document.loginInfo");
          if(inputForm.member_email.value==""  )
          {
              alert("이메일을 입력하세요");    
              inputForm.member_email.focus();
              return false;
          }
          if(inputForm.member_pw.value==""  )
          {
              alert("비밀번호를 입력하세요");    
              inputForm.member_pw.focus();
              return false;
          }          
      }    
   </script>   
</head>
<body style="overflow-x: hidden">
<%
   String msg=request.getParameter("msg");
   if(msg!=null && msg.equals("0")){
      %>
      <script>alert("비밀번호를 다시 입력해주세요.")</script>
      <%
   }else if(msg!=null && msg.equals("-1")){%>
      <script>alert("아이디를 다시 입력해주세요.")</script>
      <%
   }
   %>
   <%
    int suitnum = (Integer)session.getAttribute("suitnum");  
   	/* int register_num = Integer.parseInt(request.getParameter("register_num")); */
	%>
      
    <div class="container">
            
            <form class="form1" name="loginInfo" onsubmit="return checkValue()" action="appli_loginProc.jsp?register_num=<%=suitnum %>" method="post">
                <div class="login">    
                  <img src="../images/logo6.png" class="logo__img">
                                 
                    <div>
                        <input class="input1" type="text" name="member_email" placeholder="이메일">
                    </div>
                    <div>
                        <input class="input1" type="password" name="member_pw" placeholder="비밀번호">
                    </div>
                      
                    <br>
                    
                    <div class="agree">
                       <div>
                        <button class="button1" type="submit">로그인</button>
                        </div>
                    </div>
                </div>
            </form>
    </div>
</body>
</html>