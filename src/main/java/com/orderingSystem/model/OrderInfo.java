package com.orderingSystem.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * 订单信息表
 * @author zzy
 *
 */
@Entity
@Table(name = "orderingsystem_orderinfo")
public class OrderInfo {

	private String id;
	//送货地址
	private String address;
	//订单创建时间
	private Date createTime;
	//订单号(构造规则：当前登录的用户名称+订单创建时间字符串精确到秒)
	private String orderNo;
	//联系电话
	private String phone;
	//总价格
	private String totalPrice;
	//订单的状态 2-已完成 1-已经被处理 0-尚未处理
	private String isDeal;
	//所属用户,订单表中存放对应用户ID
	private User user;
	
	@Id
	@Column(name = "orderinfo_id")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "orderinfo_no")
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	@Column(name = "phone_number")
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getIsDeal() {
		return isDeal;
	}
	public void setIsDeal(String isDeal) {
		this.isDeal = isDeal;
	}
	
	@ManyToOne()
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
