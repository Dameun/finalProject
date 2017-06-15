<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<div>
	<select id="catechange" onchange="categorychange();">
		<c:forEach items="${category}" var="n">
			<option value="${n.category_id}">${n.title}</option>		
		</c:forEach>
    </select>
</div>