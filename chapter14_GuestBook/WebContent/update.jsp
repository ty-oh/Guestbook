<%@page import="org.joonzis.mybatis.GuestbookDao"%>
<%@page import="org.joonzis.mybatis.GuestbookVo"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		GuestbookVo vo = new GuestbookVo();
		vo.setIdx(Integer.parseInt(request.getParameter("idx")));
		vo.setWriter(request.getParameter("writer"));
		vo.setEmail(request.getParameter("email"));
		vo.setPw(request.getParameter("pw"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		
		int result = GuestbookDao.update(vo);
		pageContext.setAttribute("result", result);
		pageContext.setAttribute("idx", vo.getIdx());
	%>
	
	<c:choose>
		<c:when test="${result gt 0 }">
			<script type="text/javascript">
				alert('방명록을 수정하였습니다.');
				
				var idx = '${idx}';
				location.href='view.jsp?idx='+idx;
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('방명록을 수정하지 못하였습니다.');
			</script>
		</c:otherwise>
	</c:choose>
	
</body>
</html>