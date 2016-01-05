package com.app1.webapp.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.app1.model.Album;
import com.app1.service.AlbumManager;
import com.app1.util.Pager;

@Controller
public class AlbumController extends BaseFormController {
	
	@Autowired
	AlbumManager albumManager;
	


	@RequestMapping("/albumManage*")
	public String showPage(ModelMap model, HttpServletRequest request) {
		return "albumManage";
	}
	
	@ResponseBody
	@RequestMapping("/albums*")
	public Pager execute2(Album album, HttpServletRequest request, @RequestParam("page") int nowpage, @RequestParam("rows") int rows) {
		Map<String, Object> map = new HashMap<String, Object>();


		Pager p = albumManager.getAlbums(nowpage, rows, map);
		return p;
	}
	
	@ResponseBody
	@RequestMapping("/albumForm*")
	public Map filesUpload(Album album, HttpServletRequest request) {
		Calendar cal = Calendar.getInstance();
		String savePath = cal.get(Calendar.YEAR)+"/"+cal.get(Calendar.DAY_OF_YEAR);
		Map<String, String> map = new HashMap();
		String msg = null;

		try {

			if (request.getParameter("delete") != null) {
//				albumManager.removeAlbum(classify.getId());
				saveMessage(request, getText("user.deleted", album.getAlbumName(), request.getLocale()));
				map.put("success", "1");
			} else {
				// TODO �޸�
				String fileName = "";
				MultipartFile[] files = album.getFiles();
				// �ж�file���鲻��Ϊ�ղ��ҳ��ȴ���0
				if (files != null && files.length > 0) {
					// ѭ����ȡfile�����е��ļ�
					for (int i = 0; i < files.length; i++) {
						MultipartFile file = files[i];
						// �����ļ�
						if ("".equals(fileName)) {
							fileName = saveFile(file, savePath);
						} else {
							fileName = fileName + ";" + saveFile(file,  savePath);
						}
					}
				}
				album.setImgPath(fileName);
				// ���� classify �������ݿ���
				album.setCreateTime(new Date());
				albumManager.saveAlbum(album);
			}

		} catch (Exception e) {
			msg = e.getMessage();
		}
		map.put("errorMsg", msg);
		return map;
	}

}
