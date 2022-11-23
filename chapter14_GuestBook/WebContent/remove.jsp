<%@page import="org.joonzis.mybatis.GuestbookDao"%>
<%@page import="org.joonzis.mybatis.GuestbookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		GuestbookVo articleInfo = (GuestbookVo)session.getAttribute("articleInfo");
		GuestbookVo vo = new GuestbookVo();
		vo.setIdx(articleInfo.getIdx());
		vo.setWriter(articleInfo.getWriter());
		
		if (articleInfo.getPw() == null) {
			vo.setPw("");
		} else {
			vo.setPw(articleInfo.getPw());
		}
		
		int result = GuestbookDao.delete(vo);
		pageContext.setAttribute("result", result);		
	%>
	
	<c:choose>
		<c:when test="${result gt 0 }">
			<script type="text/javascript">
				alert("방명록을 삭제하였습니다.");
				location.href="index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("방명록을 삭제하지 못하였습니다. 비밀번호를 확인해주세요.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>