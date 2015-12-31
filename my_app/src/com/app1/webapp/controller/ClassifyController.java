package com.app1.webapp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app1.service.ClassifyManager;
import com.app1.util.Pager;

@Controller
public class ClassifyController {
	
	@Autowired
    ClassifyManager classifyManager;
    

    @RequestMapping("/classManage*")
    public String showPage(ModelMap model, HttpServletRequest request) {
    	return "classManage";
    }
    
    @ResponseBody 
    @RequestMapping("/classifies*")
    public Pager execute2(ModelMap model, HttpServletRequest request,@RequestParam("page") int nowpage,@RequestParam("rows") int rows) {
    	System.out.println("in........"+ nowpage+ " " + rows);
    	Map<String, Object> map = new HashMap<String, Object>();

    	Pager p = classifyManager.getClassifies(nowpage, rows, map);

        return p;
    }
    
    
}
