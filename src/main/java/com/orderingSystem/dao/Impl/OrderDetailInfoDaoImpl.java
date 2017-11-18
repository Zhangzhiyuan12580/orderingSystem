package com.orderingSystem.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.orderingSystem.dao.IOrderDetailInfoDao;
import com.orderingSystem.model.OrderDetailInfo;

@Repository("orderDetailInfoDao")
public class OrderDetailInfoDaoImpl implements IOrderDetailInfoDao{

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void save(OrderDetailInfo orderDetailInfo) {
		sessionFactory.getCurrentSession().save(orderDetailInfo);
	}

	@Override
	public void update(OrderDetailInfo orderDetailInfo) {
		sessionFactory.getCurrentSession().update(orderDetailInfo);
	}

	@Override
	public void delete(OrderDetailInfo orderDetailInfo) {
		sessionFactory.getCurrentSession().delete(orderDetailInfo);
	}

	@Override
	public OrderDetailInfo findById(String id) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(OrderDetailInfo.class);
		cr.add(Restrictions.eq("id", id));
		return (OrderDetailInfo)cr.list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetailInfo> findAll() {
		return sessionFactory.getCurrentSession().createCriteria(OrderDetailInfo.class).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetailInfo> findShoppingCart(String userId) {
		List<OrderDetailInfo> list = null;
		//根据用户查询信息
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(OrderDetailInfo.class);
		cr.add(Restrictions.eq("user.id", userId));
		list = cr.list();
		
		//过滤没有订单信息的清单，即当前用户购物车中的商品
		List<OrderDetailInfo> newList = new ArrayList<OrderDetailInfo>();
		for (OrderDetailInfo orderDetailInfo : list) {
			if(orderDetailInfo.getOrderInfo() == null) {
				newList.add(orderDetailInfo);
			}
		}
		return newList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void delete(String userId, String foodInfoId) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(OrderDetailInfo.class);
		cr.add(Restrictions.eq("user.id", userId));
		cr.add(Restrictions.eq("foodInfo.id", foodInfoId));
		List<OrderDetailInfo> list = cr.list();
		OrderDetailInfo orderDetailInfo = list.get(0);
		if(orderDetailInfo.getAmount()>1) {
			orderDetailInfo.setAmount(orderDetailInfo.getAmount() - 1);
			this.save(orderDetailInfo);
			return;
		}
		this.delete(orderDetailInfo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void saveOrderDetailInfo(OrderDetailInfo orderDetailInfo) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(OrderDetailInfo.class);
		cr.add(Restrictions.eq("user.id", orderDetailInfo.getUser().getId()));
		cr.add(Restrictions.eq("foodInfo.id", orderDetailInfo.getFoodInfo().getId()));
		List<OrderDetailInfo> list = cr.list();
		if(list.isEmpty()) {
			sessionFactory.getCurrentSession().save(orderDetailInfo);
		} else {
			OrderDetailInfo newOrderDetailInfo = list.get(0);
			if(newOrderDetailInfo.getOrderInfo() != null) {
				sessionFactory.getCurrentSession().save(orderDetailInfo);
			} else {
				newOrderDetailInfo.setAmount(newOrderDetailInfo.getAmount() + 1);
				sessionFactory.getCurrentSession().save(newOrderDetailInfo);
			}
		}
	}
}
