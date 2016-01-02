package com.app1.webapp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.app1.model.Classify;
import com.app1.service.ClassifyManager;
import com.app1.util.Pager;

@Controller
public class ClassifyController extends BaseFormController {
	@Value("#{configProperties['root']}")
	String savePath ;
	@Autowired
	ClassifyManager classifyManager;

	@RequestMapping("/classManage*")
	public String showPage(ModelMap model, HttpServletRequest request) {
		return "classManage";
	}

	@ResponseBody
	@RequestMapping("/classifies*")
	public Pager execute2(Classify cla, HttpServletRequest request, @RequestParam("page") int nowpage, @RequestParam("rows") int rows) {
		System.out.println(savePath);
		Map<String, Object> map = new HashMap<String, Object>();
		if (cla.getLevel() > -1) {
			map.put("level", cla.getLevel());
		}
		if (cla.getParent_id() > -1) {
			map.put("parent_id", cla.getParent_id());
		}

		Pager p = classifyManager.getClassifies(nowpage, rows, map);
		return p;
	}

	/***
	 * 保存文件
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	private String saveFile(MultipartFile file, long parent_id) throws IllegalStateException, IOException {

		// 判断文件是否为空
		if (!file.isEmpty()) {
			// 创建目录，用parent_id作为目录名称
			createDir(savePath + String.valueOf(parent_id));

			// 生成文件名
			String fileName = file.getOriginalFilename();
			String prefix = fileName.substring(fileName.lastIndexOf("."));
			UUID uuid = UUID.randomUUID();
			String newname = uuid + prefix;// 新文件名
			// 文件保存路径
			String filePath = savePath + String.valueOf(parent_id) + "/" + newname;

			// 转存文件
			file.transferTo(new File(filePath));
			return filePath;
		}
		return null;
	}



	@ResponseBody
	@RequestMapping("classifyFrom*")
	public Map filesUpload(Classify classify, HttpServletRequest request) {

		Map<String, String> map = new HashMap();
		String msg = null;

		try {

			if (request.getParameter("delete") != null) {
				classifyManager.removeClassify(classify.getId());
				saveMessage(request, getText("user.deleted", classify.getTitle(), request.getLocale()));
				map.put("success", "1");
			} else {
				// TODO 修改
				String fileName = "";
				MultipartFile[] files = classify.getFiles();
				// 判断file数组不能为空并且长度大于0
				if (files != null && files.length > 0) {
					// 循环获取file数组中得文件
					for (int i = 0; i < files.length; i++) {
						MultipartFile file = files[i];
						// 保存文件
						if ("".equals(fileName)) {
							fileName = saveFile(file, classify.getParent_id());
						} else {
							fileName = fileName + ";" + saveFile(file, classify.getParent_id());
						}
					}
				}
				classify.setImg_path(fileName);
				if ("on".equals(classify.getEnd())) {
					classify.setEnd("是");
				} else {
					classify.setEnd("否");
				}
				// 保存 classify 进入数据库中
				classify.setCreate_tm(new Date());
				classifyManager.saveClassify(classify);
			}

		} catch (Exception e) {
			msg = e.getMessage();
		}
		map.put("errorMsg", msg);
		return map;
	}

	@ResponseBody
	@RequestMapping("classifylevel*")
	public List getLevel() {
		List<Data> result = new ArrayList<Data>();
		List<Object> list = classifyManager.getLevel();
		for (Object element : list) {
			Data d = new Data();
			d.setId(element.toString());
			d.setText(element.toString());
			result.add(d);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("classifyparent*")
	public List getParent(@RequestParam("title") String title) {
		List<Classify> list = classifyManager.getParent(title);
		return list;
	}

	public class Data {
		private String id;
		private String text;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getText() {
			return text;
		}

		public void setText(String text) {
			this.text = text;
		}

	}

}
