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
<link rel="stylesheet" href="commission.css">

<script type="text/javascript">
    function check()
   {
  		inputForm = eval("document.commisionInfo");
  		var referral_sex = $('input:radio[name=referral_sex]:checked').val();

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
		    alert("방문 날짜를 입력해주세요");
		    return false;
		}
		if(inputForm.referral_office.value == "-")
		{
		    alert("방문구청을 입력해주세요");
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
    <div class="container" style="min-height: 650px;">
        <div class="container-wrap">
       <jsp:useBean id="cbean" class="closet.closetBean"/>
    	<jsp:setProperty name="cbean" property="*" /> 

            <h1 class="title1">정장위탁 신청서 작성</h1>
            <p class="title2">정장 위탁 신청을 위해 정장 상세 정보를 입력합니다.</p>
            <p class="title3">모든 항목 필수 입력</p>
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
                            	<table class="choice__cate">
                            		<tr>
	                            		<td class="choice__cate__content">자켓</td>
	                            		<td><input class="check1" type="number" min="0" max="10" name="referral_outer" placeholder="없을 경우 0입력" style="margin-left: 68px;"></td>
                            		</tr>
                            		<tr>
                            			<td class="choice__cate__content">셔츠/블라우스</td>
                            			<td><input class="check1" type="number" min="0" max="10" name="referral_top" placeholder="없을 경우 0 입력" style="margin-left: 68px;"></td>
                            		</tr>
                            		<tr>
                            			<td class="choice__cate__content">팬츠</td>
                            			<td><input class="check1" type="number" min="0" max="10" name="referral_bottom" placeholder="없을 경우 0 입력" style="margin-left: 68px;"></td>
                            		</tr>
                            		<tr>
                            			<td class="choice__cate__content">스커트</td>
                            			<td><input class="check1" type="number" min="0" max="10" name="referral_skirt" placeholder="없을 경우 0 입력" style="margin-left: 68px;"></td>
                            		</tr>
                            	</table>
                            <!-- <ul class="choice__cate">
                               <li class="choice__cate__content"><span>자켓</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="check1" type="number" min="0" max="10" name="referral_outer" placeholder="없을 경우 0입력"></li>
                               <li class="choice__cate__content"><span>셔츠/블라우스</span>&nbsp;&nbsp;&nbsp;<input class="check1" type="number" min="0" max="10" name="referral_top" placeholder="없을 경우 0 입력"></li>
                               <li class="choice__cate__content"><span>팬츠</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="check1" type="number" min="0" max="10" name="referral_bottom" placeholder="없을 경우 0 입력"></li>
                               <li class="choice__cate__content"><span>스커트</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="check1" type="number" min="0" max="10" name="referral_skirt" placeholder="없을 경우 0 입력"> </li>
                           </ul>   -->
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
    <jsp:include page="../fix/footer.jsp" />
    
</body>
</html>