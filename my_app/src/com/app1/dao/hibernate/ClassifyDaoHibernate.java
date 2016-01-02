package com.app1.dao.hibernate;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.app1.dao.ClassifyDao;
import com.app1.model.Classify;
import com.app1.util.Pager;

@Repository("ClassifyDao")
public class ClassifyDaoHibernate extends GenericDaoHibernate<Classify, Long> implements ClassifyDao{
	
	public ClassifyDaoHibernate() {
		super(Classify.class);
	}
	

	public Pager getClassifies(int pageNo, int pageSize, Map map) {
		return  findPageByCriteria(pageNo,pageSize,map);
		
	}

	@SuppressWarnings("finally")
	public Pager findPageByCriteria(int pageNo, int pageSize, Map map)
	{
		Pager pager = null;
		try
		{
			Criteria criteria = this.getSession().createCriteria(Classify.class);
	
			if (map != null)
			{
				Set<String> keys = map.keySet();
				for (String key : keys)
				{
					if("title".equals(key)){
					criteria.add(Restrictions.like(key, "%"+map.get(key)+"%"));
					}else{
						criteria.add(Restrictions.eq(key, map.get(key)));
					}
					
				}
			}

			String count= criteria.setProjection(Projections.rowCount()).uniqueResult().toString();
			int rowCount = Integer.parseInt(count);
			criteria.setProjection(null);
			criteria.setFirstResult((pageNo - 1) * pageSize);
			criteria.setMaxResults(pageSize);

			List result = criteria.list();
			pager = new Pager(pageSize, pageNo, rowCount, result);	

		} catch (RuntimeException re)
		{
			throw re;
		} finally
		{
			return pager;
		}

	}
	
	public List<Object> getLevel(){
		Criteria criteria = this.getSession().createCriteria(Classify.class);
		criteria.setProjection(Projections.distinct(Projections.property("level")));
		return  criteria.list();
	}
	
	
	public List<Classify> getParent(Long parent_id){
		Criteria criteria = this.getSession().createCriteria(Classify.class);
		criteria.add(Restrictions.eq("parent_id", parent_id));
		@SuppressWarnings("unchecked")
		List<Classify> list = criteria.list();
		return  list;
	}
	
	
	public Classify saveClassify(Classify classify) {
		if (log.isDebugEnabled()) {
			log.debug("classify id: " + classify.getId());
		}
			getSession().saveOrUpdate(classify);
		// necessary to throw a DataIntegrityViolation and catch it in
		// UserManager
		getSession().flush();
		return classify;
	}
	
}
