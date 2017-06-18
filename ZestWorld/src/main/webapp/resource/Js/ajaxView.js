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
		  url:"newAlarm.htm",
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

function send(selectId) {

	console.log("보낼 메세지:"+selectId);
	/*$.ajax({
		  type:"post",
		  dataType: "html",
		  url:"updateAlarm.htm",
		  data:{"selectId": selectId},
		  success:function(data){
		  
			  
		 console.log("알림DB업데이트 성공");
		 console.log(data);
		  }
	  });	*/
	wsocket.send(selectId);
	
}

function appendMessage(msg) {
	console.log(msg);

}

$(function() {
	connect();
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
