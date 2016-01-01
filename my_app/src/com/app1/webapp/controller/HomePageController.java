package com.app1.webapp.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController extends BaseFormController{
	   private final Log log = LogFactory.getLog(HomePageController.class);
  
    @RequestMapping("/homePage*")
    public String execute(ModelMap model) {

        return "home";
    }
    
    
}
