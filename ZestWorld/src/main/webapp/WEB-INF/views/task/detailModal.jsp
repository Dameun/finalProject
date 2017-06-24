<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <link rel="stylesheet" type="text/css" href="./resource/dist/css/ContestBoardView.css"> -->




	<div class="modal fade" id = "detailModal" role="dialog">
	<div class="modal-dialog modal-lg">
	     	 <div class="modal-content">
    <section class="widget">
        <header>
            <h4>
            	<input type="checkbox" id="modal_successF" class="modal_successF"  data-dismiss="modal"
            		<%-- <c:if test="${n.success_f eq 0}">
			             
			             onclick="modalChangeSuccessF();"
			        </c:if> 
			        <c:if test="${n.success_f eq 1}">
			        	checked= "checked"
			             onclick="modalChangeSuccessF_zero();"
			        </c:if> --%>
			        
			        
			        <c:if test="${n.success_f eq 1}">
			             checked= "checked"
			             onclick="modalChangeSuccessF_zero(${n.task_id});"
			        </c:if> 
			        <c:if test="${n.success_f eq 0}">
			            onclick="modalChangeSuccessF(${n.task_id});"
			        </c:if>
			        
			        
            	>
            	
                <span class="fw-semi-bold" id="span1">
                	<!--  <input type="text" id="modalTask" name="modalTask" class="form-control" style="board=0"> -->  
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
                        <!-- <span class="label label-warning  text-gray-dark mr-xs">
                            HTML5
                        </span> -->
                       
                    </legend>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="email">
                               		 위치
                            </label>
                            <div class="col-sm-9">
                            
                            <select id="project2" onchange="projectchange2();">
								<option value="" selected="selected">  </option>
								<c:forEach items="${projectlist}" var="n">
								 	<option value="${n.project_id}" selected="selected">${n.p_title}</option>		
								</c:forEach>
    		        		</select>
    		        		
    		        		
    		        		<div id="categoryListModal">
    		        		
    		        		
    		        		
    		        		</div>
    		        		
    		        		
                         <!--    <div class="clearfix">
					            <div class="btn-toolbar">
					                <div class="btn-group">
					                    <a href="#" data-toggle="dropdown" class="btn dropdown-toggle btn-secondary">
					                        Popular <span class="caret"></span>
					                    </a>
					                    <ul class="dropdown-menu">
					                        <li><a class="dropdown-item" href="#">All</a></li>
					                        <li><a class="dropdown-item" href="#">Popular</a></li>
					                        <li><a class="dropdown-item" href="#">Interesting</a></li>
					                        <li><a class="dropdown-item" href="#">Latest</a></li>
					                    </ul>
					                </div>
					            </div>
				        	</div> -->
                                <!-- <input type="text" id="email" name="email" class="form-control"
                                       data-parsley-trigger="change"
                                       data-parsley-validation-threshold="1"
                                       required="required" >
		                        <span class="help-block">
		                            This one is triggered even when 1 character has been input
		                        </span> -->
                            </div>
                        </div>
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
                            <label class="control-label col-sm-3" for="range">
                                	배정된 멤버
                            </label>
                            <div class="col-sm-9">
                            
                            <div
								class="select2-container select2-container-multi select2 form-control"
								id="s2id_multiple-select" data-toggle="modal"
								data-target="#taskAssignMember" onclick="taskMemberListChk(${n.project_id},${n.task_id});">
							
								
								<ul class="select2-choices">
									<div id="assignMemberCheck">
									
									 </div>
								</ul>
							</div>
                            
                            
                            
                            
                            
                            <div class="modal fade" id="taskAssignMember" style="display: none;">
								<div class="modal-dialog">
						            <div class="modal-content">
						                <div class="modal-header">
						                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						                    <h4 class="modal-title text-xl-center fw-bold mt" id="myModalLabel18">프로젝트 멤버 배정</h4>
						                    <p class="text-xl-center text-muted mt-sm fs-mini">
						                        We need a bit of your detailed information to proceed. US ticketing system requires
						                        us to process and check your personal infromation before we can go.
						                    </p>
						                </div>
						                <div class="modal-body bg-gray-lighter">
						                    	
						                    <div id="wMemberList">
						                    
											</div>
						                    
						                    
						                    
						                    
						                    
						                </div>
						                <div class="modal-footer">
						                    <button type="button" class="btn btn-gray" data-dismiss="modal">Close</button>
						                    <button type="button" class="btn btn-success" onclick="projectAssign();" data-dismiss="modal">Assign</button>
						                </div>
						            </div>
						       </div>
							</div>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                           
                        <%--     
                            <div class="select2-container select2-container-multi select2 form-control" id="s2id_multiple-select" data-toggle="modal" data-target="#assignMember" onclick="projectAssignMemberList(3,2);">
		                    	<ul class="select2-choices"> 
			                    	<c:forEach items="${project.projectMember}" var="member">
			                    			<li class="select2-search-choice"><div>${member.user_id}</div>
			                    				<a href="#" class="select2-search-choice-close" tabindex="-1" onclick="assignMemberDelete(${member.user_id});"></a>
			                    			</li>
			                    	</c:forEach>	
 								</ul>
 							</div>
                             --%>
                            
                           <!--       <div class="modal fade" id="assignMember" style="display: none;">

								</div>
                            
                             -->
                            
                            
                                <!-- <input type="text"  class="form-control"
                                       id="member" name="member"
                                       data-parsley-range="[10, 100]"
                                       data-parsley-trigger="change"
                                       data-parsley-validation-threshold="1"
                                       required="required"> -->
                              <!--         
                              		<input type="checkbox">
                              		멤버리스트 들어갈 부분
                              
                              
                              
                               -->         
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
                        
                       <!--  <div id="writecomment" onsubmit="return false;">
							<input type="hidden" name="test" />
							<div class="wrap">
								<input id="comment_input" autocomplete="off" type="text"
									placeholder="댓글을 입력해주세요."
									onkeydown="javascript: if(event.keyCode == 13) fnReplyWrite();">
								<span class="submit" onclick="fnReplyWrite();"></span>
							</div>
						</div>
                         -->
                        <div id="checkListAjax">
                        
                        </div>
                   
                                       

                                           
                        
                        <%-- <div class="comments">
							<h2>댓글목록</h2>
							<ol class="group">
								<!--  for문 -->
								<c:forEach var="reply" items="<%=replyResult%>">
									<c:set var="contents" value="${reply.getContents()}" />
									<c:set var="enrollDate" value="${reply.getEnrollDate()}" />
									<c:set var="groupCn" value="${reply.getGroupCN()}" />
									<c:set var="memCode" value="${reply.getMemCode()}" />
				
									<li class="comment"><p class="text">${contents}</p> <time>${enrollDate}</time>
										<a class="remove" onclick="fnReplyDelete(${groupCn},${memCode});">삭제</a>
										<hr></li>
								</c:forEach>
							</ol>
						</div> --%>
<!-- 						<div id="detailModalCheck">
							<form class="writecomment" onsubmit="return false;">
							<div class="writecomment">
								<input type="hidden" name="test" />
								<div class="wrap">
									<input id="comment_input" autocomplete="off" type="text"
										placeholder="댓글을 입력해주세요."
										onkeydown="javascript: if(event.keyCode == 13) fnReplyWrite();">
									<span class="submit" onclick="fnReplyWrite();"></span>
								</div>
							</form>   
	                        </div>
                        </div> -->
                </fieldset>

                <div class="form-actions">
                	<div class="row">
                		<div class="col-sm-10">
                    		<button style="margin-left:20px" type="button" class="btn btn-secondary btn-rounded" data-dismiss="modal">Cancel</button>
                    	</div>
                    	<div class="col-sm-2">
                    		<button style="margin-left:20px" type="button" class="btn btn-success" data-dismiss="modal" onclick="detailUpdate();">Submit</button>
                		</div>
                	</div>
                </div>
            </form>
        </div>
    </section>
</div>
</div>
</div>