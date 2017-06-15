<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

function CreateBtn()
{
	var workspacename = $('#workspacename').val();
	var workspaceDiscription = $('#workspaceDiscription').val();
	location.href='createWorkspace.htm?workspaceName='+ workspacename+'&'+ 'workspaceDiscription='+ workspaceDiscription;
}

</script>

<div id="content">
		<div class="bs-calltoaction bs-calltoaction-primary">
			<div class="row">
				<div class="col-md-9 cta-contents">
					<h1 class="cta-title">워크스페이스 만들기
						워크스페이스는 회사, 부서, 팀, 혹은 개인이 될 수 있습니다.	</h1>
					    <div class="control-group">
			            	<input type="text" class="login-field" style="font-size:12pt; color:#ff0000;  value="" placeholder="input workspacename" id="workspacename" name="workspacename">
			            	<label class="login-field-icon fui-user" font-color ="blue"  label for="uid">워크스페이스 이름</label>
			            </div>
			             <div class="control-group">
			            	<input type="text" "class="login-field" value="" placeholder="discription" id="workspaceDiscription" name="workspaceDiscription"
			            	style="font-size:12pt; color:#ff0000; font-weight:bold;">
			            	<label class="login-field-icon fui-user" label for="uid">설명</label>
			            </div>
				</div>
				<div class="col-md-3 cta-button">
					<button type="button" onclick="CreateBtn()"
					class="btn btn-lg btn-block btn-primary" >만들기</button>
				</div>
					
			</div>
		</div>


</div>
