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
		success : function(data) {
			var str= "";
			milestoneListView = data.milestoneList;
	 		$.each(data.milestoneList,function(index,value)
	 		{
	 				str += "<button type='button' class='btn btn-info btn-block' onclick='milestoneClick("+ index + ")''>"+ value +"</button>";
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
<div class="col-lg-4 col-md-6">
                <section class="widget">
                    <header>
                        <h4>
                            Block <span class="fw-semi-bold">Buttons</span>
                        </h4>
                        <div class="widget-controls">
                            <a data-widgster="expand" title="Expand" href="#" style="display: none;"><i class="glyphicon glyphicon-chevron-up"></i></a>
                            <a data-widgster="collapse" title="Collapse" href="#"><i class="glyphicon glyphicon-chevron-down"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <p class="fs-mini text-muted">
                            Create block level buttons - those that span the full width
                            of a parent— by adding <code>.btn-block</code>.
                            Great for menu &amp; social buttons.
                        </p>
                        <p id="tabs">
                            
                        </p>
                     	<button class="btn btn-info btn-rounded" id="open-wizard" type="button" onclick="FinishCreateEssence()">
                                    Edit complete!
                        </button>
                    </div>
                </section>
            </div>



</div>