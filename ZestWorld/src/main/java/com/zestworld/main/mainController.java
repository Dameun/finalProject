package com.zestworld.main;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.util.DataController;

import org.springframework.ui.Model;
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
   
   @RequestMapping("wSpace.htm")
   public String workSpace(){
      return "task.workSpace";
   }
   
   @RequestMapping("member.htm")
   public String member(){
      return "memberAdministration.member";
   }
   @RequestMapping("chat.htm")
   public String chat(){
      
      return "chat.chatting";
      
   }
   @RequestMapping("calendar.htm")
   public String calendar(){
      
      return "calendar.calendar";
      
   }
   
   @RequestMapping("taskList.htm")
   public String taskList(Model model){
      ArrayList<Task_DTO> list = DataController.getInstance().GetTaskList();
       model.addAttribute("list",list);
       for( int i=0; i <list.size(); i ++ )
       {
          System.out.println(i+ " / "+list.get(i).getTitle());
       }
      return "task.taskList";
      
   }
   
   @RequestMapping("file.htm")
   public String file(){
      
      return "file.file";
      
   }

   @RequestMapping("analysis.htm")
   public String analysis(){
      
      return "analysis.analysis";
      
   }
   

}