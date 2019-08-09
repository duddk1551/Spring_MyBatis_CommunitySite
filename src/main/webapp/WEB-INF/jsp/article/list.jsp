<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.demo.dto.Article"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="pageTitle" value="게시물 리스트" />

<%@ include file="../part/head.jspf"%>


<div class="list-1 table-common con">
	<table>
		<colgroup>
			<col width="80">
			<col width="180">
			<col>
			<col width="100">
		</colgroup>
		<thead>
			<tr>
				<th>ID</th>
				<th>등록날짜</th>
				<th>제목</th>
				<th>댓글</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="article" items="${list}">
				<tr>
					<td><c:out value="${article.id}" /></td>
					<td><c:out value="${article.regDate}" /></td>
					<td><a href="detail?id=${article.id}"><c:out
								value="${article.title}" /></a></td>
					<td>${article.extra.repliesCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="../part/foot.jspf"%>