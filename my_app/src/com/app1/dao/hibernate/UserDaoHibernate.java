package com.app1.dao.hibernate;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Table;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.app1.dao.UserDao;
import com.app1.model.User;
import com.app1.util.Pager;

/**
 * This class interacts with Hibernate session to save/delete and retrieve User
 * objects.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a> Modified by
 *         <a href="mailto:dan@getrolling.com">Dan Kibler</a> Extended to
 *         implement Acegi UserDetailsService interface by David Carter
 *         david@carter.net Modified by <a href="mailto:bwnoll@gmail.com">Bryan
 *         Noll</a> to work with the new BaseDaoHibernate implementation that
 *         uses generics. Modified by jgarcia (updated to hibernate 4)
 */
@Repository("userDao")
public class UserDaoHibernate extends GenericDaoHibernate<User, Long> implements UserDao, UserDetailsService {

	/**
	 * Constructor that sets the entity to User.class.
	 */
	public UserDaoHibernate() {
		super(User.class);
	}

	@Override
	public Pager getUsers(int pageNo, int pageSize, Map map) {
		/*Query qry = getSession().createQuery("from User u order by upper(u.username)");
		return qry.list();*/
		return  findPageByCriteria(pageNo,pageSize,map);
		
	}

	/**
	 * @function 分页显示符合所有的记录数，将查询结果封装为Pager
	 * @param pageNo
	 *            当前页数
	 * @param pageSize
	 *            每页显示的条数
	 * @param map
	 *            将查询条件封装为map
	 * @return 查询结果Pager
	 */
	public Pager findPageByCriteria(int pageNo, int pageSize, Map map)
	{
		Pager pager = null;
		try
		{
			Criteria criteria = this.getSession().createCriteria(User.class);
	
			if (map != null)
			{
				Set<String> keys = map.keySet();
				for (String key : keys)
				{
					criteria.add(Restrictions.like(key, "%"+map.get(key)+"%"));
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
	
	/**
	 * {@inheritDoc}
	 */
	public User saveUser(User user) {
		if (log.isDebugEnabled()) {
			log.debug("user's id: " + user.getId());
		}
			getSession().saveOrUpdate(user);
		// necessary to throw a DataIntegrityViolation and catch it in
		// UserManager
		getSession().flush();
		return user;
	}

	/**
	 * Overridden simply to call the saveUser method. This is happening because
	 * saveUser flushes the session and saveObject of BaseDaoHibernate does not.
	 *
	 * @param user
	 *            the user to save
	 * @return the modified user (with a primary key set if they're new)
	 */
	@Override
	public User save(User user) {
		return this.saveUser(user);
	}

	/**
	 * {@inheritDoc}
	 */
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List users = getSession().createCriteria(User.class).add(Restrictions.eq("username", username)).list();
		if (users == null || users.isEmpty()) {
			throw new UsernameNotFoundException("user '" + username + "' not found...");
		} else {
			return (UserDetails) users.get(0);
		}
	}

	/**
	 * {@inheritDoc}
	 */
	public String getUserPassword(Long userId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(getSessionFactory()));
		Table table = AnnotationUtils.findAnnotation(User.class, Table.class);
		return jdbcTemplate.queryForObject("select password from " + table.name() + " where id=?", String.class,
				userId);
	}


}
