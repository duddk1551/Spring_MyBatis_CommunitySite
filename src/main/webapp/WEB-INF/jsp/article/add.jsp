<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.demo.dto.Article"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../part/head.jspf"%>

<script>
	function submitAddForm(form) {

	form.title.value = form.title.value.trim();

	if (form.title.value.length == 0) {
		alert('제목을 입력해주세요.');
		form.title.focus();
		return false;
	}

	form.body.value = form.body.value.trim();

	if (form.body.value.length == 0) {
		alert('내용을 입력해주세요.');
		form.body.focus();
		return false;
	}

	form.submit();
}	
</script>

<style>
</style>

<h1 class="con">게시물 추가</h1>

<form class="table-common" action="./doAdd" method="POST"
	onsubmit="submitAddForm(this); return false;">
	<table class="table-1 con">
		<colgroup>
			<col width="200">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input autocomplete="false" type="text" name="title" placeholder="제목을 입력해주세요.">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="body" placeholder="내용을 입력해주세요."></textarea>
				</td>
			</tr>
			<tr>
				<th>등록</th>
				<td><input type="submit" value="등록"> <input type=button
					value="취소" onclick="location.href = './list';"></td>
			</tr>
		</tbody>
	</table>
</form>


<%@ include file="../part/foot.jspf"%>