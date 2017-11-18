package com.orderingSystem.dao;

import java.util.List;

import com.orderingSystem.model.User;
import com.orderingSystem.util.Page;

public interface IUserDao {

	public void save(User user);
	public void update(User user);
	public void delete(User user);
	public User findById(String id);
	public List<User> findAll();
	public Page<User> findBySearchFilter(Page<User> user);
}
