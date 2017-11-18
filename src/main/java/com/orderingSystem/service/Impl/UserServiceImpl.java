package com.orderingSystem.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.orderingSystem.dao.IUserDao;
import com.orderingSystem.model.User;
import com.orderingSystem.service.IUserService;
import com.orderingSystem.util.Page;


@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService{

	@Resource
	private IUserDao userDao;
	
	@Override
	public void save(User user) {
		userDao.save(user);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void delete(User user) {
		userDao.delete(user);
	}

	@Override
	public User findById(String id) {
		return userDao.findById(id);
	}

	@Override
	public Page<User> findBySearchFilter(Page<User> user) {
		return userDao.findBySearchFilter(user);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	

}
