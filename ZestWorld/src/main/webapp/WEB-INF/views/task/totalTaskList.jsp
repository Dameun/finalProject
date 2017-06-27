<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
   request.setCharacterEncoding("UTF-8");
%>
<script>
function backPaging(cp,ps){
	
		$.ajax({
			type:"get",
			url:"backPaging.htm?cp="+cp+"&ps="+ps,
			dataType:'html',
			success:function(data){
			
				$("#ajaxlist").append($('#ajaxlist').html(data)); 		
			},
			error:function(){
				alert('검색 에러! 관리자에게 문의하세요');
			}
		});
}

</script>
<div style="margin-top: 30px">
	<div>
		<%-- <button onclick="myfilter(${paging},0);">
			<c:if test="${cpage>1}">
					onclick="backPaging(${cpage-1},${pagesize});"
				<a href="activityboardcontent?cp=${cpage-1}&ps=${pagesize}">이전</a>
				<!--페이지 리스트 구현  -->
			</c:if>>
				<    
		</button> --%>
		<%-- <button onclick="myfilter(${paging},1);">></button> --%>
		<button 
			<c:if test="${paging>1}">
					onclick="myfilter(${paging},0);"
				
			</c:if>>
				<    
		</button>
		<%-- <button onclick="myfilter(${paging},1);">></button> --%>
		
		
		<button 
			<c:if test="${paging<count}">
					onclick="myfilter(${paging},1);"
				
			</c:if>>
			    >
		</button>
    </div>
    <div><input type="hidden" id="paging" value='${paging}'></div>
	<c:forEach items="${list}" var="n">
		<div id="totalTaskajax" >
			<div class="articlesteam" >
			
						   		<!-- <h2>팀원 모집</h2> -->
				<ol class="group">
						<%-- <li class="comment" data-toggle="modal" data-target="#detailModal" onclick= "detailModalView(${n.task_id});""location.href='detailModal.htm?task_id='+${n.task_id}"> --%>
						<%-- <li class="comment" data-toggle="modal" data-target="#detailModal" onclick= "location.href='detailModal.htm?task_id='+${n.task_id}"> --%>
						<li class="comment" >
						<%-- <p class="text">
						&nbsp ${n.title}</p>
						<!-- <input type="checkbox" value="dd" >&nbsp ${n.title}</p> -->
						<div>
							    <time>${n.p_title} > ${n.user_id}</time>
							    <a class="remove" >마감일  : ${n.end_date }</a>
							    <hr>
						</div> --%>
						
						
						
						
						<section class="event">
                        <span class="thumb-sm avatar pull-left mr-sm">
                            <input type="checkbox" 
			<c:if test="${n.success_f eq 1}">
	             checked= "checked"
	             onclick="changeSuccessF_zero(${n.task_id});"
	        </c:if> 
	        <c:if test="${n.success_f eq 0}">
	            onclick="changeSuccessF(${n.task_id});"
	        </c:if>
	        
			<%-- <c:choose>
			    <c:when test="${n.success_f eq 1}">
			        checked= "checked"
	             	onclick="changeSuccessF(${n.task_id});"
			    </c:when>
			    <c:when test="${n.success_f eq 0}">
			        onclick="changeSuccessF_zero(${n.task_id});"
			    </c:when>
			</c:choose> --%>
	        >
                        </span>
                        <h4 class="event-heading" data-toggle="modal" data-target="#detailModal" onclick= "detailModalView(${n.task_id},${n.project_id});"><a href="#">${n.title}</a> <small><a href="#">마감일: ${n.end_date}</a></small></h4>
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
</div>