package com.orderingSystem.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.orderingSystem.dao.IUserDao;
import com.orderingSystem.model.User;
import com.orderingSystem.util.Page;


@Repository("userDao")
public class UserDaoImpl implements IUserDao{

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void save(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void update(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public void delete(User user) {
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public User findById(String id) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(User.class);
		cr.add(Restrictions.eq("id", id));
		return (User) cr.list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAll() {
		List<User> list = null;
		try {
			list = sessionFactory.getCurrentSession().createCriteria(User.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<User> findBySearchFilter(Page<User> user) {

		List<User> list = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria cr = session.createCriteria(User.class);
			if(null!=user.getList().get(0).getUsername()&&user.getList().get(0).getUsername()!=""){	
				cr.add(Restrictions.like("username", "%" + user.getList().get(0).getUsername() + "%"));
			}
			int count = cr.list().size();
			int pageCount = 1;
			if(count/user.getPageSize() > 0) {
				if(count % user.getPageSize() == 0) {
					pageCount = count/user.getPageSize();
				} else {
					pageCount += count/user.getPageSize();
				}
			}
			cr.setFirstResult((user.getPageNum()-1)*user.getPageSize());
			cr.setMaxResults(user.getPageSize());
			
			list = cr.list();
			Page<User> page = new Page<User>();
			page.setPageCount(pageCount);
			page.setList(list);
			if(!StringUtils.isEmpty(user.getPageNum()) && !StringUtils.isEmpty(user.getPageSize())) {
				page.setPageNum(user.getPageNum());
				page.setPageSize(user.getPageSize());
			}
			return page;
		} catch (HibernateException e) {
			e.printStackTrace();
			return new Page<User>();
		}
	}
	
}
