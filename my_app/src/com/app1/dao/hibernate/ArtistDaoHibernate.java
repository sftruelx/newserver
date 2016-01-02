package com.app1.dao.hibernate;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.app1.dao.ArtistDao;
import com.app1.model.Artist;
import com.app1.util.Pager;


@Repository("ArtistDao")
public class ArtistDaoHibernate extends GenericDaoHibernate<Artist, Long> implements ArtistDao{

	public ArtistDaoHibernate() {
		super(Artist.class);
	}
	
	public Pager getArtists(int pageNo, int pageSize, Map map) {
		return  findPageByCriteria(pageNo,pageSize,map,Artist.class);
		
	}

	public Artist saveArtist(Artist artist) {
		if (log.isDebugEnabled()) {
			log.debug("classify id: " + artist.getArtistId());
		}
			getSession().saveOrUpdate(artist);
		// necessary to throw a DataIntegrityViolation and catch it in
		// UserManager
		getSession().flush();
		return artist;
	}
	
}
