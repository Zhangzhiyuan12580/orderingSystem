package com.orderingSystem.service;

import java.util.List;

import com.orderingSystem.model.FoodInfo;
import com.orderingSystem.util.Page;

public interface IFoodInfoService {

	public void save(FoodInfo foodInfo);
	public void update(FoodInfo foodInfo);
	public void delete(FoodInfo foodInfo);
	public FoodInfo findById(String id);
	public List<FoodInfo> findAll();
	public Page<FoodInfo> findBySearchFilter(Page<FoodInfo> foodInfo);
	public List<FoodInfo> findByFoodClassId(String foodClassId);
	
}
