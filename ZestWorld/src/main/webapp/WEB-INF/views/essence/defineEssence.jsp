<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">
var milestoneListView = new Array(); 

function getCheckedByName(name){
    var chks = document.getElementsByName(name);
    var results = [];
    for(var i = 0; i < chks.length; i++){
        chks[i].checked ? results.push(chks[i].id):"";
    }
    return results;
}

function nextMilstone(){
	
}

//완료시 체크 된것만 담기 
function finishMilstone()
{
	 var results = [];
	 results = getCheckedByName("cateDefineCheckbox");
	 
	 $.ajax({
			type : 'get',
			url : 	"selectCateSaveByMilstone.ajax",
			data : {"results" : results},
			success : function(data) {
				   ajaxView('CreateEssence.ajax');
			},
			error : function() {
				alert('error');
			}
		});
	 
}

function subTitlechecked(checkbox)
{
	var str ="";
	if( $(checkbox).is(":checked"))
	{
		$.ajax({
			type : 'get',
			url : 	"cateDetailContent.ajax",
			data : {"checkboxid" : checkbox.id},
			success : function(data) {
				str = "<button class='btn btn-inverse'>" + data.defineDetailTitle+ "&nbsp;&nbsp; <span class='badge badge-warning'>"+data.defineDetailList.length+"</span> </button><br>";
				
				$("#detailTitle").empty();
				$("#detailTitle").append ($('#detailTitle').html(str));
				
				str = "";
				$.each(data.defineDetailList,function(index,value)
		 		{
	
					str += "<div class='alert alert-success alert-sm'><span class='fw-semi-bold'>"+
					index +":</span>"+ value + " </div>";
				});
				 		
				$("#detailCateContent").empty();
				$("#detailCateContent").append ($('#detailCateContent').html(str));
			},
			error : function() {
				alert('error');
			}
		});
	}
}

$(document).ready(function(){
	$.ajax({
		type : 'get',
		url : "CreateEssenceData.ajax",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		success : function(data) 
		{
			var str= "";
	 		$.each(data.defineist_0,function(index,value)
	 		{	
	 			
	 			str += "<div class='checkbox checkbox-warning checkbox-circle' ><input id='0_"+ value.ecate_id+ "' type='checkbox' name='cateDefineCheckbox' onclick='subTitlechecked(this)'><label for='0_"+ value.ecate_id +"'>"+
		 			value.subTitle+
		 		"</label></div>";
			});
	 		
	 		$("#tab0_checkList").append ($('#tab0_checkList').html(str));
	 		
	 		str = "";
	 		$.each(data.defineist_1,function(index,value)
	 		{

	 			str += "<div class='checkbox checkbox-warning checkbox-circle' ><input id='1_"+ value.ecate_id+ "' type='checkbox'  name='cateDefineCheckbox' onclick='subTitlechecked(this)'><label for='1_"+ value.ecate_id +"'>"+
		 			value.subTitle+
		 		"</label></div>";
			});
	 		
	 		$("#tab1_checkList").append ($('#tab1_checkList').html(str));
	 		
	 		str = "";
	 		$.each(data.defineist_2,function(index,value)
	 		{
	 			console.log(value.subTitle);
	 			str += "<div class='checkbox checkbox-warning checkbox-circle' ><input id='2_"+ value.ecate_id+ "' type='checkbox'  name='cateDefineCheckbox' onclick='subTitlechecked(this)'><label for='2_"+ value.ecate_id +"'>"+
		 			value.subTitle+
		 		"</label></div>";
			});
	 		
	 		$("#tab2_checkList").append ($('#tab2_checkList').html(str));
	 		
	 		str = "";
	 		$.each(data.defineist_3,function(index,value)
	 		{
	 			console.log(value.subTitle);
	 			str += "<div class='checkbox checkbox-warning checkbox-circle' ><input id='3_"+ value.ecate_id+ "' type='checkbox' name='cateDefineCheckbox'  onclick='subTitlechecked(this)'><label for='3_"+ value.ecate_id +"'>"+
		 			value.subTitle+
		 		"</label></div>";
			});
	 		
	 		$("#tab3_checkList").append ($('#tab3_checkList').html(str));
	 		
	 		str = "";
	 		$.each(data.defineist_4,function(index,value)
	 		{
	 			console.log(value.subTitle);
	 			str += "<div class='checkbox checkbox-warning checkbox-circle' ><input id='4_"+ value.ecate_id+ "' type='checkbox' name='cateDefineCheckbox'  onclick='subTitlechecked(this)'><label for='4_"+ value.ecate_id +"'>"+
		 			value.subTitle+
		 		"</label></div>";
			});
	 		
	 		$("#tab4_checkList").append ($('#tab4_checkList').html(str));
	 		
	 		str = "";
	 		$.each(data.defineist_5,function(index,value)
	 		{
	 			console.log(value.subTitle);
	 			str += "<div class='checkbox checkbox-warning checkbox-circle' ><input id='5_"+ value.ecate_id+ "' type='checkbox'  name='cateDefineCheckbox' onclick='subTitlechecked(this)'><label for='5_"+ value.ecate_id +"'>"+
		 			value.subTitle+
		 		"</label></div>";
			});
	 		
	 		$("#tab5_checkList").append ($('#tab5_checkList').html(str));
	 		
	 		str = "";
	 		$.each(data.defineist_6,function(index,value)
	 		{
	 			console.log(value.subTitle);
	 			str += "<div class='checkbox checkbox-warning checkbox-circle' ><input id='6_"+ value.ecate_id+ "' type='checkbox'  name='cateDefineCheckbox' onclick='subTitlechecked(this)'><label for='6_"+ value.ecate_id +"'>"+
		 			value.subTitle+
		 		"</label></div>";
			});
	 		
	 		$("#tab6_checkList").append ($('#tab6_checkList').html(str));
		},
		
		error : function() {
			alert('error');
		}
	});
}); 

</script>
<div>
		<div class="row">
            <div class="col-md-12">
                <section class="widget">
                    <header>
                        <h4>
                            <b>마일스톤</b>	
                           	<small>단계 설정</small>
                        </h4>
                       <!--  <div class="widget-controls">
                            <a data-widgster="expand" title="Expand" href="#" style="display: none;"><i class="glyphicon glyphicon-chevron-up"></i></a>
                            <a data-widgster="collapse" title="Collapse" href="#"><i class="glyphicon glyphicon-chevron-down"></i></a>
                            <a data-widgster="close" title="Close" href="#"><i class="glyphicon glyphicon-remove"></i></a>
                        </div> -->
                    </header>
                    <div class="widget-body">
                        <div class="row">
                            <div class="col-md-8">
                                <h4><b>단계 구체화</b></h4>
                                <p>각 단계에 맞게 사용할 상태를 정의하세요.</p>

                                <div id="wizard" class="form-wizard">
                                     <ul class="nav-justified mb-sm nav nav-pills">
                                        <li class="active"><a href="#tab0" data-toggle="tab" aria-expanded="true">
                                            <small>1.기회</small>
                                            	 </a></li>
                                        <li><a href="#tab1" data-toggle="tab">
                                            <small>2.이해관계자</small>
                                           		 </a></li>
                                        <li><a href="#tab2" data-toggle="tab">
                                            <small>3.요구사항</small>
                                            	</a></li>
                                        <li><a href="#tab3" data-toggle="tab">
                                            <small>4.소프트웨어 시스템 </small>
                                            	</a></li>
                                          <li><a href="#tab4" data-toggle="tab">
                                            <small>5.팀</small>
                                            	</a></li>
                                            <li><a href="#tab5" data-toggle="tab">
                                            <small>6.작업방식</small>
                                           		</a></li>   
                                           	  <li><a href="#tab6" data-toggle="tab">
                                            <small>7.작업</small>
                                           		</a></li>    	 
                                    </ul>
                                  <!--   <div id="bar" class="progress progress-xs">
                                        <div class="progress-bar progress-bar-gray-light active" style="width: 25%;"></div>
                                    </div> -->
                                    <div class="tab-content">
                                        <div class="tab-pane bg-gray-lighter active" id="tab0" style="height: 444px;">
                                            <form action="" method="POST" data-parsley-priority-enabled="false" novalidate="novalidate">
                                                <fieldset>
                                                 <div class="form-group">
                                                   <div id="tab0_checkList">
                                                  
                                                   </div>
                                                   </div>
                                               <!--     <input type="text" id="destination" name="destination" placeholder="" class="form-control parsley-success" required="required" data-parsley-id="24" -->
												
                                                </fieldset>
                                            </form>
                                        </div>
                    
                                        <div class="tab-pane bg-gray-lighter" id="tab1" style="height: 444px;">
				                                <form action="" method="POST" data-parsley-priority-enabled="false" novalidate="novalidate">
	                                                <fieldset>
	                                                   <div id="tab1_checkList">
	                                                   </div>
	                                                </fieldset>
	                                            </form>
                                        </div>
                                        <div class="tab-pane bg-gray-lighter" id="tab2" style="height: 444px;">
                                             <form action="" method="POST" data-parsley-priority-enabled="false" novalidate="novalidate">
	                                                <fieldset>
	                                                   <div id="tab2_checkList">
	                                                   </div>
	                                                </fieldset>
	                                            </form>
                                        </div>
                                        <div class="tab-pane bg-gray-lighter" id="tab3" style="height: 444px;">
                                             <form action="" method="POST" data-parsley-priority-enabled="false" novalidate="novalidate">
	                                                <fieldset>
	                                                   <div id="tab3_checkList">
	                                                   </div>
	                                                </fieldset>
	                                            </form>
                                        </div>
                                         <div class="tab-pane bg-gray-lighter" id="tab4" style="height: 444px;">
                                             <form action="" method="POST"data-parsley-priority-enabled="false" novalidate="novalidate">
	                                                <fieldset>
	                                                   <div id="tab4_checkList">
	                                                   </div>
	                                                </fieldset>
	                                            </form>
                                        </div>
                                         <div class="tab-pane bg-gray-lighter" id="tab5" style="height: 444px;">
                                             <form action="" method="POST" data-parsley-priority-enabled="false" novalidate="novalidate">
	                                                <fieldset>
	                                                   <div id="tab5_checkList">
	                                                   </div>
	                                                </fieldset>
	                                            </form>
                                        </div>
                                         <div class="tab-pane bg-gray-lighter" id="tab6" style="height: 444px;">
                                             <form action="" method="POST" data-parsley-priority-enabled="false" novalidate="novalidate">
	                                                <fieldset>
	                                                   <div id="tab6_checkList">
	                                                   </div>
	                                                </fieldset>
	                                            </form>
                                        </div>
                                      <ul class="pager wizard">
                                      <!--       <li class="previous disabled">
                                                <button class="btn btn-default btn-rounded pull-left">
                                                    <i class="fa fa-caret-left"></i> &nbsp; Previous
                                                </button>
                                            </li>
                                            <li class="next">
                                                <button class="btn btn-primary btn-rounded pull-right">
                                                    Next &nbsp; <i class="fa fa-caret-right"></i></button>
                                            </li> -->
                                            <li class="finish">
                                                <button class="btn btn-warning btn-rounded pull-right" onclick="finishMilstone()">
                                                    Finish &nbsp; <i class="glyphicon glyphicon-ok"></i>
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div> 
                            </div>
                            <div class="col-md-4">
                                <h4><!--  Modal <strong>Application Wizard</strong>  --></h4>
                                <p ><!--  An example of complete wizard form in a modal. --> </p>
                                <div id="detailTitle"> </div>
                                <p><!-- detail --></p>
                                <hr/>
                               	<div id="detailCateContent">
                               	<div class="alert alert-gray alert-sm">
                   					 <!-- <span class="fw-semi-bold">상세보기:</span>datail catagory, if select check! -->
               					 </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
</div>
