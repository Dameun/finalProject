package com.zestworld.websocket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.zestworld.util.DataController;

public class WebSocketHandler extends TextWebSocketHandler {

	private Map<Object, WebSocketSession> users = new ConcurrentHashMap();
	private Map<String, String> ids = new ConcurrentHashMap();

	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
	      String userid = (String) session.getAttributes().get("userId");      
	      users.put(userid, session);
	      ids.put(session.getId(), userid);
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log((String) session.getAttributes().get("userId"));
		users.remove("parammsg");
	}

	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		  String alarmType = "";
		  String taskTitle = "";
		  String[] alarmIdArr={};

		  //alarmType+'/'+ taskTitle +'/'+selectId
		  String msg = message.getPayload();
		  String[] id_count_type = msg.split("/");
/*		  alarmType = id_count_type[0];
		  taskTitle = id_count_type[1];*/
		  alarmIdArr = id_count_type[2].split(",");
		  int connertUser = 0;
	       for(int i =0; i < alarmIdArr.length; i++){
	        	   for (WebSocketSession s : users.values()) 
	        	   { 
		        	  //접속해있는 유져일경우 
		        	   if( ids.get(s.getId()).equals(alarmIdArr[i]) )
		        	   {
		                 s.sendMessage(new TextMessage(msg) );
		                 System.out.println("***************************");
		                 System.out.println(s.getId()+"에게"+msg+"를 보냅니다.");
		                 connertUser++;
		        	   }
		        	   
	        	   }
	        	 if( connertUser== 0 )
	   	         {
	   	        	DataController.getInstance().SetAlarm(msg);
	   	         }
	        	 connertUser = 0;
	        }
	        
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log((String) session.getAttributes().get("userId") + " 에러 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
