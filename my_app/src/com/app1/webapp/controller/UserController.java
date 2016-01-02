package com.app1.webapp.controller;

import java.util.HashMap;
import java.util.List;
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
public class UserController extends BaseFormController {
	   private final Log log = LogFactory.getLog(UserController.class);
    @Autowired
    UserManager userManager;
    
    @RequestMapping("/userManage*")
    public String execute2(ModelMap model, HttpServletRequest request) {
    	return "userManage";
    }
    
    @RequestMapping("/users*")
    public String execute(ModelMap model) {
//    	model.addAttribute("userList", userManager.getUsers());
        return "userList";
    }
    

    @ResponseBody 
    @RequestMapping("/jsonlist*")
    public Pager execute2(ModelMap model, HttpServletRequest request,@RequestParam("page") int nowpage,@RequestParam("rows") int rows,@RequestParam("username") String username,@RequestParam("email") String email) {
    	System.out.println("in........"+ nowpage+ " " + rows);
    	Map<String, Object> map = new HashMap<String, Object>();
    	System.out.println(username + " " + email);
    	if(!"".equals(username)){
    		map.put("username", username);
    	}
    	if(!"".equals(email)){
    		map.put("email", email);
    	}
    	Pager p = userManager.getUsers(nowpage, rows, map);

        return p;
    }
    
    @ResponseBody 
    @RequestMapping("/userform")
    public Map onSubmit(User user, BindingResult result, HttpServletRequest request) throws Exception {
    	 Map<String, String> map = new HashMap();
        if (request.getParameter("cancel") != null) {
        	map.put("errorMsg", "cancel");
            return map;
        }



        log.debug("entering 'onSubmit' method...");
       

        if (request.getParameter("delete") != null) {
            userManager.removeUser(user.getId().toString());
            saveMessage(request, getText("user.deleted", user.getFullName(), request.getLocale()));
        } else {
            try {
                userManager.saveUser(user);
            } catch (UserExistsException uex) {
                result.addError(new ObjectError("user", uex.getMessage()));
                map.put("errorMsg", uex.getMessage());
                return null;
            }
            saveMessage(request, getText("user.saved", user.getFullName(), request.getLocale()));
        }

        map.put("errorMsg", null);

        return map;
    }
    
}
