package com.orderingSystem.dao;

import java.util.List;

import com.orderingSystem.model.OrderDetailInfo;

public interface IOrderDetailInfoDao {

	public void save(OrderDetailInfo orderDetailInfo);
	public void update(OrderDetailInfo orderDetailInfo);
	public void delete(OrderDetailInfo orderDetailInfo);
	public OrderDetailInfo findById(String id);
	public List<OrderDetailInfo> findAll();
	public List<OrderDetailInfo> findShoppingCart(String userId);
	public void delete(String userId, String foodInfoId);
	public void saveOrderDetailInfo(OrderDetailInfo orderDetailInfo);
}
