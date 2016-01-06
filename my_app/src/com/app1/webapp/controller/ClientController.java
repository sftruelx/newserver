package com.app1.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

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
		// ��ȡ��վ����·��(ͨ��ServletContext����)������ȷ�������ļ�λ�ã��Ӷ�ʵ������
		String fileName = request.getParameter("url");

		try {
			fileName = AESUtils.decrypt(fileName);
		} catch (Exception e1) {
			e1.printStackTrace();
			return ;
		}
		// 1.�����ļ�ContentType���ͣ��������ã����Զ��ж������ļ�����
		response.setContentType("multipart/form-data");
		// 2.�����ļ�ͷ�����һ�����������������ļ���
		// ����ļ���
		String prefix = fileName.substring(fileName.lastIndexOf("/")+1);
		response.setHeader("Content-Disposition", "attachment;fileName=" + prefix);
		ServletOutputStream out;
		// ͨ���ļ�·�����File����(�����·������һ��download.pdf�ļ�)
		File file = new File(rootPath + fileName);

		try {
			FileInputStream inputStream = new FileInputStream(file);

			// 3.ͨ��response��ȡServletOutputStream����(out)
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
