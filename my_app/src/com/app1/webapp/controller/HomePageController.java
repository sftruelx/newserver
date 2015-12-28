package com.app1.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {
    @RequestMapping("/homePage*")
    public String execute(ModelMap model) {

        return "homePage";
    }
}
