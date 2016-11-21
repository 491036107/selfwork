package com.zhangy.selfwork.entity;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.Table;

@Cacheable
@Table(name="B_DEPARTMENTS")
@Entity
public class Department extends BaseEntity {

	private String departmentName;

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

}
