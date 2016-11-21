package com.zhangy.selfwork.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zhangy.selfwork.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	Employee getByLastName(String lastName);
	
}
