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
	
}

function BackBtn()
{
	location.href = "workSpace.htm";
}

function yes()
{
	var workspacename = $('#workspacename').val();
	var workspaceDiscription = $('#workspaceDiscription').val();
	location.href='createWorkspace.htm?workspaceName='+ workspacename+'&'+ 'workspaceDiscription='+ workspaceDiscription;
}

function no()
{
	$('#workspacename').val("");
	$('#workspaceDiscription').val("");
}

function dialogPopup(contents, callback_Y, callback_N ) {

	  $("#dialogContent").val(contents);
	  $( "#dialog-confirm" ).dialog({
	      resizable: false,
	      height: "auto",
	      width: 400,
	      modal: true,
	      buttons: {
	        "예": function() {
	        	  if ($.isFunction(callback_Y)) {
	        		  callback_Y.call();
	                }
	          $( this ).dialog( "close" );
	        },
	        "아니오": function() {
	        	  if ($.isFunction(callback_Y)) {
	        		  callback_N.call();
	                }
	          $( this ).dialog( "close" );
	        }
	      }
	    });
}

//프로젝트 생성 
function CreateProjcetProcess()
{
	dialogPopup("워크스페이스를 생성하시겠습니까?", yes, no);
}

</script>
<div>
	<div class="content-wrap">
		<main id="content" class="widget-login-container" role="main">
		<div class="col-md-8">
			<section class="widget">
				
				<div class="widget-body">
				 <h4>
				<i class="fa fa-circle text-gray"></i> Create Workspace <i
						class="fa fa-circle text-warning"></i>
						</h4>
					<form role="form">
						<fieldset>
						<legend></legend>
							<p>
								워크스페이스는 회사, 부서, 팀, 혹은 개인이 될 수 있습니다.
								.
							</p>
							<br>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Workspace Name" id="workspacename"
									name="workspacename">
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Description" id="workspaceDiscription"
									name="workspaceDiscription">
							</div>
							<div class="form-group">
							<button type="button" class="btn btn-secondary btn-sm"onclick="BackBtn()">Cancel</button>
								<button type="button" class="btn btn-inverse btn-sm"
									onclick="CreateBtn()">Create</button>
								
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
