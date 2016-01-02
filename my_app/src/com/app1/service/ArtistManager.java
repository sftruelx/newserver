package com.app1.service;

import java.util.Map;

import com.app1.model.Artist;
import com.app1.util.Pager;

public interface ArtistManager {

	Pager getArtists(int pageNo, int pageSize, Map map);

	Artist saveArtist(Artist Artist);

}