package com.orderingSystem.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.orderingSystem.dao.IOrderInfoDao;
import com.orderingSystem.model.OrderInfo;
import com.orderingSystem.service.IOrderInfoService;
import com.orderingSystem.util.Page;

@Service("orderInfoService")
@Transactional
public class OrderInfoServiceImpl implements IOrderInfoService{

	@Resource
	private IOrderInfoDao orderInfoDao;
	
	@Override
	public void save(OrderInfo orderInfo) {
		orderInfoDao.save(orderInfo);
	}

	@Override
	public void update(OrderInfo orderInfo) {
		orderInfoDao.update(orderInfo);
	}

	@Override
	public void delete(OrderInfo orderInfo) {
		orderInfoDao.delete(orderInfo);
	}

	@Override
	public OrderInfo findById(String id) {
		return orderInfoDao.findById(id);
	}

	@Override
	public List<OrderInfo> findAll() {
		return orderInfoDao.findAll();
	}

	@Override
	public Page<OrderInfo> findBySearchFilter(Page<OrderInfo> page1) {
		return orderInfoDao.findBySearchFilter(page1);
	}

	
}
