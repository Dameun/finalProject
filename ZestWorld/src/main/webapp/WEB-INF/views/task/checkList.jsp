<%--
	@Project : ZestWorld
	@File name : checkList.jsp
	@Author : 최담은
	@Data : 2017.06.26
	@Desc : 전체개요 상세보기 -> 체크리스트 부분
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<section class="widget" id="shares-widget"
         data-widgster-load="demo/ajax/widgets/shares.php">
	    <header>
	        <h4>
	            <span class="label label-primary"></span> &nbsp;
	            <span class="fw-semi-bold">CheckList</span>
	        </h4>
	
	    </header>
	<c:forEach items="${chklist}" var="n">
		<div class="widget-body no-padding">
		    <div class="list-group list-group-lg">
		    
		        <a href="#" class="list-group-item"style="height:auto;">
			        <div class="row">
				        <div class="col-sm-1">
				           <span class="thumb-sm pull-xs-left mr">     
					            <input type="checkbox" id="${n.check_id}"  
					                <c:if test="${n.success_f eq 1}">
						                 checked= "checked"
						                 onclick="updateChkFlag_zero(${n.check_id});"
					                </c:if>
					                <c:if test="${n.success_f eq 0}">
					                		onclick="updateChkFlag(${n.check_id});"
					                </c:if>
					            >
				                   
				            </span> 
				        </div>
				        
				        <div class="col-sm-8">    
				            <h5 class="no-margin">${n.contents}</h5>            
				        </div>
				        
				        <div class="col-sm-3">
					        <div class="row">
					         	
					         	<div class="col-sm-7">
					             	<small class="text-muted">${n.enrolldate}</small>
					         	</div>
					         	
					         	<div class="col-sm-2">
					         		<span class="glyphicon glyphicon-trash" onclick="checkListDelete(${n.check_id});"></span>
					             	<!-- <small class="text-muted">qwe</small> -->
					         	</div>
					        </div>
				        </div>
			        </div>
			        
		        </a>
		    </div>
		</div>
	</c:forEach>
</section>