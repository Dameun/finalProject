<%@page import="com.zestworld.util.DataController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">
var milestoneListView = new Array(); 
var count = 0;
function FinishCreateEssence()
{
	$.ajax({
		type :'get',
		url : "FinishCreateEssence.ajax",
		success : function(data) {
			ajaxView('projectMain.ajax');
		},
		error : function() {
			alert('error');
		}
	});
}

//클릭시 
function milestoneClick(milestoneIdx)
{
	$.ajax({
		type : 'get',
		url : "CreateDefineSelectEssence.ajax",
		data : {"milestoneIdx" : milestoneIdx},
		success : function(data) {
			ajaxView('CreateDefineEssence.ajax');
		},
		error : function() {
			alert('error');
		}
	});
}

$(document).ready(function(){
	$.ajax({
		type : 'get',
		url : "CreateEssenceData.ajax",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		success : function(data) {
			var str= "";
			milestoneListView = data.milestoneList;
	 		$.each(data.milestoneList,function(index,value)
	 		{
	 				str += "<button type='button' class='btn btn-warning btn-block' onclick='milestoneClick("+ index + ")''>"+ value +"</button>";
			});
	 		
	 		$("#tabs").append ($('#tabs').html(str));
		},
		error : function() {
			alert('error');
		}
	});
}); 

</script>
<div>
	<div class="container">
		<main id="content" class="widget-login-container" role="main">
		<div class="row">
			<div class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
				<section class="widget">
					<header>
						<h4>
							 <span class="fw-semi-bold">마일스톤</span>
						</h4>
					<!-- 	<div class="widget-controls">
							<a data-widgster="expand" title="Expand" href="#"
								style="display: none;"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a
								data-widgster="collapse" title="Collapse" href="#"><i
								class="glyphicon glyphicon-chevron-down"></i></a> <a href="#"
								data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
						</div> -->
					</header>
					<div class="widget-body">
						<p class="fs-mini text-muted">
							개발 방법론의 마일스톤 혹은 단계 설정 시 해단 단계에서 
							완료되어야 할 상태에 대한 정의를 통해 각 단계의 정의를 명확히 한다.
						</p>
						<p id="tabs"></p>
							<div class="widget-controls">
					<button class="btn btn-default width-100 mb-xs" id="open-wizard"
							type="button" onclick="FinishCreateEssence()">Finish<span class="glyphicon glyphicon-ok"></span></button>
					</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	</div>
</div>

	