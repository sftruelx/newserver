package com.app1.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app1.model.User;
import com.app1.service.UserManager;

@Controller
public class UserController {
    @Autowired
    UserManager userManager;
    
    @ResponseBody 
    @RequestMapping("/jsonusers*")
    public List<User> execute2(ModelMap model, HttpServletRequest request) {
    	String username = request.getParameter("username");
    	model.addAttribute("userList", userManager.getUsers());
        return userManager.getUsers();
    }
    
    @RequestMapping("/users*")
    public String execute(ModelMap model) {
    	model.addAttribute("userList", userManager.getUsers());
        return "userList";
    }
}
