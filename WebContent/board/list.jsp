<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이미지 게시판</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

	<div>
		<c:if test="${loginUser != null}">	<!-- login User만 게시글 작성 버튼 볼 수 있음 -->
			<a href="insertForm.board">새 이미지 게시글 작성하기</a>
		</c:if>
		<c:if test="${loginUser == null}">
			<p>로그인을 해주세요</p>
		</c:if>
		
	</div>
	
	<div>
		<c:if test="${loginUser.id == 'admin'}">
			<a href="insertForm.notice">공지사항 작성하기</a>
		</c:if>
	</div>
	
	<!-- 목록 -->
	<table border="1">
		<thead>
			<tr>
				<td>순번</td>
				<td>작성자</td>
				<td>제목</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="4">표시할 내용이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="board"> 
					<tr>
						<td>${board.bNo}</td>
						<td>${board.writer}</td>
						<td><a href="view.board?bNo=${board.bNo}">${board.title}</a></td>
						<td>${board.created}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>	
		<tfoot>
			
		</tfoot>			
	</table>
	
</body>
</html>