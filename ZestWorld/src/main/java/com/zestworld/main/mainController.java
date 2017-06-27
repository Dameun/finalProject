package com.zestworld.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * @FileName : mainController.java
 * @Project : ZestWorld
 * @Date : 2017.06.13
 * @Author : 장윤희
 * @Desc : 인트로 페이지 (로그인, 회원가입)
 * */
 
@Controller
public class mainController {

   @RequestMapping("/index.htm")
   public String index(){
      return "home/login";
   }

   @RequestMapping("/login.htm")
   public String login(){
      return "home/login";
   }
   
   @RequestMapping("/main.htm")
   public String main(){
      return "home.main";
   }
}