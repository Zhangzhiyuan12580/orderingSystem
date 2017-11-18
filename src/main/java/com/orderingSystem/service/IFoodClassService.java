package com.orderingSystem.service;

import java.util.List;

import com.orderingSystem.model.FoodClass;
import com.orderingSystem.util.Page;

public interface IFoodClassService {

	public void save(FoodClass foodClass);
	public void update(FoodClass foodClass);
	public void delete(FoodClass foodClass);
	public FoodClass findById(String id);
	public List<FoodClass> findAll();
	public Page<FoodClass> findBySearchFilter(Page<FoodClass> foodClass);
}
