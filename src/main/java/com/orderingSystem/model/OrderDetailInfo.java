package com.orderingSystem.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 订单详细条目表
 * 存放订单的菜品信息
 * @author zzy
 *
 */
@Entity
@Table(name = "orderingsystem_orderdetailinfo")
public class OrderDetailInfo {

	private String id;
	//菜品详细信息
	private FoodInfo foodInfo;
	//个数
	private Integer amount;
	
	//关联的订单信息
	private OrderInfo orderInfo;
	//用户
	private User user;
	
	@ManyToOne()
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Id
	@Column(name = "orderdetail_id")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@OneToOne()
	@JoinColumn(name = "food_id")
	public FoodInfo getFoodInfo() {
		return foodInfo;
	}
	public void setFoodInfo(FoodInfo foodInfo) {
		this.foodInfo = foodInfo;
	}
	
	@ManyToOne()
	@JoinColumn(name = "orderinfo_id")
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
}
