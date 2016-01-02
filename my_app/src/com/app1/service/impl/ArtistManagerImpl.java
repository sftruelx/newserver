package com.app1.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app1.dao.ArtistDao;
import com.app1.model.Artist;
import com.app1.service.ArtistManager;
import com.app1.util.Pager;

@Service("ArtistManager")
public class ArtistManagerImpl  extends GenericManagerImpl<Artist, Long> implements  ArtistManager{

	@Autowired
	 ArtistDao dao;

	    @Autowired
	    public  ArtistManagerImpl(ArtistDao dao) {
	        super(dao);
	        this.dao = dao;
	    }
	
	/* (non-Javadoc)
	 * @see com.app1.service.impl.ArtistManager#getArtists(int, int, java.util.Map)
	 */
	@Override
	public Pager getArtists(int pageNo, int pageSize, Map map){
		return dao.getArtists(pageNo, pageSize, map);
	}
	
	
	/* (non-Javadoc)
	 * @see com.app1.service.impl.ArtistManager#saveArtist(com.app1.model.Artist)
	 */
	@Override
	public Artist saveArtist(Artist Artist){
		return dao.save(Artist);
	}
}
