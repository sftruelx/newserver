package com.app1.service;

import java.util.Map;

import com.app1.model.Artist;
import com.app1.util.Pager;

public interface ArtistManager {

	public Pager getArtists(int pageNo, int pageSize, Map map);

	public Artist saveArtist(Artist Artist);
	
	public Artist getArtist(long id);

}