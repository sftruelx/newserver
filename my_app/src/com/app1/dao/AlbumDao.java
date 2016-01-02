package com.app1.dao;

import java.util.Map;

import com.app1.model.Album;
import com.app1.util.Pager;

public interface AlbumDao  extends GenericDao<Album, Long>{

	public Pager getAlbums(int pageNo, int pageSize, Map map);
	
	public Album saveAlbum(Album album);

}
