package entity;

import java.util.Date;

import org.junit.Test;

import com.zhangy.selfwork.entity.Employee;

public class EntityTest {

	public EntityTest() {
		// TODO Auto-generated constructor stub
	}
	@Test
	public void te(){
		Employee emp =new Employee();
		emp.setBirth(new Date());
		emp.setEmail("491036107@qq.com");
		emp.setLastName("zhangy");
		System.out.println(emp.toString());
	}
}
