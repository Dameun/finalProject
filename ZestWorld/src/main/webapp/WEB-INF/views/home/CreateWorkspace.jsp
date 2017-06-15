<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

function BackBtn()
{
	location.href = "workSpace.htm";
}

</script>
<div>
	<div class="container">
		<main id="content" class="widget-login-container" role="main">
		<div class="col-md-8">
			<section class="widget">
				<header>
					<h5>
						Form <span class="fw-semi-bold">Options</span>
					</h5>

				</header>
				<div class="widget-body">
					<form role="form">
						<fieldset>
							<legend>++ADD Workspace</legend>
							<p>
								Set input heights using classes like
								<code>.input-lg</code>
								and
								<code>.input-sm</code>
								. Also works with
								<code>type="search"</code>
								inputs and selects. For input groups use
								<code>.input-group-lg</code>
								&amp;
								<code>.input-group-sm</code>
								.
							</p>
							<br>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="workspacename" id="workspacename"
									name="workspacename">
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="workspaceDiscription" id="workspaceDiscription"
									name="workspaceDiscription">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-default"
									onclick="CreateBtn()">만들기</button>
								<button type="button" class="btn btn-default"
									onclick="BackBtn()">뒤로</button>
							</div>
						</fieldset>
					</form>
				</div>
			</section>
		</div>
		</main>
	</div>
</div>
<!-- <div id="content">
 		<div class="bs-calltoaction bs-calltoaction-primary">
			<div class="row">
				<div>
	                  <div>
	                     <h4 class="modal-title" style="align: center">워크스페이스 추가</h4>
	                  </div>
	                  <div class="modal-body">
	                    		<input type="text" class="form-control" style="font-size:12pt; color:#ff0000;  value="" placeholder="input workspacename" id="workspacename" name="workspacename">
				            	<label class="login-field-icon fui-user" font-color ="blue"  label for="uid">워크스페이스 이름</label>
					</div>
						<button type="button" onclick="CreateBtn()"
						class="btn btn-lg btn-block btn-primary" >만들기</button>
						
	              		<button type="button" onclick="BackBtn()"
						class="btn btn-lg btn-block btn-primary" >뒤로</button>
	                                   
	                 
	               </div>
	          </div>
	    </div>   
</div>	 -->
<!-- <div id="content">
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
					
			</div> -->
