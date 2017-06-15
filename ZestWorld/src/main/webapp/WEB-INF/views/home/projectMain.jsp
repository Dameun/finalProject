<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function CreateWorkspace()
{
	
	console.log('CreateWorkspace');
	$.ajax({
		type:"get",
		url:"addWorkspace.ajax",
		success:function(data){
			
			$("#contentDiv").append( $('#contentDiv').html(data)); 		
		},
		error:function(){
			alert('error');
		},
	});	
}

function projectClick(project_id)
{
	$.ajax({
		type:"get",
		url:"selectProject.ajax",
		data:{"project_id" : project_id},
		success:function(data){
			ajaxView('taskList.ajax');
		},
		error:function(){
			alert('error');
		},
	});	
}
</script>
<div class="container">
  <main id="content" class="widget-login-container" role="main">
		 <div class="row">
		 		<c:forEach items="${projectList}" var="project">
		            <div class="col-md-6 widget-container">
		                <section class="widget" id="default-widget" data-widgster-load="demo/ajax/widgets/default.php">
		                    <header>
		                        <h5>Default <span class="fw-semi-bold">Widget</span></h5>
		                        <div class="widget-controls">
		                            <a data-widgster="load" title="Reload" href="#"><i class="fa fa-refresh"></i></a>
		                            <a data-widgster="expand" title="Expand" href="#"><i class="glyphicon glyphicon-chevron-up"></i></a>
		                            <a data-widgster="collapse" title="Collapse" href="#"><i class="glyphicon glyphicon-chevron-down"></i></a>
		                            <a data-widgster="fullscreen" title="Full Screen" href="#"><i class="glyphicon glyphicon-fullscreen"></i></a>
		                            <a data-widgster="restore" title="Restore" href="#"><i class="glyphicon glyphicon-resize-small"></i></a>
		                            <a data-widgster="close" title="Close" href="#"><i class="glyphicon glyphicon-remove"></i></a>
		                        </div>
		                    </header>
		                    <div class="widget-body">
		                        <p>${project.p_title}</p>
		                        <p>${project.explain}</p>
		                        <button type="button" onclick="projectClick(${project.project_id})"
											class="btn btn-lg btn-block btn-primary" >Enter</button>
		                    </div>
		                </section>
		      	</div>
		    </c:forEach>
		</div>
</main>
</div>
	<%-- <div class="container">
		<div class="col-sm-12">
			<div id="contentDiv" name= "contentDiv">
				<c:forEach items="${projectList}" var="project">
					<div class="bs-calltoaction bs-calltoaction-primary">
						<div class="row">
							<div class="col-md-9 cta-contents">

								<h1 class="cta-title">${project.p_title}</h1>
	
								<div class="cta-desc">
									<p>${project.explain}</p>
								</div>
							</div>
							
							<div class="col-md-3 cta-button">
								<button type="button" onclick="location.href='selectWorkspace.htm?selectWorkspaceID=${workSpace.workspace_id}'"
									class="btn btn-lg btn-block btn-primary" >Enter</button>
							</div>
	 						
						</div>
					</div>
				</c:forEach>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ajaxView('Createproject.ajax')">
					<span aria-hidden="true">+새로운 프로젝트</span>
				</button>
			</div>
		</div>
	</div> --%>
