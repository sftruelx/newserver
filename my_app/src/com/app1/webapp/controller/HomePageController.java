package com.app1.webapp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app1.model.User;
import com.app1.service.UserExistsException;
import com.app1.service.UserManager;
import com.app1.util.Pager;

@Controller
public class HomePageController extends BaseFormController{
	   private final Log log = LogFactory.getLog(HomePageController.class);
  
    @RequestMapping("/homePage*")
    public String execute(ModelMap model) {

        return "home";
    }
    
    
}
