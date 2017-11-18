package com.orderingSystem.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.orderingSystem.dao.IOrderDetailInfoDao;
import com.orderingSystem.model.OrderDetailInfo;
import com.orderingSystem.service.IOrderDetailInfoService;

@Service("orderDetailInfoService")
@Transactional
public class OrderDetailInfoServiceImpl implements IOrderDetailInfoService{

	@Resource
	private IOrderDetailInfoDao orderDetailInfoDao;
	
	@Override
	public void save(OrderDetailInfo orderDetailInfo) {
		orderDetailInfoDao.save(orderDetailInfo);
	}

	@Override
	public void update(OrderDetailInfo orderDetailInfo) {
		orderDetailInfoDao.update(orderDetailInfo);
	}

	@Override
	public void delete(OrderDetailInfo orderDetailInfo) {
		orderDetailInfoDao.delete(orderDetailInfo);
	}

	@Override
	public OrderDetailInfo findById(String id) {
		return orderDetailInfoDao.findById(id);
	}

	@Override
	public List<OrderDetailInfo> findAll() {
		return orderDetailInfoDao.findAll();
	}

	@Override
	public List<OrderDetailInfo> findShoppingCart(String userId) {
		return orderDetailInfoDao.findShoppingCart(userId);
	}

	@Override
	public void delete(String userId, String foodInfoId) {
		orderDetailInfoDao.delete(userId, foodInfoId);
	}

	@Override
	public void saveOrderDetailInfo(OrderDetailInfo orderDetailInfo) {
		orderDetailInfoDao.saveOrderDetailInfo(orderDetailInfo);
	}

}
