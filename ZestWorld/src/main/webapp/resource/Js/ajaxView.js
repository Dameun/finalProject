/**
 * 
 */

var wsocket;
var msg 
function connect() {
	//ws://192.168.0.136:8091/http://localhost:8081/main/
	wsocket = new WebSocket("ws://localhost:8081/main/chat-ws.htm");
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

	console.log("evt.data"+evt.data);
	$.ajax({
		  
		  type:"post",
		  dataType: "html",
		  url:"newAlarm.ajax",
		  data:{"newAlarm": evt.data},
		  success:function(data){
			  console.log("성공");
			  console.log(data);
			  $('#alarm').empty(); 
			  $('#alarm').html(data);
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

$(function() {
	connect();
	
	//알람
	$.ajax({
		type:"get",
		url: "alarmList.ajax",
		success:function(data)
		{
			alert('alarm');
			$('#alarm').empty();
			$('#alarm').append( $('#alarm').html(data)); 		
		},
		
		error:function(){
			alert('error:' + "alarmList.htm");
		},
	});	
});

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
