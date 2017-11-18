package com.orderingSystem.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.orderingSystem.dao.IFoodInfoDao;
import com.orderingSystem.model.FoodInfo;
import com.orderingSystem.util.Page;

@Repository("foodInfoDao")
public class FoodInfoDaoImpl implements IFoodInfoDao{

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void save(FoodInfo foodInfo) {
		sessionFactory.getCurrentSession().save(foodInfo);
	}

	@Override
	public void update(FoodInfo foodInfo) {
		sessionFactory.getCurrentSession().update(foodInfo);
	}

	@Override
	public void delete(FoodInfo foodInfo) {
		sessionFactory.getCurrentSession().delete(foodInfo);
	}

	@Override
	public FoodInfo findById(String id) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(FoodInfo.class);
		cr.add(Restrictions.eq("id", id));
		return (FoodInfo)cr.list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<FoodInfo> findBySearchFilter(Page<FoodInfo> foodInfo) {
		
		List<FoodInfo> list = null;
		try {
			Criteria cr = sessionFactory.getCurrentSession().createCriteria(FoodInfo.class);
			if(null != foodInfo.getList().get(0).getName()
					&& "" != foodInfo.getList().get(0).getName()) {
				cr.add(Restrictions.like("name", "%" + foodInfo.getList().get(0).getName() + "%"));
			}
			if(null != foodInfo.getList().get(0).getFoodClass()) {
				if(null != foodInfo.getList().get(0).getFoodClass().getId()
						&& "" != foodInfo.getList().get(0).getFoodClass().getId()) {
					cr.add(Restrictions.eq("foodClass.id", foodInfo.getList().get(0).getFoodClass().getId()));
				}
			}
			
			int count = cr.list().size();
			int pageCount = 1;
			if(count / foodInfo.getPageSize() > 0) {
				if(count % foodInfo.getPageSize() == 0) {
					pageCount = count / foodInfo.getPageSize();
				} else {
					pageCount += count / foodInfo.getPageSize();
				}
			}
			
			cr.setFirstResult((foodInfo.getPageNum() - 1) * foodInfo.getPageSize());
			cr.setMaxResults(foodInfo.getPageSize());
			list = cr.list();
			
			Page<FoodInfo> page = new Page<FoodInfo>();
			page.setPageCount(pageCount);
			page.setList(list);
			if(!StringUtils.isEmpty(foodInfo.getPageNum())) {
				page.setPageNum(foodInfo.getPageNum());
			}
			if(!StringUtils.isEmpty(foodInfo.getPageSize())) {
				page.setPageSize(foodInfo.getPageSize());
			}
			
			return page;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return new Page<FoodInfo>();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FoodInfo> findAll() {
		return sessionFactory.getCurrentSession().createCriteria(FoodInfo.class).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FoodInfo> findByFoodClassId(String foodClassId) {
		
		List<FoodInfo> list = null;
		
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(FoodInfo.class);
		cr.add(Restrictions.eq("foodClass.id", foodClassId));
		list = cr.list();
		
		if(list.isEmpty()) {
			return new ArrayList<FoodInfo>();
		}
		return list;
	}

}
