package com.zhangy.selfwork.handler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/user")
public class UserHandler {
	/**
	 * Description:跳转用户管理首页
	 * @return
	 * @author:zhangyu
	 * @date:2016年11月2日
	 */
	@RequestMapping("index")
	public String index(){
		return "user/index";
	}
	
}
