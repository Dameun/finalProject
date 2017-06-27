<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript">
	function CreateBtn() 
	{
		CreateProjcetProcess();
	}
	
	//프로젝트 생성 
	function CreateProjcetProcess()
	{
		var p_title = $('#p_title').val();
		var explain = $('#explain').val();
		var etcStr = "0";

		if ($("#private").is(':checked'))
			etcStr = "1"; //공개 0,비공개 1
			
		$.ajax({
			type : "get",
			url : "CreateProjectProcess.ajax",
			data : {
				"p_title" : p_title,
				"explain" : explain,
				"etcStr" : etcStr
			},

			success : function(data) {
				ajaxView('projectMain.ajax');
			},
			error : function() {
				alert('error');
			},
		});
	}

	//마일스톤명 입력시
	function CreateMilestone ()
	{
		var p_title = $('#p_title').val();
		var explain = $('#explain').val();
		var etcStr = "0";
		var eProjectCheck = "0";
		if ($("#private").is(':checked'))
			etcStr = "1"; //공개 0,비공개 1
		
			
		$.ajax({
		       type : "get",
		       url: "CreateEssenceMilestone.ajax",
		       
		       data : {
					"p_title" : p_title,
					"explain" : explain,
					"etcStr" : etcStr,
					"milestoneContentStr" : $('#milestoneContent').val()
				},
		       success:function(data) {
		    	   
		    	   ajaxView('CreateEssence.ajax');
		       },
		       error:function() {
		          alert('error');
		       }
		    });
	}
</script>
<div class="content-wrap">
<main id="content" class="widget-login-container" role="main">
<div class="col-md-8">
<section class="widget">
<div class="widget-body">
	<h4>
		Create Project 
		
	</h4>
	<div class="widget-controls">
	<button type="button" class="btn btn-warning" data-toggle="modal"
	         data-target="#milestone-modal"> + Essence</button>
	</div>
	<form role="form">
		<fieldset>
			<legend></legend>
			<div class="form-group">
				<label for="p_title">프로젝트
					이름</label> <br><input type="text" class="form-control"
					placeholder="Project Name" id="p_title" name="p_title">

			</div>
			<div class="form-group">
				<label for="explain">프로젝트
					설명</label> <br><input type="text" class="form-control"
					 placeholder="Discription" id="explain" name="explain">

			</div>

			
			<div class="form-group">
				<button type="reset" class="btn btn-secondary btn-sm">Reset</button>
				<button type="button" onclick="CreateBtn()"
					class="btn btn-inverse btn-sm">Create</button>
			</div>
		</fieldset>
	</form>
</div>
</section>
</div>
</main>
</div>
 <!--마일스톤 팝업창  -->
         <!-- modal -->
         <form id="milestone" name="milestone" method="post">
         <div class="modal fade" id="milestone-modal" style="display: none;">
            <div class="modal-dialog"style="width:40%;">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                     <h4 class="modal-title">마일스톤 명을 입력하세요</h4>
                  </div>
                  <br>
                  <div class="modal-body">
                  <div class="input-group">
                     <input class="form-control" type="text" id="milestoneContent" name="milestoneContent"
                        placeholder="',' 로구분해주세요"  style="width:90%;">
                       
                        <div class="input-group-btn">
                     <button type="button" class="btn btn-warning"
                        id="btn" onclick= "CreateMilestone()"   data-dismiss="modal">
                        <i class="fa fa-check"></i>
                     </button>
                     </div>
                     </div>
                  </div>
               </div>

            </div>

         </div>
     
      </form>

