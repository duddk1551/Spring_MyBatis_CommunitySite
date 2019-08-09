<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.demo.dto.Article"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../part/head.jspf"%>

<script>
	
</script>

<style>
</style>

<h1 class="con">게시물 수정</h1>

<form class="table-common" action="./doModify" method="POST"
	onsubmit="submitModifyForm(this); return false;">
	<input type="hidden" name="id" value="${article.id}" />
	<table class="detail-1 table-1 con">
		<colgroup>
			<col width="200">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th>ID</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>등록날짜</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input autocomplete="false" type="text" name="title"
					value="${article.title}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="body">${article.body}</textarea></td>
			</tr>
			<tr>
				<th>수정</th>
				<td><input type="submit" value="수정" /> <input type=button
					value="취소" onclick="location.href = './list';"></td>
			</tr>
		</tbody>
	</table>
</form>
<%@ include file="../part/foot.jspf"%>