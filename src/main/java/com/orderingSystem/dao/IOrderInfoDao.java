package com.orderingSystem.dao;

import java.util.List;

import com.orderingSystem.model.OrderInfo;
import com.orderingSystem.util.Page;

public interface IOrderInfoDao {

	public void save(OrderInfo orderInfo);
	public void update(OrderInfo orderInfo);
	public void delete(OrderInfo orderInfo);
	public OrderInfo findById(String id);
	public List<OrderInfo> findAll();
	public Page<OrderInfo> findBySearchFilter(Page<OrderInfo> page1);
}
