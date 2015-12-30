package com.app1.webapp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app1.model.User;
import com.app1.service.UserExistsException;
import com.app1.service.UserManager;

@Controller
@ResponseBody 
@RequestMapping("/userform111*")
public class UserFormController extends BaseFormController {
    private final Log log = LogFactory.getLog(UserFormController.class);

    @Autowired
    UserManager userManager;

    @Autowired(required = false)
    Validator validator;

    @ResponseBody 
    @RequestMapping(method = RequestMethod.POST)
    public Map onSubmit(User user, BindingResult result, HttpServletRequest request) throws Exception {
    	 Map<String, String> map = new HashMap();
        if (request.getParameter("cancel") != null) {
        	map.put("errorMsg", "cancel");
            return map;
        }

        if (validator != null && request.getParameter("delete") == null) { // validator is null during testing
            validator.validate(user, result);

            if (result.hasErrors()) {
            	map.put("errorMsg", "dddd");
                return map;
            }
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

    @ModelAttribute
    @RequestMapping(method = RequestMethod.GET)
    protected User getUser(HttpServletRequest request) {
        String userId = request.getParameter("id");
        if ((userId != null) && !userId.equals("")) {
            return userManager.getUser(userId);
        } else {
            return new User();
        }
    }
}
