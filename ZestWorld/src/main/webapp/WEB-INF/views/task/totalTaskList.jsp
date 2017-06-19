<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
   request.setCharacterEncoding("UTF-8");
%>
<div style="margin-top: 30px">
	<c:forEach items="${list}" var="n">
		<div id="totalTaskajax" >
			<div class="articlesteam" >
			<input type="checkbox" onclick="changeSuccessF(${n.task_id});">
						   		<!-- <h2>팀원 모집</h2> -->
				<ol class="group">
						<%-- <li class="comment" data-toggle="modal" data-target="#detailModal" onclick= "detailModalView(${n.task_id});""location.href='detailModal.htm?task_id='+${n.task_id}"> --%>
						<%-- <li class="comment" data-toggle="modal" data-target="#detailModal" onclick= "location.href='detailModal.htm?task_id='+${n.task_id}"> --%>
						<li class="comment" data-toggle="modal" data-target="#detailModal" onclick= "detailModalView(${n.task_id});">
						<p class="text">
						&nbsp ${n.title}</p>
						<!-- <input type="checkbox" value="dd" >&nbsp ${n.title}</p> -->
						<div>
							    <time>taskworldproject > ${n.userid}</time>
							    <a class="remove" >마감일 없음</a>
							    <hr>
						</div>
						</li>
				</ol>
			</div>
		</div>
	</c:forEach> 
</div>