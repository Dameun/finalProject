<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<div>

	<c:if test="${empty category}" >
		카테고리가 없습니다.
	</c:if>
	
	<c:if test="${!empty category}" >
		<select id="catechange" onchange="categorychange();">
			<option value="cateBefore">카테고리 선택</option>
				<c:forEach items="${category}" var="n">	
					<option value="${n.category_id}">${n.title}</option>		
				</c:forEach>
	    </select>
	</c:if>
	
</div>