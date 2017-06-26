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
		var p_title = $('#p_title').val();
		var explain = $('#explain').val();
		var etcStr = "";
		var publicProjectCheck = "0";
		var eProjectCheck = "0";
		if ($("#private").is(':checked'))
			publicProjectCheck = "1"; //공개 0,비공개 1
		if ($("#e_check").is(':checked'))
			eProjectCheck = "1"; //에센스미사용 0,에센시사용 1
		etcStr = publicProjectCheck + "," + eProjectCheck;
		
	   //에센스 만듬
	   if( eProjectCheck == "1")
	   {
		   CreateEssence ();
	   }else{
		   CreateProjcetProcess ();
	   }
	}
	
	//프로젝트 생성 
	function CreateProjcetProcess()
	{
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
		var etcStr = "";
		var publicProjectCheck = "0";
		var eProjectCheck = "0";
		if ($("#private").is(':checked'))
			publicProjectCheck = "1"; //공개 0,비공개 1
		if ($("#e_check").is(':checked'))
			eProjectCheck = "1"; //에센스미사용 0,에센시사용 1
		etcStr = publicProjectCheck + "," + eProjectCheck;
			
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

<div class="widget-body">
	<h4>
		<i class="fa fa-circle text-gray"></i> Create Project <i
			class="fa fa-circle text-warning"></i>
	</h4>
	<form role="form">
		<fieldset>
			<legend></legend>
			<div class="form-group">
				<label class="login-field-icon fui-user" label for="p_title">프로젝트
					이름</label> <br><input type="text" style="width: 50%;" class="form-controll"
					value="" placeholder="Project Name" id="p_title" name="p_title">

			</div>
			<div class="form-group">
				<label class="login-field-icon fui-user" label for="explain">프로젝트
					설명</label> <br><input type="text" "class="form-controll" style="width: 50%;"
					value="" placeholder="Discription" id="explain" name="explain">

			</div>

			<button type="button" class="btn btn-primary" data-toggle="modal"
	         data-target="#milestone-modal"> +Essence</button>
			<div class="form-group">
				<button type="reset" class="btn btn-secondary btn-sm">Reset</button>
				<button type="button" onclick="CreateBtn()"
					class="btn btn-inverse btn-sm">Create</button>
			</div>
		</fieldset>
	</form>
</div>
 <!--마일스톤 팝업창  -->
         <!-- modal -->
         <form id="milestone" name="milestone" method="post">
         <div class="modal fade" id="milestone-modal" style="display: none;">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                     <h4 class="modal-title" style="align: center">마일스톤 명을 입력하세요</h4>
                  </div>
                  <br>
                  <div class="modal-body">
                     <input class="form-control" type="text" id="milestoneContent" name="milestoneContent"
                        placeholder=",구분해주세요" >
                     <button type="button" class="btn btn-info btn-circle btn-lg"
                        id="btn" onclick= "CreateMilestone()"   data-dismiss="modal">
                        <i class="fa fa-check"></i>
                     </button>
                     <button type="button" class="btn btn-warning btn-circle btn-lg"
                        data-dismiss="modal" id="ucancle">
                        <i class="fa fa-times"></i>
                     </button>
                     
                  </div>
               </div>

            </div>

         </div>
     
      </form>

