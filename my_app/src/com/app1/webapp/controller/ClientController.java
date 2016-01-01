package com.app1.webapp.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app1.model.Classify;
import com.app1.service.ClassifyManager;

@Controller
public class ClientController extends BaseFormController {
	private final Log log = LogFactory.getLog(ClientController.class);
	@Autowired
	ClassifyManager manager;

	@ResponseBody
	@RequestMapping("/client/test*")
	public List<Classify> execute(HttpServletRequest request) {
	

		Enumeration names = request.getHeaderNames();

		while (names.hasMoreElements()) {

			String name = (String) names.nextElement();

			System.out.println("<b>" + name + ":</b>" + request.getHeader(name) + "<br />");
			if (name.equals("user-agent")) {

				System.out.println("<a href='#'>" + name + ":" + request.getHeader(name) + "</a><br />");

			}

			System.err.println(name + ":" + request.getHeader(name) + "");

		}

		return manager.getParent("");
	}
}
