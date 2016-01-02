package com.app1.dao.hibernate;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.app1.dao.AlbumDao;
import com.app1.model.Album;
import com.app1.model.Classify;
import com.app1.util.Pager;


@Repository("AlbumDao")
public class AlbumDaoHibernate extends GenericDaoHibernate<Album, Long> implements AlbumDao{

	public AlbumDaoHibernate() {
		super(Album.class);
	}
	
	public Pager getAlbums(int pageNo, int pageSize, Map map) {
		return  findPageByCriteria(pageNo,pageSize,map,Album.class);
		
	}

	public Album saveAlbum(Album album) {
		if (log.isDebugEnabled()) {
			log.debug("classify id: " + album.getId());
		}
			getSession().saveOrUpdate(album);
		// necessary to throw a DataIntegrityViolation and catch it in
		// UserManager
		getSession().flush();
		return album;
	}
	
}
