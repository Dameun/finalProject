<%--
	@Project : ZestWorld
	@File name : totalTaskList.jsp
	@Author : 최담은
	@Data : 2017.07.01
	@Desc : 전체개요 -> 리스트출력
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
   request.setCharacterEncoding("UTF-8");
%>

<div style="margin-top: 30px">
	
    <div><input type="hidden" id="paging" value='${paging}'></div>
   
	<c:forEach items="${list}" var="n">
		<div id="totalTaskajax" >
			<div class="articlesteam" >		  
				<ol class="group">
					<li style="list-style-type: none">
							<section class="event">
		                        <span class="thumb-sm avatar pull-left mr-sm">
		                            <input type="checkbox" 
											<c:if test="${n.success_f eq 1}">
									             checked= "checked"
									             onclick="modalSuccessUpdateDialog(${n.task_id});"
									        </c:if> 
									        <c:if test="${n.success_f eq 0}">
									            onclick="modalSuccess_kUpdateDialog(${n.task_id});"
									        </c:if>
								>
		                        </span>
		                            <h4 class="event-heading" data-toggle="modal" data-target="#detailModal" onclick= "detailModalView(${n.task_id},${n.project_id});"><a href="#">${n.title}</a></h4> 
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small><a href="#">마감일: ${n.end_date}</a></small>
		                        <p class="fs-sm text-muted">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        		follower > ${n.user_id}</p>
		                        <p class="fs-mini">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                           ${n.explain}
		                        </p>
		                        <br>
	                      </section>			
					</li>
				</ol>
			</div>
		
		</div>
		<input type="hidden" id="hiddenFollower" value="${n.follower}">
		<input type="hidden" id="hiddenUserId" value="${userId}">
	</c:forEach> 
	
	<div class="clearfix"style="text-align:center;">
        <button class="btn btn-default btn-rounded"
			<c:if test="${paging>1}">
					onclick="myfilter(${paging},0);"
				
			</c:if>>
			<i class="fa fa-caret-left"></i>
				이전
		</button>
		
		
		<button class="btn btn-inverse btn-rounded"
			<c:if test="${paging<count}">
					onclick="myfilter(${paging},1);"
				
			</c:if>>
			다음
			   <i class="fa fa-caret-right"></i>
			 
		</button>
    </div>
</div>