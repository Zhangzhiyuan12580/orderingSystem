package com.orderingSystem.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品类别表
 * @author zzy
 *
 */
@Entity
@Table(name = "orderingsystem_foodclass")
public class FoodClass {

	private String id;
	/** 类别名称*/
	private String className;
	/** 类别描述*/
	private String classInformation;
	private Date createTime;
	
	@Id
	@Column(name = "class_id")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "class_name")
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	@Column(name = "class_information", length=256)
	public String getClassInformation() {
		return classInformation;
	}
	public void setClassInformation(String classInformation) {
		this.classInformation = classInformation;
	}
	@Column(name = "class_createtime")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
