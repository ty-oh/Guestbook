<%@page import="org.joonzis.mybatis.GuestbookDao"%>
<%@page import="org.joonzis.mybatis.GuestbookVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		div {
			width: 800px;
			margin: auto;
			text-align: center;
		}
		table {
			width: 100%;
			border-collapse: collapse;
		}
		td, th {
			border: 1px solid black;
			padding: 10px;
		}
		thead {
			background-color: maroon;
			color: #fff;
		}
		th:nth-of-type(1) {
			width: 80px;
		}
		th:nth-of-type(2) {
			width: 200px;
		}
		th:nth-of-type(3) {
			width: 300px;
		}
		th:nth-of-type(4) {
			width: 200px;
		}
	</style>
</head>
<body>
	<%
		List<GuestbookVo> list = GuestbookDao.select_all();
		pageContext.setAttribute("list", list);
		
	%>
	
	<div>
		<p>
			<input type="button" value="글쓰기" onclick="location.href='write_page.jsp'"/>
		</p>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="4">작성된 방명록이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.idx }</td>
								<td>${vo.writer }</td>
								<td>
									<a href="view.jsp?idx=${vo.idx }">${vo.title }</a>
								</td>
								<td>${vo.reg_date }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>