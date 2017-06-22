<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<h3>워크스페이지스 부분</h3>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="http://www.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function searc() {
		pwsearch.submit();
}

</script>
<br>


<div class="btn-group">
                      <button type="button" class="btn btn-default" onclick="location.href='taskList.htm'">업무리스트</button>
                      <button type="button" class="btn btn-default" onclick="ajaxView('analysis.ajax')">분석</button> 
                      <button type="button" class="btn btn-default" onclick="ajaxView('file.ajax')">파일</button>
                                        
</div>

 	<!-- 초대 email -->
					<div class="container">
						<!-- Trigger the modal with a button -->
						<button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">초대하기</button>
						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">초대할맴버 이메일입력</h4>
									</div>
									<div class="modal-body">
										<!-- 내용 -->
										<c:url value="/invitation.htm" var="loginURL" />
										<form action="${loginURL}" name="pwsearch" id="pwsearch"
											method="post">
											<tr>
												<td>초대하실분 이메일</td>
												<td><input type="text" name="userid" /></td>
											</tr>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal" onclick="searc()">전송</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!--  -->