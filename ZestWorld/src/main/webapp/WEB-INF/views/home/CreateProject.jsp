<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript">
	function CreateBtn() {
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
		alert('p_title' + p_title + '/explain' + explain + '/etcStr' + etcStr)

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
		/* 	
		 location.href="CreateProjectProcess.htm?p_title="+ p_title+"&explain="+ explain 
		 + "&etcStr=" + etcStr; */
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

			<div class="form-group">
				프로젝트 공개여부 <input type="radio" name="projectType" id="public"
					value="공개" checked />공개 <input type="radio" name="projectType"
					id="private" value="비공개" />비공개 <br> <input type="checkbox"
					name="e_check" id="e_check" value="에센스 적용" />에센스 적용여부

			</div>
			<div class="form-group">
				<button type="reset" class="btn btn-secondary btn-sm">Reset</button>
				<button type="button" onclick="CreateBtn()"
					class="btn btn-inverse btn-sm">Create</button>
			</div>
		</fieldset>
	</form>
</div>


