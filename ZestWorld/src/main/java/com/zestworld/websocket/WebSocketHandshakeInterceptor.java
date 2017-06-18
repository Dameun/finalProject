package com.zestworld.websocket;

import java.util.Map;

import javax.activation.DataContentHandler;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.zestworld.util.DataController;

public class WebSocketHandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	

    @Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {     
    
        System.out.println("beforehandshake 시작");
          
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
        

        
        
        //로그인한 사람 아이디 뽑기
		//Join_DTO dto = (Join_DTO) req.getSession().getAttribute("info");
		
        attributes.put("userId", DataController.getInstance().GetUser().getUserid());
  
      
        System.out.println("인터셉터 id:"+ DataController.getInstance().GetUser().getUserid());

 
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
  
    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        System.out.println("After Handshake");
  
        super.afterHandshake(request, response, wsHandler, ex);
    }
    
}
