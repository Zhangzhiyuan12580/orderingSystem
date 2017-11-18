package com.orderingSystem.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.orderingSystem.dao.IFoodClassDao;
import com.orderingSystem.model.FoodClass;
import com.orderingSystem.util.Page;

@Repository("foodClassDao")
public class FoodClassDaoImpl implements IFoodClassDao{

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void save(FoodClass foodClass) {
		sessionFactory.getCurrentSession().save(foodClass);
	}

	@Override
	public void update(FoodClass foodClass) {
		sessionFactory.getCurrentSession().update(foodClass);
	}

	@Override
	public void delete(FoodClass foodClass) {
		sessionFactory.getCurrentSession().delete(foodClass);
	}

	@Override
	public FoodClass findById(String id) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(FoodClass.class);
		cr.add(Restrictions.eq("id", id));
		return (FoodClass)cr.list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FoodClass> findAll() {
		return sessionFactory.getCurrentSession().createCriteria(FoodClass.class).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<FoodClass> findBySearchFilter(Page<FoodClass> foodClass) {
		
		List<FoodClass> list = null;
		try {
			Criteria cr = sessionFactory.getCurrentSession().createCriteria(FoodClass.class);
			if(null != foodClass.getList().get(0).getClassName()
					&& foodClass.getList().get(0).getClassName() != "") {
				cr.add(Restrictions.like("className", "%" + foodClass.getList().get(0).getClassName() + "%"));
			}
			int count = cr.list().size();
			int pageCount = 1;
			if(count / foodClass.getPageSize() > 0) {
				if(count % foodClass.getPageSize() == 0) {
					pageCount = count / foodClass.getPageSize();
				} else {
					pageCount += count / foodClass.getPageSize(); 
				}
			}
			cr.setFirstResult((foodClass.getPageNum() - 1) * foodClass.getPageSize());
			cr.setMaxResults(foodClass.getPageSize());
			list = cr.list();
			Page<FoodClass> page = new Page<FoodClass>();
			page.setPageCount(pageCount);
			page.setList(list);
			if(!StringUtils.isEmpty(foodClass.getPageNum())) {
				page.setPageNum(foodClass.getPageNum());
			}
			if(!StringUtils.isEmpty(foodClass.getPageSize())) {
				page.setPageSize(foodClass.getPageSize());
			}
			return page;
		} catch (HibernateException e) {
			e.printStackTrace();
			return new Page<FoodClass>();
		}
	}

}
