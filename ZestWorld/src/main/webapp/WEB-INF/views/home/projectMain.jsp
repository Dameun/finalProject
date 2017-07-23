<%--
	@File name : projectMain.jsp
	@Project : ZestWorld
	@Author : 장윤희
	@Data : 2017.07.12
	@Desc :  프로젝트  메인화면 (수정하거나 프로젝트 선택시)
--%>
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

//맴버삭제
function assignMemberDelete(memberId,projectId){
	$.ajax({
		type:"get",
		url:"assignMemberDelete.htm?memberId="+memberId+"&projectId="+projectId,
		success:function(data){
		    if(data.check=="check"){
		    	 ajaxView('projectMain.ajax');
		    }
			/* 
			ajaxView('taskList.ajax'); */
		},
		error:function(){
			alert('error');
		}
	});	
}

//프로젝트 배정맴서 수정
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

//프로젝트 할당
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
	    		   ajaxView('projectMain.ajax');
	    	   }
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	}); 
}


</script>
 <h3>Individual Task - <span class="fw-semi-bold">Project</span></h3>
	<div class="clearfix">
		<div class="btn-toolbar pull-right">
			<button role="button" class="btn btn-inverse mb-xs"
				onclick="ajaxView('Createproject.ajax')">
 <i class="fa fa-plus text-warning"></i>
 새로운 프로젝트</button>
			<!-- <a class="btn btn-inverse btn-sm" href="index.html">Login</a> -->
		</div>
	</div>
	<div class="row">
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
							onclick="projectEditModalView(${project.project_id},'${project.p_title}','${project.description}');"
							href="#"><i class="glyphicon glyphicon-edit"></i></a> 
						<a
							data-widgster="close" title="Close"
							onclick="projectDelete(${project.project_id})" href="#">
							<i class="glyphicon glyphicon-remove"></i></a>
					</div>
				</header>

				<div class="widget-body">
					<p>${project.p_title}</p>
					<p>${project.description}</p>

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
								<a href="#"
								onclick="assignMemberDelete('${member.user_id}',${member.project_id});"
								class="select2-search-choice-close"tabindex="-1"></a> <!-- <a onclick="location.href='assignMemberDelete.htm?memberId=${member.user_id}&project_id=${member.project_id }'" class="select2-search-choice-close" tabindex="-1"></a> -->
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
					<h4 class="modal-title"
						id="myModalLabel18">프로젝트 멤버 배정</h4>
					
				</div>
				<div class="modal-body">

					<div id="wMemberList"></div>

			
				<div class="form-group"style="text-align:right;">
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-warning btn-sm"
						onclick="projectAssign();" data-dismiss="modal">Finish</button>
				</div>
					</div>
			</div>
		</div>
	</div>
<!--프로젝트 수정  -->
<div class="modal fade" id="editProjectModal" role="dialog">
	<div class="modal-dialog modal-lg"  style="padding-left:10%;">
		
		   
			<section class="widget"style="width:90%;">
				<div class="widget-body">
					<form id="validation-form" class="form-horizontal form-label-left"
						method="post" data-parsley-priority-enabled="false"
						novalidate="novalidate">
						<fieldset>
						<div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                     <h4 class="modal-title">프로젝트명 수정</h4>
                     </div>
                     <br>
							<div class="form-group">
								<label class="control-label col-sm-2" for="number"> 프로젝트
									명 </label>
								<div class="col-sm-10">
									<input type="text"
										class="form-control"
										id="modalDetailTitle">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="number"> 상세
									설명 </label>
								<div class="col-sm-10">
									<textarea rows="3"
										class="autogrow form-control transition-height"
										id="modalDetailExplain"></textarea>
								</div>
							</div>
							<div class="form-group"style="text-align:right;">
								<div class="col-sm-12">
									<button type="button"
										class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
								
								
									<!-- <button style="margin-left:20px" type="button" class="btn btn-success" data-dismiss="modal" onclick="detailUpdate();">Submit</button> -->
									<button type="button"
										class="btn btn-warning btn-sm" id="detailClose" data-dismiss="modal"
										onclick="projectUpdate(${project.project_id});">Finish</button>
							</div>
							</div>
						</fieldset>
					</form>
				</div>
			</section>
		</div>
	</div>
</div>


