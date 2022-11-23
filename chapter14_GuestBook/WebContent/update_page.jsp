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
	<script type="text/javascript">
		var updateGuestbook = function(f) {
			// 현재 session에 저장되어있는 vo객체의 pw와
			// input에서 입력받은 pw 값을 비교
			if (f.pw.value != "${articleInfo.pw}") {
				alert(${articleInfo.pw});
				alert("비밀번호가 다릅니다.");
				return;
			}
			
			var choice = confirm("방명록을 수정하시겠습니까?");
			if(choice) {
				f.submit();
			}
		}
	</script>
</head>
<body>
	<div>
		<h2>${articleInfo.writer }의 방명록</h2>
		<form action="update.jsp" method="post">
			<input type="hidden" name="idx" value="${articleInfo.idx }"/>
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>
							${articleInfo.writer }
							<input type="hidden" name="writer" value="${articleInfo.writer}"/>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="${articleInfo.title }" size="80"/></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" value="${articleInfo.email }" size="80"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pw" size="80"/></td>
					</tr>
<%-- 					<tr>
						<th>첨부파일</th>
						<td>
							<c:if test="${result.filename ne null }">
								<a href="download.jsp?path=upload&filename=${result.filename }">${result.filename }</a><br/>
							</c:if>
							<input type="file" name="filename" />
						</td>
					</tr> --%>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="80" name="content" placeholder="내용을 입력해주세요." style="resize:none;">${articleInfo.content}</textarea></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${articleInfo.reg_date }</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="방명록 수정" onclick="updateGuestbook(this.form)"/>&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>