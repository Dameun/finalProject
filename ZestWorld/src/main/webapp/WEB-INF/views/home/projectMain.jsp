<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript">

var edit_project_id='';
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


//프로젝트 수정 
function projectEditModalView(project_id,p_title,explain)
{
	edit_project_id= project_id;
	$('#modalDetailTitle').val(p_title);
	$('#modalDetailExplain').val(explain);projectUpdate
}

function projectUpdate()
{

	var editTitle = $('#modalDetailTitle').val();
	var editExplain = $('#modalDetailExplain').val();

	$.ajax({
		type:"get",
		url:"projectEdit.ajax",
		data:{"project_id" : edit_project_id,
			"editTitle" : editTitle,
			"editExplain" : editExplain},
		success:function(data){
			alert('projectMain');
			ajaxView('projectMain.ajax');
		},
		error:function(){
			alert('error');
		}
	});	
}

//프로젝트 삭제 
function projectDelete(project_id)
{
	$.ajax({
		type:"get",
		url:"projectDelete.ajax",
		data:{"project_id" : project_id},
		success:function(data){
			ajaxView('projectMain.ajax');
		},
		error:function(){
			alert('error');
		}
	});	
}

/* 배정된 멤버 삭제  */
function assignMemberDelete(memberId,projectId){
	$.ajax({
		type:"get",
		url:"assignMemberDelete.htm?memberId="+memberId+"&projectId="+projectId,
		success:function(data){
		    if(data.check=="check"){
				window.location.reload()
		    }
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
	$.ajax({
	    type : "get",
	    url : "projectAssignMemberList.htm?workspace_id="+workspace_id+"&project_id="+project_id,
	    success : function(data) {
	 		console.log("data:    " + data);
	 		current_project_id=project_id
	 		$.each(data.wMemberList,function(index,value){
					console.log(index + "/" + value.user_id);
					str+="<input type='checkbox' value='"+value+"' id = 'checkbox1' name='AssignMemberChk' >&nbsp&nbsp&nbsp&nbsp"+value + "<br>";
					
			});
	 	
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

<div class="row">
	<div class="clearfix">
		<div class="btn-toolbar pull-right">
			<button type="button" class="btn btn-secondary btn-sm"
				onclick="ajaxView('Createproject.ajax')">+ 새로운 프로젝트</button>
			<!-- <a class="btn btn-inverse btn-sm" href="index.html">Login</a> -->
		</div>
	</div>
	<c:forEach items="${projectList}" var="project">
		<div class="col-md-6 widget-container" id="border1" >
			<section class="widget" id="default-widget"
				data-widgster-load="demo/ajax/widgets/default.php">
				<header>
					<h5>
						<span class="fw-semi-bold">${project.p_title}</span>
					</h5>
					<div class="widget-controls">
						<a  data-widgster="restore" title="Edit"
							data-toggle="modal" data-target="#editProjectModal"
							onclick="projectEditModalView(${project.project_id},'${project.p_title}','${project.explain}');"
							href="#"><i class="glyphicon glyphicon-resize-small"></i></a> 
						<a
							data-widgster="close" title="Close"
							onclick="projectDelete(${project.project_id})" href="#"><i
							class="glyphicon glyphicon-remove"></i></a>
					</div>
				</header>

				<div class="widget-body">
					<p>${project.p_title}</p>
					<p>${project.explain}</p>

					<legend></legend>

					Member <span class="glyphicon glyphicon-plus text-warning"
						onclick="projectAssignMemberList(${project.workspace_id},${project.project_id});"
						data-toggle="modal" data-target="#assignMember"></span>
				</div>

				<div
					class="select2-container select2-container-multi select2 form-control"
					id="s2id_multiple-select">
					<ul class="select2-choices">
						<c:forEach items="${project.projectMember}" var="member">
							<li class="select2-search-choice"><div>${member.user_id}</div>
								<!-- <a href='javascript:void(0);' onclick="assignMemberDelete1234(${member.user_id},${member.project_id});" class="select2-search-choice-close" tabindex="-1"></a> -->
								<a href='#'
								onclick="assignMemberDelete('${member.user_id}',${member.project_id});"
								class="select2-search-choice-close" tabindex="-1"></a> <!-- <a onclick="location.href='assignMemberDelete.htm?memberId=${member.user_id}&project_id=${member.project_id }'" class="select2-search-choice-close" tabindex="-1"></a> -->
							</li>
						</c:forEach>

					</ul>
				</div>
				<br>
				<button type="button" onclick="projectClick(${project.project_id})"
					class="btn btn-ms btn-block btn-inverse">Enter</button>
			</section>
		</div>
	</c:forEach>



	<div class="modal fade" id="assignMember" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title text-xl-center fw-bold mt"
						id="myModalLabel18">프로젝트 멤버 배정</h4>
					<p class="text-xl-center text-muted mt-sm fs-mini"></p>
				</div>
				<div class="modal-body">

					<div id="wMemberList"></div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-warning"
						onclick="projectAssign();" data-dismiss="modal">Assign</button>
				</div>
			</div>
		</div>
	</div>
	
<!--프로젝트 수정  -->
<div class="modal fade" id="editProjectModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<section class="widget">
				<div class="widget-body">
					<form id="validation-form" class="form-horizontal form-label-left"
						method="post" data-parsley-priority-enabled="false"
						novalidate="novalidate">
						<fieldset>
							<div class="form-group row">
								<label class="control-label col-sm-2" for="number"> 프로젝트
									명 </label>
								<div class="col-sm-9">
									<textarea rows="3"
										class="autogrow form-control transition-height"
										id="modalDetailTitle"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label class="control-label col-sm-2" for="number"> 상세
									설명 </label>
								<div class="col-sm-9">
									<textarea rows="3"
										class="autogrow form-control transition-height"
										id="modalDetailExplain"></textarea>
								</div>
							</div>
						</fieldset>

						<div class="">
							<div class="row">
								<div class="col-sm-10">
									<button style="margin-left: 20px" type="button"
										class="btn btn-secondary btn-rounded" data-dismiss="modal">Cancel</button>
								</div>
								<div class="col-sm-2">
									<!-- <button style="margin-left:20px" type="button" class="btn btn-success" data-dismiss="modal" onclick="detailUpdate();">Submit</button> -->
									<button style="margin-left: 20px" type="button"
										class="btn btn-warning" id="detailClose" data-dismiss="modal"
										onclick="projectUpdate(${project.project_id});">Submit</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
</div>

</div>

