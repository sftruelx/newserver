package com.app1.dao;

import java.util.Map;

import com.app1.model.Artist;
import com.app1.util.Pager;

public interface ArtistDao  extends GenericDao<Artist, Long>{

	public Pager getArtists(int pageNo, int pageSize, Map map);
	
	public Artist saveArtist(Artist artist);

}
