package com.app1.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app1.model.User;
import com.app1.service.UserManager;

@Controller
public class HomePageController {
	
    @Autowired
    UserManager userManager;
    @RequestMapping("/homePage*")
    public String execute(ModelMap model) {

        return "testeasyui";
    }
    
    
    @ResponseBody 
    @RequestMapping("/jsonlist*")
    public Map execute2(ModelMap model, HttpServletRequest request,@RequestParam("page") int nowpage,@RequestParam("rows") int rows) {
    	System.out.println("in........"+ nowpage+ " " + rows);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<User> list = userManager.getUsers();
    	map.put("rows", list);
    	map.put("total",100);
    	map.put("page", 3);
        return map;
    }
}
