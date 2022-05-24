<%@page import="closet.closetDAO"%>
<%@page import="closet.closetBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="../join/commission.js"></script>

<link rel="stylesheet" href="suitlist.css">

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<!--header-->
	<%@ include file="../fix/header.jsp"%>

	<jsp:useBean id="cdao" class="closet.closetDAO" />

	<!--main content-->
	<!--list-top-->
	<div class="list-top">
		<img src="../images/suitlist1.gif" class="list-top__img">
		<h2 class="suit-share__title">
			SUIT <span>SHARE</span>
		</h2>
		<p class="suit-share__text">
			가까이서 당신을 응원하는 CLOSET의 옷장을 열어보세요!<br> 따뜻한 정장들이 당신을 기다리고 있습니다.<br>
			당신의 꿈에 날개가 되어줄 정장을 이용해보세요!<br>
	</div>
	<!--category&product-->
	<div class="content">
		<!--category-->
		<div class="category">
			<h3 class="category__title">MEN'S</h3>
			<ul class="category__list" id="category">
				<li class="category__text" value="1" onclick="category()">JAKET</li>
				<li class="category__text" value="2" onclick="category()">SHIRT</li>
				<li class="category__text" value="3" onclick="category()">PANTS</li>
			</ul>
			<br>
			<h3 class="category__title">WOMAN'S</h3>
			<ul class="category__list" id="category" name="Kind">
				<li class="category__text" value="4" onclick="category()">JAKET</li>
				<li class="category__text" value="5" onclick="category()">BLOUSE</li>
				<li class="category__text" value="6" onclick="category()">PANTS</li>
				<li class="category__text" value="7" onclick="category()">SKIRT</li>
			</ul>
		</div>
		<!--product-->
		<div class="product">
			<div class="product__title__content">
				<h3 class="product__title">
					<span>PRODUCTS</span>
				</h3>

				<select class="option" id="office" onChange="office(this.value)">
					<option id="all" selected>전체</option>
					<option value="강남구청">강남구청</option>
					<option value="강동구청">강동구청</option>
					<option value="강북구청">강북구청</option>
					<option value="강서구청">강서구청</option>
					<option value="관악구청">관악구청</option>
					<option value="광진구청">광진구청</option>
					<option value="구로구청">구로구청</option>
					<option value="금천구청">금천구청</option>
					<option value="노원구청">노원구청</option>
					<option value="도봉구청">도봉구청</option>
					<option value="동대문구청">동대문구청</option>
					<option value="동작구청">동작구청</option>
					<option value="마포구청">마포구청</option>
					<option value="서대문구청">서대문구청</option>
					<option value="서초구청">서초구청</option>
					<option value="성동구청">성동구청</option>
					<option value="성북구청">성북구청</option>
					<option value="송파구청">송파구청</option>
					<option value="양천구청">양천구청</option>
					<option value="영등포구청">영등포구청</option>
					<option value="용산구청">용산구청</option>
					<option value="은평구청">은평구청</option>
					<option value="중구구청">중구청</option>
					<option value="중랑구청">중랑구청</option>
					<option value="종로구청">종로구청</option>
				</select>

			</div>

			<form>
			<table class="product__table">
			<%
				int totalCount = 0;
				totalCount = cdao.getCount();
				int pageSize = 12; //페이지당 12개씩 보이게 함
				String strPageNum = request.getParameter("pageNum");
				if (strPageNum == null) {
					strPageNum = "1";
				}
				int pageNum = Integer.parseInt(strPageNum);
				int startRow = (pageNum - 1) * pageSize + 1;
				int endRow = pageNum * pageSize;

				ArrayList<closetBean> c = cdao.getLists(startRow, endRow);

				int j = 0;
				for (int i = 0; i < c.size(); i++) {
					closetBean cbean = c.get(i);

					if (j % 3 == 0) {
			%>
				<tr>
					<%
						}
					%>
					<td class="product__content">
						<a href="suitdetail.jsp?register_num=<%=cbean.getRegister_num()%>">
						<img class="product__img" src="../upload/<%=cbean.getRegister_mainimg()%>">
						<h4 class="product__content__title"><%=cbean.getRegister_name()%></h4>
						<p class="product__content__price"><%=cbean.getRegister_office()%></p>
						<p class="product__content__button">VIEW DETAIL</p>
						</a>
					</td>
					<%
						j++;
					}
					%>
				</tr>
			</table>

			<!--페이지 넘버링  -->
			<div class="bd-color-grey">
				<div class="page_number">
				<%
					if (totalCount > 0) {
					int pageCount = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1);

					int pageBlock = 5;

					int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
					int endPage = startPage + pageBlock - 1;
					if (endPage > pageCount) {
						endPage = pageCount;
					}
					//이전
					if (startPage > pageBlock) {
						out.println("<a href=\"?pageNum=" + (endPage - pageBlock) + "\" class=\"item\">이전</a>");
					}

					//페이지 넘버 부여
					for (int s = startPage; s <= endPage; s++) {
						if (s == pageNum) {
					out.println("<a href=\"?pageNum=" + s + "\" class=\"item\"><b>" + s + "</b></a>");
						} else {
					out.println("<a href=\"?pageNum=" + s + "\" class=\"item\">" + s + "</a>");
						}
					}

					//다음
					if (endPage < pageCount) {
						out.print("<a href=\"?pageNum=" + (startPage + pageBlock) + "\" class=\"item\">다음</a>");
					}
				}
				%>
				</div>
			</div>
			</form>
		</div>
	</div>

	<!--footer-->
	<%@ include file="../fix/footer.jsp"%>

</body>
</html>