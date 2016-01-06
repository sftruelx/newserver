package com.app1.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app1.dao.AlbumDao;
import com.app1.model.Album;
import com.app1.service.AlbumManager;
import com.app1.util.Pager;

@Service("AlbumManager")
public class AlbumManagerImpl  extends GenericManagerImpl<Album, Long> implements AlbumManager{

	@Autowired
	 AlbumDao dao;

	    @Autowired
	    public  AlbumManagerImpl(AlbumDao dao) {
	        super(dao);
	        this.dao = dao;
	    }
	
	public Pager getAlbums(int pageNo, int pageSize, Map map){
		return dao.getAlbums(pageNo, pageSize, map);
	}
	
	
	public Album saveAlbum(Album album){
		return dao.save(album);
	}
	
	public Album getAlbum(long id){
		return dao.get(id);
	}
}
