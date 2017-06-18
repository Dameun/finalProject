<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	if( $("#private").is(':checked')) publicProjectCheck = "1"; //공개 0,비공개 1
	if( $("#e_check").is(':checked')) eProjectCheck = "1"; //에센스미사용 0,에센시사용 1
	etcStr = publicProjectCheck+","+eProjectCheck;
	alert('p_title'+p_title+'/explain'+explain+'/etcStr'+etcStr)
	
	$.ajax({
		type:"get",
		url:"CreateProjectProcess.ajax",
		data:{	"p_title" : p_title,
				"explain" : explain,
				"etcStr"  : etcStr
		},
		
		success:function(data){
			ajaxView('projectMain.ajax');
		},
		error:function(){
			alert('error');
		},
	});	
/* 	
	location.href="CreateProjectProcess.htm?p_title="+ p_title+"&explain="+ explain 
			+ "&etcStr=" + etcStr; */
}
</script>
<div id="content">
 		<div class="bs-calltoaction bs-calltoaction-primary">
			<div class="row">
				<div class="col-md-9 cta-contents">
					<h1 class="cta-title">프로젝트 생성</h1>
					    <div class="control-group">
			            	<input type="text" class="login-field" style="font-size:12pt; color:#ff0000;  value="" placeholder="input workspacename" id="p_title" name="p_title">
			            	<label class="login-field-icon fui-user" font-color ="blue"  label for="uid">프로젝트 이름</label>
			            </div>
			             <div class="control-group">
			            	<input type="text" "class="login-field" value="" placeholder="discription" id="explain" name="explain"
			            	style="font-size:12pt; color:#ff0000; font-weight:bold;">
			            	<label class="login-field-icon fui-user" label for="uid">프로젝트 설명</label>
			            </div>
			            <br>
			            	프로젝트 공개여부
			            <input type="radio" name="projectType" id="public" value="공개" checked>공개
                		<input type="radio" name="projectType" id="private" value="비공개">비공개
                			<br>
                		<input type="checkbox" name="e_check" id="e_check" value="에센스 적용">에센스 적용여부
                	
				</div>
				<div class="col-md-3 cta-button">
					<button type="button" onclick="CreateBtn()"
					class="btn btn-lg btn-block btn-primary" >만들기</button>
				</div>
					
			</div>
		</div>  


</div>
