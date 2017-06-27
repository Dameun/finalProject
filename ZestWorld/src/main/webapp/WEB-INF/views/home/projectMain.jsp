<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript">

var current_project_id='';
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
		}
	});	
}

/* 배정된 멤버 삭제  */
function assignMemberDelete(memberId)
{
	console.log('멤버삭제 들어가라');
	$.ajax({
		type:"get",
		url:"assignMemberDelete.htm?memberId="+memberId,
		success:function(data){
			/* if(data=="check"){
				window.location.reload()
			} */
			/* 
			ajaxView('taskList.ajax'); */
		},
		error:function(){
			alert('error');
		}
	});	
}


function projectAssignMemberList(workspace_id,project_id){
	var str='';
	console.log("멤버배정 리스트");
	$.ajax({
	    type : "get",
	    url : "projectAssignMemberList.htm?workspace_id="+workspace_id,
	    success : function(data) {
	 		console.log("data:    " + data);
	 		current_project_id=project_id
	 		$.each(data.wMemberList,function(index,value){
					console.log(index + "/" + value.user_id);
					str+="<input type='checkbox' value='"+value.user_id+"' name='AssignMemberChk' >&nbsp&nbsp&nbsp&nbsp"+value.user_id + "<br>";
					/* "+value.user_id+" */
					
			});
	 		/* var htm="<form name='memberChk'>"+str+"</form>"; */
	 		console.log("str   :" +str);
	 		$("#wMemberList").append($('#wMemberList').html(str));
	    },
	    error : function() {
	       alert('Error while request..');
	    }
	 });
}


function projectAssign(){
	var checkboxValues = [];
    $("input[name='AssignMemberChk']:checked").each(function(i) {
        checkboxValues.push($(this).val());
    });
    console.log('들어오니');
    $.ajax({
	       type : "get",
	       url : "projectAssignChk.htm?project_id="+current_project_id+"&chkmember="+checkboxValues,
	       success : function(data) {
	    	   if(data.success=="success"){
	    	   		console.log('성공');
	    	   		location.reload();
	    	   }
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	}); 
}


</script>
projectmain
		 <div class="row">
		 		<c:forEach items="${projectList}" var="project">
		            <div class="col-md-6 widget-container">
		                <section class="widget" id="default-widget" data-widgster-load="demo/ajax/widgets/default.php">
		                    <header>
		                        <h5><span class="fw-semi-bold">${project.p_title}</span></h5>
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
		              
		                        
		                        <hr>
		                        
                        	<label class="col-md-4 control-label" for="multiple-select"  onclick= "projectAssignMemberList(${project.workspace_id},${project.project_id});" data-toggle="modal" data-target="#assignMember">
                                     	<h4 >Member</h4>
                            </label>
                            </div>
		                    <div class="select2-container select2-container-multi select2 form-control" id="s2id_multiple-select"  >
		                    	<ul class="select2-choices" > 
			                    		<c:forEach items="${project.projectMember}" var="member">
			                    			<li class="select2-search-choice"><div>${member.user_id}</div>
<%-- 			                    				<a onclick="location.href='assignMemberDelete.htm?memberId=${member.user_id}'" class="select2-search-choice-close" tabindex="-1" onclick="assignMemberDelete(${member.user_id});"></a>
 --%>			                    		
 												<a onclick="location.href='assignMemberDelete.htm?memberId=${member.user_id}&project_id=${member.project_id }'" class="select2-search-choice-close" tabindex="-1"></a>
 											</li>
			                    		</c:forEach>
		                    	
 								</ul>
 							</div>
		                        <br>
		                        <button type="button" onclick="projectClick(${project.project_id})"
											class="btn btn-lg btn-block btn-primary" >Enter</button>
		                    </div>
		                </section>
		      	</div>
		      	
		    </c:forEach>
		    
		     <div class="clearfix">
                                <div class="btn-toolbar pull-right">
                                    <button type="button" class="btn btn-default btn-sm" onclick="ajaxView('Createproject.ajax')" >+새로운 프로젝트</button>
                                    <!-- <a class="btn btn-inverse btn-sm" href="index.html">Login</a> -->
                                </div>
                     </div>  
		</div>

     <div class="modal fade" id="assignMember" style="display: none;">
		<div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title text-xl-center fw-bold mt" id="myModalLabel18">프로젝트 멤버 배정</h4>
                    <p class="text-xl-center text-muted mt-sm fs-mini">
                        We need a bit of your detailed information to proceed. US ticketing system requires
                        us to process and check your personal infromation before we can go.
                    </p>
                </div>
                <div class="modal-body bg-gray-lighter">
                    	
                    <div id="wMemberList">
                    
					</div>
                    
                    
                    
                    
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-gray" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success" onclick="projectAssign();" data-dismiss="modal">Assign</button>
                </div>
            </div>
       </div>
	</div>


