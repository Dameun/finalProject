<%--
	@Project : ZestWorld
	@File name : taskassignMember.jsp
	@Author : 최담은
	@Data : 2017.6.26
	@Desc : 전체개요 상세보기 -> 배정된 멤버리스트
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <div
	class="select2-container select2-container-multi select2 form-control"
	id="s2id_multiple-select" data-toggle="modal"
	data-target="#assignMember">
	onclick="projectAssignMemberList(${project.workspace_id},${project.project_id});">
	
	<ul class="select2-choices">
		<c:forEach items="${assignmember}" var="member">
			<li class="select2-search-choice"><div>${member.user_id}</div> <a
				href="#" class="select2-search-choice-close" tabindex="-1"
				onclick="assignMemberDelete(${member.user_id});"></a></li>
		</c:forEach>
	</ul>
</div> --%>
<c:forEach items="${assignmember}" var="member">
		<li class="select2-search-choice"><div>${member.user_id}</div> <a
			<%--  onclick="location.href='deleteTaskMember.htm?userid=${member.user_id}'" class="select2-search-choice-close" tabindex="-1" --%>
			onclick="deleteTaskMember('${member.user_id}');" class="select2-search-choice-close" tabindex="-1"
	
			></a></li>
</c:forEach>