package com.zestworld.websocket;

import java.util.Map;

import javax.activation.DataContentHandler;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.util.DataController;

public class WebSocketHandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	

    @Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {     
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        HttpServletRequest req =  ssreq.getServletRequest();
        
        if(req.getSession().getAttribute("user") != null)
        {
            Users_DTO user = (Users_DTO)req.getSession().getAttribute("user");
            attributes.put("userId", user.getUser_id());
            System.out.println("로그인 아이디 id:"+ user.getUser_id());
        }
  
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
