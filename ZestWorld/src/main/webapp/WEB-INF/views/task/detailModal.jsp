<%--
	@Project : ZestWorld
	@File name : detailModal.jsp
	@Author : 최담은
	@Data : 2017.07.01
	@Desc : 전체개요 상세보기 모달창 (수정가능 폼)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
  $( function() {
	  $("#detailEnd").datepicker({ dateFormat: 'yy/mm/dd' });
      $("#detailStart" ).datepicker({ dateFormat: 'yy/mm/dd' });
  } );
</script>

<div class="modal fade" id = "detailModal" role="dialog">
<div class="modal-dialog modal-lg">
<div class="modal-content">
    <section class="widget">
        <header>
            <h4>
            	
                <span class="fw-semi-bold" id="span1">
                </span> 
                <small><span id="Modalenrolldate"></span></small>
            </h4>
            <div class="widget-controls">
            	<span class="label label-danger fw-normal" id="modal_delete" data-dismiss="modal" onclick="modalDeleteTask();">delete</span>
            	&nbsp;&nbsp;&nbsp;&nbsp;
                <a data-widgster="close" title="Close" href="#"><i class="glyphicon glyphicon-remove" data-dismiss="modal"></i></a>
            </div>
        </header>
        <div class="widget-body">
            <form id="validation-form" class="form-horizontal form-label-left" method="post"
                  data-parsley-priority-enabled="false"
                  novalidate="novalidate">

                <fieldset>
                    <legend>
                    </legend>

                        <div class="form-group row">
                        	<label class="control-label col-sm-3" for="number">
                                	상세 설명
                            </label>
                        	<div class="col-sm-9">
                        		<textarea rows="3" class="autogrow form-control transition-height" id="modalDetailExplain"
                             	                     placeholder="Try to add few new lines.."></textarea>
                        	</div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="number">
                                	시작일
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="detailStart" name="detailStart" class="form-control"
                                       data-parsley-type="number"
                                       required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="number">
                                	마감일
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="detailEnd" name="detailEnd" class="form-control"
                                       data-parsley-type="number"
                                       required="required">
                            </div>
                        </div>
                        <div class="form-group row">
	                        <div  data-toggle="modal"
									data-target="#taskAssignMember" onclick="taskMemberListChk();">
	                            <label class="control-label col-sm-3" for="range">
	                                	배정된 멤버
	                            </label>
	                        </div>
                            <div class="col-sm-9">
                            
                            <div
								class="select2-container select2-container-multi select2 form-control"
								id="s2id_multiple-select">
							
								
								<ul class="select2-choices">
									<div id="assignMemberCheck">
									
									 </div>
								</ul>
							</div>
							<br>
							<div id="wMemberList" style="background-color:#EAEAEA">
						                    
							</div>
							 <button type="button" style="margin-left: 568px"class="btn btn-success" onclick="taskAssign(${n.task_id});">Assign</button> 
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="password">
                               		 팔로워
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="follower22" name="follower22" class="form-control mb-sm"
                                       data-parsley-trigger="change"
                                       data-parsley-minlength="6"
                                       required="required">
                            </div>
                        </div>
                    
						<hr>        
                    
                       <div class="form-group row">
                            <label class="control-label col-sm-3" for="password">
                               		 체크리스트
                            </label>
                            <div class="col-sm-8">
                                <input type="text" id="CheckContents" name="CheckContents" class="form-control mb-sm" style="width:635px"
                                       data-parsley-trigger="change"
                                       data-parsley-minlength="6"
                                       required="required">
                                       
                            </div>
                            <div class="col-sm-1">
                            	<button type="button" class="btn btn-warning" onclick="checkreg();"><i class="fa fa-plus" style="margin-left:5px"></i></button>
                            </div>
                            
                        </div>   

                        <div id="checkListAjax">
                        
                        </div>
                </fieldset>

                <div class="form-actions">
                	<div class="row">
                		<div class="col-sm-10">
                    		<button style="margin-left:20px" type="button" class="btn btn-secondary btn-rounded" data-dismiss="modal">Cancel</button>
                    	</div>
                    	<div class="col-sm-2">
                    		<!-- <button style="margin-left:20px" type="button" class="btn btn-success" data-dismiss="modal" onclick="detailUpdate();">Submit</button> -->
                			<button style="margin-left:20px" type="button" class="btn btn-success" id="detailClose"  data-dismiss="modal" onclick="detailModalUpdateDialog();">Submit</button> 
                		</div>
                	</div>
                </div>
            </form>
        </div>
    </section>
</div>
</div>
</div>