package com.orderingSystem.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orderingSystem.model.FoodInfo;
import com.orderingSystem.model.OrderDetailInfo;
import com.orderingSystem.model.User;
import com.orderingSystem.service.IFoodInfoService;
import com.orderingSystem.service.IOrderDetailInfoService;
import com.orderingSystem.service.IUserService;

@Controller
@RequestMapping("orderDetailInfo")
public class OrderDetailInfoController {

	@Resource
	private IOrderDetailInfoService orderDetailInfoService;
	@Resource
	private IFoodInfoService foodInfoService;
	@Resource
	private IUserService userService;
	
	@RequestMapping("/loadShoppingCart")
	@ResponseBody
	public List<OrderDetailInfo> loadShoppingCart(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		List<OrderDetailInfo> list = orderDetailInfoService.findShoppingCart(userId);
		return list;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public OrderDetailInfo saveOrderDetailInfo(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		User user = userService.findById(userId);
		String foodInfoId = request.getParameter("foodInfoId");
		FoodInfo foodInfo = foodInfoService.findById(foodInfoId);
		OrderDetailInfo orderDetailInfo = new OrderDetailInfo();
		orderDetailInfo.setId(UUID.randomUUID().toString());
		orderDetailInfo.setAmount(1);
		orderDetailInfo.setUser(user);
		orderDetailInfo.setFoodInfo(foodInfo);
		orderDetailInfoService.saveOrderDetailInfo(orderDetailInfo);
		return orderDetailInfo;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String foodInfoId = request.getParameter("foodInfoId");
		orderDetailInfoService.delete(userId, foodInfoId);
		return "success";
	}
}
