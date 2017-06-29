<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	  	 <div class="modal fade" id="myModal" >
	     	<div class="modal-dialog modal-lg">
	     	 <div class="modal-content">
	      
	        	<div class="modal-header">
	         		 <button type="button" class="close" data-dismiss="modal">&times;</button>
	          		 <h4 class="modal-title">파일 업로드</h4>
	          
	        	</div>
	        
	        	<div class="modal-body"  id="uploadFile">
	    	    	 <div class="form-group row">
                        	<label class="control-label col-sm-4" for="number">
                                	제목
                            </label>
                        	<div class="col-sm-8">
                        		<input rows="3" class="autogrow form-control transition-height" id="title"
                             	                     placeholder="제목을 입력하시오."></input>
                        	</div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-4" for="number">
                                	파일첨부
                            </label>
                            <div class="col-sm-4">
                                <input type="file" id="filesrc" name="files[0]" class="form-control">
                            </div>
                            <div class="col-sm-4">
                                <input type="file" id="filesrc2" name="files[1]" class="form-control">
                            </div>
                            <div class="col-sm-4">
                            	&nbsp;&nbsp;&nbsp;
                                <button type="button" id="detailStart" name="detailStart" class="glyphicon glyphicon-upload">
                            </div>
                        </div>
                        
                        <%-- <form name="multiform" id="multiform" action="<%=request.getContextPath() %>/fileUpload1"
                                      method="POST" enctype="multipart/form-data">
	
										title: <input type="text" name="title"  value=""/> <br/>
										설명: <input type="text" name="description"  value=""/> <br/>
	
										<!-- 다중 파일업로드  -->
										file : <input type="file" class="afile3"  name="file" /> <br/>
											   <button type="submit" id="btnSubmit" class="glyphicon glyphicon-upload" value="업로드"/><br/>
						</form> --%>
                        
	        	</div>
	        
	        
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" id ="upload" onclick="templateList.htm">확인</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="button22();">취소</button>
	        </div>
	        
	       </div>
	    </div>
	  </div>

</body>
</html>