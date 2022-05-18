<%@page import="closet.closetBean"%>
<%@page import="closet.closetDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="appli.css">       
</head>
<%
	int register_num = Integer.parseInt(request.getParameter("register_num"));
	session.setAttribute("suitnum", register_num);
	if(session.getAttribute("sessionID") == null){
		
		response.sendRedirect("../suit/appli_login.jsp?register_num="+register_num);
	}else{

	closetDAO cdao = new closetDAO();
	/* int apply_suitnum = Integer.parseInt(request.getParameter("register_num")); */
	String member_email = (String)session.getAttribute("sessionID");
	closetBean cbean = cdao.getOneRegister(register_num, member_email);
	
	String name = cbean.getRegister_name();
	session.setAttribute("sessionName", name);
	
	String price = cbean.getRegister_price();
	session.setAttribute("sessionPrice", price);
	
%>
<body style="overflow-x: hidden">
    <div class="container">
            
            <form class="form1" action="applyProc.jsp" method="post">
                <div class="login">    
                  <img src="../images/logo6.png" class="logo__img">
                   <h1 class="title1" style="font-family: 'NanumSquare';">정장을 이용하시겠습니까?</h1>     
                    <table class="table1"><%-- 
                          <input type="hidden" name="apply_username" value=<%=member_email %> />     --%>                       

                    <tr>
                        <td class="td1"><h4 class="td1" >정장명</h4></td>
                        <td class="td2">
                           <span class="app_name"><input type="hidden" name="apply_suitname" value="<%=name %>"/><%=cbean.getRegister_name() %></span>                           
                        </td>
                    </tr>
                    <tr>
                        <td class="td1"><h4>연장여부</h4></td>
                        <td class="td2">
                           <ul class="choice__sex">
                               <li class="choice__sex__content"><input class="radio1" type="radio" name="apply_extend" value="연장함"><span>연장함&nbsp;&nbsp;&nbsp;</span></li>
                               <li class="choice__sex__content"><input class="radio2" type="radio" name="apply_extend" value="연장하지않음"><span>연장하지않음</span></li>
                           </ul>                            
                        </td>
                    </tr>
                    <tr>
                        <td class="td1"><h4>반납수단</h4></td>
                        <td class="td2">
                           <ul class="choice__sex">
                               <li class="choice__sex__content"><input class="radio1" type="radio" name="apply_return" value="방문반납"><span>방문반납</span></li>
                               
                               <li class="choice__sex__content"><input class="radio2" type="radio" name="apply_return" value="택배반납"><span>택배반납</span></li>
                           </ul>                            
                        </td>
                    </tr>
                    <tr class="date">
                        <td class="td1"><h4>대여기간</h4></td>
                        <td class="td2">
                        	<jsp:useBean id="now" class="java.util.Date" />
                            <!-- <input class="check1" type="date" id='currentDate'  disabled style="background-color:#f4f4f4;" name="apply_period1">&nbsp;~ -->    
                            <input class="check1" type="date" name="apply_period1" style="vertical-align:middle;display:inline-block;"><p style="vertical-align:middle;display:inline-block;">&nbsp;~</p>
                            <input class="check1" type="date" name="apply_period2" style="vertical-align:middle;display:inline-block;">
                            <!-- <script>
                                    document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);                                    
                            </script> -->       
                        </td>
                    </tr>
                    <tr>
                        <td class="td1"><h4 class="td1" >대여가격</h4></td>
                        <td class="td2">
                           <span class="app_price"><input type="hidden" name="apply_price" value="<%=price %>"/><%=price %>원</span>                           
                        </td>
                    </tr>
                    </table>
                    
                    <div class="agree">
                       <div>
                        <button class="button1" type="submit" value="이용신청">이용신청</button>
                        </div>
                    </div>
                    
                </div>
            </form>
    </div>
    <%
		}
    %>
</body>
</html>