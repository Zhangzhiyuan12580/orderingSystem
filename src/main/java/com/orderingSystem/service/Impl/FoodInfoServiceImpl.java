package com.orderingSystem.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.orderingSystem.dao.IFoodInfoDao;
import com.orderingSystem.model.FoodInfo;
import com.orderingSystem.service.IFoodInfoService;
import com.orderingSystem.util.Page;

@Service("foodInfoService")
@Transactional
public class FoodInfoServiceImpl implements IFoodInfoService{

	@Resource
	private IFoodInfoDao foodInfoDao;

	@Override
	public void save(FoodInfo foodInfo) {
		foodInfoDao.save(foodInfo);
	}

	@Override
	public void update(FoodInfo foodInfo) {
		foodInfoDao.update(foodInfo);
	}

	@Override
	public void delete(FoodInfo foodInfo) {
		foodInfoDao.delete(foodInfo);
	}

	@Override
	public FoodInfo findById(String id) {
		return foodInfoDao.findById(id);
	}

	@Override
	public Page<FoodInfo> findBySearchFilter(Page<FoodInfo> foodInfo) {
		return foodInfoDao.findBySearchFilter(foodInfo);
	}

	@Override
	public List<FoodInfo> findAll() {
		return foodInfoDao.findAll();
	}

	@Override
	public List<FoodInfo> findByFoodClassId(String foodClassId) {
		return foodInfoDao.findByFoodClassId(foodClassId);
	}
	
}
