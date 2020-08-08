package com.mycom.toyLMS;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	// 메인화면으로 이동
	@RequestMapping(value = "/")
	public String index() {
		return "index";
	}
	
	
}
