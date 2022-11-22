<%@page import="org.joonzis.mybatis.GuestbookDao"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.joonzis.mybatis.GuestbookVo"%>
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
		String realPath = request.getServletContext().getRealPath("/upload");
			
		MultipartRequest mr = new MultipartRequest(
				request,
				realPath,
				1024*1024*10, // 바이트 단위(1024=1kb) (1024KB=1MB)
				"utf-8",
				new DefaultFileRenamePolicy()
				// 동일한 이름의 파일이 업로드되면 어떤 방식으로 저장할 것인지
				// 기본 값 : 파일 뒤에 번호를 붙임
				);
	
		request.setCharacterEncoding("utf-8");
		
		GuestbookVo vo = new GuestbookVo();
		vo.setWriter(mr.getParameter("writer"));
		vo.setTitle(mr.getParameter("title"));
		vo.setEmail(mr.getParameter("email"));
		vo.setPw(mr.getParameter("pw"));
		vo.setContent(mr.getParameter("content"));
		
		//첨부파일 유무에 따라서 filename 값을 결정하자
		if(mr.getFile("filename") != null) {
			vo.setFilename(mr.getFilesystemName("filename"));
		} else {
			vo.setFilename("");
		}
		
		int result = GuestbookDao.insert(vo);
		pageContext.setAttribute("result", result);
	%>
	
	<c:choose>
		<c:when test="${result gt 0}">
			<script type="text/javascript">
				alert("방명록이 작성되었습니다.");
				location.href="index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("방명록 작성이 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>