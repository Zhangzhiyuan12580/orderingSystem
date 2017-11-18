package com.orderingSystem.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.orderingSystem.dao.IFoodClassDao;
import com.orderingSystem.model.FoodClass;
import com.orderingSystem.service.IFoodClassService;
import com.orderingSystem.util.Page;

@Service("foodClassService")
@Transactional
public class FoodClassServiceImpl implements IFoodClassService{

	@Resource
	private IFoodClassDao foodClassDao;
	
	@Override
	public void save(FoodClass foodClass) {
		foodClassDao.save(foodClass);
	}

	@Override
	public void update(FoodClass foodClass) {
		foodClassDao.update(foodClass);
	}

	@Override
	public void delete(FoodClass foodClass) {
		foodClassDao.delete(foodClass);
	}

	@Override
	public FoodClass findById(String id) {
		return foodClassDao.findById(id);
	}

	@Override
	public List<FoodClass> findAll() {
		return foodClassDao.findAll();
	}

	@Override
	public Page<FoodClass> findBySearchFilter(Page<FoodClass> foodClass) {
		return foodClassDao.findBySearchFilter(foodClass);
	}

	
}
