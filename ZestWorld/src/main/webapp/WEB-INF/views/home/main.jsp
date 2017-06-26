<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--workspaceList-->
 <!-- 민성 추가부분2(datepicker) 없으면 이벤트발생안해요  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- ㅠㅠ..민성 추가부분2(datepicker) 없으면 이벤트발생안해요 -->
<script type="text/javascript">
$(function() {
		ajaxView('projectMain.ajax');
		connect();
		AlarmCountView();
});	

</script>
	<div id="binContent"></div>