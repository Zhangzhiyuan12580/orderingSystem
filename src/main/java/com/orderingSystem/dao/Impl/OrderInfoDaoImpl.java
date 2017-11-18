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

import com.orderingSystem.dao.IOrderInfoDao;
import com.orderingSystem.model.OrderInfo;
import com.orderingSystem.util.Page;

@Repository("orderInfoDao")
public class OrderInfoDaoImpl implements IOrderInfoDao{

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void save(OrderInfo orderInfo) {
		sessionFactory.getCurrentSession().save(orderInfo);
	}

	@Override
	public void update(OrderInfo orderInfo) {
		sessionFactory.getCurrentSession().update(orderInfo);
	}

	@Override
	public void delete(OrderInfo orderInfo) {
		sessionFactory.getCurrentSession().delete(orderInfo);
	}

	@Override
	public OrderInfo findById(String id) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(OrderInfo.class);
		cr.add(Restrictions.eq("id", id));
		return (OrderInfo)cr.list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderInfo> findAll() {
		return sessionFactory.getCurrentSession().createCriteria(OrderInfo.class).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<OrderInfo> findBySearchFilter(Page<OrderInfo> orderInfo) {
		List<OrderInfo> list = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria cr = session.createCriteria(OrderInfo.class);
			if(null != orderInfo.getList().get(0).getIsDeal()
					&& orderInfo.getList().get(0).getIsDeal() != ""){	
				cr.add(Restrictions.eq("isDeal", orderInfo.getList().get(0).getIsDeal()));
			}
			if(null != orderInfo.getList().get(0).getUser()) {
				cr.add(Restrictions.eq("user.id", orderInfo.getList().get(0).getUser().getId()));
			}
			int count = cr.list().size();
			int pageCount = 1;
			if(count/orderInfo.getPageSize() > 0) {
				if(count % orderInfo.getPageSize() == 0) {
					pageCount = count/orderInfo.getPageSize();
				} else {
					pageCount += count/orderInfo.getPageSize();
				}
			}
			cr.setFirstResult((orderInfo.getPageNum()-1)*orderInfo.getPageSize());
			cr.setMaxResults(orderInfo.getPageSize());
			
			list = cr.list();
			Page<OrderInfo> page = new Page<OrderInfo>();
			page.setPageCount(pageCount);
			page.setList(list);
			if(!StringUtils.isEmpty(orderInfo.getPageNum()) && !StringUtils.isEmpty(orderInfo.getPageSize())) {
				page.setPageNum(orderInfo.getPageNum());
				page.setPageSize(orderInfo.getPageSize());
			}
			return page;
		} catch (HibernateException e) {
			e.printStackTrace();
			return new Page<OrderInfo>();
		}
	}

}
