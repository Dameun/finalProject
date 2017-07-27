<%--
	@File name : CreateProject.jsp
	@Project : ZestWorld
	@Author : 장윤희
	@Data : 2017.07.10
	@Desc :  프로젝트 생성시 프로젝트 이름 및 설명 유져입력받는 페이지 
--%>
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
	
	function yes()
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
	
	function no()
	{
		$('#p_title').val("");
		$('#explain').val("");
	}
	
	//프로젝트 생성 
	function CreateProjcetProcess()
	{
		dialogPopup("프로젝트를 생성하시겠습니까?", yes, no);
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
<div class="col-md-7 col-sm-6 col-xs-10 col-lg-offset-2 col-sm-offset-3 col-xs-offset-1">
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
					 placeholder="Description" id="explain" name="explain">

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

<div id="dialog-confirm" title="알람메세지">
  <div id = "dialogContent"></div>
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
                  <div class="form-group">
                     <input class="form-control" type="text" id="milestoneContent" name="milestoneContent"
                        placeholder="',' 로구분해주세요"  style="width:100%;">
                       </div>
                       <div class="form-group" style="text-align:right;">
                        
                          <button type="button" class="btn btn-secondary btn-sm"
                        id="cancleBtn" data-dismiss="modal">
                       Cancel
                     </button>
                     <button type="button" class="btn btn-warning btn-sm"
                        id="btn" onclick= "CreateMilestone()"  style="padding-right:10px" data-dismiss="modal">
                        Finish
                     </button>
                   
                     
                     
                     </div>
                  </div>
               </div>

            </div>

         </div>
     
      </form>

