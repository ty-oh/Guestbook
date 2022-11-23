<%@page import="org.joonzis.mybatis.GuestbookDao"%>
<%@page import="org.joonzis.mybatis.GuestbookVo"%>
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
		textarea {
			resize:none;
		}
		table {
			width: 100%;
			border-collapse: collapse;
			text-align: left
		}
		td, th {
			border: 1px solid black;
			padding: 10px;
		}
		th {
			width: 100px;
			background-color: maroon; 
			color: #fff;
			text-align: center;
		}
		tr:nth-of-type(7) {
			text-align: center;
		}
	</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		GuestbookVo vo = new GuestbookVo();
		vo.setIdx(idx);
		
		GuestbookVo result = GuestbookDao.selectByIdx(vo);
		
		//★★★★★★★★★★★★★session에 저장되었기 때문에 수정, 삭제에도 사용가능.★★★★★★★★★★★★★
		session.setAttribute("articleInfo", result);
	%>
	
	<div>
		<h2>${articleInfo.writer }의 방명록</h2>
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td>${articleInfo.writer }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${articleInfo.title }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${articleInfo.email }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<c:choose>
						<c:when test="${articleInfo.filename eq null }">
							<td>첨부파일이 없습니다.</td>
						</c:when>
						<c:otherwise>
							<td><a href="download.jsp?path=upload&filename=${articleInfo.filename }">${articleInfo.filename }</a></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="80" name="content" placeholder="내용을 입력해주세요." readonly>${articleInfo.content }</textarea></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${articleInfo.reg_date }</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="방명록 수정" onclick="location.href='update_page.jsp'"/>&nbsp;&nbsp;
						<input type="button" value="방명록삭제" onclick="location.href='remove_page.jsp'">&nbsp;&nbsp;
						<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'">
					</td>
				</tr>
			</tbody>
		</table>
	</div>	
</body>
</html>