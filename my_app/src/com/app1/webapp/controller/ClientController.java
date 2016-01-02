package com.app1.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app1.model.Classify;
import com.app1.service.ClassifyManager;
import com.app1.util.AESUtils;
import com.app1.util.EncryptionUtils;

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

		return manager.getParent(1L);
	}

	@Value("#{configProperties['albumroot']}")
	String rootPath ;
	
	
	@RequestMapping("client/img")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) {
		// 获取网站部署路径(通过ServletContext对象)，用于确定下载文件位置，从而实现下载
		String fileName = request.getParameter("url");

		try {
			fileName = AESUtils.decrypt(fileName);
		} catch (Exception e1) {
			e1.printStackTrace();
			return ;
		}
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		// 2.设置文件头：最后一个参数是设置下载文件名
		// 生成文件名
		String prefix = fileName.substring(fileName.lastIndexOf("/")+1);
		response.setHeader("Content-Disposition", "attachment;fileName=" + prefix);
		ServletOutputStream out;
		// 通过文件路径获得File对象(假如此路径中有一个download.pdf文件)
		File file = new File(rootPath + fileName);

		try {
			FileInputStream inputStream = new FileInputStream(file);

			// 3.通过response获取ServletOutputStream对象(out)
			out = response.getOutputStream();

			byte[] buffer = new byte[1024];
			int i = -1;
			while ((i = inputStream.read(buffer)) != -1) {
				out.write(buffer, 0, i);
			}
			inputStream.close();
			out.close();
			out.flush();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
