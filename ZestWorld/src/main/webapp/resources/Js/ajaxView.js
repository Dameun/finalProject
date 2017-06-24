/**
 * 
 */

var wsocket;
var msg 
function connect() {
	//ws://192.168.0.136:8091/http://localhost:8081/main/
	wsocket = new WebSocket("ws://l92.168.0.152:8081/main/chat-ws.htm");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;

}
function disconnect() {
	wsocket.close();
}

function onOpen(evt) {
	appendMessage("연결되었습니다.");
}

function onMessage(evt) {

	console.log("ajax.view >> evt.data"+evt.data);
	//AlarmInsert(evt);
	console.log("알람 AlarmInsert")

	$.ajax({
		  type:"post",
		  dataType: "html",
		  url:"newAlarm.ajax",
		  data:{"newAlarm": evt.data},
		  success:function(data){
			  AlarmCountView(); // header의 알람 숫자표시 수정
			  // $('#alarm').empty(); 
			  //$('#alarm').html(data);
		  }
	});	

}
function onClose(evt) {
	appendMessage("연결을 끊었습니다.");
}

/*첫번째 인자 알람 타입,업무이름,메세지 받을 사람(여러명일경우 ,로 구분)한다. 
	업무 추가시 0 ,업무 완료시 1*/
function send(alarmType, taskTitle, selectId , writerId) {

	var alarmMsg = alarmType+'/'+ taskTitle +'/'+selectId + '/' + writerId;
	console.log("메세지 받을 사람들:"+selectId);
	
	wsocket.send(alarmMsg);
	
}

function appendMessage(msg) {
	console.log(msg);

}

/*$(function() {
	connect();
});*/

//$(function() {
	function ajaxView(menuName)
	{

		$.ajax({
			type:"get",
			url: menuName,
			success:function(data)
			{
			
				$('#binContent').empty();
				$('#binContent').append( $('#binContent').html(data)); 		
			},
			
			error:function(){
				alert('error:' + menuName);
			},
		});	
	}
//})
