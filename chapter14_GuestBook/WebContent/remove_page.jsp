<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		tr:nth-of-type(4) {
			text-align: center;
		}
	</style>
	<script type="text/javascript">
		var removeGuestbook = function(f) {
			var isPwCorrect = f.pw.value == "${articleInfo.pw}";
			if (!isPwCorrect) {
				alert('비밀번호가 맞지 않습니다.');
				return;
			}
			
			f.action="remove.jsp";
			f.submit();
		}
		
		
	</script>
</head>
<body>
	<div>
		<h2>${articleInfo.writer }의 방명록을 삭제하시겠습니까?</h2>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>
							${articleInfo.writer }
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${articleInfo.title }</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pw" size="80"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="삭제" onclick="removeGuestbook(this.form)"/>&nbsp;&nbsp;
							<input type="button" value="취소" onclick="location.href='index.jsp'">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>