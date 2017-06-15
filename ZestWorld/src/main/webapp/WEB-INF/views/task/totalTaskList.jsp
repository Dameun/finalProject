<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<div>
	<c:forEach items="${list}" var="n">
		<div id="totalTaskajax">
			<div class="articlesteam" >
						   		<!-- <h2>팀원 모집</h2> -->
				<ol class="group">
						<li class="comment">
						<p class="text">
						<input type="checkbox" value="dd">&nbsp ${n.title}</p>
							    <time>taskworldproject > ${n.userid}</time>
							    <a class="remove">마감일 없음</a>
							    <hr>
						</li>
				</ol>
			</div>
		</div>
	</c:forEach> 
</div>