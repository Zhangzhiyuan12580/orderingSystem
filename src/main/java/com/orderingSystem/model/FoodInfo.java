package com.orderingSystem.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 菜品信息
 * @author zzy
 *
 */
@Entity
@Table(name = "orderingsystem_foodinfo")
public class FoodInfo {

	private String id;
	//上传时间
	private Date createTime;
	//菜品名称
	private String name;
	//菜品介绍
	private String information;
	//菜品价格
	private String price;
	//图片路径
	private String photoPath;
	//菜品所属类别
	private FoodClass foodClass;
	
	@Id
	@Column(name = "food_id")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "food_name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "food_information")
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	
	@Column(name = "food_price")
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	@Column(name = "food_photo")
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	
	@ManyToOne()
	@JoinColumn(name = "class_id")
	public FoodClass getFoodClass() {
		return foodClass;
	}
	public void setFoodClass(FoodClass foodClass) {
		this.foodClass = foodClass;
	}
	
	
}
