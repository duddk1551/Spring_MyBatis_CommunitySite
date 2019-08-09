<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.demo.dto.Article"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시물 상세페이지"/>
<%@ include file="../part/head.jspf"%>

<script>
	
</script>

<style>
</style>

<div class="article-detail table-common con">
	<table>
		<colgroup>
			<col width="80">
		</colgroup>
		<tbody>
			<tr>
				<th>ID</th>
				<td><c:out value="${article.id}" /></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><c:out value="${article.regDate}" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><c:out value="${article.title}" escapeXml="true" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${article.bodyForPrint}</td>
			</tr>
		</tbody>
	</table>
</div>
<%@ include file="../part/foot.jspf"%>