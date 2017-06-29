<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery import -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery Form Plugin import -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="<%=request.getContextPath() %>/resources/js/jQuery.MultiFile.min.js"></script>
<script type="text/javascript">

	
/* function upload(){
	
	console.log("upload 함수 탐");
	var title= $('#title').val();
	var filesrc= $('#filesrc').val();
	var filesrc2= $('#filesrc2').val();
	console.log(title)
 	console.log(filesrc); 
	 $.ajax({
	       type : "get",
	       url : "TemplateUpload.htm?title="+title+"&filesrc="+filesrc,
	       dataType:'html',
	       success : function(data) {
	    	 alert(data);
	    	 if( data == 'success')
    		{
    		 	ajaxView('totalTask.ajax');
    		 }  
    		 
	    	 
	    	$("#uploadTable").append($('#uploadTable').html(data));          
	       },
	       error : function() {
	          alert('업로드중 에러남');
	       }
	    });
	 
	  
}  */

 $(document).ready(function(){
    
    //use jQuery MultiFile Plugin 
    $('#multiform input[name=file]').MultiFile({
        max: 5, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
        /* accept: 'jpg|png|gif', */ //허용할 확장자(지정하지 않으면 모든 확장자 허용)
        maxfile: 1024, //각 파일 최대 업로드 크기
        maxsize: 3024,  //전체 파일 최대 업로드 크기
        STRING: { //Multi-lingual support : 메시지 수정 가능
            remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
            duplicate : "$file 은 이미 선택된 파일입니다.", 
            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
            selected:'$file 을 선택했습니다.', 
            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
        },
        list:"#afile3-list" //파일목록을 출력할 요소 지정가능
    });
}); 






/*jQuery form 플러그인을 사용하여 폼데이터를 ajax로 전송*/

var downGroupCnt =0; //다운로드그룹 개수카운트

$(function(){
    
	//폼전송 : 해당폼의 submit 이벤트가 발생했을경우 실행  
    $('#multiform').ajaxForm({
       cache: false,
       url : "templateUpload.htm",
       dataType:"json",

       //보내기전 validation check가 필요할경우
       beforeSubmit: function (data, frm, opt) {
	       //console.log(data);
           alert("전송전!!");
           return true;
       },
       //submit이후의 처리
       success: function(data, statusText){
    	   
    	   alert("전송성공!!");
           console.log(data); //응답받은 데이터 콘솔로 출력         
           
           output(data); //받은 정보를 화면 출력하는 함수 호출
       },
       //ajax error
       error: function(e){
           alert("에러발생!!");
           console.log(e);
       }                               
	});
});

//전달받은 정보를 가지고 화면에 보기 좋게 출력
function output(data) {
	//업로드한 파일을 다운로드할수있도록 화면 구성
	$("#uploadTable").append("<h3>("+(++downGroupCnt)+") 다운로드</h3>");
    $("#uploadTable").append("제목:"+data.title+"<br/>");
    $("#uploadTable").append("설명:"+data.description+"<br/>");
  
    if(data.file && data.file.length != 0){
        $("#result").append("파일:<br/>");           
        $.each(data.file, function(index, item){
     	   //var link = "fileDownload2?f="+item.fileName+"&of="+item.uploadedFileName;
     	   $("#result").append("<a href='"+ item.downlink +"' download>"+item.fileName+"</a>");
           $("#result").append("<br/>");	               
        });
    }       
	
    $('#multiform')[0].reset(); //폼 초기화(리셋);
    //$('#multiform').resetForm(); //(jQuery.Form 플러그인 메서드)
    //$('#multiform').clearForm(); //(jQuery.Form 플러그인 메서드)  
    $('#multiform input:file').MultiFile('reset'); //멀티파일 초기화        
} 
	
</script>

</head>

<body>

	<!-- <div> template </div> -->
	
    <div class="row" style="background:#f0b518 ; font-weight:bold">
   
		<div class="col-md-1">
    	
    	</div>
   
    	<div class="col-md-3">
    		<!-- 이름 -->
    	</div>
    	
    	<div class="col-md-3">
          	<!-- 크기 -->
    	</div>
    	
    	<div class="col-md-3">
    		<!-- 공유한날짜 -->
    	</div>
    	
    	<div class="col-md-2">
    		<!-- 공유한사람 -->
    	</div>
    	
    	
    	
	</div>
	
	
	 <div class="col-md-12" style="background-color:black">
	
                <section class="widget">
                
                    <header>
                        <h4>
                        	<span class="fw-semi-bold">Template</span>
                        </h4>
                        <div class="widget-controls">
                           <!-- <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a data-widgster="close" href="#"><i class="glyphicon glyphicon-remove"></i></a> -->
                        </div>
                    </header>
                    
                    <div class="widget-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="hidden-xs">NO.</th>
                                <th class="hidden-xs">작성자</th>
                                <th class="hidden-xs">제목</th>
                                <th class="hidden-xs">설명</th>
                                <th class="hidden-xs">업로드 날짜</th>
                                <th class="hidden-xs">용량</th>
                                <th class="hidden-xs">내려받기</th>
                                <th></th>
                            </tr>
                            </thead>
                            
                            
                            
                            <tbody>
                            <tr id="uploadTable">
                                <td class="hidden-xs">
                                1
                                </td> 
                                
                                
                                
                                <td class="width-150">
                                 	<%-- <c:forEach items="${category}" var="n">
										<option value="${n.category_id}">${n.title}</option>		
									</c:forEach> --%>
									황이준
                                </td>
                                
                                <td>
                                    	코알라
                                </td>
                                
                                <td class="hidden-xs">
                                    <p class="no-margin">
                                        <small>
                                           <!--  <span class="fw-semi-bold">Type:</span>
                                            <span class="text-semi-muted">&nbsp; JPEG</span> -->
                                            		설명
                                        </small>
                                    </p>
                                   <!--  <p>
                                        <small>
                                            <span class="fw-semi-bold">Dimensions:</span>
                                            <span class="text-semi-muted">&nbsp; 200x150</span>
                                        </small>
                                    </p> -->
                                 </td> 
                                
                                <td class="hidden-xs text-semi-muted">
                                    17/06/23
                                </td>
                                
                                <td class="hidden-xs text-semi-muted">
                                    45.6 KB
                                </td>
                                
                                <td class="hidden-xs text-semi-muted">
                                     <button type="button" id="download" name="download" class="glyphicon glyphicon-download">
                                </td>
                                
                                

                                
                            </tr>

                            
                            
                            </tbody>

                        </table>
                        <div class="clearfix">
                            <div class="pull-right">
                     	 	 	
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModal">
	         						 파일 업로드
									</button>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="#">Clear</a></li>
                                        <li><a href="#">Move ...</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                </section>
                
                
           	
                
                	  	 <!--  (모달) --> 	 
	  	 <div class="modal fade" id="myModal" >
	     	<div class="modal-dialog modal-lg">
	     	 <div class="modal-content">
	      
	        	<div class="modal-header">
	         		 <button type="button" class="close" data-dismiss="modal">&times;</button>
	          		 <h4 class="modal-title">파일 업로드</h4>
	          
	        	</div>
	        

	        
	        
		 <form action="<%=request.getContextPath() %>/templateUpload.htm" id="multiform" enctype="multipart/form-data">
	        
	        	title: <input type="text" name="title"  value=""/> <br/>
				description: <input type="text" name="description"  value=""/> <br/>

				<!-- 다중 파일업로드  -->			
				file : <input type="file" name="file" /> <br/>
				
				<button type="submit" id="btnSubmit" class="glyphicon glyphicon-upload" value="업로드"/><br/>
		
		</form>
		
	        	<!-- <div class="modal-body"  id="uploadFile">
	    	    	 <div class="form-group row">
                        	<label class="control-label col-sm-4" for="number">
                                	제목
                            </label>
                        	<div class="col-sm-8">
                        		<input rows="3" class="autogrow form-control transition-height" id="title"
                             	                     placeholder="제목을 입력하시오.">
                             	</input>
                        	</div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-4" for="number">
                                	파일첨부
                            </label>
                            <div class="col-sm-4">
                                <input type="file" id="filesrc" name="file" class="form-control">
                            </div>
                            <div class="col-sm-4">
                                <input type="file" id="filesrc2" name="file" class="form-control">
                            </div>
                            <div class="col-sm-4">
                            	&nbsp;&nbsp;&nbsp;
                                <button type="submit" id="detailStart" name="detailStart" class="glyphicon glyphicon-upload">
                            </div>
                        </div> -->
                        
                        <%-- <<form name="multiform" id="multiform" action="<%=request.getContextPath() %>/fileUpload1"
                                      method="POST" enctype="multipart/form-data">
	
										title: <input type="text" name="title"  value=""/> <br/>
										설명: <input type="text" name="description"  value=""/> <br/>
	
										<!-- 다중 파일업로드  -->
										file : <input type="file" class="afile3"  name="file" /> <br/>
											   <button type="submit" id="btnSubmit" class="glyphicon glyphicon-upload" value="업로드"/><br/>
						</form> --%>
                        
	        	</div>
	       
	        
	        	<!-- <div class="modal-footer">
	         	 <button type="submit" class="btn btn-default" data-dismiss="modal" id ="upload" onclick="" >확인</button>
	         	 <button type="button" class="btn btn-default" data-dismiss="modal" onclick="button22();">취소</button>
	          
	        	</div> -->
	        </form> 
	        
	       </div>
	    </div>
	  </div>
                
            </div>

</body>
</html>